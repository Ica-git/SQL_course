CREATE TABLE existing_customers (
  customer_id NUMBER(5),
  first_name VARCHAR2(100),
  last_name VARCHAR2(100),
  address_state VARCHAR2(10),
  email_address VARCHAR2(350),
  CONSTRAINT old_pk_cust PRIMARY KEY (customer_id)
);

BEGIN
	INSERT INTO existing_customers (customer_id, first_name, last_name, address_state, email_address)
	VALUES (1, 'Teresa', 'Hudson', 'NY', 'thudson@abc.com');
	INSERT INTO existing_customers (customer_id, first_name, last_name, address_state, email_address) 
	VALUES (2, 'Fred', 'Montgomery', 'CA', 'fmont@gmail.com');
	INSERT INTO existing_customers (customer_id, first_name, last_name, address_state, email_address) 
	VALUES (3, 'Lois', 'Lawson', 'OR', 'lois_law@outlook.com');
	INSERT INTO existing_customers (customer_id, first_name, last_name, address_state, email_address) 
	VALUES (4, 'Alice', 'Perry', 'SC', 'aliceperry');
	INSERT INTO existing_customers (customer_id, first_name, last_name, address_state, email_address) 
	VALUES (5, 'Ralph', 'Montgomery', 'TX', 'ralph_mont25@gmail.com');
	INSERT INTO existing_customers (customer_id, first_name, last_name, address_state, email_address) 
	VALUES (6, 'Dorothy', 'Armstrong', 'OR', 'abc123@abc.com');
	INSERT INTO existing_customers (customer_id, first_name, last_name, address_state, email_address) 
	VALUES (7, 'Fred', 'Wallace', 'NY', 'wallacef@testwebsite.co.uk');
	INSERT INTO existing_customers (customer_id, first_name, last_name, address_state, email_address) 
	VALUES (8, 'Joseph', 'Bell', 'FL', 'jbell@comm.edu');
	INSERT INTO existing_customers (customer_id, first_name, last_name, address_state, email_address) 
	VALUES (9, 'Lois', 'Martinez', 'CALIF', 'loismar@awe.com');
	INSERT INTO existing_customers (customer_id, first_name, last_name, address_state, email_address) 
	VALUES (10, 'Robert', 'Rice', 'IN', 'robrice123');
END;

CREATE TABLE  new_customers(
  customer_id NUMBER(5),
  first_name VARCHAR2(100),
  last_name VARCHAR2(100),
  address_state VARCHAR2(10),
  email_address VARCHAR2(350)
);

BEGIN
	INSERT INTO new_customers (customer_id, first_name, last_name, address_state, email_address) 
	VALUES (15, 'John', 'Stock', 'ND', 'js1980@outlook.com');
	INSERT INTO new_customers (customer_id, first_name, last_name, address_state, email_address) 
	VALUES (12, 'Joseph', 'Bell', 'OR', 'thebell@yahoo.com');
	INSERT INTO new_customers (customer_id, first_name, last_name, address_state, email_address) 
	VALUES (3, 'Lois', 'Lawson', 'WA', 'lois_law@outlook.com');
	INSERT INTO new_customers (customer_id, first_name, last_name, address_state, email_address) 
	VALUES (8, 'Joseph', 'Bell', 'FL', 'jbell@gmail.com');
	INSERT INTO new_customers (customer_id, first_name, last_name, address_state, email_address) 
	VALUES (1, 'Teresa', 'Hudson', 'NY', 'thudson@abc.com');
	INSERT INTO new_customers (customer_id, first_name, last_name, address_state, email_address) 
	VALUES (4, 'Alice', 'Howard', 'SC', 'aliceperry@gmail.com');
END;

SELECT * FROM existing_customers;
SELECT * FROM new_customers;

MERGE INTO existing_customers c
USING new_customers n
ON (c.customer_id = n.customer_id)
WHEN MATCHED THEN 
    UPDATE SET
    c.first_name = n.first_name,
    c.LAST_NAME = n.LAST_NAME,
    c.ADDRESS_STATE = n.ADDRESS_STATE,
    c.EMAIL_ADDRESS = n.EMAIL_ADDRESS
WHEN NOT MATCHED THEN
    INSERT (c.CUSTOMER_ID, c.first_name, c.last_name, c.ADDRESS_STATE, c.email_address)
    VALUES (n.CUSTOMER_ID, n.first_name, n.last_name, n.ADDRESS_STATE, n.email_address);


SELECT * FROM existing_customers;
SELECT * FROM new_customers;

