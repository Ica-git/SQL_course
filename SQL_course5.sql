select b.*,  
       sum ( weight ) over (
         order by BRICK_ID
       ) running_weight
from   bricks b;

select b.*,  
       sum ( weight ) over (
         order by BRICK_ID range between unbounded preceding 
      and current row
       ) running_weight
from   bricks b;

select b.*,  
       sum ( weight ) over (
         order by weight
       ) running_weight
from   bricks b
order by weight;

select b.*,  
       sum ( weight ) over (
         order by weight rows between unbounded preceding 
     and current row
       ) running_weight
from   bricks b
order by weight;

select b.*,  
       sum ( weight ) over (
         order by weight rows between 1 preceding 
     and current row
       ) running_weight
from   bricks b
order  by weight;

select b.*,  
       sum ( weight ) over (
         order by weight rows between 2 preceding 
     and current row
       ) running_weight
from   bricks b
order  by weight;

select * from (
  select b.*,
         count(*) over ( partition by colour ) colour_count
  from   bricks b
)
where  colour_count >= 2;

update bricks set weight = 5 where weight = 2;
commit;

CREATE TABLE STORES (
STORE_ID NUMBER NOT NULL,
CITY VARCHAR(50)
);

SELECT * FROM STORES;

INSERT INTO STORES(STORE_ID, CITY) VALUES(1, 'San Francisco');
INSERT INTO STORES(STORE_ID, CITY) VALUES(2, 'New York City');
SELECT * FROM STORES ORDER BY STORE_ID;

INSERT INTO STORES(STORE_ID, CITY) VALUES(3, 'CHICAGO');

INSERT ALL
    INTO STORES(STORE_ID, CITY) VALUES (4, 'Philadelphia')
    INTO STORES(STORE_ID, CITY) VALUES (5, 'Boston')
    INTO STORES(STORE_ID, CITY) VALUES (6, 'Seattle')
SELECT * FROM DUAL;

SELECT STORE_ID, INITCAP(CITY) FROM STORES;

SELECT DISTINCT STORE_ID, CITY FROM STORES;
SELECT STORE_ID, COUNT(*) FROM STORES GROUP BY STORE_ID;
SELECT STORE_ID, COUNT(*) FROM STORES GROUP BY STORE_ID ORDER BY 1;

CREATE TABLE PRODUCTS 
(
    PRODUCT_ID NUMBER NOT NULL,
    NAME VARCHAR(50),
    PRODUCT_COST NUMBER(5,2),
    PRODUCT_RETAIL NUMBER(5,2),
    PRODUCT_TYPE VARCHAR(10),
    STORE_ID NUMBER NOT NULL,

    CONSTRAINT PRODUCT_PK PRIMARY KEY (PRODUCT_ID)
)

SELECT * FROM PRODUCTS;

INSERT INTO PRODUCTS(PRODUCT_ID, NAME, PRODUCT_COST, PRODUCT_RETAIL, PRODUCT_TYPE, STORE_ID) 
VALUES (1001, 'Colgate Toothpaste', 2.25, 5.47, 'hygiene', 2);
INSERT INTO PRODUCTS(PRODUCT_ID, NAME, PRODUCT_COST, PRODUCT_RETAIL, PRODUCT_TYPE, STORE_ID) 
VALUES (1002, 'Colgate Toothpaste', 2.25, 5.47, 'hygiene', 2);
INSERT INTO PRODUCTS(PRODUCT_ID, NAME, PRODUCT_COST, PRODUCT_RETAIL, PRODUCT_TYPE, STORE_ID) 
VALUES (1003, 'Listerine Mouthwash', 1.75, 4.81, 'hygiene', 3);

SELECT * FROM PRODUCTS;

SELECT * FROM PRODUCTS NATURAL JOIN STORES;

INSERT ALL
    INTO products (product_id, name, product_cost, product_retail, product_type, store_id )
        VALUES (1004, 'T-Shirt', 1.75, 7.77, 'Clothing', 2)
    INTO products (product_id, name, product_cost, product_retail, product_type, store_id )
        VALUES (1005, 'T-Shirt', 1.65, 7.85, 'Clothing', 2)
    INTO products (product_id, name, product_cost, product_retail, product_type, store_id )
        VALUES (1006, 'T-Shirt', 1.73, 7.80, 'Clothing', 3)
    INTO products (product_id, name, product_cost, product_retail, product_type, store_id )
        VALUES (1007, 'Shorts', 0.73, 5.60, 'Clothing', 3)
    INTO products (product_id, name, product_cost, product_retail, product_type, store_id )
        VALUES (1008, 'Dress Shoes', 17.85, 87.67, 'Clothing', 2)
    INTO products (product_id, name, product_cost, product_retail, product_type, store_id )
        VALUES (1009, 'Garden Chair', 12.01, 27.87, 'Home & Gar', 2)
    INTO products (product_id, name, product_cost, product_retail, product_type, store_id )
        VALUES (1010, 'Grass Fertilizer', 3.20, 8.70, 'Home & Gar', 2)
SELECT * FROM DUAL; 

SELECT * FROM PRODUCTS NATURAL JOIN STORES;

