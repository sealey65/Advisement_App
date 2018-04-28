/* 

Admin IDs:
stacy_williams

Student IDs:
00055873
00052358

Advisor_IDs
AD_Nagee


all passwords:
$Password123

password hash is:
$2y$10$exOI/zFzLjbJRsLD76J/qupaNGB3FrezGBxDY71vUrRZtEFp6Cbxi

*/

-- copy and paste this into phpmyadmin or mysql console to insert values.
-- this is only necessary if the latest database export doesn't have user data for some reason

INSERT INTO `user` (`user_id`, `user_email`, `password_hash`, `role_name`) VALUES
('00052358', '00052358@my.costaatt.edu.tt', '$2y$10$exOI/zFzLjbJRsLD76J/qupaNGB3FrezGBxDY71vUrRZtEFp6Cbxi', 'Student'),
('00055873', '00055873@my.costaatt.edu.tt', '$2y$10$exOI/zFzLjbJRsLD76J/qupaNGB3FrezGBxDY71vUrRZtEFp6Cbxi', 'Student'),
('AD_Nagee', 'AD_Nagee@my.costaatt.edu.tt', '$2y$10$exOI/zFzLjbJRsLD76J/qupaNGB3FrezGBxDY71vUrRZtEFp6Cbxi', 'Advisor'),
('stacy_williams', 'stacy.williams@my.costaatt.edu.tt', '$2y$10$exOI/zFzLjbJRsLD76J/qupaNGB3FrezGBxDY71vUrRZtEFp6Cbxi', 'Admin');
