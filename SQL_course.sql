select job from emp;
select distinct job from emp;

select * from emp where job = 'MANAGER' and sal = 2450 and deptno = 10;
SELECT * FROM EMP WHERE JOB != 'SALESMAN';
SELECT * FROM EMP WHERE JOB != 'SALESMAN' AND SAL < 2500;
SELECT * FROM EMP WHERE JOB != 'SALESMAN' AND SAL <= 3000 ORDER BY SAL;
SELECT * FROM EMP WHERE COMM > SAL;
SELECT * FROM EMP WHERE JOB != 'MANAGER' AND SAL > 2500 AND DEPTNO = 20;

SELECT * FROM EMP WHERE JOB = 'CLERK' OR JOB = 'SALESMAN';
SELECT * FROM EMP WHERE JOB != 'MANAGER' AND JOB != 'SALESMAN' AND SAL >= 2000;
SELECT ENAME FROM EMP WHERE JOB != 'MANAGER' AND JOB != 'SALESMAN' AND SAL >= 2000;

SELECT ENAME, HIREDATE FROM EMP WHERE DEPTNO = 20 OR DEPTNO = 30;
SELECT ENAME, HIREDATE FROM EMP WHERE DEPTNO IN (20, 30) AND ENAME IN ('ALLEN', 'WARD', 'SMITH', 'MARTIN', 'FORD');
SELECT ENAME, HIREDATE FROM EMP WHERE ENAME IN ('ALLEN', 'WARD', 'SMITH', 'MARTIN', 'FORD')
SELECT ENAME, HIREDATE FROM EMP WHERE ENAME  NOT IN ('ALLEN', 'WARD', 'SMITH', 'MARTIN', 'FORD');
SELECT * FROM EMP WHERE SAL BETWEEN 1000 AND 2000 ORDER BY SAL;
SELECT * FROM EMP WHERE SAL NOT BETWEEN 950 AND 1600 ORDER BY SAL;
SELECT * FROM EMP WHERE COMM IS NULL;
SELECT * FROM EMP WHERE COMM IS NOT NULL;

SELECT * FROM EMP WHERE COMM IS NULL AND SAL > 1100 AND SAL < 5000 AND SAL <> 3000;
SELECT * FROM EMP WHERE COMM IS NULL AND SAL > 1100 AND SAL < 5000 AND SAL <> 3000 OR COMM = 0 AND SAL > 1100 AND SAL < 5000 AND SAL <> 3000;
SELECT * FROM EMP WHERE (COMM IS NULL AND SAL > 1100 AND SAL < 5000 AND SAL <> 3000) OR (COMM = 0 AND SAL > 1100 AND SAL < 5000 AND SAL <> 3000);

SELECT * FROM EMP WHERE (COMM IS NULL OR COMM = 0)
AND SAL > 1100 AND SAL < 5000 
AND SAL <> 3000 ;

SELECT * FROM EMP WHERE JOB = 'SALESMAN' AND (COMM = 300 OR COMM > 1000)

SELECT * FROM EMP WHERE JOB LIKE 'M%R';
SELECT * FROM EMP WHERE JOB LIKE 'M%';
SELECT * FROM EMP WHERE JOB LIKE '%R';

SELECT ENAME EMPLOYEE_NAME, SAL SALARY, COMM COMMISION FROM EMP;
SELECT ENAME "EMPLOYEE NAME", SAL SALARY, COMM COMMISION FROM EMP;
SELECT ENAME AS "EMPLOYEE NAME", SAL AS SALARY, COMM AS COMMISION FROM EMP;

SELECT 'Hello my name is '|| ENAME || ', I am a ' || JOB || ', and I make ' 
|| SAL || '$ per month' AS "SENTANCE" FROM EMP;

SELECT ENAME, '$' || SAL AS SALLERY FROM EMP ORDER BY SAL;
SELECT ENAME, '$' || SAL AS SALLERY FROM EMP ORDER BY SAL DESC;
SELECT ENAME, '$' || SAL AS SALLERY FROM EMP ORDER BY SAL ASC;

SELECT DEPTNO, SAL ,ENAME FROM EMP ORDER BY DEPTNO, SAL DESC;

