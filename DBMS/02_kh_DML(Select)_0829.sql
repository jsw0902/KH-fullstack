-- <-���� �ּ�
/*
    DML(SELECT) => DQL (������ ��ȭ ����, �ܼ� ��ȸ�ϴ� SQL)
    ������ ��ȸ ��, ����ϴ� SQL
    
    [ǥ����]
    
    SELECT �÷���1, �÷���2, �÷���3.... FROM ���̺��;

    �Ľ� (Ž��) ���� : FROM -> SELECT
    �Ľ� (Ž��) ���� : FROM -> WHERE -> SELECT
    
    ResultSet : SELECT�� ���� ��ȸ�� ���
*/

--EMPLOYEE ���̺���, ��� �÷� ��ȸ
SELECT * FROM EMPLOYEE;

-- EMPLOYEE ���̺���, EMP_NO�� EMP_NAME ��ȸ
SELECT EMP_NO, EMP_NAME FROM EMPLOYEE;

-- EMPLOYEE ���̺���, ����̸�, �ֹι�ȣ, �޿� �÷� ��ȸ
SELECT EMP_NAME, EMP_NO, SALARY FROM EMPLOYEE;

-- EMPLOYEE ���̺��� ����̸�, �̸���, ��ȭ��ȣ, �Ի����� ��ȸ
SELECT EMP_NAME, EMAIL,PHONE, HIRE_DATE FROM EMPLOYEE;

-- EMPLOYEE ���̺� �������� �ʴ� �÷� ��ȸ ��, ���� �߻�
--SELECT EMP_PW FROM EMPLOYEE;

-----------------------�ǽ�------------------------

-- 1. JOB ���̺��� ���޸� ��ȸ
SELECT JOB_NAME FROM JOB;

-- 2. DEPARTMENT ���̺��� ��� �÷� ��ȸ
SELECT * FROM DEPARTMENT; 

-- 3. DEPARTMENT ���̺��� �μ��ڵ�, �μ��� ��ȸ
SELECT DEPT_ID, DEPT_TITLE FROM DEPARTMENT;

-- 4. EMPLOYEE ���̺��� �����, �̸���, ��ȭ��ȣ, �޿�, �����ڵ� ��ȸ
SELECT EMP_NAME, EMAIL, PHONE, SALARY, JOB_CODE FROM EMPLOYEE;

-- 5. EMPLOYEE ���̺��� ���, �����, ���ʽ� ��ȸ
SELECT EMP_ID, EMP_NAME, BONUS FROM EMPLOYEE;


/*
    �÷� ���� ���� ��� ����
    
    SELECT���� �÷��� �ۼ� �κп�, ������� �ۼ� ����(���������� �÷���Ī���� ��µ�)
    
    
*/

-- �� ����� ������ ���� ��ȸ
SELECT EMP_NAME, SALARY FROM EMPLOYEE;

-- �� ����� ������ ���� ��ȸ
SELECT EMP_NAME, SALARY * 12 FROM EMPLOYEE;

-- �� ����� ������ ����, ���ʽ� ��ȸ
SELECT EMP_NAME, SALARY, BONUS FROM EMPLOYEE;

-- �� ����� �����, �޿�, ���ʽ�, ����, ���ʽ��� ���Ե� ����
SELECT EMP_NAME, SALARY, BONUS, SALARY*12, (SALARY * BONUS + SALARY)* 12 FROM EMPLOYEE;

-- �� ����� �����, �Ի����� ��ȸ
SELECT EMP_NAME, HIRE_DATE FROM EMPLOYEE;

-- �� ����� �����, ���ñ����� �ٹ����� ��ȸ == ���� ��¥ - �Ի� ����
SELECT EMP_NAME, SYSDATE - HIRE_DATE FROM EMPLOYEE;


----------------------�ǽ�����-----------------------
-- 1. 4�� ����Ḧ ������ �� �޿����� ����Ͻÿ�. �� �������� �޿��� 23%
SELECT EMP_NAME, SALARY-SALARY*0.23 FROM EMPLOYEE;
-- 2. 1������ 30���̶�� �����ϰ� �� �޿�, �ϱ޿�, �� ���ʽ� �ݾ��� ����Ͻÿ�. (��, �޿����� ���ʽ� ���� �ݾ�)
SELECT EMP_NAME, SALARY + SALARY * BONUS, (SALARY + SALARY * BONUS)/30, BONUS FROM EMPLOYEE;
-- 3. 1������ 30���̶�� �����ϰ� ������� �ٹ��� �������� ����Ͻÿ�. (�Ҽ��� ���·� ���)
SELECT EMP_NAME, (SYSDATE - HIRE_DATE) / 30 FROM EMPLOYEE;

