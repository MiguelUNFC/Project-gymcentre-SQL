-- 1 customers table
CREATE TABLE customers (
	customer_id int NOT NULL AUTO_INCREMENT,
	customer_firstName char(35) NOT NULL DEFAULT ' ',
    customer_lastName char(35) NOT NULL DEFAULT ' ',
    customer_age int NOT NULL DEFAULT '0',
    customer_genre CHAR(35),
    customer_email char(50) NOT NULL DEFAULT ' ', 
    customer_phone char(15) NOT NULL DEFAULT ' ',
    customer_address char(50) NOT NULL DEFAULT ' ',
    PRIMARY KEY (customer_id)
);


-- 2 Memberships table
CREATE TABLE memberships(
	membership_id INT NOT NULL PRIMARY KEY,
    membership_type CHAR(35),
    membership_price DECIMAL NOT NULL,
    membership_duration CHAR(35),
    membership_benefits CHAR(100) NOT NULL DEFAULT ' '
    
);

-- 3  payments table
CREATE TABLE payments(
	payment_id  INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL DEFAULT '0',
    membership_id INT NOT NULL DEFAULT '0',
    payment_date DATE NOT NULL,
    payment_amount DECIMAL NOT NULL,
    payment_method CHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (membership_id) REFERENCES memberships(membership_id)
);


-- 4 customer_progress table
CREATE TABLE customer_progress (
    progress_id INT NOT NULL PRIMARY KEY,
    customer_id INT NOT NULL,
    weight DECIMAL(5, 2),
    body_fat DECIMAL(4, 2),
    progress_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

/* If we wanted to create the table:
-- 5 registrations table
CREATE TABLE registrations (
    registration_id INT NOT NULL PRIMARY KEY,
    customer_id INT NOT NULL,
    registration_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

if we wanted to import from an CSV document and modify the table, it means, first import and then:
ALTER TABLE registrations CHANGE COLUMN ï»¿registration_id registration_id INT NOT NULL PRIMARY KEY; ---> to create primary key

ALTER TABLE registrations
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id) REFERENCES customers(customer_id);   ----> to create fk and to connect to customer
*/


-- 6 workouts table
CREATE TABLE workouts(
	workout_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    workout_name VARCHAR (35) NOT NULL,
    workout_description TEXT,
    workout_duration INT NOT NULL
);


-- 7 trainer table
CREATE TABLE trainer(
	trainer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    trainer_firstName VARCHAR (35),
    trainer_lastName VARCHAR (35),
    trainer_email VARCHAR (35),
    trainer_phone VARCHAR (35),
    trainer_address VARCHAR (35),
    trainer_certificates VARCHAR (100) -- puedo sacar una tabla sobre este
);



-- 8 classes table
CREATE TABLE classes(
	class_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR (35) NOT NULL DEFAULT ' ',
    class_duration INT NOT NULL DEFAULT '0',
    class_maxCapacity INT NOT NULL DEFAULT '15',
    class_dateTime DATETIME NOT NULL,
    trainer_id INT NOT NULL,
    workout_id INT NOT NULL,
    FOREIGN KEY (trainer_id) REFERENCES trainer(trainer_id),
    FOREIGN KEY (workout_id) REFERENCES workouts(workout_id)
);

/* If we wanted to create the table:
-- 9 class_registrations table
CREATE TABLE class_registration (
    registration_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    customer_id INT NOT NULL,
    class_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (class_id) REFERENCES classes(class_id)
);


we decided to import from an CSV document and then modify the table, it means, first import and then:
USE fitness_centre;
ALTER TABLE class_registration CHANGE COLUMN ï»¿registration_id classs_registration_id INT NOT NULL PRIMARY KEY;

ALTER TABLE class_registration
ADD CONSTRAINT fk_customer1
FOREIGN KEY (customer_id) REFERENCES customers(customer_id);   

ALTER TABLE class_registration
ADD CONSTRAINT fk_class
FOREIGN KEY (class_id) REFERENCES classes(class_id); 
*/

 

-- 10 supplier table
CREATE TABLE Supplier (
    supplier_id INT NOT NULL PRIMARY KEY,
    supplier_name VARCHAR(100),
    supplier_phone VARCHAR(15),
    supplier_email VARCHAR(100),
    supplier_address VARCHAR(150)
);

-- 11 inventory table
CREATE TABLE inventory (
	product_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    product_name CHAR(50),
    category CHAR(50),
    available_quantity INT,
    supplier_id INT,
    product_price DECIMAL(10,2),
    FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id)
);
