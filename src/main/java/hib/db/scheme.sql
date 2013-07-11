
DROP DATABASE IF EXISTS eproject;
CREATE SCHEMA IF NOT EXISTS eproject;

USE eproject;

CREATE TABLE customer (
    customer_id INTEGER NOT NULL AUTO_INCREMENT,
    'name' VARCHAR(255) NOT NULL,    
    PRIMARY KEY (customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE 'order' (
    order_id BIGINT NOT NULL AUTO_INCREMENT,
    order_type INT NOT NULL, 
    order_uid VARCHAR(255),
    order_description TEXT,
    customer_id INTEGER,
    CONSTRAINT customer_id_fk FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT order_type_id FOREIGN KEY (order_type) REFERENCES order_type(order_type_id) ON UPDATE CASCADE ON DELETE SET NULL,
    PRIMARY KEY(order_id, order_type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE payment(
    payment_id BIGINT NOT NULL AUTO_INCREMENT;
    payment_prefix CHAR(5),
    order_id BIGINT NOT NULL,
    desciption TEXT,
    CONSTRAINT order_id_fk FOREIGN KEY (order_id) REFERENCES 'order'(order_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    PRIMARY KEY(payment_prefix, payment_id)    
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE order_type (
    order_type_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255),
    description TEXT,
    PRIMARY KEY (order_type_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