/*
    ��ȸ�� �÷��� ��Ī�� ������ �� ����.
    EX) ��������� ���� ��ȸ�� �÷����� ��������. �÷��� ���� �������� �ǹ̸� �ٷ� �ؼ��� �� ����.
    
    [ǥ����]
    AS : Alias
    
    �÷��� ��Ī  / �÷��� AS ��Ī / �÷� �� "��Ī" / �÷��� AS "��Ī"
    
    ��, ��Ī�� Ư�����ڳ� ���� ���� ��, ""(�ֵ���ǥ)�� �����ؾ� ��.
    
*/

SELECT EMP_ID �����ȣ, EMP_ID AS �����ȣ, EMP_ID "�����ȣ", EMP_ID AS "�����ȣ" FROM EMPLOYEE; 

/*
-- ��Ī�� Ư�� ���ڳ� ���� ���� �� ""(�ֵ���ǥ)�� �����ؾ���
SELECT EMP_ID AS ��� ��ȣ FROM EMPLOTEE; 
*/
-- 1. 4�� ����Ḧ ������ �� �޿����� ����Ͻÿ�. �� �������� �޿��� 23%
SELECT EMP_NAME �̸�, SALARY-SALARY*0.23 "������ ����" FROM EMPLOYEE;
-- 2. 1������ 30���̶�� �����ϰ� �� �޿�, �ϱ޿�, �� ���ʽ� �ݾ��� ����Ͻÿ�. (��, �޿����� ���ʽ� ���� �ݾ�)
SELECT EMP_NAME �̸� , SALARY + SALARY * BONUS "���ʽ� ���� �� �޿���", (SALARY + SALARY * BONUS)/30 AS "���ʽ� ���� �� �޿���", BONUS ���ʽ� FROM EMPLOYEE;
-- 3. 1������ 30���̶�� �����ϰ� ������� �ٹ��� �������� ����Ͻÿ�. (�Ҽ��� ���·� ���)
SELECT EMP_NAME "��� �̸�", (SYSDATE - HIRE_DATE) / 30 "�ٹ� ������"FROM EMPLOYEE;


--------------------------------�ǽ�����--------------------------------------------

-- 1. EMPLOYEE ���̺��� ��� �÷� ��ȸ, �� ��� �÷��� ���ؼ� ������ ��Ī�� �����Ͻÿ�
SELECT EMP_ID "��� ��ȣ", EMP_NAME"�̸�", EMP_NO"�ֹι�ȣ", EMAIL �̸���, PHONE "��ȭ��ȣ", DEPT_CODE" �μ��ڵ�"
, JOB_CODE �����ڵ�, SAL_LEVEL "�޿� ����", SALARY "�� �޿�", BONUS ���ʽ���, MANAGER_ID"�Ŵ���ID", HIRE_DATE �Ի糯¥, ENT_DATE "�������", ENT_YN ��Ͽ��� FROM EMPLOYEE;
-- 2. SAL_GRADE ���̺��� ��� ������ �Ʒ��� ���� ��Ī�� �ۼ��Ͽ� ����Ͻÿ�.
-- �޿� ����, �ּ� �޿�, �ִ� �޿�
SELECT SAL_LEVEL "�޿� ����", MIN_SAL "�ּ� �޿�", MAX_SAL "�ִ� �޿�" FROM SAL_GRADE;

/*
    ���ͷ� : ���Ƿ� ������ ���ڿ�('')
    
    SELECT���� ���ͷ��� �����ϸ�, ��ġ ���̺�� �����ϴ� ������ó�� ��ȸ�� ����.
    ��ȸ�� RESULT SET�� ��� �࿡ �ݺ������� ��µȴ�.
*/
SELECT EMP_NAME, SALARY, '�ȳ�' AS �λ� FROM EMPLOYEE;

