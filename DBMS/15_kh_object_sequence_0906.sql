/*
    ������(SEQUENCE)
    
    - �ڵ����� ���ӵ� ���ڸ� �߻������ִ� ��ü
    - �������� ���������� ������Ű�� �߻���Ŵ.
    
    [ǥ����]
    
    CREATE SEQUENCE ��������
    [START WITH ���ۼ���]       -- ó�� �߻��� ����  (�⺻�� 1)
    [INCREMENT BY ��������]     -- � ������ų���� (�⺻��1)
    [MAXVALUE �ִ밪]           -- �ִ밪 ���� (�⺻�� ��û ũ��)
    [MINVALUE �ּҰ�]           -- �ּҰ� ���� (�⺻�� 1)
    [CYCLE | NOCYCLE]          -- �� ��ȯ ���� (CYCLE�� ������ ��� �ִ밪 ����, ��ȯ)
    [NOCACHE | CACHE]          -- ĳ�� �޸� �Ҵ�. (ĳ�� : �߻��� ���ڸ� �̸� �����س��� ����)
*/

CREATE SEQUENCE SEQ_EMPNO; -- �ƹ� �ɼ��� �������� �ʾƵ� ���� ����
DROP SEQUENCE SEQ_EMPNO;


CREATE SEQUENCE SEQ_EMPNO
START WITH 3        -- ó�� ���۰�
INCREMENT BY 1      -- ������
MAXVALUE 10         -- �ִ밪
MINVALUE 1          -- �ּҰ�
NOCYCLE;             -- ��ȯ���� ����!

SELECT SEQ_EMPNO.CURRVAL FROM DUAL;     -- ���� : ó�� �ѹ��� NEXTVAL�� ���� ���� ���� ���Ѿ� ��.
SELECT SEQ_EMPNO.NEXTVAL FROM DUAL;     -- NEXTVAL : ���� ��
SELECT SEQ_EMPNO.CURRVAL FROM DUAL;     -- CURRVAL : ���� �� (�������� ���������� ����� NEXTVAL�� ��)

-- MAXVALUE���� NEXTVAL ����!
SELECT SEQ_EMPNO.NEXTVAL FROM DUAL;   
SELECT SEQ_EMPNO.CURRVAL FROM DUAL; -- 10 == MAXVALUE
SELECT SEQ_EMPNO.NEXTVAL FROM DUAL; -- �ִ밪 ���� ��, �������� �ɼ��� NOCYCLE�̱� ������ ���� �߻�!


DROP SEQUENCE SEQ_EMPNO;

CREATE SEQUENCE SEQ_EMPNO
START WITH 3        -- ó�� ���۰�
INCREMENT BY 1      -- ������
MAXVALUE 10         -- �ִ밪
MINVALUE 1          -- �ּҰ�
CYCLE               -- �� ��ȯ
NOCACHE;             

SELECT SEQ_EMPNO.CURRVAL FROM DUAL;
SELECT SEQ_EMPNO.NEXTVAL FROM DUAL; -- MAXVALUE���� ���� ��, CYCLE�� �����Ǿ� ���� �ʱ�ȭ�ȴ�.
-- ��, ��ȯ�Ǿ��� �� ó�� ���� MINVALUE!!




--------------------------------------------------------------------------------
/*
    ���̺�� �������� �������� ����
*/

CREATE TABLE EMP_COPY2
AS
SELECT EMP_ID, EMP_NAME, PHONE
  FROM EMPLOYEE
 WHERE 1=0;

CREATE SEQUENCE SEQ_EMPNO
START WITH 1        -- ó�� ���۰�
INCREMENT BY 1      -- ������
MAXVALUE 10         -- �ִ밪
MINVALUE 1          -- �ּҰ�
CYCLE               -- �� ��ȯ
NOCACHE; 

SELECT *
  FROM EMP_COPY2;

  
INSERT INTO EMP_COPY2 VALUES (SEQ_EMPNO.NEXTVAL, '��¿�', '01012345678'); -- EMP_ID == 1
SELECT SEQ_EMPNO.CURRVAL FROM DUAL; -- ���� INSERT�� ���������� ����Ǿ�, ������ NEXTVAL�� 1�� ���


INSERT INTO EMP_COPY2 VALUES (SEQ_EMPNO.NEXTVAL, 'ī����', '01012345678', 1234);
SELECT SEQ_EMPNO.CURRVAL FROM DUAL; -- ���� INSERT���� �÷� ���� ������ �߻��Ͽ�, ������ NEXTVAL�� 1�� ���


INSERT INTO EMP_COPY2 VALUES (SEQ_EMPNO.NEXTVAL, '����', '010654654654654');
SELECT SEQ_EMPNO.CURRVAL FROM DUAL; -- �÷��� ���� �� ��, ���� ���� ���������� �˻�(����, �ڷ���)�ϱ� ������ NEXTVAL�� ����Ǿ���.



/*
    1���� 9999���� 1�� �����ϴ� ������.
    CYCLE�� ������ ���.
*/
SELECT TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(SEQ_EMPNO.NEXTVAL, 4, '0') FROM DUAL; -- �Ϸ翡 9999�� ��� ����
SELECT TO_CHAR(SYSDATE, 'YYMMDDHH') || LPAD(SEQ_EMPNO.NEXTVAL, 4, '0') FROM DUAL; -- 1�ð��� 9999�� ��� ����
SELECT TO_CHAR(SYSDATE, 'YYMMDDHH24MI') || LPAD(SEQ_EMPNO.NEXTVAL, 4, '0') FROM DUAL; -- 1�п� 9999�� ��� ����


