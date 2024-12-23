SELECT * FROM EMP, DEPT WHERE EMP.DEPTNO (+) = DEPT.DEPTNO;
SELECT * FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO (+);
SELECT * FROM EMP FULL OUTER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO;

SELECT * FROM (SELECT * FROM EMP) EMP FULL OUTER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO;
SELECT * FROM (SELECT * FROM EMP) E, (SELECT * FROM DEPT) D WHERE E.DEPTNO = D.DEPTNO;

SELECT * FROM (SELECT * FROM EMP WHERE JOB = 'SALESMAN') E FULL OUTER JOIN (SELECT * FROM DEPT) D ON E.DEPTNO = D.DEPTNO;

SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, E.DEPTNO, D.DEPTNO, DNAME, LOC
FROM (SELECT * FROM DEPT) D LEFT JOIN (SELECT * FROM EMP WHERE JOB = 'SALESMAN') E ON D.DEPTNO = E.DEPTNO;

SELECT * FROM EMP WHERE EXISTS (select 'KING' FROM EMP);
SELECT * FROM EMP WHERE NOT EXISTS (select 'KING' FROM EMP);
SELECT * FROM EMP WHERE JOB = 'SALESMAN' AND EXISTS(SELECT COMM FROM EMP);
SELECT * FROM EMP WHERE JOB = 'MANAGER' AND EXISTS (SELECT COMM FROM EMP WHERE COMM IS NULL);
SELECT * FROM DEPT WHERE EXISTS (SELECT * FROM EMP WHERE DEPT.DEPTNO = EMP.DEPTNO);
SELECT * FROM DEPT WHERE NOT EXISTS (SELECT * FROM EMP WHERE DEPT.DEPTNO = EMP.DEPTNO);

SELECT * FROM DEPT WHERE NOT EXISTS (SELECT * FROM EMP WHERE DEPT.DEPTNO = EMP.DEPTNO) OR LOC = 'CHICAGO' OR LOC = 'DALLAS';