PRACTICE:
SELECT * FROM EMP WHERE ENAME LIKE 'A%' AND (ENAME LIKE '%A%' OR ENAME LIKE '%N');
SELECT * FROM EMP WHERE SAL BETWEEN 3000 AND 5000;
SELECT * FROM EMP WHERE DEPTNO = 10 OR DEPTNO = 30;
SELECT ENAME, DEPTNO FROM EMP WHERE DEPTNO = 10 OR DEPTNO = 30;
SELECT ENAME, DEPTNO FROM EMP WHERE EMPNO > 7900
SELECT * FROM EMP WHERE SAL < 1000 OR SAL = 3000;

SELECT 'My name is ' || ENAME AS "MY NAME IS" FROM EMP;
SELECT concat('My name is ', ename) AS "MY NAME IS" FROM EMP
SELECT concat('My name is ', ENAME) || concat(', I make $', SAL) || ' a month' AS "MONTHLY INCOME" FROM EMP

SELECT UPPER('hello') AS HI FROM DUAL;
SELECT * FROM DUAL;

SELECT CONCAT('MY name is ', LOWER(ENAME)) FROM EMP WHERE DEPTNO = 20;
SELECT CONCAT(UPPER('My name is '), LOWER(ENAME)) FROM EMP WHERE DEPTNO = 20;

SELECT CONCAT(CONCAT(UPPER('My name is '), LOWER(ENAME)), CONCAT(' and my job is:  ', JOB)) FROM EMP;
SELECT CONCAT(CONCAT(UPPER('My name is '), LOWER(ENAME)), CONCAT(' and my job is:  ', JOB)) AS Scentence FROM EMP;

SELECT * FROM EMP WHERE JOB = UPPER('manager');
SELECT INITCAP(LOWER(ENAME)) FROM EMP;
SELECT LENGTH(ENAME) AS SCENTENCE FROM EMP;
SELECT ENAME, LENGTH(ENAME) AS LENGTH FROM EMP;

SELECT CONCAT(SUBSTR(ENAME, 1, 1), SUBSTR(LOWER(ENAME), 2)) AS NAME FROM EMP;

SELECT LPAD(SAL,5,'$') FROM EMP;
SELECT RPAD(SAL,5,'$') FROM EMP;
SELECT LPAD(SAL,50,'$') FROM EMP;

SELECT LTRIM('hhhello', 'h') FROM DUAL;
SELECT LTRIM('hhhellohh', 'h') FROM DUAL;
SELECT RTRIM('hhhellohh', 'h') FROM DUAL;

SELECT ROUND(107.088, 2) AS ROUNDED FROM DUAL;
SELECT TRUNC(107.088, 1) AS ROUNDED FROM DUAL;
SELECT TRUNC(107.0889120301283, 3) AS ROUNDED FROM DUAL;

SELECT SYSDATE FROM DUAL;
SELECT SYSTIMESTAMP FROM DUAL;
SELECT ADD_MONTHS(SYSDATE , -3)FROM DUAL;
SELECT MONTHS_BETWEEN(SYSDATE, '11/21/2020')FROM DUAL;
SELECT TRUNC(SYSTIMESTAMP, 'MONTH')FROM DUAL;
SELECT TRUNC(SYSTIMESTAMP, 'YEAR')FROM DUAL;

SELECT CONCAT(SUBSTR(ENAME, 1, 1), SUBSTR(LOWER(ENAME),2)), TRUNC(HIREDATE, 'YEAR')FROM EMP;

SELECT TO_CHAR(SYSDATE, 'mm-dd-yyyy') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MON-dd-yyyy') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'ddth "of" month, yyyy') FROM DUAL;

SELECT TO_CHAR(SAL, '$9,999.99') FROM EMP;
SELECT ENAME, SAL, TO_CHAR(SAL, '$999,999.99') AS SALERIES FROM EMP;

SELECT TO_DATE('2024-09-23', 'yyyy-mm-dd') FROM DUAL;
SELECT ADD_MONTHS(TO_DATE('2024-09-23', 'yyyy-mm-dd'), 2) FROM DUAL;
SELECT TO_DATE('3 of June, 2012', 'dd "of" Month, YYYY') FROM DUAL;

SELECT ENAME, JOB, SAL, COMM, NVL(COMM, 0) FROM EMP WHERE EMPNO BETWEEN 7566 AND 7839 ORDER BY EMPNO;

