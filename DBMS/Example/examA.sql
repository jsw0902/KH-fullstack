SELECT * FROM TB_DEPARTMENT;
SELECT * FROM tb_student;
SELECT * FROM tb_professor;
SELECT * FROM tb_class;
-- 1. �� ������б��� �а� �̸��� �迭�� ǥ���Ͻÿ� ��, ��� ����� "�а� ��", "�迭"���� ǥ��
SELECT department_name "�а� ��", category �迭 FROM TB_DEPARTMENT;

-- 2. �а��� �а� ������ ������ ���� ���·� ȭ�鿡 ����Ѵ�.
SELECT department_name || '�� ������' || CAPACITY || '�� �Դϴ�. 'AS "�а��� ����" FROM tb_department;


--3. ���������� ���� ���� ��� ��ü�� ���� ã�� �̸��� �Խ��ϰ��� �Ѵ�. �� ����ڵ��� �й��� ������ ���� �� ����ڵ��� ã�� ������ SQL ������ �ۼ��Ͻÿ�.
-- ��ü�� �й� : A513079, A513090, A513091, A513110, A513119
SELECT STUDENT_NAME FROM TB_STUDENT WHERE student_no IN ('A513079','A513090','A513091','A513110','A513119')ORDER BY student_name DESC;


-- 4. ���������� 20�� �̻� 30�� ������ �а����� �а� �̸��� �迭�� ����Ͻÿ�.
SELECT department_name, category FROM TB_DEPARTMENT WHERE capacity BETWEEN 20 AND 30;

-- 5. �� ������б��� ������ �����ϰ� ��� �������� �Ҽ� �а��� ������ �ִ�. �׷� �� ������б� ������ �̸��� �˾Ƴ� �� �ִ� SQL ������ �ۼ��Ͻÿ�.
SELECT professor_name FROM TB_PROFESSOR WHERE department_no IS NULL ;

-- 6. ������û�� �Ϸ��� �Ѵ�. �������� ���θ� Ȯ���ؾ� �ϴµ�, ���������� �����ϴ� ������� ��������� �����ȣ�� ��ȸ�غ��ÿ�
SELECT CLASS_NO FROM tb_class WHERE preattending_class_no IS NOT NULL;

-- 7. �� ���п��� � �迭(CATEGORY)���� �ִ��� ��ȸ�غ��ÿ�.
SELECT DISTINCT CATEGORY FROM tb_department ORDER BY 1;