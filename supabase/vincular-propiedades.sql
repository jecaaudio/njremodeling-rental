-- =====================================================================
-- VINCULAR TODAS LAS PROPIEDADES DEL SITIO A TU USUARIO
-- (njremodelingrental@gmail.com)
-- 1) Inserta las 6 propiedades originales si aun no estan en la base.
-- 2) Pone TODAS las propiedades existentes a tu nombre.
-- Corre este archivo UNA VEZ en Supabase (SQL Editor -> Run).
-- Es seguro correrlo mas de una vez: no duplica nada.
-- =====================================================================

-- 5903 Jessamine Ln
insert into public.properties
  (legacy_id, owner_id, title, address, city, state, zip, bedrooms, bathrooms, sqft, rent,
   image, fallback_image, photos, description_en, description_es, zillow_url, approved)
select
  '73561400',
  (select id from auth.users where email = 'njremodelingrental@gmail.com'),
  '5903 Jessamine Ln', '5903 Jessamine Ln', 'Louisville', 'KY', '40258',
  3, 1, 2268, 1780,
  'assets/properties/5903-jessamine.jpg', 'assets/properties/5903-jessamine.jpg', '["https://photos.zillowstatic.com/fp/855b690522816a1e1e962a1f346f2f75-cc_ft_960.jpg", "https://photos.zillowstatic.com/fp/4b21a3846a53b37f9833c802baf3a290-cc_ft_960.jpg", "https://photos.zillowstatic.com/fp/8efb555d4858c9800bec57f6a960f223-cc_ft_960.jpg", "https://photos.zillowstatic.com/fp/a3fecb54eb5cb7a99a0a347dd485da06-cc_ft_960.jpg", "https://photos.zillowstatic.com/fp/c83d1ac150dd50368bb2e4e756872511-cc_ft_960.jpg", "assets/properties/5903-jessamine.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/305/1668305_0.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/305/1668305_1.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/305/1668305_2.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/305/1668305_3.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/305/1668305_4.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/305/1668305_5.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/305/1668305_6.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/305/1668305_7.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/305/1668305_8.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/305/1668305_9.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/305/1668305_10.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/305/1668305_11.jpg"]'::jsonb,
  'Classic stone ranch on a large corner lot with an updated kitchen, granite countertops, fresh paint, laminate flooring, and a finished basement for extra living space.', 'Casa ranch de piedra en lote amplio con cocina renovada, granito, pintura fresca, piso laminado y sotano terminado para mas espacio.', 'https://www.zillow.com/homedetails/5903-Jessamine-Ln-Louisville-KY-40258/73561400_zpid/', true
where not exists (select 1 from public.properties x where x.legacy_id = '73561400');

-- 2205 Elmhurst Ave
insert into public.properties
  (legacy_id, owner_id, title, address, city, state, zip, bedrooms, bathrooms, sqft, rent,
   image, fallback_image, photos, description_en, description_es, zillow_url, approved)
select
  '73587912',
  (select id from auth.users where email = 'njremodelingrental@gmail.com'),
  '2205 Elmhurst Ave', '2205 Elmhurst Ave', 'Louisville', 'KY', '40216',
  2, 1, 710, 1130,
  'assets/properties/2205-elmhurst.jpg', 'assets/properties/2205-elmhurst.jpg', '["https://photos.zillowstatic.com/fp/ad26e9d9599373ecb50288ab09db4836-cc_ft_960.jpg", "https://photos.zillowstatic.com/fp/549a7ce56057a6f04592941d8fb42014-cc_ft_960.jpg", "assets/properties/2205-elmhurst.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/977/1531977_0.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/977/1531977_1.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/977/1531977_2.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/977/1531977_3.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/977/1531977_4.jpg"]'::jsonb,
  'Renovated home on a quiet street off Rockford Lane with a private back yard, convenient location, hardwood flooring, washer and dryer, deck, and porch.', 'Casa renovada en una calle tranquila cerca de Rockford Lane, con patio privado, buena ubicacion, piso de madera, lavadora y secadora, deck y porche.', 'https://www.zillow.com/homedetails/2205-Elmhurst-Ave-Louisville-KY-40216/73587912_zpid/', true
