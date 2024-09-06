/*
        < JOIN >
        
        �� �� �̻��� ���̺��� �����͸� ��ȸ�ϰ��� �� �� ���.
        ��ȸ ����� �ϳ��� RESULT SET���� ���
        
        ������ �����ͺ��̽�������, �ּ����� �����ͷ� ������ ���̺� �����͸� ����(�ߺ� �ּ�ȭ)
        
        ����Ŭ ���� ����                                           ANSU ǥ�� ����
        ---------------------------------------------------------------------
        �����(EQUAL JOIN)                |        ���� ����(INNER JOIN)
        ---------------------------------------------------------------------
        ��������(LEFT, RIGHT)               |    ���� �ܺ� ����(LEFT OUTER JOIN)
                                           | ������ �ܺ� ����(RIGHT OUTER JOIN)
                                           | ��ü �ܺ� ���� (FULL OUTER JOIN)
        ---------------------------------------------------------------------
        ��ü ����(SELF JOIN)                |
        ---------------------------------------------------------------------
*/

-- EMPLOYEE ���̺���, �����, �ֹι�ȣ, �μ��� ��ȸ
SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;

-- EMPLOYEE ���̺���, �����, �ֹι�ȣ, ���޸� ��ȸ
SELECT * FROM EMPLOYEE;

SELECT * FROM JOB;

/*
    � ����(EQUAL JOIN) / ���� ����(INNER JOIN)
    
    - �� ���� ���̺��� ����Ǵ� �÷��� ���� ��ġ�ϴ� ��鸸 ��ȸ.
    - ��ġ���� �ʴ� ���� ��ȸ���� ���ܵ�. 
*/

-- ������� �����, �μ��ڵ� , �μ��� ��ȸ

-- ����Ŭ ���� ����
SELECT EMP_NAME, DEPT_CODE,
       DEPT_ID, DEPT_TITLE
    FROM EMPLOYEE, -- ��ȸ�ϰ��� �ϴ� ���̺��� ,�� �����Ͽ� �����Ѵ�. 
         department
    WHERE DEPT_CODE = DEPT_ID; -- WHERE���� ���̺��� ��Ī(����)��ų �÷��� ���� ������ ������
-- �� 21�� ���. �μ��ڵ尡 �������� �ʴ� ��� ������ ��µ��� ����.
-- EMPLOYEE.DEPT_CODE�� DEPARTMENT.DEPT_ID�� �����ؾ� ��.
-- DEPARTMENT.DEPT_ID�� EMPLOYEE.DEPT_CODE�� �����ؾ� ��.

-- 2) ������� �����, �����ڵ�, ���޸� ��ȸ
-- ����� : EMPLOYEE.EMP_NAME
-- �����ڵ� : EMPLOYEE.JOB_CODE, JOB.JOB_CODE
-- ���޸� : JOB.JOB_NAME

-- ����Ŭ ���� ����
SELECT  EMP_NAME, JOB_CODE, JOB_NAME
  FROM EMPLOYEE,
       JOB
WHERE JOB_CODE = JOB_CODE;
       
-- ����Ŭ ���� ���� - ���� �÷���Ī�� ���� �� �ذ���1)
SELECT  EMP_NAME, EMPLOYEE.JOB_CODE, JOB_NAME
  FROM EMPLOYEE,
       JOB
WHERE EMPLOYEE.JOB_CODE = JOB.JOB_CODE; -- ���̺��.�÷���

-- ����Ŭ ���� ���� - ���� �÷���Ī�� ���� �� �ذ���1)
SELECT  EMP_NAME, E.JOB_CODE, JOB_NAME
  FROM EMPLOYEE E, --���̺�� ��Ī ����.
       JOB J
WHERE E.JOB_CODE = J.JOB_CODE; -- ��Ī ����


-- ANSI ǥ�� ����

--1) �����, �μ��ڵ�, �μ���
-- ���εǴ� �÷� ��Ī�� �ٸ� ���
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
  FROM EMPLOYEE
  JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
  
--2) �����, �����ڵ�, ���޸�
-- ���εǴ� �÷� ��Ī�� ���� ���
SELECT EMP_NAME, J.JOB_CODE, JOB_NAME
  FROM EMPLOYEE E
  JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE);
  
