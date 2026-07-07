-- =====================================================================
-- NJ Remodeling and Rental: actualizacion de mejoras (julio 2026)
-- Corre este archivo UNA VEZ en Supabase:
--   Dashboard -> SQL Editor -> New query -> pegar todo -> Run
-- Es seguro correrlo mas de una vez (usa "if not exists").
-- =====================================================================

-- ---------------------------------------------------------------------
-- 1) MENSAJES DE CONTACTO (tabla "leads")
--    El formulario de contacto de index.html guarda aqui cada mensaje.
--    Tu los ves y administras desde admin.html.
-- ---------------------------------------------------------------------
create table if not exists public.leads (
  id uuid primary key default gen_random_uuid(),
  name text not null default '',
  contact text not null default '',
  need text not null default '',
  message text not null default '',
  language text not null default 'en',
  handled boolean not null default false,
  created_at timestamptz not null default now()
);

alter table public.leads enable row level security;

-- Cualquier visitante (incluso sin cuenta) puede ENVIAR un mensaje.
drop policy if exists "leads_insert_public" on public.leads;
create policy "leads_insert_public"
  on public.leads for insert
  with check (true);

-- Solo el administrador puede LEER, marcar como atendido o borrar.
drop policy if exists "leads_select_admin" on public.leads;
create policy "leads_select_admin"
  on public.leads for select
  using (public.is_admin_user());

drop policy if exists "leads_update_admin" on public.leads;
create policy "leads_update_admin"
  on public.leads for update
  using (public.is_admin_user());

drop policy if exists "leads_delete_admin" on public.leads;
create policy "leads_delete_admin"
  on public.leads for delete
  using (public.is_admin_user());

-- ---------------------------------------------------------------------
-- 2) ESTADO "RECHAZADA" CON MOTIVO
--    Al rechazar una propiedad ya no se borra: queda marcada como
--    rechazada y el dueno ve el motivo en su dashboard.
-- ---------------------------------------------------------------------
alter table public.properties
  add column if not exists rejected boolean not null default false;

alter table public.properties
  add column if not exists rejection_reason text not null default '';

-- ---------------------------------------------------------------------
-- 3) ALMACENAMIENTO DE FOTOS (Supabase Storage)
--    Las fotos que suben los usuarios ya no se guardan dentro de la
--    base de datos: se suben al bucket "property-photos" y solo se
--    guarda la direccion (URL) de cada foto.
-- ---------------------------------------------------------------------
insert into storage.buckets (id, name, public)
values ('property-photos', 'property-photos', true)
on conflict (id) do nothing;

-- Cualquiera puede VER las fotos (el bucket es publico).
drop policy if exists "property_photos_read" on storage.objects;
create policy "property_photos_read"
  on storage.objects for select
  using (bucket_id = 'property-photos');

-- Solo usuarios con sesion pueden SUBIR fotos, y solo dentro de una
-- carpeta con su propio id de usuario (asi nadie pisa fotos ajenas).
drop policy if exists "property_photos_insert" on storage.objects;
create policy "property_photos_insert"
  on storage.objects for insert
  with check (
    bucket_id = 'property-photos'
    and auth.role() = 'authenticated'
    and (storage.foldername(name))[1] = auth.uid()::text
  );

-- El dueno de la carpeta o el admin pueden borrar fotos.
drop policy if exists "property_photos_delete" on storage.objects;
create policy "property_photos_delete"
  on storage.objects for delete
  using (
    bucket_id = 'property-photos'
    and (
      (storage.foldername(name))[1] = auth.uid()::text
      or public.is_admin_user()
    )
  );
