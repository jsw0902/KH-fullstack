/*
    INDEX : DBMS���� ������ ���� ������ ���̱� ���ؼ�, Ư�� �÷��� �����ϴ� ��ü
    
    
    Ư¡)
    
    - DML(INSERT, UPDATE, DELETE)�� ���� ����Ǵ� �÷��� ���ؼ�, INDEX ���� �� ���� ���ϰ� �߻��� �� ����.
    - �Ϲ������� SELECT SQL�� ���� ������ ���̱� ���ؼ� ���Ǵ� ��ü.
    
    - PRIMARY KEY �÷��� ���ؼ� �����ϰų�, WHERE ���ǽĿ� ���� ���Ǵ� �÷��� ���ؼ� �Ϲ������� �����Ѵ�.
    
    [ǥ����]
    
    CREATE INDEX �ε����� ON ���̺��(�÷���);    
*/

-- EMPLOYEE ���̺��� EMP_NAME �÷��� INDEX ����
CREATE INDEX IDX_NAME ON EMPLOYEE(EMP_NAME);




-- EXAMA �������� �����Ͽ�, index ���� �� ���� �ӵ� ��� �׽�Ʈ!


SELECT STUDENT_NO,
       STUDENT_NAME,
       DEPARTMENT_NAME,
       STUDENT_SSN,
       STUDENT_ADDRESS,
       ENTRANCE_DATE,
       PROFESSOR_NAME,
       ROUND((SELECT AVG(POINT) FROM TB_GRADE G WHERE G.STUDENT_NO = S.STUDENT_NO), 1) AS POINT_AVG
  FROM TB_STUDENT S
  LEFT JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
  LEFT JOIN TB_PROFESSOR ON (COACH_PROFESSOR_NO = PROFESSOR_NO);

-- �ε��� �� ������ : 0.011
CREATE INDEX IDX_GRADE_STD_NO ON TB_GRADE(STUDENT_NO);
-- �ε��� ���� �� : 0.002

-- �ε��� ����
DROP INDEX IDX_GRADE_STD_NO;

