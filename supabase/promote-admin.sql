-- Run this AFTER njremodelingrental@gmail.com has signed up at least once on login.html.
-- It promotes that account to admin so it can approve/reject properties in admin.html.

update public.profiles
set is_admin = true
where email = 'njremodelingrental@gmail.com';