SELECT EMP_NAME, SALARY, '��' AS ���� FROM EMPLOYEE;

-- ���ͷ� ���� �ܵ���ǥ�� ������ ��.
-- SELECT EMP_NAME, SALARY, "��" AS ���� FROM EMPLOYEE;

SELECT EMP_NAME, SALARY, BONUS, '%' AS ���ʽ��� FROM EMPLOYEE;

/*
    ���� ������ : ||
    
    ���� ������ �ϳ��� �÷�ó�� ����(����)�ϰų�, �÷����� ���ͷ��� ������ �� ����.
    PS. Java���� String ���� ����� ����
*/
SELECT EMP_NAME, SALARY || '��' AS "�޿�����" FROM EMPLOYEE;

SELECT EMP_NAME, SALARY || '��' AS "�޿�����", BONUS || '%' AS ���ʽ��� FROM EMPLOYEE;

SELECT EMP_NAME, 'TEL : ' || PHONE AS "��ȭ��ȣ" FROM EMPLOYEE;


-----------------------------�ǽ�����-----------------------------------

-- 1. XXX�� ������ XXX�� �Դϴ�. => �÷��� : �޿� ���� 
SELECT EMP_NAME || '�� ������'|| SALARY || '�� �Դϴ�.' AS "�޿� ����" FROM EMPLOYEE; 
-- 2. ����Ͽ� '��' ������ �ٿ� ��� => �÷��� : �Ի���
SELECT HIRE_DATE || '��' AS "�Ի���" FROM EMPLOYEE;
-- 3. ��� ����� ����, ����̸�, �� �޿�(���ʽ� ����)��, �ٹ����ڸ� ���Ͻÿ�
SELECT EMP_NAME AS "����̸�", SALARY + SALARY * SALARY || '��' AS "�� �޿�(���ʽ� ����)", SYSDATE - HIRE_DATE AS "�ٹ�����" FROM EMPLOYEE; 
-- 4. ��� ����� ����, XXX���� ������ XXXX�� �̸�, �Ŵ��� �����ȣ�� XXX�Դϴ�. �� ���� ��� �÷��� => ��� ����
SELECT EMP_NAME || '���� ������ ' || SALARY || '�� �̸�, �Ŵ��� �����ȣ�� ' || MANAGER_ID || '�Դϴ�.' AS "��� ����" FROM EMPLOYEE;

/*
    DISTINCT : �÷��� �ߺ��� ������ �ѹ����� ����ϰ��� �� �� ���.
*/

SELECT JOB_CODE FROM EMPLOYEE;

SELECT DISTINCT JOB_CODE FROM EMPLOYEE;

SELECT DISTINCT DEPT_CODE FROM EMPLOYEE;

-- SELECT���� �ѹ��� �ۼ� �����ϹǷ�, ���� �߻�
-- SELECT DISTINCT DEPT_CODE, DISTINCT JOB_CODE FROM EMPLOYEE;

-- DEPT_CODE�� JOB_CODE�� �� ������ ��� �ߺ��� �Ǻ��ϰ�, �ߺ����� 1���� ����Ѵ�.
SELECT DISTINCT DEPT_CODE || JOB_CODE FROM EMPLOYEE;

/*
    WHERE
        - ��ȸ�ϰ��� �ϴ� ���̺�κ���, Ư�� ���ǿ� �����ϴ� ��(ROW)���� ��ȸ�ϰ��� �� �� ���.
        - WHERE���� ���ϴ� ��(ROW)�� ���� ���ǽ��� �ۼ��Ѵ�.
  
        
*/

-- EMPLOYEE ���̺��� DEPT_CODE�� D9�� ����� ��� �÷� ��ȸ
SELECT * FROM EMPLOYEE WHERE DEPT_CODE = 'D9';

-- EMPLOYEE ���̺��� JOB_CODE�� J5�� ����� �����, �ֹι�ȣ, ��ȭ��ȣ ��ȸ
SELECT EMP_NAME, EMP_NO, PHONE FROM EMPLOYEE WHERE JOB_CODE = 'J5';

