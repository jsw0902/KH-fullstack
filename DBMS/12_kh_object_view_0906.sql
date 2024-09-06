/*
    < view >
    
    - DDL�� ������ �� �ִ� ��ü�� �� ����.
    - ���̺��� ��ȸ�� �� �ִ� SQL�� ������ �� �ִ� ��ü.
    - ���� ���ǰų� ������ SELECT SQL�� VIEW�� ���������ν�, ����� �����ϰ� ��ȸ�� �� �ִ�.
    - �ӽ� ���̺� ���� ������ ����. (���� �����Ͱ� ����Ǿ� �ִ� ���� �ƴ�)
    - ��ȸ ��, ���� ���̺��� �����Ͽ� �����͸� ����Ѵ�.
    
    * ��, VIEW�� �����ϸ� ���� ���̺��� �ݿ��� �ȴ�. (���� ���̺��� �����ϰ� �����Ƿ�)
    * ���� ���̺��� �����ص�, VIEW�� �ִ� �����Ͱ� ����ȴ�.
    
    �������� ���̺� : ���� �����Ͱ� �����ϴ� ���̺� (EMPLOYEE, DEPARTMENT, LOCATION.....)
    ������ ���̺� : ���� �����Ͱ� �����ϴ� ���̺��� �ƴ�, ������ ���̺��� ������� �� ������ ���̺�
            ->> VIEW�� ������ ���̺��̶�� ���� �� �ִ�. 
*/

/*
    VIEW ���� ���
    
    [ǥ����]
    
    CREATE VIEW ���Ī
    AS
    ��������;
*/

-- ���� �߻� : VIEW�� ������ �� �ִ� ������ KH ������ �ο����� �ʾ���.
CREATE VIEW EMP_VIEW
AS
SELECT EMP_ID, EMP_NAME, EMAIL, PHONE
  FROM EMPLOYEE;

-- ������ �������� �����Ͽ�, KH ������ VIEW�� ������ �� �ִ� ������ �ο�
GRANT CREATE VIEW TO KH;

-- ��� ����� ���̺�� �ٸ��� ������, ���� �����Ͱ� ����Ǿ� �ִ� ���� �ƴ�!!! ������ ���̺�
SELECT *
  FROM EMP_VIEW;
  
-- ���� ���̺� ����
CREATE TABLE EMP_COPY
AS
SELECT EMP_ID, EMP_NAME, EMAIL, PHONE
  FROM EMPLOYEE;

SELECT * FROM EMP_COPY; -- �������� ���̺�(JAVA������ ���� ����� ����(���� �����͸� �����ϴ�))
SELECT * FROM EMP_VIEW; -- ������ ���̺�(JAVA������ ���� ����� ����(�ּҰ��� �����ϴ�!))

SELECT *
  FROM EMPLOYEE
 WHERE EMP_NAME = '���߼�';
 
UPDATE EMPLOYEE
   SET PHONE = '01040647125'
 WHERE EMP_NAME = '���߼�';
 
-- ������ ���̺�(������ ���̺�)�� ������ �����͸� �����ϱ� ������, ���� ���̺� ���� �� ������ ���� �ʴ´�.
SELECT *
  FROM EMP_COPY
 WHERE EMP_NAME = '���߼�';
 
-- ���� ���̺�� ������ VIEW(���� ���̺�)�� ���� ���̺��� �����ϱ� ������, ���� ���̺� ���� �� ������ �޴´�.
SELECT *
  FROM EMP_VIEW
 WHERE EMP_NAME = '���߼�';
 
---------------------------------------------------------------------------------------
-- ������ ���̺� (������ ���̺�) ������Ʈ
UPDATE EMP_COPY
   SET PHONE = '01012345678'
 WHERE EMP_NAME = '�ӽ�ȯ';
 
SELECT * 
  FROM EMP_COPY 
 WHERE EMP_NAME = '�ӽ�ȯ';
 
