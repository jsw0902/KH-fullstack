/*
    ���� ������ (SET OPERATOR)
    
    - �ΰ� �̻��� ���̺��� JOIN�� ������� �ʰ� ���� �����͸� ��ȸ�ϴ� ���
    - �������� SQL ����� �ϳ��� �����ϴ� ���
    - JOIN�� �ٸ��� ROW�� �߰��Ͽ� �����͸� ǥ��.
    
    ����)
    1. �� SELECT�� ��� �÷����� �����ؾ� ��.
    2. SELECT���� ������ ��ġ�� �����ϴ� �÷� �����Ͱ� ��ȣ ȣȯ ������ �����̾�� ��.
    
    - (������) UNION         : �� SQL�� ��� ��, �ߺ��� ������ �����ϰ� �ϳ��� ��ħ.
    - (������) UNION ALL     : �� SQL�� ��� ��, �ߺ��� ������ �ߺ��� ��ŭ ���(�ߺ� ���� X)
    - (������) INTERSECT     : �� SQL�� ��� ��, ������ ������ ���
    - (������) MINUS         : ���� SQL�� �������, ���� SQL�� ����� ������ ������ ������ ���
    
    
*/


---------------------------UNION---------------------------
-- �μ��ڵ尡 D5�� ��� �Ǵ� �޿��� 300���� �̻��� ����� ��ȸ(���, �̸�, �μ��ڵ�, �޿�)

-- ù�� ° �� �������� �������� ����
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY 
  FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' -- ��� ���� ���� : 6
UNION -- �ߺ��� �� ���� ��, 12���� ��� ���
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
  FROM EMPLOYEE
WHERE SALARY >= 3000000; -- ��� ���� ���� : 8

---------------------------UNION ALL------------------------------
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY 
  FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' -- ��� ���� ���� : 6
UNION ALL -- �ߺ����� ���� �����Ƿ�, ù�� ° SQL ��� �� + �ι� ° SQL ��� ��
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
  FROM EMPLOYEE
WHERE SALARY >= 3000000; -- ��� ���� ���� : 8

-----------------------------INTERSECT-----------------------------

--�μ��ڵ尡 D5�̸鼭 �޿��� 300���� �̻��� ����� �����ȣ, �����, �μ��ڵ�, �޿� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
  FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' AND SALARY >= 3000000;

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
  FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
-- ORDER BY EMP_ID DESC -- ���� ������ ��� ��, ORDER BY���� ������ SQL���� �ۼ�
INTERSECT -- �� SQL �����, �Ʒ� SQL ��� ���߿� ��ġ�� �ุ ���
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
  FROM EMPLOYEE
WHERE SALARY >= 3000000
ORDER BY EMP_ID DESC;


-------------------------------MINUS-------------------------------
-- �μ��ڵ尡 D5�� ����� �߿��� �޿��� 300���� �̻��� ������� ���� �� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
  FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' -- ��� �� : 6�� => 6�� ��, �Ʒ� SQL ����� ���ԵǴ� ���� ���� �� ���
MINUS
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
  FROM EMPLOYEE
WHERE SALARY >= 3000000; -- ��� �� : 8��


-- ���� �ٸ� ���̺� �÷��� ������, ��ġ�ϰ� �ִ� �÷����� ������ ������ ��ȣ ȣȯ �����ϸ�
-- ���տ����� ��� ����
SELECT EMP_ID, EMP_NO, PHONE
  FROM EMPLOYEE
UNION ALL
SELECT DEPT_ID, DEPT_TITLE, LOCATION_ID
  FROM DEPARTMENT;
  
