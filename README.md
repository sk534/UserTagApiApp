# README

This README would normally document whatever steps are necessary to get the
application up and running.

User List
localhost:3000/api/v1/users 
GET
=========================================================================================
Create User
localhost:3000/api/v1/create_user?first_name=satish5&last_name=kumar5&email=sk5@example.com&password=password&password_confirmation=password&username=sk5&is_admin=false
POST
==========================================================================================
localhost:3000/api/v1/create_user?first_name=satish1&last_name=kumar1&email=sk1@example.com&password=password&password_confirmation=password&username=sk1&is_admin=true
POST
==========================================================================================
Delete User
localhost:3000/api/v1/delete_user?username=sk5
POST
==========================================================================================
Deactivate User
localhost:3000/api/v1/deactivate_user?username=sk5
POST
==========================================================================================
Update User:
localhost:3000/api/v1/update_user?first_name=a1&last_name=a1&email=sk5@example.com&password=Passwors&password_confirmation=Password
POST
==========================================================================================
Tag List
localhost:3000/api/v1/users 
GET
==========================================================================================
Create Tag
localhost:3000/api/v1/create_tag?name=taggggee&username=sk5
POST
==========================================================================================
Delete Tag
localhost:3000/api/v1/delete_tag?name=t3tagggggg&username=sk5
POST
==========================================================================================
Update Tag:
localhost:3000/api/v1/update_tag?name=t3tagggggg&username=sk5
POST





TRUNCATE users RESTART IDENTITY;

select * from users;

