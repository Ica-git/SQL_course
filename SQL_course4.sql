SELECT * FROM BRICKS;
SELECT COLOUR, COUNT(*) FROM BRICKS GROUP BY COLOUR;
SELECT SHAPE, COUNT(*) FROM BRICKS GROUP BY SHAPE;
SELECT WEIGHT, COUNT(*) FROM BRICKS GROUP BY WEIGHT;
SELECT COUNT(*) FROM BRICKS;
SELECT BRICK_ID	, COLOUR, SHAPE, WEIGHT, (SELECT COUNT(*) FROM BRICKS) AS TOTAL_BRICKS FROM BRICKS;
SELECT BRICK_ID	, COLOUR, SHAPE, WEIGHT, (SELECT COUNT(*) FROM BRICKS) AS "TOTAL BRICKS" FROM BRICKS;
SELECT BRICKS.*, (SELECT COUNT(*) FROM BRICKS) AS "TOTAL BRICKS" FROM BRICKS;
SELECT B.*, (SELECT COUNT(*) FROM BRICKS) AS "TOTAL BRICKS" FROM BRICKS B;
SELECT B.*, (SELECT COUNT(*) FROM BRICKS) AS "TOTAL BRICKS", (SELECT TO_CHAR(AVG(WEIGHT), '9.99') FROM BRICKS) FROM BRICKS B;
SELECT B.*, (SELECT COUNT(*) FROM BRICKS) AS "TOTAL BRICKS", (SELECT TO_CHAR(AVG(WEIGHT), '9.99') FROM BRICKS) AS AVG FROM BRICKS B;
SELECT B.*, (SELECT COUNT(COLOUR) FROM BRICKS WHERE COLOUR = B.COLOUR) AS "TOTAL BRICKS BY COLOUR" FROM BRICKS B;
SELECT B.*, (SELECT SUM(WEIGHT) FROM BRICKS WHERE COLOUR = B.COLOUR) AS "TOTAL WEIGHT BY COLOUR" FROM BRICKS B;
SELECT B.*, (SELECT SUM(WEIGHT) FROM BRICKS WHERE SHAPE = B.SHAPE) AS "TOTAL WEIGHT BY COLOUR" FROM BRICKS B;

SELECT B.*, COUNT(*) OVER() FROM BRICKS B;
SELECT B.*, COUNT(*) OVER(PARTITION BY COLOUR) FROM BRICKS B;
SELECT B.*, COUNT(*) OVER(PARTITION BY SHAPE) FROM BRICKS B;
SELECT B.*, 'THERE IS '||COUNT(*) OVER(PARTITION BY SHAPE) || ' ' || UPPER(SHAPE) || 'S' AS "NUM OF SHAPES" FROM BRICKS B;

SELECT B.*, 
'THERE IS '||COUNT(*) OVER(PARTITION BY SHAPE) || ' ' || UPPER(SHAPE) || 'S' AS "NUM OF SHAPES", 
'THERE IS '||COUNT(*) OVER(PARTITION BY COLOUR) || ' ' || UPPER(COLOUR) || ' BRICKS' AS "NUM OF COLOURS",
'THERE IS '||COUNT(*) OVER(PARTITION BY WEIGHT) || ' BRICKS THAT WEIGH ' || UPPER(WEIGHT) || ' KILOS' AS "NUM OF COLOURS"
FROM BRICKS B;

SELECT B.*, SUM(WEIGHT) OVER(PARTITION BY COLOUR) AS "TOTAL WEIGHT BY COLOUR" FROM BRICKS B;
SELECT B.*, SUM(WEIGHT) OVER(PARTITION BY SHAPE) AS "TOTAL WEIGHT BY SHAPE" FROM BRICKS B;

SELECT B.*, SUM(WEIGHT) OVER(PARTITION BY SHAPE) AS "WEIGHT P",
    SUM(WEIGHT) OVER(PARTITION BY COLOUR) AS "WEIGHT C"
    FROM BRICKS B;

SELECT B.*, SUM(WEIGHT) OVER(PARTITION BY SHAPE) || ' FOR ' || UPPER(SHAPE) AS "WEIGHT P",
    SUM(WEIGHT) OVER(PARTITION BY COLOUR) || ' FOR ' || UPPER(COLOUR) AS "WEIGHT C"
    FROM BRICKS B;

SELECT B.*, SUM(WEIGHT) OVER(PARTITION BY SHAPE) || ' FOR ' || UPPER(SHAPE) AS "WEIGHT P",
    SUM(WEIGHT) OVER(PARTITION BY COLOUR) || ' FOR ' || UPPER(COLOUR) AS "WEIGHT C",
    MAX(WEIGHT) OVER(PARTITION BY SHAPE) || ' FOR ' || UPPER(SHAPE) AS "MAX WEIGHT C",
    MAX(WEIGHT) OVER(PARTITION BY COLOUR) || ' FOR ' || UPPER(COLOUR) AS "MAX WEIGHT C"
    FROM BRICKS B;

SELECT E.ENAME, E.JOB, E.SAL, E.DEPTNO,
MAX(SAL) OVER(PARTITION BY JOB) AS "MAX SAL",
MAX(SAL) OVER(PARTITION BY JOB) - E.SAL AS "POTENTIAL SAL"
FROM EMP E;

SELECT E.ENAME, E.JOB, E.SAL, E.DEPTNO, LOC,
MAX(SAL) OVER(PARTITION BY JOB) AS "MAX SAL",
MAX(SAL) OVER(PARTITION BY JOB) - E.SAL AS "POTENTIAL SAL"
FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO;

select b.*,  
       sum ( weight ) over (
         partition by colour order by brick_id
       ) running_weight
from   bricks b order by weight desc;

SELECT E.ENAME, E.JOB, E.SAL, E.DEPTNO, LOC,
MAX(SAL) OVER(PARTITION BY JOB) AS "MAX SAL",
MAX(SAL) OVER(PARTITION BY JOB) - E.SAL AS POTENTIAL_SAL
FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO
ORDER BY POTENTIAL_SAL;