-- EMPLOYEE ���̺��� DEPT_CODE�� D1�� �ƴ� ����� ���, �����, �μ��ڵ� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_CODE FROM EMPLOYEE WHERE DEPT_CODE != 'D1';
SELECT EMP_ID, EMP_NAME, DEPT_CODE FROM EMPLOYEE WHERE DEPT_CODE <> 'D1';
SELECT EMP_ID, EMP_NAME, DEPT_CODE FROM EMPLOYEE WHERE DEPT_CODE ^= 'D1';

-- EMPLOYEE ���̺��� �������� ����� ���� ���
SELECT * FROM EMPLOYEE WHERE ENT_YN = 'Y';

-- EMPLOYEE ���̺��� �޿��� 400���� �̻��� ������� �����, �޿����� ���
SELECT EMP_NAME, SALARY FROM EMPLOYEE WHERE SALARY >= 4000000;

-- EMPLOYEE ���̺��� �޿��� 300���� �̻��̰�, �μ��ڵ尡 D6�� ��� ��ȸ
SELECT * FROM EMPLOYEE WHERE SALARY >= 3000000 AND DEPT_CODE = 'D6';

-- EMPLOYEE ���̺��� ���� �ڵ尡 J2�̰ų�, J6�� ��� ��ȸ
SELECT * FROM EMPLOYEE WHERE JOB_CODE = 'J2' OR JOB_CODE = 'J6';

-- EMPLOYEE ���̺��� �޿��� 300���� �̻��� ��� ��ȸ(���ʽ� ����)
SELECT EMP_NAME, SALARY + SALARY * BONUS FROM EMPLOYEE WHERE SALARY + SALARY * BONUS >= 3000000;

-- EMPLOYEE ���̺��� �ٹ����ڰ� 10,000�� �̻��� ��� ��ȸ
SELECT EMP_NAME, SYSDATE - HIRE_DATE AS "�ٹ�����" FROM EMPLOYEE WHERE SYSDATE-HIRE_DATE >= 10000;

----------------------------- �ǽ� ���� ---------------------------------

-- 1. �޿��� 300���� �̻��� ������� �����, �޿�, �Ի���, ����(���ʽ�������) ��ȸ
SELECT EMP_NAME �����, SALARY �޿�, HIRE_DATE �Ի���, SALARY*12 AS "����(���ʽ�������)" FROM EMPLOYEE WHERE SALARY >= 3000000;
-- 2. ������ 5000���� �̻��� ������� �����, �޿�, ����, �μ��ڵ� ��ȸ(���ʽ� ������)
SELECT EMP_NAME �����, SALARY �޿�, SALARY*12 AS ����, DEPT_CODE �μ��ڵ� FROM EMPLOYEE WHERE SALARY*12 >= 50000000;
-- 3. �����ڵ尡 'J3'�� �ƴ� ������� �����ȣ, �����, �����ڵ�, ��翩��(ENT_YN) ��ȸ
SELECT EMP_ID �����ȣ, EMP_NAME �����, JOB_CODE �����ڵ�, ENT_YN ��翩�� FROM EMPLOYEE WHERE JOB_CODE != 'J3';
-- 4. �μ��ڵ尡 D9�̸鼭 �޿��� 500���� �̻��� ������� �����ȣ, �����, �޿�, �μ��ڵ� ��ȸ
SELECT EMP_ID �����ȣ, EMP_NAME �����, SALARY �޿�, DEPT_CODE FROM EMPLOYEE WHERE DEPT_CODE = 'D9' AND SALARY >= 5000000;
-- 5. �μ��ڵ尡 D6�̰ų� �޿��� 300���� �̻��� ������� �����, �μ��ڵ�, �޿� ��ȸ
SELECT EMP_NAME �����, DEPT_CODE �μ��ڵ�, SALARY "�޿���ȸ" FROM EMPLOYEE WHERE DEPT_CODE = 'D6' OR SALARY >= 3000000;
-- 6. �޿��� 350���� �̻�, 600���� ���ϸ� �޴� ������� �����ȣ, �����, �޿� ��ȸ
SELECT EMP_ID �����ȣ, EMP_NAME �����, SALARY "�޿� ��ȸ" FROM EMPLOYEE WHERE SALARY >= 3500000 AND SALARY <= 6000000;
-- 7. �����ڵ尡 J6�̰ų� J5��, �޿��� 300���� �̻��� ������� �����, �����ڵ�, �޿� ��ȸ
SELECT EMP_NAME �����, JOB_CODE �����ڵ�, SALARY "�޿� ��ȸ" FROM EMPLOYEE WHERE (JOB_CODE = 'J6' OR JOB_CODE = 'J5') AND SALARY >= 3000000;
-- 8. �����ڵ尡 J6�̰ų� J5��, �޿��� 300���� �̻��̸� �ٹ����ڰ� 1000�� �̻��� ������� �����, �����ڵ�, �޿�, �ٹ�����
SELECT EMP_NAME �����, JOB_CODE �����ڵ�, SALARY "�޿� ��ȸ", SYSDATE-HIRE_DATE �ٹ����� FROM EMPLOYEE WHERE (JOB_CODE = 'J6' OR JOB_CODE = 'J5')AND SALARY >= 3000000 AND SYSDATE-HIRE_DATE >= 1000;


/*
    BETWEEN : ���ǽĿ��� ���Ǵ� ����
        - Ư�� ������ �����͸� ��ȸ�ϰ� ���� �� ���.
    [ǥ����]
    BETWEEN ��1 AND �� 2 -> �� 1 �̻� - ��2 ����
*/

-- �޿��� 300�̻��̰�, 500���� ������ ����� ���� ���
SELECT * FROM EMPLOYEE WHERE SALARY BETWEEN 3000000 AND 5000000;

-- �޿��� 300���� ~ 500������ ���Ե��� �ʴ� ����� ���� ���
SELECT * FROM EMPLOYEE WHERE SALARY NOT BETWEEN 3000000 AND 5000000;
SELECT * FROM EMPLOYEE WHERE SALARY NOT BETWEEN 3000000 AND 5000000;
-- NOT : ������������

-- �Ի����� 90�� 1�� 1�� ~ 01�� 1�� 1���� ��� ��ȸ
SELECT * FROM EMPLOYEE WHERE HIRE_DATE BETWEEN '90/01/01' AND '01/01/01';

-------------------�ǽ�����---------------------
--���ʽ� ���� �� �޿��� 350���� �̻�, 600���� ������ ����� �����ȣ, �����, �μ��ڵ�, ���ʽ� ���� �� �޿� ��ȸ
SELECT EMP_ID �����ȣ, EMP_NAME �����, DEPT_CODE �μ��ڵ�, SALARY + SALARY * BONUS "���ʽ� ���� �� �޿�" FROM EMPLOYEE WHERE SALARY + SALARY * BONUS BETWEEN 3500000 AND 6000000;


/*
    LIKE : ���ϰ��� �ϴ� �÷��� ���� ���� ������ Ư¡ ���Ͽ� �����ϴ� ��� ���
    
    [ǥ����]
    �񱳴���÷� LIKE 'Ư¡����'
    
    - 'Ư¡����'
        '_'�� '%'(���ϵ� ī��)�� �ۼ��Ͽ� ������ ����.
        
    - '_' => ���ڼ����� ����
    EX) �񱳴���÷� LIKE '_����'       => �񱳴���� �÷����� ���� �տ� ������ �ѱ��ڰ� �� ��� ��ȸ
        �񱳴���÷� LIKE '__����'      => �񱳴���� �÷����� ���� �տ� ������ �α��ڰ� �� ��� ��ȸ
        �񱳴���÷� LIKE '_����_'      => �񱳴���� �÷����� ���� �հ� �ڿ� ������ �ѱ��ڰ� �� ��� ��ȸ
    - '%' =>
    EX) �񱳴���÷� LIKE '%����'       => �񱳴���� �÷����� "����"�� ���� ��� ��ȸ
        �񱳴���÷� LIKE '����%'       => �񱳴���� �÷����� "����"�� ������ ��� ��ȸ
        �񱳴���÷� LIKE '%����%'      => �񱳴���� �÷����� "����"�� ���Ե� ��� ��ȸ

*/
SELECT * FROM EMPLOYEE WHERE EMP_NAME LIKE '��__'; -- EMP_NAME�� '��'���� �����ϰ�, 3������ ��� ��ȸ
SELECT * FROM EMPLOYEE WHERE EMP_NAME LIKE '��___'; -- EMP_NAME�� '��'���� �����ϰ�, 4������ ��� ��ȭ
SELECT * FROM EMPLOYEE WHERE EMP_NAME LIKE '����_'; -- EMP_NAME�� '����'���� �����ϰ�, 3������ ��� ��ȸ
SELECT * FROM EMPLOYEE WHERE EMP_NAME LIKE '__��'; -- EMP_NAME�� '��'���� ������, 3������ ��� ��ȸ
SELECT * FROM EMPLOYEE WHERE EMP_NAME LIKE '_��_'; -- EMP_NAME�� �߰� ���ڰ� '��'��, 3������ ��� ��ȸ