-- ���εǴ� �÷� ��Ī�� ���� ��쿡�� USING ��� ����
SELECT EMP_NAME, JOB_CODE, JOB_NAME
  FROM EMPLOYEE
  JOIN JOB USING(JOB_CODE); -- ǥ�� ���������� �÷��� ������ ���, ������ ������ ����
  
-- �ؿܿ����μ����� �ٹ��ϴ� ����� ��ȸ�ϰ� ����.
SELECT EMP_NAME, DEPT_TITLE
  FROM EMPLOYEE
  JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE DEPT_TITLE LIKE '�ؿܿ���%';

SELECT EMP_NAME, DEPT_TITLE
  FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID
  AND DEPT_TITLE LIKE '�ؿܿ���%';
  
  
------------------------ �ǽ� ------------------------
-- ����Ŭ ���� ������ ǥ�� ���� ���� �ۼ�
-- 1. �μ��� �λ�������� ������� ���, �̸�, ���ʽ� ��ȸ
SELECT EMP_ID, EMP_NAME, BONUS
  FROM EMPLOYEE
  JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE DEPT_TITLE LIKE '�λ����%';

SELECT EMP_ID, EMP_NAME, DEPT_TITLE, BONUS
  FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID
  AND DEPT_TITLE = '�λ������';
-- 2. DEPARTMENT�� LOCATION�� �����ؼ� ��ü �μ��� �μ��ڵ�, �μ���, �����ڵ�, ������ ��ȸ
SELECT DEPT_ID, DEPT_TITLE, LOCATION_ID, LOCAL_CODE, LOCAL_NAME
  FROM DEPARTMENT
  JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE);
  
SELECT DEPT_ID, DEPT_TITLE, LOCATION_ID, LOCAL_CODE, LOCAL_NAME
  FROM DEPARTMENT, LOCATION
WHERE LOCATION_ID = LOCAL_CODE;
-- 3. ���ʽ��� �޴� ������� ���, �����, ���ʽ�, �μ��� ��ȸ
SELECT EMP_ID, EMP_NAME, BONUS, DEPT_TITLE
  FROM EMPLOYEE
  JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE BONUS IS NOT NULL;

SELECT EMP_ID, EMP_NAME, BONUS, DEPT_TITLE
  FROM EMPLOYEE, DEPARTMENT
 WHERE DEPT_CODE = DEPT_ID
   AND BONUS IS NOT NULL;
   
-- 4. �μ��� �ѹ��ΰ� �ƴ� ������� �����, �޿�, �μ��� ��ȭ
SELECT EMP_NAME, SALARY, DEPT_TITLE
  FROM EMPLOYEE
  JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
 WHERE DEPT_TITLE != '�ѹ���';
 
SELECT EMP_NAME, SALARY, DEPT_TITLE
  FROM EMPLOYEE, DEPARTMENT
 WHERE DEPT_CODE = DEPT_ID
   AND DEPT_TITLE != '�ѹ���';
   
/*
    ���� ���� / �ܺ� ����(OUTER JOIN)
    �� ���̺��� JOIN ��, ��ġ���� �ʴ� ROW�� ���Խ��� ��ȸ
    ��, ������ �Ǵ� ���̺��� ����ؾ� ��. (LEFT/RIGHT)
*/
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
  FROM DEMPLOYEE
  JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID); -- �(EQUAL)���� ��, ��ġ�ϴ� ROW�� ��� == 21�� ROW
  -- EMPLOYEE���� �μ� ��ġ�� ���� �ʴ�(DEPT_CDE�� NULL) ��� ������ ��µ��� ����
  
  
-- LFFT JOIN
-- Ű���� ���� �ۼ��� ���̺��� ������ �ȴ�.
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
  FROM EMPLOYEE
  LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
  
-- ����Ŭ ���� ����
SELECT EMP_NAME, DEPT_CODE, DEPT_TITLE
  FROM EMPLOYEE, DEPARTMENT
 WHERE DEPT_CODE = DEPT_ID(+);
 
 
 -- RIGHT JOIN
-- Ű���� ������ �ۼ��� ���̺��� ������ �ȴ�.
SELECT EMP_NAME, DEPT_ID, DEPT_TITLE
  FROM EMPLOYEE
  RIGHT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
