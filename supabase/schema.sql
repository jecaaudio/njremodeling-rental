-- NJ Remodeling and Rental: shared properties + user accounts
-- Run this once in Supabase: Dashboard -> SQL Editor -> New query -> paste -> Run.

create extension if not exists pgcrypto;

-- One row per signed-up user.
create table if not exists public.profiles (
  id uuid primary key references auth.users (id) on delete cascade,
  email text,
  is_admin boolean not null default false,
  created_at timestamptz not null default now()
);

alter table public.profiles enable row level security;

create or replace function public.is_admin_user()
returns boolean
language sql
security definer set search_path = public
as $$
  select coalesce((select is_admin from public.profiles where id = auth.uid()), false);
$$;

drop policy if exists "profiles_select" on public.profiles;
create policy "profiles_select"
  on public.profiles for select
  using (auth.uid() = id or public.is_admin_user());

-- Automatically create a profile row whenever someone signs up.
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  insert into public.profiles (id, email)
  values (new.id, new.email);
  return new;
end;
$$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

-- Shared rental listings. Each row belongs to the user who created it
-- and only becomes public once an admin approves it.
create table if not exists public.properties (
  id uuid primary key default gen_random_uuid(),
  legacy_id text,
  owner_id uuid not null references auth.users (id) on delete cascade,
  title text not null,
  address text not null default '',
  city text not null default '',
  state text not null default '',
  zip text not null default '',
  bedrooms numeric,
  bathrooms numeric,
  sqft numeric,
  rent numeric,
  image text,
  fallback_image text,
  photos jsonb not null default '[]'::jsonb,
  description_en text not null default '',
  description_es text not null default '',
  zillow_url text not null default '',
  approved boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.properties enable row level security;

drop policy if exists "properties_select" on public.properties;
create policy "properties_select"
  on public.properties for select
  using (approved = true or owner_id = auth.uid() or public.is_admin_user());

drop policy if exists "properties_insert" on public.properties;
create policy "properties_insert"
  on public.properties for insert
  with check (owner_id = auth.uid() and (approved = false or public.is_admin_user()));

drop policy if exists "properties_update" on public.properties;
create policy "properties_update"
  on public.properties for update
  using (owner_id = auth.uid() or public.is_admin_user())
  with check (public.is_admin_user() or (owner_id = auth.uid() and approved = false));

drop policy if exists "properties_delete" on public.properties;
create policy "properties_delete"
  on public.properties for delete
  using (owner_id = auth.uid() or public.is_admin_user());

create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists set_properties_updated_at on public.properties;
create trigger set_properties_updated_at
  before update on public.properties
  for each row execute procedure public.set_updated_at();

create index if not exists properties_owner_id_idx on public.properties (owner_id);
create index if not exists properties_approved_idx on public.properties (approved);
