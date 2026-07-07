-- =====================================================================
-- FASE 1: Aplicacion universal de inquilino
-- Corre este archivo UNA VEZ en Supabase (SQL Editor -> Run).
-- Es seguro correrlo mas de una vez.
-- =====================================================================

-- ---------------------------------------------------------------------
-- 1) APLICACION UNIVERSAL (una por usuario)
--    El inquilino la llena una sola vez y la reutiliza en todas las
--    propiedades. NO se piden datos regulados (sin SSN, sin credito).
-- ---------------------------------------------------------------------
create table if not exists public.tenant_applications (
  user_id uuid primary key references auth.users (id) on delete cascade,
  full_name text not null default '',
  phone text not null default '',
  email text not null default '',
  current_address text not null default '',
  employer text not null default '',
  job_title text not null default '',
  employment_time text not null default '',
  monthly_income numeric,
  occupants integer,
  has_pets boolean not null default false,
  pets_description text not null default '',
  reference_name text not null default '',
  reference_phone text not null default '',
  desired_move_in date,
  additional_info text not null default '',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.tenant_applications enable row level security;

-- Cada usuario ve y edita SOLO su propia aplicacion.
drop policy if exists "app_select_own" on public.tenant_applications;
create policy "app_select_own"
  on public.tenant_applications for select
  using (user_id = auth.uid() or public.is_admin_user());

drop policy if exists "app_insert_own" on public.tenant_applications;
create policy "app_insert_own"
  on public.tenant_applications for insert
  with check (user_id = auth.uid());

drop policy if exists "app_update_own" on public.tenant_applications;
create policy "app_update_own"
  on public.tenant_applications for update
  using (user_id = auth.uid());

drop policy if exists "app_delete_own" on public.tenant_applications;
create policy "app_delete_own"
  on public.tenant_applications for delete
  using (user_id = auth.uid() or public.is_admin_user());

-- ---------------------------------------------------------------------
-- 2) APLICACIONES POR PROPIEDAD
--    Cada vez que un inquilino presiona "Aplicar" en una casa se crea
--    un registro aqui. El dueno de la casa las ve en su dashboard.
-- ---------------------------------------------------------------------
create table if not exists public.property_applications (
  id uuid primary key default gen_random_uuid(),
  property_id uuid not null references public.properties (id) on delete cascade,
  applicant_id uuid not null references public.tenant_applications (user_id) on delete cascade,
  status text not null default 'submitted'
    check (status in ('submitted', 'reviewed', 'accepted', 'declined')),
  message text not null default '',
  created_at timestamptz not null default now(),
  unique (property_id, applicant_id)
);

alter table public.property_applications enable row level security;

-- Funcion auxiliar: saber si el usuario actual es dueno de la propiedad.
create or replace function public.owns_property(prop_id uuid)
returns boolean
language sql
security definer
set search_path = public
as $$
  select exists (
    select 1 from public.properties p
    where p.id = prop_id and p.owner_id = auth.uid()
  );
$$;

-- El inquilino crea y ve sus propias aplicaciones.
drop policy if exists "papp_insert_applicant" on public.property_applications;
create policy "papp_insert_applicant"
  on public.property_applications for insert
  with check (applicant_id = auth.uid());

drop policy if exists "papp_select" on public.property_applications;
create policy "papp_select"
  on public.property_applications for select
  using (
    applicant_id = auth.uid()
    or public.owns_property(property_id)
    or public.is_admin_user()
  );

-- El dueno de la propiedad (o el admin) cambia el estado.
drop policy if exists "papp_update_owner" on public.property_applications;
create policy "papp_update_owner"
  on public.property_applications for update
  using (public.owns_property(property_id) or public.is_admin_user());

-- El inquilino puede retirar su aplicacion; el admin tambien puede borrar.
drop policy if exists "papp_delete" on public.property_applications;
create policy "papp_delete"
  on public.property_applications for delete
  using (applicant_id = auth.uid() or public.is_admin_user());

-- El dueno de la propiedad necesita LEER la aplicacion universal de
-- quien aplico a su casa (solo de ellos, no de todos).
drop policy if exists "app_select_landlord" on public.tenant_applications;
create policy "app_select_landlord"
  on public.tenant_applications for select
  using (
    exists (
      select 1
      from public.property_applications pa
      join public.properties p on p.id = pa.property_id
      where pa.applicant_id = tenant_applications.user_id
        and p.owner_id = auth.uid()
    )
  );