-- ��ġ�ϴ� ���� + �μ� ����

SELECT EMP_NAME, DEPT_ID, DEPT_TITLE
  FROM EMPLOYEE, department
 WHERE DEPT_CODE(+) = DEPT_ID;
 
 -- FULL JOIN
 -- �� ���̺� �����ϴ� ��� ���� ��ȸ�ϰ� ���� ��
 SELECT EMP_NAME, DEPT_TITLE, SALARY
   FROM EMPLOYEE
   FULL JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
ORDER BY 2 NULLS LAST;

-- CROSS JOIN
-- EMPLOYEE ROW COUNT 23 * DEPARTMENT ROW COUNT 9 = 207 ROWS
SELECT EMP_NAME, DEPT_CODE, DEPT_ID, DEPT_TITLE, SALARY
  FROM EMPLOYEE
  CROSS JOIN DEPARTMENT
ORDER BY 1,2,3;


/*
    �ڰ� ���� (SELF ����)
    - ���� ���̺��� �����ϴ� ���
*/
-- EMPLOYEE���� �����ȣ, ����̸�, �Ŵ���ID, �Ŵ��� ��ȸ
SELECT E.EMP_ID, E.EMP_NAME, E.MANAGER_ID, M.EMP_NAME
  FROM EMPLOYEE E -- ��� ����
  JOIN EMPLOYEE M -- �Ŵ��� ����
  ON (M.EMP_ID = E.MANAGER_ID);
  
-- �����ȣ, ����̸�, �μ���, ���޸�
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_NAME
  FROM EMPLOYEE 
  LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
  JOIN JOB USING(JOB_CODE);
  
-- EMPLOYEE�� DEPARTMENT EQUAL ���� �� ��� ROW COUNT => 21
-- EMPLOYEE�� JOB EQUAL ���� �� ��� ROW COUNT => 23
-- �������� ����� 21�� ROW COUNT�� ������, EMPLOYEE�� DEPARTMENT ���� ���Ŀ� JOB ���̺�� �����ϱ� �����̴�.

-- �����, �μ���, �μ� ������ ��ȸ
SELECT EMP_NAME, DEPT_TITLE, LOCATION_ID
  FROM EMPLOYEE
  LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID) -- ������� JOIN ��, 23�� ROW
  LEFT JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE); -- 2�� ����� ���� LOCATION_ID NULL�̹Ƿ�, EQUAL �����ϸ� �ٽ� 21�� ROW
  
/* EMPLOYEE���� LOCATION ���̺�� ������ �÷��� �������� ����
    (EMPLOYEE JOIN DEPARTMENT) JOIN LOCATION ������� �����ؾ� ��.
    
LEFT JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
*/

----------------------------- �ǽ� -------------------------------
-- 1. �����ȣ, �����, �μ���, ������, ������
-- EMPLOYEE, DEPARTMENT, LOCATION, NATIONAL
SELECT EMP_ID �����ȣ, EMP_NAME �����, DEPT_TITLE �μ���, LOCAL_NAME ������ ,NATIONAL_NAME ������
  FROM EMPLOYEE
  JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
  JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
  JOIN NATIONAL USING (NATIONAL_CODE);

-- 2. �����ȣ, �����, �μ���, ���޸�, ������, ������, �ش� �޿���޿��� ���� �� �ִ� �ִ� �޾�
--EMPLOYEE, DEPARTMENT, JOB, LOCATION, NATIONAL, SAL_GRADE
SELECT E.EMP_ID, E.EMP_NAME,
       D.DEPT_TITLE, 
       J.JOB_NAME, 
       L.LOCAL_NAME, 
       N.NATIONAL_NAME,
       S.MAX_SAL
  FROM EMPLOYEE E
  JOIN DEPARTMENT D ON (E.DEPT_CODE = D.DEPT_ID)
  JOIN JOB J USING(JOB_CODE)
  JOIN LOCATION L ON (D.LOCATION_ID = L.LOCAL_CODE)
  JOIN NATIONAL N USING (NATIONAL_CODE)
  JOIN SAL_GRADE S USING (SAL_LEVEL);