SELECT ENAME, JOB, SAL, COMM, NVL(TO_CHAR(COMM), 'NO DATA FOUND') 
FROM EMP WHERE EMPNO BETWEEN 7566 AND 7839 ORDER BY EMPNO;

SELECT ENAME, LENGTH(ENAME), NULLIF(LENGTH(ENAME), 5) FROM EMP

SELECT ENAME, LENGTH(ENAME), NVL(TO_CHAR(NULLIF(LENGTH(ENAME), 5)), 'LEN = 5')  AS LENGTH FROM EMP
SELECT ENAME, LENGTH(ENAME), NVL(NULLIF(TO_CHAR(LENGTH(ENAME)), TO_CHAR(5)), 'LEN = 5')  AS LENGTH FROM EMP

#Practice 2
SELECT ENAME, SAL, CONCAT(CONCAT(ENAME, ' has the salery of '), TO_CHAR(SAL, '$9,999.99')) AS NAMEANDSALERY FROM EMP;
SELECT ENAME, SAL, CONCAT(CONCAT(CONCAT(SUBSTR(ENAME, 1, 1), SUBSTR(LOWER(ENAME),2)),
 ' has the salery of '), TO_CHAR(SAL, '$9,999.99')) AS NAMEANDSALERY FROM EMP;

SELECT JOB, SUBSTR(JOB, 1, 3),  SUBSTR(JOB, -3) FROM EMP;
SELECT JOB, CONCAT(CONCAT(LOWER(SUBSTR(JOB, 1, 3)), '/'),  LOWER(SUBSTR(JOB, -3))) AS TASK2 FROM EMP;

SELECT MAX(SAL) FROM EMP;
SELECT TO_CHAR(MAX(SAL), '$999,999.99') AS MAX FROM EMP;
SELECT MIN(SAL) FROM EMP;
SELECT TO_CHAR(MIN(SAL), '$999,999.99') AS MAX FROM EMP;
SELECT SUM(SAL) FROM EMP;
SELECT TO_CHAR(SUM(SAL), '$999,999.99') AS MAX FROM EMP;

SELECT TO_CHAR(MAX(SAL), '$999,999.99') AS MAX FROM EMP WHERE JOB = 'MANAGER';

SELECT AVG(SAL) FROM EMP;
SELECT TO_CHAR(AVG(SAL), '$999,999.99') AS MAX FROM EMP;
SELECT COUNT(ENAME) FROM EMP;
SELECT COUNT(*) FROM EMP;
SELECT COUNT(COMM) FROM EMP;

SELECT COUNT(*) - COUNT(COMM) AS NULL_COUNT FROM EMP;

SELECT TO_CHAR(SUM(SAL) / COUNT(*), '$999,999.99') AS AVERAGE, AVG(SAL) FROM EMP;

SELECT SUM(SAL), AVG(SAL), MAX(SAL), MIN(SAL), COUNT(SAL) FROM EMP;

SELECT SUM(SAL), TO_CHAR(AVG(SAL), '$999,999.99'), MAX(SAL), MIN(SAL), COUNT(SAL) FROM EMP WHERE JOB = 'MANAGER';

SELECT TO_CHAR(AVG(SAL), '$999,999.99') JOB FROM EMP GROUP BY JOB;
SELECT TO_CHAR(AVG(SAL), '$999,999.99'), SUM(SAL), MIN(SAL), MAX(SAL), COUNT(SAL), JOB FROM EMP GROUP BY JOB;
SELECT TO_CHAR(AVG(SAL), '$999,999.99'), SUM(SAL), MIN(SAL), MAX(SAL), COUNT(SAL), DEPTNO FROM EMP GROUP BY DEPTNO;

SELECT AVG(SAL), SUM(SAL), MIN(SAL), MAX(SAL), COUNT(SAL), JOB FROM EMP GROUP BY JOB ORDER BY AVG(SAL) DESC;
SELECT TO_CHAR(AVG(SAL), '$999,999.99'), SUM(SAL), MIN(SAL), MAX(SAL), COUNT(SAL), JOB FROM EMP GROUP BY JOB 
ORDER BY TO_CHAR(AVG(SAL), '$999,999.99');