where not exists (select 1 from public.properties x where x.legacy_id = '73587912');

-- 7903 Canna Dr
insert into public.properties
  (legacy_id, owner_id, title, address, city, state, zip, bedrooms, bathrooms, sqft, rent,
   image, fallback_image, photos, description_en, description_es, zillow_url, approved)
select
  '73577696',
  (select id from auth.users where email = 'njremodelingrental@gmail.com'),
  '7903 Canna Dr', '7903 Canna Dr', 'Louisville', 'KY', '40258',
  3, 1, 1750, 1580,
  'assets/properties/7903-canna.jpg', 'assets/properties/7903-canna.jpg', '["https://photos.zillowstatic.com/fp/816401ad9e6f9db23ec2430bf3b41162-cc_ft_960.jpg", "https://photos.zillowstatic.com/fp/a6bfc21b386f3e1144b05eb65b19daa3-cc_ft_960.jpg", "assets/properties/7903-canna.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/543/1680543_1.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/543/1680543_2.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/543/1680543_3.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/543/1680543_4.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/543/1680543_5.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/543/1680543_6.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/543/1680543_7.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/543/1680543_8.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/543/1680543_9.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/543/1680543_10.jpg"]'::jsonb,
  'Brick ranch in PRP with fenced back yard, finished basement, attached carport, two-car detached garage, stainless steel appliances, and flexible lower-level space.', 'Ranch de ladrillo en PRP con patio cercado, sotano terminado, carport, garaje separado para dos carros, electrodomesticos de acero inoxidable y espacio flexible abajo.', 'https://www.zillow.com/homedetails/7903-Canna-Dr-Louisville-KY-40258/73577696_zpid/', true
where not exists (select 1 from public.properties x where x.legacy_id = '73577696');

-- 103 Scottsdale Blvd
insert into public.properties
  (legacy_id, owner_id, title, address, city, state, zip, bedrooms, bathrooms, sqft, rent,
   image, fallback_image, photos, description_en, description_es, zillow_url, approved)
select
  '73547767',
  (select id from auth.users where email = 'njremodelingrental@gmail.com'),
  '103 Scottsdale Blvd', '103 Scottsdale Blvd', 'Louisville', 'KY', '40214',
  3, 2, 1397, 1590,
  'assets/properties/103-scottsdale.jpg', 'assets/properties/103-scottsdale.jpg', '["https://photos.zillowstatic.com/fp/5a1ca297940492b3fffdd3f8bdfbb04f-cc_ft_960.jpg", "https://photos.zillowstatic.com/fp/7efaaae0c61947daad10e6bb78a67463-cc_ft_960.jpg", "https://photos.zillowstatic.com/fp/ecd65593f332153097882aed0a882025-cc_ft_960.jpg", "https://photos.zillowstatic.com/fp/d6ead7bb860641248f3f45fd9c0ac42f-cc_ft_960.jpg", "https://photos.zillowstatic.com/fp/d1e11fc6afd416a44ae4c74816268f67-cc_ft_960.jpg", "assets/properties/103-scottsdale.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/043/1712043_1.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/043/1712043_2.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/043/1712043_3.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/043/1712043_4.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/043/1712043_5.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/043/1712043_6.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/043/1712043_7.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/043/1712043_8.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/043/1712043_9.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/043/1712043_10.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/612/1703612_1.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/612/1703612_2.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/612/1703612_3.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/612/1703612_4.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/612/1703612_5.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/612/1703612_6.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/612/1703612_7.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/612/1703612_8.jpg"]'::jsonb,
  'Warm, well-maintained ranch with open kitchen and great room, updated kitchen, pantry, laundry area, covered front porch, patio, privacy-fenced yard, pool, and storage shed.', 'Ranch acogedor y bien cuidado con cocina abierta, great room, cocina renovada, pantry, laundry, porche cubierto, patio, cerca privada, piscina y shed.', 'https://www.zillow.com/homedetails/103-Scottsdale-Blvd-Louisville-KY-40214/73547767_zpid/', true
