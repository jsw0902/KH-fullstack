/*
        DML
            - DQL : SELECT (�������� ��ȭ�� ����)
            - �� �� : INSERT, UPDATE, DELETE
            
        INSERT : �����͸� �����ϴ� SQL ����
        UPDATE : �����͸� �����ϴ� SQL ����
        DELETE : �����͸� �����ϴ� SQL ����
        
*/

/*
    - INSERT -
    
    [ǥ����]
    
    1) INSERT INTO ���̺�� VALUES (��1, ��2, ��3.......);
    2) INSERT INTO ���̺�� (�÷�1, �÷�2, �÷�3...) VALUES (��1, ��2, ��3.......);
    
*/

SELECT *
  FROM EMPLOYEE;
  
/*
    1�� ǥ������ �̿��� INSERT
    - �÷� ������ ���Ѽ� VALUES�� ���� �����ؾ� ��.
*/
INSERT INTO EMPLOYEE
VALUES (900, '��¿�', '020902-3111111', 'SIUUUUU@iei.or.ke', '0109999999', 'D9', 'J3',
        'S1', 10000000, 50, '201', SYSDATE, NULL, DEFAULT);
  
-- NOT ENOUGH VALUES : ���� ������� �ʴ�.      
INSERT INTO EMPLOYEE
VALUES (901, '��¿�', '020902-3111111', 'SIUUUUU@iei.or.ke', '0109999999', 'D9', 'J3'
);

-- TOO MANY VALUES : ��õǾ� �ִ� �÷� ���ں���, ���� ����.
INSERT INTO EMPLOYEE
VALUES (900, '��¿�', '020902-3111111', 'SIUUUUU@iei.or.ke', '0109999999', 'D9', 'J3',
        'S1', 10000000, 50, '201', SYSDATE, NULL, DEFAULT, '320', 3235253, 42342342);
        
/*
    2�� ǥ������ �̿��� INSERT
    - ������ �÷��� ���� ���� INSERT �� �� ���.
    - �������� ���� �÷��� ���� �� ���� �ǹ��ϴ� NULL�� �߰�.
    - ���̺� ���� ��, DEFAULT ���� �����Ǿ� �ִ� ��� INSERT�� �������� �ʾƵ� �⺻���� �߰���.
*/

INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, JOB_CODE, SAL_LEVEL, HIRE_DATE)
VALUES (901, 'ī����', '000411-4548654', 'J1', 'S2', SYSDATE);

-- INSERT ����, SELECT
SELECT *  -- ENT_YN�� INSERT���� �ʾ�����, DEFAULT ���� �����Ǿ� �־� �߰��� ���� Ȯ���� �� ����.
  FROM EMPLOYEE;
  
  
/*
    INSERT INTO ���̺�� (��������)
    
    - ���� ���� ����Ͽ� �߰��ϴ� ���� �ƴϰ�,
      ���������� ��ȸ�� ����� �뤊�� �߰��� �� ����.
      
*/

-- �׽�Ʈ ���̺� ����
CREATE TABLE EMP_01 (
       EMP_ID VARCHAR(3), -- �����ȣ
       EMP_NAME VARCHAR2(20), -- �����
       DEPT_TITLE VARCHAR2(20) -- �μ���
);

-- ���� ������ ��� ��ü�� EMP_01 ���̺� INSERT
INSERT INTO EMP_01
(SELECT EMP_ID, EMP_NAME, DEPT_TITLE
  FROM EMPLOYEE
  LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
  );

SELECT *
  FROM EMP_01;
  
ROLLBACK;
/*
    INSERT ALL
    -- ���� ���̺� �ѹ��� �����͸� �߰��ϴ� ����
    
    INSERT ALL
    INTO ���̺�� VALUES (�÷�1,�÷�2,�÷�3)
    INTO ���̺�� VALUES (�÷�2,�÷�4,�÷�5)
*/

-- �׽�Ʈ�� ���� ���̺� ����
-- ������ ����(�÷�)�� �����Ͽ� ���̺� ����
CREATE TABLE EMP_DEPT
AS
SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE
  FROM EMPLOYEE
 WHERE 1=0; -- ������ FALSE �����Բ� �ۼ��Ͽ�, ��ȸ���� �ʵ���


CREATE TABLE EMP_MANAGER
AS
SELECT EMP_ID, EMP_NAME, MANAGER_ID
  FROM EMPLOYEE
 WHERE 1=0; 

-- �Ʒ� SELECT ����� �÷��� VALUES�� ������ ����.  
INSERT ALL
INTO EMP_DEPT VALUES (EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE)
INTO EMP_MANAGER VALUES (EMP_ID, EMP_NAME, MANAGER_ID)
SELECT EMP_ID, EMP_NAME, DEPT_CODE, MANAGER_ID, HIRE_DATE
   FROM EMPLOYEE;
-- WHERE DEPT_CODE IN ('D5', 'D8'); --���������� ���ǽ� �ۼ��Ͽ�, Ư�� �ุ �߰��� �� �ֵ��� ó�� ����.

ROLLBACK;

SELECT * FROM EMP_DEPT;
SELECT * FROM EMP_MANAGER;