SELECT * FROM EMPLOYEE WHERE EMP_NAME LIKE '��%'; -- EMP_NAME�� '��'���� �����ϴ� ��� ���� �� �������.
SELECT * FROM EMPLOYEE WHERE EMP_NAME LIKE '%ö'; -- EMP_NAME�� 'ö'�� ������ ���, ���� �� ��� ����
SELECT * FROM EMPLOYEE WHERE EMP_NAME LIKE '%��%'; -- EMP_NAME�� '��' ���ڰ� ���Ե� ��� ��ȸ

--PHONE �÷��� ���� 3��° ���ڰ� 1�� ����� ���� ���
SELECT * FROM EMPLOYEE WHERE PHONE LIKE '__1%';

-- �̸����� _�������� �� ���ڰ� 3������ �����ȸ
SELECT * FROM EMPLOYEE WHERE EMAIL LIKE '____%'; -- ��� �̸��� ������ ��ȸ��.
SELECT * FROM EMPLOYEE WHERE EMAIL LIKE '___$_%' ESCAPE '$'; -- ESCAPE�� ������ Ư������ �ڿ� ���� ���ڸ� ���ڸ� ���ϵ�ī�尡 �ƴ� ���ڷ� �νĽ�Ŵ
SELECT * FROM EMPLOYEE WHERE EMAIL NOT LIKE '___$_%' ESCAPE '$';




-----------------------------�ǽ�����-------------------------------

--1. EMPLOYEE���� �̸��� '��'���� ������ ������� �����, �Ի��� ��ȸ
SELECT EMP_NAME �����, HIRE_DATE FROM EMPLOYEE WHERE EMP_NAME LIKE '%��';
--2. EMPLOYEE���� ��ȭ��ȣ ó�� 3�ڸ��� '010'�� �ƴ� ������� �����, ��ȭ��ȣ ��ȸ
SELECT EMP_NAME �����, PHONE ��ȭ��ȣ FROM EMPLOYEE WHERE PHONE NOT LIKE '010%' ;
--3. EMPLOYEE���� �̸��� '��'�� ���ԵǾ� �ְ�, �޿��� 240����~500������ ������� �����, �޿� ��ȸ
SELECT EMP_NAME �����, SALARY "�޿�" FROM EMPLOYEE WHERE EMP_NAME LIKE '%��%' AND SALARY BETWEEN 2400000 AND 5000000;
--4. DEPARTMENT���� �ؿܿ������� �μ����� �μ��ڵ�, �μ��� ��ȸ
SELECT DEPT_ID �μ��ڵ�, DEPT_TITLE �μ��� FROM DEPARTMENT WHERE DEPT_TITLE LIKE '�ؿܿ���%';  
--5. EMPLOYEE���� ���� �ּҿ� 'S'�� ���Եǰ�, DEPT_CODE�� D9�Ǵ� D6�̰�,
    --������� 90/01/01 ~ 00/12/01�̸鼭, ������ 270���� �̻��� ����� ���� ��ȸ
SELECT * FROM EMPLOYEE WHERE EMAIL LIKE '%s%' AND (DEPT_CODE = 'D9' OR DEPT_CODE = 'D6') AND
              HIRE_DATE BETWEEN '90/01/01' AND '00/12/01' AND SALARY >= 2700000;
/*
    �������� �켱 ����
    1. ()
    2. ��� ����
    3. ���� ����
    4. �� ����
    5. IS NULL/LIKE '����' / IN
    6. BETWEEN AND
    7. NOT(������������)
    8. AND
    9. OR
*/

--------------------------------------------------------------------------------------------------------------------------
-- ��� ����� ����, �޿� ������ ���ʽ���, ���ʽ� ���� �޿� ��ȸ
SELECT EMP_NAME, SALARY, BONUS, SALARY + SALARY * BONUS "���ʽ� ���� �޿�" FROM EMPLOYEE;

