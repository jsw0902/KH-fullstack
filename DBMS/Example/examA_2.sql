SELECT * FROM tb_department;
SELECT * FROM tb_student;
SELECT * FROM tb_PROFESSOR;
-- 1. ������а�(�а��ڵ� 002) �л����� �й�, ���̸�, ���г⵵�� ���г⵵�� ���� ������ ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�
SELECT STUDENT_NO �й� , STUDENT_NAME �̸�, TO_CHAR(ENTRANCE_DATE, 'yyyy-MM-DD') AS ���г⵵ FROM tb_student 
WHERE DEPARTMENT_NO IN(002) ORDER BY ENTRANCE_DATE;

-- 2. �� ������б��� ���� �� �̸��� �� ���ڰ� �ƴ� ������ �� �� �ִٰ� �Ѵ�. �� ������ �̸��� �ֹι�ȣ�� ȭ�鿡 ����ϴ� SQL ������ �ۼ��Ͻÿ�.
SELECT PROFESSOR_NAME, PROFESSOR_SSN FROM tb_professor WHERE LENGTH (PROFESSOR_NAME) != 3;  
SELECT SYSDATE FROM DUAL;
/*
    3. �� ������б��� ���� �������� �̸��� ���̸� ����ϴ� SQL������ �ۼ��Ͻÿ�.
    �� �̶� ���̰� ���� ������� ���� ��� ������ ȭ�鿡 ��µǵ��� ����ÿ�
    (��, ���� �� 2000�� ���� ����ڴ� ������, ���̴� �����̰� �ƴ� �Ϲ� ���̷� ����Ѵ�.)
*/

-- 4.