SELECT TO_CHAR(AVG(SAL), '$999,999.99'), SUM(SAL), MIN(SAL), MAX(SAL), COUNT(SAL), JOB FROM EMP GROUP BY JOB 
ORDER BY TO_CHAR(AVG(SAL), '$999,999.99') DESC;

SELECT JOB FROM EMP GROUP BY JOB HAVING COUNT(JOB) = 2;
SELECT DEPTNO, COUNT(DEPTNO) FROM EMP GROUP BY DEPTNO HAVING COUNT(DEPTNO) > 3;
SELECT DEPTNO, COUNT(DEPTNO) FROM EMP GROUP BY DEPTNO HAVING COUNT(DEPTNO) = 3;
SELECT DEPTNO, COUNT(DEPTNO) FROM EMP GROUP BY DEPTNO HAVING COUNT(DEPTNO) > 1 ORDER BY COUNT(DEPTNO) DESC;

SELECT DEPTNO, COUNT(DEPTNO) FROM EMP GROUP BY DEPTNO HAVING COUNT(DEPTNO) > 3;

SELECT JOB, COUNT(JOB), DEPTNO FROM EMP GROUP BY JOB, DEPTNO ORDER BY COUNT(JOB) DESC;
SELECT JOB, COUNT(JOB), DEPTNO FROM EMP GROUP BY JOB, DEPTNO HAVING COUNT(JOB) > 1 ORDER BY COUNT(JOB) DESC;

SELECT * FROM DEPT WHERE DEPTNO = 30;
SELECT * FROM DEPT WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DEPTNO = 30);
SELECT * FROM DEPT WHERE DEPTNO < (SELECT DEPTNO FROM DEPT WHERE DEPTNO = 30);
SELECT * FROM DEPT WHERE DEPTNO < (SELECT DEPTNO FROM DEPT WHERE DEPTNO = 30) AND DNAME = 'ACCOUNTING';
SELECT * FROM (SELECT * FROM DEPT);
SELECT * FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'CHICAGO');
SELECT * FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'CHICAGO') AND COMM IS NOT NULL;
SELECT * FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE LOC IN('CHICAGO', 'DALLAS'));

SELECT JOB, ENAME, DEPTNO, (SELECT JOB FROM EMP WHERE ENAME = 'KING') FROM EMP;
SELECT JOB, ENAME, DEPTNO, (SELECT 'Hello' FROM DUAL) FROM EMP;

SELECT * FROM EMP, DEPT;
SELECT * FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO;

SELECT * FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO AND LOC = 'DALLAS';
SELECT * FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO AND DEPT.LOC = 'DALLAS';
SELECT ENAME, JOB, SAL, DEPT.DEPTNO, LOC FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO AND DEPT.LOC = 'DALLAS';

SELECT ENAME, JOB, SAL FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND D.LOC = 'DALLAS';
SELECT ENAME, JOB, SAL, D.DEPTNO, LOC FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND D.LOC = 'DALLAS';
SELECT ENAME, JOB, SAL, D.DEPTNO, LOC FROM (SELECT * FROM EMP) E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND D.LOC = 'DALLAS';

SELECT ENAME, JOB, SAL, D.DEPTNO, LOC FROM (SELECT * FROM EMP WHERE JOB = 'ANALYST') E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND D.LOC = 'DALLAS';
SELECT ENAME, JOB, SAL, D.DEPTNO, LOC FROM (SELECT * FROM EMP WHERE JOB != 'ANALYST') E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND D.LOC = 'DALLAS';

SELECT ENAME, JOB, SAL, D.DEPTNO, LOC FROM (SELECT * FROM EMP WHERE JOB != 'ANALYST') E, 
(SELECT * FROM DEPT WHERE LOC = 'DALLAS') D WHERE E.DEPTNO = D.DEPTNO ;

SELECT ENAME, JOB, SAL, D.DEPTNO, LOC FROM (SELECT * FROM EMP WHERE JOB = 'ANALYST') E, 
(SELECT * FROM DEPT WHERE LOC = 'DALLAS') D WHERE E.DEPTNO = D.DEPTNO ;

SELECT ENAME, JOB, SAL, DEPT.DEPTNO, LOC FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO ORDER BY DEPTNO DESC;

SELECT * FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO;
SELECT * FROM EMP INNER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO;
SELECT * FROM EMP RIGHT JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO;