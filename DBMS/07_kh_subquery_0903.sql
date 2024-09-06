/*
    �������� (SUB QUERY)
    
    - �ϳ��� SELECT ���� ���ο�, ���Ե� �� �ϳ��� SELECT ����
    
    * ���� ���� *
    - ���������� �ݵ�� �Ұ�ȣ()�� ����� �Ѵ�.
    - ���������� �پ��� ��ġ���� ����� �����ϴ�.
    - FROM���� ���Ǵ� �������� �̿��� ��ġ���� ORDER BY ����� �Ұ����ϴ�.

    * ���������� ����
    
    - ���������� ������� ���� �Ʒ��� ���� ���еȴ�.
    
    - ������           : ���������� ��ȸ ������� ���ϰ��� �� (1�� 1��)
    - ������           : ���������� ��ȸ ������� �������� �� (N�� 1��)
    - ���߿�           : ���������� ��ȸ ������� �������� �� (1�� N��)
    - ������ ���߿�     : ���������� ��ȸ ������� ������ �������� �� (N�� N��)
    
    - ���            : �������� ���� ��, ���������� �� ���� �����ϴ� ��ȣ���� ��������
    - ��Į��          : ���ϰ��� ��ȯ�ϴ� ��������
*/

-- ���ö ����� ���� �μ��� ���� ����� ��ȸ
SELECT *
  FROM EMPLOYEE
 WHERE EMP_NAME = '���ö';
 
 SELECT *
   FROM EMPLOYEE
  WHERE DEPT_CODE = 'D9'; -- ������ ��ȸ�� �μ��ڵ带 ���� ����� ��ȸ
  
-- ���������� ����� "���ö ����� ���� �μ��� ���� �����" ��ȸ
SELECT *
   FROM EMPLOYEE
  WHERE DEPT_CODE = (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME = '���ö');
  
  
-- �� ������ ��� �޿����� ���� �޿��� �޴� ������� ���� ��ȸ
SELECT AVG(SALARY)
  FROM EMPLOYEE; -- 3047662
  
SELECT *
  FROM EMPLOYEE
WHERE SALARY > 3047662; -- ��� �޿����� ���� �޴� �����

-- �������� ���
SELECT *
  FROM EMPLOYEE
 WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE);
 
-------------------------- ������ �������� --------------------------

-- 1) �� ���� ��� �޿����� �޿��� �� ���� �޴� ����� ���� ��ȸ
SELECT *
  FROM EMPLOYEE
 --WHERE SALARY < ��ձ޿�;
WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEE);

-- 2) ���� �޿��� �޴� ��� ����
SELECT *
  FROM EMPLOYEE
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEE);

-- 3) ���ö ����� �޿����� ���� �޴� ��� ���� ��ȸ
-- ���ö ����� �޿� ������ �˾ƾ��Ѵ�. => ���� ������ WHERE, ���� ������ WHERE
SELECT *
  FROM EMPLOYEE
WHERE SALARY > (SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME = '���ö');

-- 4) D1,D2 �μ��� �ٹ��ϴ� ����� ��, �޿��� D5 �μ� �������� ��� �޿����� ���� �޿��� �޴� ����� ��ȸ
SELECT *
  FROM EMPLOYEE
WHERE DEPT_CODE IN ('D1', 'D2')
   AND SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE WHERE DEPT_CODE = 'D5');


-- 5) �μ��� �޿����� ���� ū �μ��� �μ� �ڵ�� �޿��� �հ� ��ȸ
SELECT MAX(SUM(SALARY)) -- �μ��� �޿� �հ� ��, ���� ū ��
  FROM EMPLOYEE
 GROUP BY DEPT_CODE;
 
SELECT DEPT_CODE, SUM(SALARY)
  FROM EMPLOYEE
 GROUP BY DEPT_CODE
HAVING SUM(SALARY) = (SELECT MAX(SUM(SALARY))
                        FROM EMPLOYEE
                       GROUP BY DEPT_CODE);
                       
-- 6) ������ ����� ���� �μ������� ���, �����, ��ȭ��ȣ, �Ի��� ��ȸ
-- ��, ������ ����� �����ϰ� ���

SELECT EMP_ID, EMP_NAME, PHONE, HIRE_DATE
  FROM EMPLOYEE
 WHERE DEPT_CODE = (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME = '������')
   --AND EMP_NAME != '������';
   AND EMP_ID != (SELECT EMP_ID FROM EMPLOYEE WHERE EMP_NAME = '������');
   
----------------------------------������ ��������------------------------------------------
/*
    ���������� ������� ���� �� �� ��
    
    * ������ ������������ �ַ� ���Ǵ� ������ : IN, ANY, ALL
    
    IN : �������� ����� �߿��� �ϳ��� ��ġ�ϴ� ���� �ִ���
    
    A > ANY �������� : �������� ������߿��� A���� "�Ѱ���" Ŭ ���. (������ ������߿��� ���� ���������� Ŭ ���)
    A < ANY �������� : �������� ������߿��� A���� "�Ѱ���" ���� ��� (�������� ������߿��� ���� ū ������ ���� ���)
    
        A > ANY (��1, ��2, ��3)
        A > ��1 OR A > ��2 OR A > ��3 �� ���� �ǹ�.
    
    A > ALL �������� : �������� "���" ������� ���� A�� Ŭ ���
    A < ALL �������� : �������� "���" ������� ���� A�� ���� ���
    100 < ANY (50, 80, 150)    
        
        A > ALL (��1, ��2, ��3)
        A > ��1 AND A> ��2 AND A > ��3 �� ���� �ǹ�.
        
   A > ALL �������� : �������� "���" ������� ���� A�� Ŭ ���
   A < ALL �������� : �������� "���" ������� ���� A�� ���� ���
*/

-- IN

-- ����ϰ� �ִ� ����� �������� ���
SELECT MANAGER_ID, COUNT(MANAGER_ID)
  FROM EMPLOYEE
  GROUP BY MANAGER_ID
  HAVING COUNT(MANAGER_ID) > 1;
  
SELECT *
  FROM EMPLOYEE
 WHERE EMP_ID IN ('200', '204', '207', '214');
 
SELECT *
  FROM EMPLOYEE
 WHERE EMP_ID IN (SELECT MANAGER_ID
                 FROM EMPLOYEE
                 GROUP BY MANAGER_ID
                 HAVING COUNT(MANAGER_ID) > 1);
                 
-- �μ��� �ְ� �޿��� �޴� ����
-- = �����ڷ� ���� �� ���� ���� : ���������� ��� �� �� ��Ͱ� ������ �� �� ����.
SELECT *
  FROM EMPLOYEE
  WHERE SALARY IN (SELECT MAX(SALARY)
                  FROM EMPLOYEE
                  GROUP BY DEPT_CODE);
 -- �����, ������ ����� ���� ������ ������� ���, �����, �����ڵ�, �޿�
 SELECT *
  FROM EMPLOYEE
 WHERE EMP_NAME IN ('�����', '������');
 
 SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
   FROM EMPLOYEE
  WHERE JOB_CODE IN ('J3', 'J7');
  
SELECT EMP_ID, EMP_NAME, JOB_CODE
  FROM EMPLOYEE
 WHERE JOB_CODE IN (SELECT JOB_CODE
                   FROM EMPLOYEE
                  WHERE EMP_NAME IN ('�����', '������'));
                  
                  
SELECT JOB_CODE
  FROM EMPLOYEE
 WHERE EMP_NAME IN ('�����', '������');
 
 SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
   FROM EMPLOYEE
  WHERE JOB_CODE IN ('J3', 'J3');
  
SELECT EMP_ID, EMP_NAME, JOB_CODE
  FROM EMPLOYEE -- ���������� ����� 1���̱� ������, = ������ �����ϴ�
 WHERE JOB_CODE = (SELECT DISTINCT JOB_CODE
                   FROM EMPLOYEE
                  WHERE EMP_NAME IN ('�����', '������'));
                  
-- ANY
SELECT * FROM EMPLOYEE WHERE SALARY > ANY(2000000, 3000000) ORDER BY SALARY;
-- SELECT * FROM EMPLOYEE WHERE SALARY > 2000000 OR SALARY > 3000000 ORDER BY SALARY;
SELECT * FROM EMPLOYEE WHERE SALARY < ANY(2000000, 3000000) ORDER BY SALARY;
-- SELECT * FROM EMPLOYEE WHERE SALARY < 2000000 OR SALARY < 3000000 ORDER BY SALARY;
SELECT * FROM EMPLOYEE WHERE SALARY = ANY(2000000, 3000000) ORDER BY SALARY;
-- SELECT * FROM EMPLOYEE WHERE SALARY = 2000000 OR SALARY = 3000000 ORDER BY SALARY;


-- �븮 ����������, ���� ���� �޿��� �� �ּ� �޿����� ���� �޴� ���
SELECT SALARY
  FROM EMPLOYEE
  JOIN JOB USING (JOB_CODE)
 WHERE JOB_NAME = '����';
 
SELECT *
  FROM EMPLOYEE
  JOIN JOB USING (JOB_CODE)
 WHERE JOB_NAME = '�븮'
   AND (SALARY > 2200000 OR SALARY > 2500000 OR SALARY > 3760000);
   
SELECT *
  FROM EMPLOYEE
  JOIN JOB USING (JOB_CODE)
 WHERE JOB_NAME = '�븮'
   AND SALARY > ANY (SELECT SALARY
                       FROM EMPLOYEE
                       JOIN JOB USING (JOB_CODE)
                      WHERE JOB_NAME = '����');
                      
-- ALL
SELECT * FROM EMPLOYEE WHERE SALARY > ALL(2000000, 6000000); -- �ᱹ 600�������� ū �޿��� �ٵ�� ��� ��ȸ
-- SELECT * FROM EMPLOYEE WHERE SALARY > 200000 AND SALARY > 6000000;
SELECT * FROM EMPLOYEE WHERE SALARY < ALL(2000000, 6000000); -- �ᱹ 200�������� ���� �޿��� �޴� ��� ��ȸ
-- SELECT * FROM EMPLOYEE WHERE SALARY < 200000 AND SALARY < 6000000;
--SELECT * FROM EMPLOYEE WHERE SALARY = ALL(2000000, 6000000); -- 200�����̸鼭 600������ ���� ����


---------------------------------���߿� ���� ����-----------------------------------------
/*
    ���������� ������� 1�� N���� ���.
    
    * �񱳴�� �÷� ������, �������� ��� �÷� ���� �����ؾ� ��!
*/


-- ������ ����� ������ �μ��ڵ�, ������ �����ڵ忡 �ش��ϴ� ����� ��ȸ
SELECT DEPT_CODE, JOB_CODE
  FROM EMPLOYEE
 WHERE EMP_NAME = '������';
 
SELECT *
  FROM EMPLOYEE
 WHERE (DEPT_CODE, JOB_CODE) = (SELECT DEPT_CODE, JOB_CODE
          FROM EMPLOYEE
         WHERE EMP_NAME = '������');
         
         
         
         
-- �ڳ��� ����� ������ �����ڵ�, �Ŵ��� ������ ������ �ִ� �������
SELECT *
  FROM EMPLOYEE
 WHERE (JOB_CODE, MANAGER_ID) IN (SELECT JOB_CODE, MANAGER_ID
                                    FROM EMPLOYEE
                                   WHERE EMP_NAME = '�ڳ���'); 
                                   
----------------------------------������ ���߿� ��������----------------------------------------
/*
    ���������� ������� N�� N���� ��
*/

-- �� ���޺� �ּ� �޿��� �޴� ��� ���� ��ȸ

SELECT *
  FROM EMPLOYEE -- �������̹Ƿ� = ���� �Ұ�.
 WHERE (JOB_CODE, SALARY) = (SELECT JOB_CODE, MIN(SALARY)
                               FROM EMPLOYEE
                              GROUP BY JOB_CODE);
                              
                              
-----------------------��� ��������----------------------------------
/*
    ��ȣ���� ��������
    - ���������� ���������� ���� �����Ǿ� �ִ� ����.
    - ���� ���� ���� ��, ���� ������ �����͸� ������ �����ϴ� ����.
*/


-- �����ڰ� �ִ� ������� ���� ��ȸ
SELECT *
  FROM EMPLOYEE E
 WHERE EXISTS 
 (SELECT 1 FROM EMPLOYEE M WHERE E.MANAGER_ID = M.EMP_ID);
-- ���������� ����� ��, ���� ������ �� �����͸� �����ϰ� ����. E.MANAGER_ID = M.EMP_ID
-- SELECT 1�� �ۼ� ������ ������, ���� ������ ���������� ��� "��"�� ���� ó���ϴ°� �ƴ� ��ġ�ϴ� ���� �����ϴ����� �Ǵ��ϱ� �����̴�.
-- E.MANAGER_ID 1����, M.EMP_ID 23�� ��� �� ���� ����.


-- �μ��� �ѹ����� ������� ����
SELECT *
  FROM EMPLOYEE E
WHERE EXISTS (SELECT 1 FROM DEPARTMENT WHERE DEPT_TITLE = '�ѹ���' AND E.DEPT_CODE = DEPT_ID);

----------------------------------- ��Į�� ��������-------------------------------
/*
    ���ϰ��� ��ȯ�ϴ� ��Į�� ��������
*/

---------------------------- ���������� ��ġ -------------------------------------

-- �����ȣ, �����, �Ŵ��� �����ȣ, �Ŵ��� �̸�
SELECT EMP_ID, EMP_NAME, MANAGER_ID,
        NVL((SELECT EMP_NAME FROM EMPLOYEE M WHERE E.MANAGER_ID = M.EMP_ID), '�����ھ���') AS MANAGER_NAME
  FROM EMPLOYEE E;
  
  
-- ������� ������ ��ȸ. ��, �μ���Ī �������� ����
SELECT *
  FROM EMPLOYEE
 ORDER BY (SELECT DEPT_TITLE 
             FROM DEPARTMENT
             WHERE DEPT_CODE = DEPT_ID);
 
 -- ������ 3õ���� �̻��� ���
 SELECT *
   FROM EMPLOYEE
   WHERE SALARY * 12 >= 30000000;
 
 -- FROM���� ����� �������� == �ζ��� ��(�ӽ����̺�)
 -- �ܺ� SQL ���� �� ������
 SELECT *
   FROM ( SELECT *
          FROM EMPLOYEE
          WHERE SALARY * 12 >= 30000000);
 
 SELECT EMP_NAME,
        CASE WHEN ���� >= 30000000 THEN '���'
             WHEN ���� >= 20000000 THEN '�߱�'
             WHEN ���� >= 10000000 THEN '�ʱ�'
        END ���
        -- , EMAIL --  ���� ������ ����� EMAIL�̶�� �÷��� �������� ����.
  FROM (SELECT EMP_NAME,
               SALARY * 12 ����
          FROM EMPLOYEE);
          
 -- �μ��ڵ尡 D9�� ����� ��ȸ
 
 SELECT *
   FROM (
        SELECT * FROM EMPLOYEE WHERE DEPT_CODE = 'D9'
        );
        

        
-- �ζ��� ��(FROM���� ��������)�� ���Ǵ� �κ� : TOP-N �м�
-- TOP-N : �÷��� ���߿��� ���� ū �� �������� ��� �����͸� ������ ��


-- �� ���� �߿� �޿��� ���� ���� ���� 5���� ��� ���� ��ȸ
SELECT ROWNUM, EMP_ID, EMP_NAME, SALARY
  FROM EMPLOYEE
ORDER BY SALARY DESC; -- ���࿡ ROWNUM�� �ٰ��� �޿������� �������ϴ� ROWNUM�� ���δ�.

SELECT ROWNUM, E.* 
  FROM
       (
       SELECT EMP_ID, EMP_NAME, SALARY
       FROM EMPLOYEE
       WHERE ROWNUM <= 5
       ORDER BY SALARY DESC
       ) E;
       
SELECT ROWNUM, E.* -- ����ڰ� ���ϴ� ��� ���� �۾� ����, ROWNUM�� ���δ�
  FROM
       (
       SELECT EMP_ID, EMP_NAME, SALARY
       FROM EMPLOYEE
       ORDER BY SALARY DESC
       ) E
  WHERE ROWNUM <= 5;
  
-- �޿� 6�� 10������ ��ȸ
SELECT ROWNUM, E.*
  FROM
       (
       SELECT EMP_ID, EMP_NAME, SALARY
       FROM EMPLOYEE
       ORDER BY SALARY DESC
       ) E
  WHERE ROWNUM >= 6 AND ROWNUM <= 10;
-- ����(�ζ��� ��) SQL �����, SELECT �� �� ROWNUM�� ���� ������ �ϳ��� �����Ͽ� ä���Ѵ�.
-- ù�� ° (������) ���� ROWNUM�� 1��. �׸��� WHERE ���ǽİ� �� ==> ��� X
-- �ι� ° (������) ���� ROWNUM�� ?? ù�� ° (������)�� ��ȸ���� �ʾ����Ƿ�, �ι� ° (���߱�) ���� ROWNUM�� 1��
-- ���� °, �׹� °.... ��� ������ ���� ��ȸ���� �ʾ����Ƿ� ROWNUM�� �׻� 1��. ��, �׻� WHERE ���ǽĿ� ��ġ���� ����.
        
 SELECT ROWNUM, E.*
  FROM
       (
       SELECT EMP_ID, EMP_NAME, SALARY
       FROM EMPLOYEE
       ORDER BY SALARY DESC
       ) E
  WHERE ROWNUM >= 6 AND ROWNUM <= 10;       

-- ROWNUM���� ä���� �� ��ȣ�� �� �ึ�� ������Ų ����, WHERE�� ���� ������ ���� �� 
SELECT E.*
  FROM
       (
       SELECT ROWNUM RNUM, E.*
       FROM
            (
             SELECT EMP_ID, EMP_NAME, SALARY
                FROM EMPLOYEE
             ORDER BY SALARY DESC
       ) E
    )E
WHERE RNUM >= 6 AND RNUM <= 10;

-- �� �μ��� ��ձ޿��� ���� 3�� �μ� ��ȸ
SELECT ROWNUM, E.*
  FROM 
        (
        SELECT DEPT_CODE, AVG(SALARY)
        FROM EMPLOYEE
        GROUP BY DEPT_CODE
        ORDER BY 2 DESC
        )E
WHERE ROWNUM <= 3;


-------------------------------------------------------------------
/*
    WINDOW �Լ� (���� �ű�� �Լ�)
    
    - RANK() OVER(���ı���) : ������ ���� ���� ��, ������ ������ �� ������ŭ �ǳʶٰ� ������ ���.
                      EX) ���� 1���� 2���̸� ==> 1 1 3
    - DENSE_RANK() OVER(���ı���) : ������ ������ �ִٰ� �ϴ���, �� ���� ������ ������ 1�� �����Ͽ� ���.
                      EX) ���� 1���� 2���̸� ==> 1 1 2
    - SELECT�������� ����� ������ �Լ�.
*/

-- �޿��� ���� ������� ���� ��ȸ
SELECT EMP_NAME, SALARY,
       RANK() OVER(ORDER BY SALARY DESC) AS ���� -- 19���� 2��! �� ���� ������ 21��
  FROM EMPLOYEE;
  
SELECT EMP_NAME, SALARY,
       DENSE_RANK() OVER(ORDER BY SALARY DESC) AS ����  -- 19�� �� 2��! �� ���� ������ 20��
  FROM EMPLOYEE;
  
-- �޿� 1 ~ 5 �������� ��ȸ
SELECT *
  FROM
    (
    SELECT EMP_NAME, SALARY,
           RANK() OVER(ORDER BY SALARY DESC) AS ����
      FROM EMPLOYEE
      -- WHERE RANK() OVER(ORDER BY SALARY DESC) <= 5; -- WHERE���� WINDOW �Լ� �Ұ�
      -- WHERE ���� < = 5; -- WHERE���� SELECT���� �ʰ� ����ǹǷ�, ��Ī ��� �Ұ�
    )
 WHERE ���� < = 5; -- �ζ��� �� ��� ��, ���� �����͸� ���̺�ó�� ����ϹǷ�, ��Ī�� WHERE���� ��� ����.