-- BONUS �÷��� NUMBER(����) Ÿ���ε� ���ڿ��� ���Ͽ� ���� �߻�
SELECT EMP_NAME, SALARY, BONUS, SALARY + SALARY * BONUS "���ʽ� ���� �޿�" FROM EMPLOYEE
WHERE BONUS != 'NULL';

SELECT EMP_NAME, SALARY, BONUS, SALARY + SALARY * BONUS "���ʽ� ���� �޿�" FROM EMPLOYEE
WHERE BONUS != 0;

SELECT EMP_NAME, SALARY, BONUS, SALARY + SALARY * BONUS "���ʽ� ���� �޿�" FROM EMPLOYEE
WHERE NONUS = 0; -- NULL�� ���� ����ϰ��� �ۼ��Ͽ�����, ��µ��� ����.

/*
    IS NULL / IS NOT NULL
    
    - �÷��� ���� (NULL)�� ���� ���, NULL �� �񱳿� ���Ǵ� ������
    - NULL : ���� ������ �ǹ�. ��������̳� �񱳿��� �Ұ�
        * NULL�� ���ڿ��̳�, 0�� �ǹ����� ����!
*/

-- ���ʽ��� ���� �ʴ� ����� �����ȣ, �����, �޿�, ���ʽ� ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY, BONUS FROM EMPLOYEE WHERE BONUS IS NULL;

-- ���ʽ��� �޴� ����� �����ȣ, �����, �޿�, ���ʽ� ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY, BONUS FROM EMPLOYEE WHERE BONUS IS NOT NULL;

-- �Ŵ����� ���� ����� ��� ���� ��ȸ
SELECT * FROM EMPLOYEE WHERE MANAGER_ID IS NULL;

-- �μ���ġ�� ���� ���� �ʾ����� ���ʽ��� �޴� ��� ��ȸ
SELECT * FROM EMPLOYEE WHERE DEPT_CODE IS NULL AND BONUS IS NOT NULL; 


/*
    IN : �񱳴�� �÷����� ������ ����߿� ��ġ�ϴ� ���� �����ϴ���
    
    [ǥ����]
    �񱳴���÷� IN (��1, ��2, ��3....)

*/
-- �μ��ڵ尡 D6�̰ų�, D8�̰ų�, D5�� ����� �����ȣ, �����, �μ��ڵ� ��ȸ
SELECT EMP_ID �����ȣ, EMP_NAME �����, DEPT_CODE �μ��ڵ� FROM EMPLOYEE WHERE DEPT_CODE IN ('D6','D8','D5');

-- ������ 200�����̰ų�, 340������ ���
SELECT * FROM EMPLOYEE WHERE SALARY = 2000000 OR SALARY = 3400000;
SELECT * FROM EMPLOYEE WHERE SALARY IN  (2000000,3400000);

-----------------------�ǽ�����---------------------------------

-- 1. ����� ������, �μ���ġ�� ���� ���� ������� �����, ��� �����ȣ, �μ��ڵ� ��ȸ
SELECT EMP_NAME �����, MANAGER_ID "��� �����ȣ", DEPT_CODE �μ��ڵ� FROM EMPLOYEE WHERE MANAGER_ID IS NOT NULL AND DEPT_CODE IS NULL;
-- 2. ����(���ʽ� ������)�� 3000���� �̻��̰�, ���ʽ��� ���� �ʴ� ������� �����ȣ, �����, �޿�, ���ʽ� ��ȸ
SELECT EMP_ID �����ȣ ,EMP_NAME �����, SALARY �޿�, BONUS ���ʽ� FROM EMPLOYEE WHERE SALARY*12 >= 30000000 AND BONUS IS NULL; 
-- 3. �Ի����� '95/01/01' �����̰�, �μ���ġ�� ���� ����� �����ȣ, �����, �Ի���, �μ��ڵ� ��ȸ
SELECT EMP_ID �����ȣ ,EMP_NAME �����, DEPT_CODE �μ��ڵ� FROM EMPLOYEE WHERE HIRE_DATE > '95/01/01' AND DEPT_CODE IS NOT NULL;
-- 4. �޿��� 200���� �̻�, 500���� �����̰�, �Ի����� '01/01/01' �����̸鼭 ���ʽ��� ���� �ʴ� ������� ���� ��ȸ
SELECT * FROM EMPLOYEE WHERE SALARY BETWEEN 2000000 AND 5000000 AND HIRE_DATE > '01/01/01' AND BONUS IS NULL;
-- 5. ���ʽ� ���� ������ NULL�� �ƴϰ�, �̸��� '��'�� ���ԵǾ� �ִ� ������� �����ȣ, �����, �޿�, ���ʽ� ���� ���� ��ȸ
SELECT EMP_ID �����ȣ ,EMP_NAME �����, SALARY �޿�, (SALARY + SALARY * BONUS)*12 "���ʽ����� ����" FROM EMPLOYEE WHERE BONUS IS NOT NULL AND
EMP_NAME LIKE '%��%';