where not exists (select 1 from public.properties x where x.legacy_id = '73547767');

-- 3709 Carpenter Dr
insert into public.properties
  (legacy_id, owner_id, title, address, city, state, zip, bedrooms, bathrooms, sqft, rent,
   image, fallback_image, photos, description_en, description_es, zillow_url, approved)
select
  '73541489',
  (select id from auth.users where email = 'njremodelingrental@gmail.com'),
  '3709 Carpenter Dr', '3709 Carpenter Dr', 'Louisville', 'KY', '40229',
  3, 1.5, 1134, 1538,
  'https://ssl.cdn-redfin.com/photo/185/bigphoto/443/1616443_1.jpg', 'assets/property-hero.jpg', '["https://ssl.cdn-redfin.com/photo/185/bigphoto/443/1616443_0.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/443/1616443_1.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/443/1616443_2.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/443/1616443_3.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/443/1616443_4.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/443/1616443_5.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/443/1616443_6.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/443/1616443_7.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/443/1616443_8.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/443/1616443_9.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/443/1616443_10.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/443/1616443_11.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/443/1616443_12.jpg"]'::jsonb,
  'Bright ranch in Silver Heights with three bedrooms, one full bath plus a half bath, an attached garage, porch, chain-link fencing, and a spacious back yard.', 'Ranch claro en Silver Heights con tres habitaciones, un bano completo y medio bano, garaje, porche, cerca de chain link y un patio amplio.', 'https://www.zillow.com/homedetails/3709-Carpenter-Dr-Louisville-KY-40229/73541489_zpid/', true
where not exists (select 1 from public.properties x where x.legacy_id = '73541489');

-- 9507 Polaris Dr
insert into public.properties
  (legacy_id, owner_id, title, address, city, state, zip, bedrooms, bathrooms, sqft, rent,
   image, fallback_image, photos, description_en, description_es, zillow_url, approved)
select
  '73649367',
  (select id from auth.users where email = 'njremodelingrental@gmail.com'),
  '9507 Polaris Dr', '9507 Polaris Dr', 'Louisville', 'KY', '40229',
  3, 1, 1025, 1522,
  'https://ssl.cdn-redfin.com/photo/185/bigphoto/968/1619968_1.jpg', 'assets/property-hero.jpg', '["https://ssl.cdn-redfin.com/photo/185/bigphoto/968/1619968_0.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/968/1619968_1.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/968/1619968_2.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/968/1619968_3.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/968/1619968_4.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/968/1619968_5.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/968/1619968_6.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/968/1619968_7.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/968/1619968_8.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/968/1619968_9.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/968/1619968_10.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/968/1619968_11.jpg", "https://ssl.cdn-redfin.com/photo/185/bigphoto/968/1619968_12.jpg"]'::jsonb,
  'Silver Heights ranch with three bedrooms, first-floor living, dining room, kitchen, driveway parking, and major systems reported replaced in recent years.', 'Ranch en Silver Heights con tres habitaciones, distribucion en un solo nivel, comedor, cocina, parqueo en driveway y sistemas principales reportados como reemplazados en anos recientes.', 'https://www.zillow.com/homedetails/9507-Polaris-Dr-Louisville-KY-40229/73649367_zpid/', true
where not exists (select 1 from public.properties x where x.legacy_id = '73649367');

-- Todas las propiedades existentes pasan a ser tuyas:
update public.properties
set owner_id = (select id from auth.users where email = 'njremodelingrental@gmail.com')
where owner_id is distinct from (select id from auth.users where email = 'njremodelingrental@gmail.com');

-- Resumen para confirmar:
select count(*) as propiedades_a_tu_nombre
from public.properties p
join auth.users u on u.id = p.owner_id
where u.email = 'njremodelingrental@gmail.com';