INSERT ALL
WHEN HIRE_DATE < '2000/01/01' THEN -- �Ʒ� SELECT ��� ��, �Ի����ڰ� 2000�� ������ ����鸸 EMP_DEPT�� �߰�
INTO EMP_DEPT VALUES (EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE)
WHEN HIRE_DATE >= '2000/01/01' THEN -- �Ʒ� SELECT ��� ��, �Ի����ڰ� 2000�� ������ ����鸸 EMP_MANAGER�� �߰�
INTO EMP_MANAGER VALUES (EMP_ID, EMP_NAME, MANAGER_ID)
SELECT EMP_ID, EMP_NAME, DEPT_CODE, MANAGER_ID, HIRE_DATE
   FROM EMPLOYEE;


/*

    - UPDATE -
    ���̺��� �����ϴ� �����͸� �����ϴ� ����


    [ǥ����]
    UPDATE ���̺��
       SET �÷��� = ���氪,
           �÷��� = ���氪,
           �÷��� = ���氪
           
    [WHERE ���ǽ�] ==> ������ ����. ��, ���� �� ��� �࿡ ���� ������Ʈ�� ����ǹǷ� ����
    
    
*/

CREATE TABLE DEPT_COPY
AS SELECT * FROM DEPARTMENT;


SELECT * FROM DEPT_COPY;

-- �ѹ��� => ������ȹ�η� �μ��� ����
UPDATE DEPT_COPY -- ������ ���̺�
   SET DEPT_TITLE = '������ȹ��' -- ������ �÷� = ���氪 
 WHERE DEPT_ID = 'D9'; -- ������ ROW
 

CREATE TABLE EMP_SALARY
AS SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY, BONUS
     FROM EMPLOYEE;
     
SELECT * FROM EMP_SALARY;

-- ���ö ����� �޿� 400�������� ����

UPDATE EMP_SALARY
   SET SALARY = 4000000
 WHERE EMP_NAME = '���ö';

-- ������ ����� �޿� 750�������� �����ϰ�, ���ʽ��� 0.25�� ����
UPDATE EMP_SALARY
   SET SALARY = 7500000, BONUS = 0.25
 WHERE EMP_NAME = '������';
 
/*
    - ���� ������ ���� UPDATE
    
    UPDATE ���̺��
       SET ���� �÷� = (��������)
    [WHERE ���ǽ�]
*/

-- �ڸ�� ����� �޿��� ���ʽ��� ����� ����� �����ϰ� ����
UPDATE EMP_SALARY
   SET SALARY = (SELECT SALARY FROM EMP_SALARY WHERE EMP_NAME = '�����'),
       BONUS = (SELECT BONUS FROM EMP_SALARY WHERE EMP_NAME = '�����')
 WHERE EMP_NAME = '����';


-- ���� ������ ��ȸ�� ù�� ° �÷����� SALARY�� ������
-- ���� ������ ��ȸ�� �ι� ° �÷����� BONUS�� ������
UPDATE EMP_SALARY
   SET (SALARY, BONUS) = (SELECT SALARY,BONUS FROM EMP_SALARY WHERE EMP_NAME = '�����')  
 WHERE EMP_NAME = '����';

-- ASIA �ٹ� ������ �ٹ��ϴ� ������� ���ʽ����� 0.5�� ����
UPDATE EMP_SALARY
   SET BONUS = 0.2
 WHERE DEPT_CODE IN (
                    SELECT DEPT_CODE 
                    FROM EMP_SALARY
                    JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
                    JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
                    WHERE LOCAL_NAME LIKE '%ASIA%');

/*
    DELETE
    - ���̺� ��ϵ� �����͸� �����ϴ� ����
    
    [ǥ����]
    DELETE
    FROM ���̺��
    [WHERE ���ǽ�] -- ���� ��, ��ü ���� ������. ����
    
*/

SELECT * FROM EMPLOYEE;

DELETE
  FROM employee
 WHERE EMP_ID = '900';
 
 -- Ư�� �÷��� ������ �����ϴ� ���� �Ұ�. DELETE�� �� ������ ����!
 -- DELETE FROM employee WHERE EMP_ID = '901';
 
 DELETE
   FROM EMPLOYEE
  WHERE EMP_ID = (SELECT EMP_ID FROM EMPLOYEE WHERE EMP_NAME = 'ī����');
  
-- ���� �ð��� �������� Ư�� ���� �ð��� �����͸� ��ȸ
-- DELETE �� ���� �ݿ� ��, �����͸� �����ؾ��� �� �����ϰ� ���� �� �ִ�.
SELECT *
  FROM EMP_01 AS OF TIMESTAMP(SYSTIMESTAMP-INTERVAL '1' MINUTE);
  
DELETE
  FROM EMP_01;
  
  
/*
    TRUNCATE
    
    - ���̺��� ��ü �����͸� ������ �� ���Ǵ� ����.
    - ���������� DELETE���� ����.
    - Ư�� ���ǽ�(WHERE) �ۼ� �Ұ�. �� ������ �����Ƿ� DELETE ���������� ���.
    - ROLLBACK (����)�� �Ұ���
    
    [ǥ����]
    TRUNCATE TABLE ���̺��;
*/

DELETE
  FROM EMP_DEPT;
  
SELECT * FROM EMP_DEPT;

ROLLBACK;

TRUNCATE TABLE EMP_DEPT;