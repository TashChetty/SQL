--Creating product table
CREATE TABLE product
(
    product_id bigserial PRIMARY KEY NOT NULL,
    description varchar (100) NOT NULL,
    price numeric (20,2) NOT NULL
);

--Insert into Product Table
INSERT INTO product (description, price)
VALUES ('Coke', 7.5),
       ('Doritos', 8.5),
       ('BarOne', 9.5),
       ('Fanta', 7.5),
       ('Juice', 10.5);
       
SELECT * FROM product;

--Creating Cart 
CREATE TABLE cart
(
    product_id bigint PRIMARY KEY NOT NULL,
    quantity bigint NOT NULL CHECK (quantity > -1)
     
);
--show cart
SELECT description, quantity, price, quantity*price AS subtotal FROM cart
INNER JOIN product ON cart.product_id = product.product_id;

--IF Quantity = 0, add product to cart
INSERT INTO cart (product_id,quantity)
SELECT 3,1
WHERE NOT EXISTS (
SELECT 1 FROM cart WHERE product_id=3);
--show cart
SELECT description, quantity, price, quantity*price AS subtotal FROM cart
INNER JOIN product ON cart.product_id = product.product_id;

----------------------------DO NOT RUN--------------------------------------------------------
--INSERT into cart
INSERT INTO cart (product_id,quantity)
VALUES (1,2),
        (2, 1),
       (3, 4),
       (4, 3),
       (5, 2);
SELECT * FROM cart;
--INNER JOIN
SELECT description, quantity, price, quantity*price AS subtotal FROM cart
INNER JOIN product ON cart.product_id = product.product_id;
---------------------------------DO NOT RUN-----------------------------------------------------

--UPDATE CART add For each product_id
UPDATE cart SET cart.quantity = cart.quantity+1
WHERE EXISTS (SELECT 1 FROM cart c WHERE c.product_id=2)--if this product exists then it will update
AND cart.product_id=2;
--Show Cart on ADDING product_id
SELECT description, quantity, price, quantity*price AS subtotal FROM cart
INNER JOIN product ON cart.product_id = product.product_id;


--UPDATE CART REMOVE For each product_id
UPDATE cart SET cart.quantity = cart.quantity - 1
WHERE EXISTS (SELECT 1 FROM cart c WHERE c.product_id=1)--if this product exists then it will update
AND cart.product_id=1;
--Show Cart on removing product_id
SELECT description, quantity, price, quantity*price AS subtotal FROM cart
INNER JOIN product ON cart.product_id = product.product_id;


--delete from cart
DELETE FROM cart WHERE cart.quantity = 0;
--Show Cart on DELETING 0
SELECT description, quantity, price, quantity*price AS subtotal FROM cart
INNER JOIN product ON cart.product_id = product.product_id;

-- grandtotal
SELECT SUM(cart.quantity*product.price) AS grandtotal
FROM cart
INNER JOIN product on product.product_id = cart.product_id;

