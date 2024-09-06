/*
    ���Ǿ�(SYNONYM) : A ������, B ������ ���̺��� ��ȸ�� �� ���Ǿ ����Ͽ� ������ ��Ī���� ��ȸ �����ϰ� �ϴ� ��.
    
    * ��Ī�� ���̰� �� ���̺� ���� SQL ���� ��, ���Ǿ�� ������ ������ ��Ī���� ��� ����.
    
    - ���� ����
        - �����ڰ� ������ ���Ǿ�
        - ��� USER�� ���Ǿ ����� �� ����.
    - ����� ���Ǿ�
        - Ư�� USER�� ������ ���Ǿ�
        - USER�� ���� ������ �ο��� Ÿ USER�� ����� ����.    
*/

--------------------------------------------------------------------------------
/*
    ���� ���Ǿ�
*/

-- ADMIN �������� ���Ǿ� ���� ���� �ο�
GRANT CREATE SYNONYM TO KH;

-- ADMIN �������� ���� ���Ǿ� ����! (���� ���Ǿ� ������ PUBLIC�� �ٿ��ش�)
CREATE PUBLIC SYNONYM DEPT FOR KH.DEPARTMENT;

-- ADMIN �������� ���� ���Ǿ ����� �׽�Ʈ ���� ����
CREATE USER SYNONYM_TEST IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE TO SYNONYM_TEST;
-- �׽�Ʈ ������, KH�� DEPARTMENT ���̺��� ��ȸ�� �� �ִ� ���� �ο�
GRANT SELECT ON KH.DEPARTMENT TO SYNONYM_TEST;

-- SYNONYM_TEST �������� �����Ͽ� �Ʒ� SQL ����
SELECT * FROM KH.DEPARTMENT;
SELECT * FROM DEPT;


--------------------------------------------------------------------------------

/*
    ����� ���Ǿ�
    
    Ư�� USER�� ������ ���Ǿ�
*/
-- ADMIN �������� ���Ǿ� ���� ���� �ο�
GRANT CREATE SYNONYM TO KH;

-- KH �������� ���Ǿ� ����!
CREATE SYNONYM EMPSYNO FOR EMPLOYEE;

-- Ÿ �������� KH EMPLOYEE�� ���� ���Ǿ� ���� ��, SELECT ������ �ο��ؾ� ��
-- ��, ���� ���Ǿ� �ۼ� �� �̹� ������ �ο� ����! DEPARTMENT����...
GRANT SELECT ON KH.EMPLOYEE TO SYNONYM_TEST;

SELECT * FROM KH.EMPLOYEE;
SELECT * FROM KH.EMPSYNO; -- ����� ���Ǿ�� �տ� USER ��Ī�� �ۼ����־�� ��.

