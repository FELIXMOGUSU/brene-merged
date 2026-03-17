create extension if not exists pgcrypto;

create table if not exists public.customers (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  email text unique,
  phone text unique,
  created_at timestamptz not null default now()
);

create table if not exists public.orders (
  id uuid primary key default gen_random_uuid(),
  customer_id uuid not null references public.customers(id) on delete cascade,
  product_name text not null,
  size text,
  quantity integer not null default 1 check (quantity > 0),
  total_price numeric(12,2) not null default 0,
  payment_status text not null default 'pending',
  created_at timestamptz not null default now()
);

create table if not exists public.catalogue (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  description text,
  price numeric(12,2) not null default 0,
  image_url text,
  category text,
  in_stock boolean not null default true,
  sizes text[] not null default array['S','M','L','XL'],
  colors text[] not null default array['Black'],
  tags text[] not null default array[]::text[],
  created_at timestamptz not null default now()
);

alter table public.customers enable row level security;
alter table public.orders enable row level security;
alter table public.catalogue enable row level security;

create policy "public can read catalogue" on public.catalogue for select using (true);
create policy "public can manage catalogue" on public.catalogue for all using (true) with check (true);
create policy "public can insert customers" on public.customers for insert with check (true);
create policy "public can read customers" on public.customers for select using (true);
create policy "public can update customers" on public.customers for update using (true) with check (true);
create policy "public can insert orders" on public.orders for insert with check (true);
create policy "public can read orders" on public.orders for select using (true);