/*
    ORDER BY : �����͸� �����ϱ� ���� �ۼ��ϴ� Ű����
    
    [ǥ����]
    ORDER BY �����ϰ� ���� �÷��� | ��ȸ��� ���� | �������� | ��Ī [ ASC (�⺻��)| DESC ]
    
    ASC : �������� ����(������ -> ū�� / �������� / ������ -> ������ / NULL�� ���� �Ʒ���) [���� �� �⺻ ��]
    DESC : �������� ����(ū�� -> ������ / �������� / ������ -> ������ / NULL�� ���� ����)
    
    NULLS FIRST : �����ϰ��� �ϴ� �÷��� ���� NULL�� ���Ե� ��� NULL�� ���� ���� ���
    NULLS LAST : �����ϰ��� �ϴ� �÷��� ���� NULL�� ���Ե� ��� NULL�� ���� �������� ���
    
    
*/
SELECT * FROM EMPLOYEE ORDER BY SALARY; -- ������ -> ū��
SELECT * FROM EMPLOYEE ORDER BY SALARY DESC; --ū�� -> ������
SELECT * FROM EMPLOYEE WHERE SALARY >= 2000000 ORDER BY SALARY;

SELECT * FROM EMPLOYEE WHERE SALARY >= 2000000 ORDER BY EMP_NAME; -- ��������
SELECT * FROM EMPLOYEE WHERE SALARY >= 2000000 ORDER BY EMP_NAME DESC; -- ���� ����

SELECT * FROM EMPLOYEE ORDER BY HIRE_DATE;          --������ -> ������
SELECT * FROM EMPLOYEE ORDER BY HIRE_DATE DESC;     --������ -> ������

SELECT * FROM EMPLOYEE ORDER BY BONUS;  --���������� ��, NULL�� ���� ������(LAST)�� ��µȴ�.
SELECT * FROM EMPLOYEE ORDER BY BONUS NULLS FIRST;  -- BONUS ���� �������� ����. ��, NULL�� ���� ����

SELECT * FROM EMPLOYEE ORDER BY BONUS DESC; -- ���������� ��, NULL�� ���� ó��(FIRST)�� ��µȴ�.
SELECT * FROM EMPLOYEE ORDER BY BONUS DESC NULLS LAST; -- BONUS ���� �������� ����. ��, NULL�� ���� ������

SELECT * FROM EMPLOYEE ORDER BY SALARY, EMP_NAME;
SELECT * FROM EMPLOYEE ORDER BY SALARY, EMP_NAME DESC; --�޿� �������� ���� ��, ���� �޿��� ���� ����� ���� �̸� �������� ����

SELECT * FROM EMPLOYEE ORDER BY 1 DESC;

-- ��ȸ�� ����� 3��° �÷� �������� ����
SELECT EMP_ID, EMP_NAME, SALARY FROM EMPLOYEE ORDER BY 3 DESC;

--��ȸ�� ����� ���� �����ϹǷ�, ORDER BY ���� ��Ī �ۼ� ����.
SELECT EMP_ID "�����ȣ", EMP_NAME "�����", SALARY "�޿�" FROM EMPLOYEE ORDER BY �޿�;

--ORDER BY ����, �÷��� �Ǵ� �÷������Ӹ� �ƴ϶� �������ĵ� ����.
SELECT EMP_ID, EMP_NAME, SALARY*12 FROM EMPLOYEE ORDER BY SALARY*12;

