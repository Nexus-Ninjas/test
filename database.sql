CREATE DATABASE IF NOT EXISTS inventory_pos_management_system;

USE inventory_pos_management_system;

CREATE TABLE IF NOT EXISTS users (
    id CHAR(11) PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    username VARCHAR(50),
    photo VARCHAR(50),
    password VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS purchases (
    id CHAR(11) PRIMARY KEY,
    purchase_date VARCHAR(50),
    purchase_no CHAR(10),
    supplier_id CHAR(11),
    purchase_status VARCHAR(10),
    created_by CHAR(11),
    updated_by CHAR(11),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);

CREATE TABLE IF NOT EXISTS purchase_details (
    purchase_id CHAR(11),
    product_id CHAR(11),
    quantity INT(11),
    unitcost INT(11),
    total INT(11),
    PRIMARY KEY (purchase_id, product_id),
    FOREIGN KEY (purchase_id) REFERENCES purchases(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE IF NOT EXISTS products (
    id CHAR(11) PRIMARY KEY,
    product_name VARCHAR(50),
    category_id CHAR(11),
    product_code CHAR(5),
    buying_price INT(11),
    selling_price INT(11),
    stock INT(11),
    unit_id CHAR(11),
    product_image VARCHAR(50),
    FOREIGN KEY (category_id) REFERENCES categories(id),
    FOREIGN KEY (unit_id) REFERENCES units(id)
);

CREATE TABLE IF NOT EXISTS categories (
    id CHAR(11) PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS units (
    id CHAR(11) PRIMARY KEY,
    unit_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS order_details (
    order_id CHAR(11),
    product_id CHAR(11),
    quantity INT(11),
    unitcost INT(11),
    total INT(11),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE IF NOT EXISTS orders (
    id CHAR(11) PRIMARY KEY,
    customer_id CHAR(11),
    order_date VARCHAR(10),
    order_status VARCHAR(10),
    total_products INT(11),
    sub_total INT(11),
    vat INT(11),
    total INT(11),
    invoice_no CHAR(10),
    payment_type VARCHAR(10),
    pay INT(11),
    due INT(11),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE IF NOT EXISTS customers (
    id CHAR(11) PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    phone VARCHAR(15),
    address VARCHAR(100),
    type VARCHAR(15),
    bank_name VARCHAR(50),
    account_holder VARCHAR(50),
    account_number VARCHAR(50),
    photo VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS suppliers (
    id CHAR(11) PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    phone VARCHAR(15),
    address VARCHAR(100),
    shopname VARCHAR(50),
    type VARCHAR(15),
    bank_name VARCHAR(50),
    account_holder VARCHAR(50),
    account_number VARCHAR(50),
    photo VARCHAR(50)
);
