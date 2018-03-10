# MyBLOG 

Blog App using the Laravel framework.

Features:
1.	Creating the Categories Admin Panel: List,View,Add,Delete Categories
2.	Creating the Posts Admin Panel: List,View,Add,Edit,Delete Posts with attachment (any file extension). Images can be shown on webpage but other files can be  downloaded to watch. 
3.	Add/list/delete comments related post
3.	Displaying Posts By Category
4.	Searching Posts
5.	Building Shopping Cart: Add/Update/Delete Cart
6.	Security, User/Admin Authentication: 
	- Only admin users can perform CRUD operation with Categories, Posts, Comments
	- Normal user can perform CRUD operation with Posts and Comments only
	- Normal user can not Edit/Delete other users posts
7.	Pagination feature is available
8.	MYSQL dump of the database named 'laravelblog.sql’ is provided.
9.	Images will be stored in folder ‘public/images’ using laravel package ‘File Storage’

### Prerequisites

•	XAMPP (start MySQL, Apache service)
•	Phpmyadmin 
•	Php laravel (Laravel Framework 5.4.35)
•	Text editor

## Getting Started

Step 1: Download and add the folder inside ‘C:\xampp\htdocs’

Step 2: Open phpmyadmin http://localhost/phpmyadmin/index.php , create database ‘laravelblog’ and import database dump file ‘laravelblog.sql’ into it.

Step 3: Go to command prompt

c:\xampp\htdocs\laravelblog>php artisan serve 

Visit http://127.0.0.1:8000/ to see the application in action.

Note: If you cannot see images (attachments) on webpage , then remove folder ‘storage’ from ‘app\public’ and then again link it using command as follows:
‘php artisan storage:link’

Home Page
![1homepage](https://user-images.githubusercontent.com/14937374/37242528-502c6612-246b-11e8-927e-c7c7c9bb56a5.png)

Blog post list
![2bloglist](https://user-images.githubusercontent.com/14937374/37242529-565a17fa-246b-11e8-8f78-2e508f9fc250.png)

Categories Admin Panel
![3category admin panel](https://user-images.githubusercontent.com/14937374/37242530-58ea6e8e-246b-11e8-8051-5eb50e847a49.png)

Posts Admin Panel
![4blog admin panel](https://user-images.githubusercontent.com/14937374/37242531-5c186926-246b-11e8-910a-2db77ba58fee.png)

View blog with comment functionality
![5view blog with comment functionality](https://user-images.githubusercontent.com/14937374/37242532-5ef5dd18-246b-11e8-8a69-e19872abdf46.png)

Displaying Posts By Category
![6postsbycategory](https://user-images.githubusercontent.com/14937374/37242534-62d8dc00-246b-11e8-94f1-2d8d6e641115.png)