MERGE INTO existing_customers c
USING new_customers n
ON (c.customer_id = n.customer_id)
WHEN MATCHED THEN 
    UPDATE SET
    c.first_name = n.first_name,
    c.LAST_NAME = n.LAST_NAME,
    c.ADDRESS_STATE = n.ADDRESS_STATE,
    c.EMAIL_ADDRESS = n.EMAIL_ADDRESS
DELETE WHERE c.first_name = 'John'
WHEN NOT MATCHED THEN
    INSERT (c.CUSTOMER_ID, c.first_name, c.last_name, c.ADDRESS_STATE, c.email_address)
    VALUES (n.CUSTOMER_ID, n.first_name, n.last_name, n.ADDRESS_STATE, n.email_address);


SELECT * FROM existing_customers;
SELECT * FROM new_customers;

CREATE SEQUENCE product_seq
    MINVALUE 1
    MAXVALUE 99999999999999999999
    START WITH 1
    INCREMENT BY 1
    CACHE 20;

SELECT product_seq.NEXTVAL FROM DUAL;

ALTER SEQUENCE product_seq
    NOCACHE;

SELECT product_seq.NEXTVAL FROM DUAL;

INSERT INTO products
(product_id, product_name)
VALUES
(prouct_seq.NEXTVAL, 'any old product');

SELECT * FROM DEPT;

SELECT * FROM dept WHERE deptno = 40;

DELETE FROM dept WHERE deptno = 40;

DELETE FROM dept WHERE DNAME IN ('ACCOUNTING');

DELETE FROM dept;

alter table "WKSP_ICASQLICA"."EMP" drop constraint
EMP_DEPT_FK;

alter table EMP drop constraint EMP_DEPT_FK;

DELETE FROM dept;

DROP TABLE dept;

SELECT * FROM dept;

SELECT * FROM emp;

TRUNCATE TABLE emp;

SELECT * FROM emp;

DROP TABLE emp;

SELECT * FROM employees


CREATE INDEX emp_name_idx
    ON employees (ename)


CREATE INDEX emp_name_job_date_idx
    ON employees (ename, job, hiredate)


SELECT * FROM employees
WHERE ename = 'John'
AND hiredate = ''
AND job = ''


CREATE UNIQUE INDEX emp_job_idx  
    ON employees (job)


CREATE INDEX emp_job_idx 
    ON employees (job)

DROP INDEX emp_job_idx;

CREATE INDEX emp_name_job_date_idx
    ON employees (ename, job, hiredate)
COMPUTE STATISTICS;

ALTER INDEX emp_name_idx
    REBUILD COMPUTE STATISTICS;

SELECT * FROM STORES

SELECT DISTINCT store_id, city FROM STORES;

SELECT store_id, city
FROM STORES
GROUP BY store_id, city
HAVING COUNT(store_id) > 1;

ALTER TABLE STORES ADD CONSTRAINT unique_store_id UNIQUE(store_id);

SELECT store_id, COUNT(*)
FROM STORES
GROUP BY store_id
HAVING COUNT(*) > 1;

DELETE FROM STORES
WHERE ROWID NOT IN (
  SELECT MIN(ROWID)
  FROM STORES
  GROUP BY store_id
);

SELECT * FROM STORES ORDER BY STORE_ID;

SELECT store_id, COUNT(*)
FROM STORES
GROUP BY store_id, city
ORDER BY COUNT(*);

SELECT rowid, store_id, city FROM stores;

SELECT rowid
FROM STORES
GROUP BY store_id, city;

SELECT MIN(rowid)
FROM STORES
GROUP BY store_id, city;

ALTER TABLE STORES
ADD CONSTRAINT pk_store_id PRIMARY KEY (store_id);

CREATE UNIQUE INDEX store_id_idx  
    ON stores (store_id)
    COMPUTE STATISTICS;

SELECT * FROM all_tables;

SELECT * FROM all_tables;
WHERE ROWNUM < 10;

SELECT * FROM all_tables
WHERE  table_name = 'EMPLOYEES'
AND ROWNUM < 10;

SELECT * FROM all_tab_COLUMNS
WHERE  table_name = 'EMPLOYEES'
AND ROWNUM < 10;

SELECT * FROM all_tab_COLUMNS
WHERE  table_name = 'EMPLOYEES';

SELECT * FROM ALL_OBJECTS 
WHERE object_type = 'INDEX'
AND LOWER(object_name) = 'emp_name_idx' 
AND ROWNUM  < 50;

SELECT * FROM ALL_OBJECTS 
WHERE object_type = 'INDEX'
AND object_name = UPPER('emp_name_idx');
 
SELECT * FROM user_TYPES;

CREATE SYNONYM emp_table FOR employees;

SELECT * FROM emp_table;

SELECT ROWID, ROWNUM, e.* FROM employees e;