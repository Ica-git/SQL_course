SELECT * FROM employees WHERE JOB = 'MANAGER';

CREATE VIEW managers_v AS SELECT * FROM employees WHERE JOB = 'MANAGER';

SELECT * FROM managers_v;

SELECT * FROM user_objects WHERE object_type = 'VIEW';

SELECT * FROM employees;

SELECT * FROM stores;

SELECT * FROM employees NATURAL JOIN stores;

SELECT * FROM all_objects WHERE OWNER LIKE '%ICASQ%';

SELECT * FROM all_objects WHERE OWNER LIKE '%ICASQ%' AND object_type = 'TABLE';

SELECT * FROM all_objects WHERE OWNER LIKE '%ICASQ%' AND object_type = 'VIEW';

SELECT * FROM employees;

SELECT MAX(SAL), STORE_ID
FROM employees 
GROUP BY STORE_ID;

SELECT * FROM employees WHERE (SELECT MAX(SAL), STORE_ID
FROM employees 
GROUP BY STORE_ID);

SELECT * FROM employees WHERE SAL = (SELECT MAX(SAL), STORE_ID
FROM employees 
GROUP BY STORE_ID);

SELECT * FROM employees;

SELECT MAX(SAL), STORE_ID
FROM employees 
GROUP BY STORE_ID;

SELECT * FROM employees E
WHERE E.SAL = (SELECT MAX(SAL) FROM employees WHERE STORE_ID = E.STORE_ID);

SELECT MAX(SAL), STORE_ID
FROM employees 
GROUP BY STORE_ID;

SELECT * FROM employees e1
INNER JOIN (SELECT MAX(SAL) AS max_sal, store_id
FROM employees 
GROUP BY store_id) e2
ON e1.store_id = e2.store_id
AND e1.sal = e2.max_sal;

CREATE VIEW super_employees AS
SELECT e1.* FROM employees e1
INNER JOIN (SELECT MAX(SAL) AS max_sal, store_id
FROM employees 
GROUP BY store_id) e2
ON e1.store_id = e2.store_id
AND e1.sal = e2.max_sal
WHERE ename != 'FORD';

SELECT * FROM super_employees
UNION
SELECT * FROM employees;

SELECT * FROM super_employees
UNION ALL
SELECT * FROM employees;

SELECT * FROM employees
MINUS
SELECT * FROM super_employees;

CREATE OR REPLACE VIEW super_employees AS
SELECT e1.* FROM employees e1
INNER JOIN (SELECT MAX(SAL) AS max_sal, store_id
FROM employees 
GROUP BY store_id) e2
ON e1.store_id = e2.store_id
AND e1.sal = e2.max_sal
WHERE ename != 'FORD';

DROP VIEW super_employees