DESCRIBE EMP;

CREATE TABLE dest_tbl_1 (
id NUMBER,
name VARCHAR2(50),
date_of DATE
);

CREATE TABLE dest_tbl_2 (
id NUMBER,
name VARCHAR2(50),
date_of DATE
);

CREATE TABLE dest_tbl_3 (
id NUMBER,
name VARCHAR2(50),
date_of DATE
);

INSERT ALL
    INTO dest_tbl_1 (id, name, date_of) values (EMPNO, ENAME, HIREDATE)
    INTO dest_tbl_2 (id, name, date_of) values (EMPNO, ENAME, HIREDATE)
    INTO dest_tbl_3 (id, name, date_of) values (EMPNO, ENAME, HIREDATE)
SELECT EMPNO, ENAME, HIREDATE FROM EMP;

INSERT ALL
WHEN SAL <= 1500 THEN
    INTO dest_tbl_1 (id, name, date_of) values (EMPNO, ENAME, HIREDATE)
WHEN SAL BETWEEN 1501AND 2500 THEN
    INTO dest_tbl_2 (id, name, date_of) values (EMPNO, ENAME, HIREDATE)
ELSE
    INTO dest_tbl_3 (id, name, date_of) values (EMPNO, ENAME, HIREDATE)
SELECT EMPNO, ENAME, HIREDATE, SAL FROM EMP;

INSERT ALL
WHEN SAL <= 1500 THEN
    INTO dest_tbl_1 (id, name, date_of) values (EMPNO, ENAME, HIREDATE)
WHEN SAL BETWEEN 1501AND 2500 THEN
    INTO dest_tbl_2 (id, name, date_of) values (EMPNO, ENAME, HIREDATE)
WHEN SAL > 2500 THEN
    INTO dest_tbl_3 (id, name, date_of) values (EMPNO, ENAME, HIREDATE)
SELECT EMPNO, ENAME, HIREDATE, SAL FROM EMP;

SELECT * FROM dest_tbl_1;
SELECT * FROM dest_tbl_2;
SELECT * FROM dest_tbl_3;

INSERT INTO PRODUCTS(PRODUCT_ID, NAME, PRODUCT_COST, PRODUCT_RETAIL, PRODUCT_TYPE, STORE_ID)
VALUES (1011, '', 4.00, 8.00, 'Clothing', 3);

INSERT INTO PRODUCTS VALUES (1011, '', 4.00, 8.00, 'Clothing', 3);

DESCRIBE PRODUCTS;

ALTER TABLE PRODUCTS MODIFY NAME VARCHAR2(50) NOT NULL;

DELETE FROM PRODUCTS WHERE PRODUCT_ID = 1011;

DELETE FROM PRODUCTS WHERE NAME IS NULL;

ALTER TABLE PRODUCTS MODIFY NAME VARCHAR2(50) NOT NULL;

ALTER TABLE PRODUCTS MODIFY NAME VARCHAR2(50) NOT NULL;

DESCRIBE PRODUCT_PK;

ALTER TABLE PRODUCTS 
MODIFY (PRODUCT_COST NUMBER(5,2) NOT NULL, 
    PRODUCT_RETAIL NUMBER(5,2) NOT NULL);

ALTER TABLE PRODUCTS RENAME COLUMN NAME TO PRODUCT_NAME;

CREATE TABLE EMPLOYEES AS SELECT EMPNO, ENAME, JOB, HIREDATE, SAL, COMM FROM EMP;

SELECT * FROM EMPLOYEES;

CREATE TABLE EMPLOYEES AS SELECT EMPNO, ENAME, JOB, HIREDATE, SAL, COMM FROM EMP;

SELECT EMPNO, INITCAP(ENAME) AS ENAME, JOB, HIREDATE, SAL, COMM FROM EMPLOYEES;

DESCRIBE EMPLOYEES;

ALTER TABLE employees ADD store_id number;

UPDATE employees SET store_id = 3 WHERE ename in ('KING', 'BLAKE', 'CLARK');

UPDATE employees SET store_id = 2 WHERE job = 'SALESMAN';

UPDATE employees SET store_id = 4 WHERE job IN ('CLERK', 'ANALYST');

UPDATE employees SET store_id = 1 WHERE ename = 'JONES';

UPDATE employees
SET store_id = CASE
    WHEN job = 'SALESMAN' THEN 2
    WHEN job IN ('CLERK', 'ANALYST') THEN 4
    WHEN ename = 'JONES' THEN 1
    ELSE store_id
END;

UPDATE employees SET store_id = 111;

UPDATE employees
SET store_id = CASE
    WHEN ename IN ('KING', 'BLAKE', 'CLARK') THEN 3
    WHEN job = 'SALESMAN' THEN 2
    WHEN job IN ('CLERK', 'ANALYST') THEN 4
    WHEN ename = 'JONES' THEN 1
    ELSE store_id
END;

SELECT * FROM EMPLOYEES WHERE job = 'MANAGER' AND ename NOT LIKE 'B%' AND ename NOT LIKE 'C%';

ALTER TABLE employees MODIFY store_id NUMBER NOT NULL;