SELECT * -- ������� �ʾ���!
  FROM EMPLOYEE -- ���� ���̺� 
 WHERE EMP_NAME = '�ӽ�ȯ'; 
 
-- ���� ���̺�� ������ VIEW (���� ���̺�) ������Ʈ
UPDATE EMP_VIEW
   SET PHONE = '01099998888'
 WHERE EMP_NAME = '�ӽ�ȯ';
 
SELECT *
  FROM EMP_VIEW
 WHERE EMP_NAME = '�ӽ�ȯ';
 
SELECT * -- ���� ���̺� ����Ǿ���!
  FROM EMPLOYEE
 WHERE EMP_NAME = '�ӽ�ȯ';
 
/*
    VIEW�� DML ������ �Ұ����� ���
    
    1) �信 ���Ե��� ���� �÷��� �����ϴ� ���
    2) VIEW�� ���Ե��� ���� �÷� ��, ���� ���̺��� NOT NULL ���������� ������ ���
    3) ��� ��������� ������ �÷��� �����ϴ� VIE
    4) JOIN, GROUP �Լ��� ������ VIEW
    5) DISTINCT�� �ߺ��� �����Ͽ� ������ VIEW
*/

--1) �信 ���Ե��� ���� �÷��� �����ϴ� ���
SELECT *
  FROM EMP_VIEW;
  
UPDATE EMP_VIEW
   SET SALARY = 2000000 -- VIEW���� �������� �ʴ� �÷��̹Ƿ� ���� �߻�!
 WHERE EMP_ID = '202';
 
 --2) VIEW�� ���Ե��� ���� �÷� ��, ���� ���̺��� NOT NULL ���������� ������ �÷��� �����ϴ� ���
SELECT *
  FROM EMP_VIEW;
-- ���� VIEW�� �����ϰ� �ִ� �÷��� EMP_ID, EMP_NAME, EMAIL, PHONE
-- VIEW�� INSERT�� ����(EMPLOYEE)���� ISERT ��! �ٵ� �� 4�� �÷� �̿��� �÷��� (EMP_NO, JOB_CODE...)��
-- NOT NULL ���������� �����Ǿ� �־� ���� �߻�!
INSERT INTO EMP_VIEW VALUES ('900', '��¿�', 'jsw0209@iei.or.kr', '01012345678');

--3) ������������ ������ VIEW�� ���
CREATE VIEW EMP_VIEW2
AS
SELECT EMP_ID, EMP_NAME, SALARY * 12 AS ���� -- ��Ī�� �����ؾ� ���������� ������ �����ϴ�.
  FROM EMPLOYEE;
  
SELECT * FROM EMP_VIEW2;

UPDATE EMP_VIEW2
   SET ���� = 9000000 -- ���� �߻�
 WHERE EMP_ID = '200';
 
UPDATE EMPLOYEE
   SET SALARY = 3000000 -- ���� ���̺��� �翬�� ������Ʈ ����.
 WHERE EMP_ID = '200';
 
SELECT SALARY
  FROM EMPLOYEE
 WHERE EMP_ID = '200';

SELECT *    -- VIEW���� �������� �����͵� ���������� ���������� ���� ����� �����ְ� ����.
  FROM EMP_VIEW2;
  
-- 4) GROUP BY �Ǵ� JOIN�� ���� ������ VIEW
CREATE VIEW EMP_VIEW3
AS
SELECT DEPT_CODE, SUM(SALARY) �հ�, FLOOR(AVG(SALARY)) ���
  FROM EMPLOYEE
 GROUP BY DEPT_CODE;
 
SELECT *
  FROM EMP_VIEW3;

-- ����(EMPLOYEE) ���̺��� �μ��ڵ尡 D6�� ����鿡�� �հ� �ݾװ�, ��� �ݾ��� ��� �й��Ͽ� SALARY�� ������Ʈ �ϴ°�??
UPDATE EMP_VIEW3
   SET �հ� = 5000000,
       ��� = 3500000
 WHERE DEPT_CODE = 'D6';
 
 
