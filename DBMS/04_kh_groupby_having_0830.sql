/*
    GROUP BY
    - �׷� �Լ� ��� ��, �׷��� ������ �ۼ��ϴ� ����
    
    �Ľ�(Ž��) ����
    SELECT �÷���, �׷��Լ� FROM ���̺�� WHERE ���ǽ� GROUP BY �׷� ���� HAVING �׷��Լ� ���ǽ� ORDER BY ���ı���;
    
    FROM -> WHERE -> GROUP BY -> SELECT -> ORDER BY
    FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY
*/

-- ��ü ����� �޿� �� �հ�
SELECT SUM(SALARY) FROM EMPLOYEE;

-- ���޺� �޿� �� �հ�
SELECT SUM(SALARY) FROM EMPLOYEE GROUP BY job_code;

--�μ��� �޿� �� �հ�
SELECT DEPT_CODE, SUM(SALARY) FROM EMPLOYEE GROUP BY DEPT_CODE;

-- �μ��� ���� ��
SELECT DEPT_CODE, COUNT(*) FROM EMPLOYEE GROUP BY DEPT_CODE;

-- ���޺� �ּ� �޿�
SELECT JOB_CODE, MIN(SALARY) FROM EMPLOYEE GROUP BY JOB_CODE;

-- ���޺� �ִ� �޿� 
SELECT JOB_CODE, MAX(SALARY) FROM EMPLOYEE WHERE JOB_CODE NOT IN('J1', 'J3') GROUP BY JOB_CODE
ORDER BY 1;

-- �� ���޺� �� ��� ��, ���ʽ��� �޴� ��� ��, �޿��� �Ѱ�, ��� �޿�, �ִ� �޿�, �ּ� �޿�
SELECT JOB_CODE, DEPT_CODE,
       COUNT(*) "�� ��� ��",
       COUNT(BONUS) "���ʽ��� �޴� ��� ��",
       SUM(SALARY) "�޿��� �հ�",
       AVG(SALARY) "��� �޿�",
       MAX(SALARY) "�ִ� �޿�",
       MIN(SALARY) "�ּ� �޿�"
    FROM EMPLOYEE
GROUP BY JOB_CODE, DEPT_CODE
ORDER BY JOB_CODE, DEPT_CODE;

-- ���� �ּ� �޿�, �� �����
SELECT SUBSTR(EMP_NO, 8, 1),
       MIN(SALARY),
       COUNT(*)
    FROM EMPLOYEE
GROUP BY SUBSTR(EMP_NO, 8, 1);

SELECT DECODE(SUBSTR(EMP_NO, 8,1), '1','1','2','2','3','1','4','2') ����,
       MIN(SALARY),
       COUNT(*)
    FROM EMPLOYEE
GROUP BY DECODE(SUBSTR(EMP_NO, 8, 1), '1', '��', '2', '��', '3', '��', '4', '��');

/*
    HAVING
        - �׷� �Լ��� ���� ���ǽ��� �ۼ�.
*/

-- �� ���޺� �� ������� ��ȸ. ��, 2�� �̻��� ���.

SELECT JOB_CODE, COUNT(*) FROM EMPLOYEE GROUP BY JOB_CODE HAVING COUNT(*) > 1;

-- �μ��� ��� �޿��� 300���� �̻��� �μ��ڵ�, ��� �޿� ��ȸ
SELECT DEPT_CODE,
        AVG(SALARY)
    FROM EMPLOYEE
GROUP BY DEPT_CODE HAVING AVG(SALARY) >= 300000;
--HAVING AVG(SALARY) BETWEEN 1000000 AND 3000000;

-- ���ʽ��� ���� �ʴ� ����� �����ϴ� �μ� ��ȸ
SELECT DEPT_CODE, BONUS FROM EMPLOYEE ORDER BY DEPT_CODE;

-- 1) �μ����� ���ʽ��� �޴� ��� �� ��ȸ
SELECT DEPT_CODE, COUNT(BONUS) -- ��ȿ�� ���� ���ڸ� ��ȯ
FROM EMPLOYEE GROUP BY DEPT_CODE;

SELECT DEPT_CODE, COUNT(BONUS)
FROM EMPLOYEE GROUP BY DEPT_CODE HAVING COUNT(BONUS) = 0; -- ��ȿ�� ���� ����! ��, NULL �����͸� ������ �μ��ڵ�

