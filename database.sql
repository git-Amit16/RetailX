-- Supermarket Management System Database Schema

CREATE DATABASE IF NOT EXISTS supermarket_db;
USE supermarket_db;

-- Users table (for owner login)
CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Categories table
CREATE TABLE IF NOT EXISTS categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Suppliers table
CREATE TABLE IF NOT EXISTS suppliers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    contact VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- Products table
CREATE TABLE IF NOT EXISTS products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    category_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    price DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    supplier_id INT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id) ON DELETE CASCADE
);

-- Customers table
CREATE TABLE IF NOT EXISTS customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    contact VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    address TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Purchases tables
CREATE TABLE IF NOT EXISTS purchases (
    id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_id INT NULL,
    total_amount DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    date DATETIME DEFAULT CURRENT_TIMESTAMP,
    invoice_no VARCHAR(100),
    notes TEXT,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS purchase_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    purchase_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_cost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (purchase_id) REFERENCES purchases(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

-- Orders table
CREATE TABLE IF NOT EXISTS orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
);

-- Order Items table (to track products in each order)
CREATE TABLE IF NOT EXISTS order_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

-- Note: Admin user password will be set up using the setup script
-- Run: node scripts/setup-admin.js after creating the database

-- Sample data for testing
INSERT INTO categories (name) VALUES 
('Fruits & Vegetables'),
('Dairy Products'),
('Beverages'),
('Snacks'),
('Bakery');

INSERT INTO suppliers (name, contact, email) VALUES 
('Fresh Farms', '1234567890', 'fresh@farms.com'),
('Dairy Co', '0987654321', 'dairy@co.com'),
('Beverage Inc', '1122334455', 'beverage@inc.com');


INSERT INTO categories (name)
VALUES ('Electronics');

-- ✅ Extend supplier list to total 10 suppliers
INSERT INTO suppliers (name, contact, email) VALUES
('Snack World', '9876543210', 'snackworld@gmail.com'),
('Bake House', '9123456789', 'bakehouse@gmail.com'),
('ElectroMart', '9988776655', 'electromart@gmail.com'),
('Super Electronics', '9000011223', 'superelectronics@gmail.com'),
('Green Growers', '9001122334', 'greengrowers@gmail.com'),
('Mega Wholesale', '9112233445', 'megawholesale@gmail.com'),
('Gadget Hub', '9223344556', 'gadgethub@gmail.com');

-- ✅ Add 30 realistic customers
INSERT INTO customers (name, contact, email, phone, address) VALUES
('Amit Kumar', '9000011111', 'amitkumar@gmail.com', '9000011111', 'Vizag, Andhra Pradesh'),
('Priya Singh', '9000022222', 'priyasingh@gmail.com', '9000022222', 'Hyderabad, Telangana'),
('Rahul Mehta', '9000033333', 'rahulmehta@gmail.com', '9000033333', 'Chennai, Tamil Nadu'),
('Neha Sharma', '9000044444', 'nehasharma@gmail.com', '9000044444', 'Delhi'),
('Sanjay Reddy', '9000055555', 'sanjayreddy@gmail.com', '9000055555', 'Bangalore, Karnataka'),
('Deepa Iyer', '9000066666', 'deepaiyer@gmail.com', '9000066666', 'Kochi, Kerala'),
('Vikram Rao', '9000077777', 'vikramrao@gmail.com', '9000077777', 'Mumbai, Maharashtra'),
('Anjali Das', '9000088888', 'anjalidas@gmail.com', '9000088888', 'Kolkata, West Bengal'),
('Ravi Teja', '9000099999', 'raviteja@gmail.com', '9000099999', 'Visakhapatnam, Andhra Pradesh'),
('Sneha Patel', '9010010101', 'snehapatel@gmail.com', '9010010101', 'Surat, Gujarat'),
('Arjun Nair', '9010020202', 'arjunnair@gmail.com', '9010020202', 'Thiruvananthapuram, Kerala'),
('Sowmya Devi', '9010030303', 'sowmyadevi@gmail.com', '9010030303', 'Vijayawada, Andhra Pradesh'),
('Manoj Kumar', '9010040404', 'manojkumar@gmail.com', '9010040404', 'Pune, Maharashtra'),
('Bhavna Joshi', '9010050505', 'bhavnajoshi@gmail.com', '9010050505', 'Ahmedabad, Gujarat'),
('Rajesh Khanna', '9010060606', 'rajeshkhanna@gmail.com', '9010060606', 'Chandigarh'),
('Meena Roy', '9010070707', 'meenroy@gmail.com', '9010070707', 'Lucknow, UP'),
('Harish Chandra', '9010080808', 'harishchandra@gmail.com', '9010080808', 'Delhi'),
('Pooja Jain', '9010090909', 'poojajain@gmail.com', '9010090909', 'Bhopal, MP'),
('Sunil Gupta', '9020010101', 'sunilgupta@gmail.com', '9020010101', 'Ranchi, Jharkhand'),
('Rohit Sharma', '9020020202', 'rohitsharma@gmail.com', '9020020202', 'Jaipur, Rajasthan'),
('Anita Menon', '9020030303', 'anitamenon@gmail.com', '9020030303', 'Cochin, Kerala'),
('Tarun Verma', '9020040404', 'tarunverma@gmail.com', '9020040404', 'Nagpur, Maharashtra'),
('Divya Raj', '9020050505', 'divyaraj@gmail.com', '9020050505', 'Indore, MP'),
('Nikhil Rao', '9020060606', 'nikhilrao@gmail.com', '9020060606', 'Bangalore, Karnataka'),
('Shweta Kaur', '9020070707', 'shwetakaur@gmail.com', '9020070707', 'Amritsar, Punjab'),
('Kiran Babu', '9020080808', 'kiranbabu@gmail.com', '9020080808', 'Hyderabad, Telangana'),
('Ramesh Naidu', '9020090909', 'rameshnaidu@gmail.com', '9020090909', 'Guntur, Andhra Pradesh'),
('Lavanya S', '9030010101', 'lavanyas@gmail.com', '9030010101', 'Vellore, Tamil Nadu'),
('Vamsi Krishna', '9030020202', 'vamsikrishna@gmail.com', '9030020202', 'Vizag, Andhra Pradesh'),
('Rekha Nair', '9030030303', 'rekhanair@gmail.com', '9030030303', 'Palakkad, Kerala');

-- ✅ Products (grouped by category)
-- Note: category_id values assume auto-increment order (1=Fruits & Vegetables, 2=Dairy, 3=Beverages, 4=Snacks, 5=Bakery, 6=Electronics)

-- Fruits & Vegetables
INSERT INTO products (name, category_id, quantity, price, supplier_id) VALUES
('Apples', 1, 100, 120.00, 1),
('Bananas', 1, 150, 50.00, 1),
('Tomatoes', 1, 200, 40.00, 8),
('Potatoes', 1, 250, 35.00, 8),
('Carrots', 1, 180, 45.00, 8);

-- Dairy Products
INSERT INTO products (name, category_id, quantity, price, supplier_id) VALUES
('Milk (1L)', 2, 300, 55.00, 2),
('Butter (500g)', 2, 120, 260.00, 2),
('Cheese (200g)', 2, 80, 180.00, 2),
('Curd (500g)', 2, 200, 60.00, 2),
('Paneer (250g)', 2, 150, 100.00, 2);

-- Beverages
INSERT INTO products (name, category_id, quantity, price, supplier_id) VALUES
('Coca-Cola (1L)', 3, 200, 90.00, 3),
('Pepsi (1L)', 3, 180, 85.00, 3),
('Red Bull (250ml)', 3, 100, 120.00, 3),
('Tropicana Orange Juice (1L)', 3, 90, 130.00, 3),
('Bisleri Water (1L)', 3, 300, 25.00, 3);

-- Snacks
INSERT INTO products (name, category_id, quantity, price, supplier_id) VALUES
('Lays Chips (50g)', 4, 400, 20.00, 4),
('Kurkure Masala Munch (50g)', 4, 350, 15.00, 4),
('Bingo Tangles (50g)', 4, 300, 15.00, 4),
('Haldiram Mixture (200g)', 4, 250, 60.00, 4),
('Popcorn Packet (100g)', 4, 200, 40.00, 4);

-- Bakery
INSERT INTO products (name, category_id, quantity, price, supplier_id) VALUES
('White Bread (400g)', 5, 200, 35.00, 5),
('Brown Bread (400g)', 5, 180, 40.00, 5),
('Butter Cookies (200g)', 5, 150, 120.00, 5),
('Muffins (Pack of 4)', 5, 100, 150.00, 5),
('Croissant (Pack of 2)', 5, 100, 90.00, 5);

-- Electronics
INSERT INTO products (name, category_id, quantity, price, supplier_id) VALUES
('LED TV 32-inch', 6, 20, 18000.00, 6),
('Bluetooth Speaker', 6, 40, 2500.00, 7),
('Microwave Oven', 6, 15, 9000.00, 6),
('Mixer Grinder', 6, 25, 3500.00, 7),
('Refrigerator 200L', 6, 10, 21000.00, 6),
('Electric Kettle', 6, 30, 1200.00, 7),
('Headphones', 6, 50, 1500.00, 10),
('Smartwatch', 6, 40, 4000.00, 10),
('Laptop (i5, 8GB RAM)', 6, 8, 55000.00, 10),
('Washing Machine (6kg)', 6, 12, 23000.00, 7);