-- 5) DISTINCT�� �ߺ��� �����Ͽ� ������ VIEW
SELECT DISTINCT DEPT_CODE FROM EMPLOYEE;

----------------------------------------------------------------------
/*
    VIEW �ɼ�
    
    [ǥ����]
    CREATE [OR REPLACE] [FORCE | "NOFORCE"] VIEW ���Ī
    AS
    ��������
    [WITH CHECK OPTION]
    [WITH READ ONLY];
    
    OR REPLACE          : ������ ������ �䰡 �������� ������, �����ϰ� �����ϸ� ����.
    FORCE | NOFORCE
            - FORCE : �� ���� ��, ���������� ����� ���̺��� �������� �ʾƵ� �䰡 ������.
            - NOFORCE[�⺻��] : ���������� ����� ���̺��� �����ؾ߸� �� ���� ����.
    WITH CHECK OPTION : DML��, ���������� ����� ���ǿ� ������ �����θ� DML ���� ����
    WITH READ ONLY    : �信 ���� DML ���� �Ұ�(���� ��ȸ�� ����)
*/

-- 1) CREATE OR REPLACE
CREATE OR REPLACE VIEW EMP_VIEW -- ������ �����ϴ� VIEW�� ���ؼ� REPLACE ����!!
AS
SELECT EMP_ID, EMP_NAME, EMAIL, PHONE, DEPT_CODE, JOB_CODE
  FROM EMPLOYEE;
  
SELECT *
  FROM EMP_VIEW;
  
-- 2) FORCE
CREATE OR REPLACE FORCE VIEW VW_FORCE
AS
SELECT TEST1, TEST2, TEST3
  FROM TEST_TBL; -- ������ ������ �Բ� �䰡 �����Ǿ����ϴ�.(�������� �ʴ� ���̺�� ������ ��!)
  
SELECT * -- ������ �Ǿ�����, ��ȸ �Ұ�! ���� VVIEW ����Ʈ���� X�ڽ� ����� ǥ�õȰ� Ȯ���� �� ����.
  FROM VW_FORCE;
  
CREATE TABLE TEST_TBL(
    TEST1 VARCHAR2(30),
    TEST2 VARCHAR2(30),
    TEST3 VARCHAR2(30)
);

-- �� TEST_TBL�� �����Ͽ���, ��ȸ ����!
SELECT *
  FROM VW_FORCE;
  
--3) WITH CHECK OPTION
-- VIEW�� ���� DML ���� ��, ���������� �����ϴ� �����θ� DML ����!

CREATE OR REPLACE VIEW EMP_VIEW4
AS
SELECT EMP_ID, EMP_NAME, SALARY
  FROM EMPLOYEE
 WHERE SALARY >= 3000000
WITH CHECK OPTION;

SELECT *
  FROM EMP_VIEW4;

UPDATE EMP_VIEW4
  SET SALARY = 3500000 -- �� ���� ��, WHERE���ǿ� �����ϹǷ� ���� ������Ʈ
 WHERE EMP_NAME = '���ȥ';

UPDATE EMP_VIEW4
  SET SALARY = 2900000 -- �� ���� ��, WHERE���ǿ� �������� �����Ƿ� ���� �߻�!
 WHERE EMP_NAME = '���ȥ';
 
-- 4) WITH READ ONLY
-- VIEW ���� ��, �б� ����(��ȸ)���� ����. DML ������ �Ұ���!
--���� ���̺� ������ ���� �ʵ��� �ϱ� ����!

CREATE OR REPLACE VIEW EMP_VIEW5
AS
SELECT EMP_ID, EMP_NAME, EMP_NO, SALARY
  FROM EMPLOYEE
WITH READ ONLY;

SELECT *
  FROM EMP_VIEW5;
  
UPDATE EMP_VIEW5
   SET SALARY = 3000000 -- READ ONLY�� ������ VIEW�̹Ƿ�, DML �Ұ�!!!
 WHERE EMP_ID = '222';