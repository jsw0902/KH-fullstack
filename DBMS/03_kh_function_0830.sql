/*
  �Լ�(FUNCTION)
  - �ڹٿ��� ó�� �ϳ��� ����� ����ϴ� ��
  - ���޵� �÷����鿡 ���� ������� ��ȯ
  
  * �Լ��� ����
  - ������ �Լ� : N���� ���� ���޹ް�, N���� ������� ��ȯ(��� �࿡ �ݺ������� ����)
  - �׷� �Լ� : N���� ���� ���޹ް�, 1���� ������� ��ȯ(�׷��� ���� �׷캰�� ���� ����� ��ȯ)
*/
/*

    < ���� ó�� �Լ� >
    
    -LENCTH /LENGTHB
    
    LENGTH(�÷� | '���ڿ�') : �ش� ���ڿ��� ���� �� ��ȯ
    LENGTHB(�÷� | '���ڿ�') : �ش� ���ڿ��� ����Ʈ �� ��ȯ
    
*/

SELECT SYSDATE FROM DUAL;
SELECT 'A' FROM DUAL;
SELECT 84398493 FROM DUAL;

SELECT 'ABCDE', LENGTH('ABCDE') FROM DUAL;
SELECT 'ABCDE', LENGTHB('ABCDE') FROM DUAL;
SELECT '&*^%!%&@', LENGTH('&*^%!%&@') FROM DUAL;
SELECT '&*^%!%&@', LENGTHB('&*^%!%&@') FROM DUAL;

SELECT '����Ŭ', LENGTH('����Ŭ') FROM DUAL;
SELECT '����Ŭ', LENGTHB('����Ŭ') FROM DUAL;

SELECT EMP_NAME, LENGTH(EMP_NAME), LENGTHB(EMP_NAME), EMAIL, LENGTH(EMAIL), LENGTHB(EMAIL),
BONUS, LENGTH(BONUS), LENGTHB(BONUS)
FROM EMPLOYEE WHERE SALARY>2000000;

/*
    - INSTR : ���ڿ��κ��� Ư�� ������ ��ġ�� ã�Ƽ� ��ȯ.
    
    []�� ���� ����.
    
    INSTR(�÷� | '���ڿ�', 'ã���� �ϴ� ����', ['ã����ġ�� ���۰�'], [����])
    
    ã�� ��ġ�� ���� ��
    1 : �տ������� Ž��
    -1 : �ڿ������� Ž��
*/

SELECT ('AABAACAABBAA') FROM DUAL;

-- ù�� °, ���ް����� �ι�° ���ް��� ��ġ�� Ž��, ��ȯ ����� 1����
SELECT INSTR('AABAACAABBAA', 'B') FROM DUAL;
SELECT INSTR('AABAACAABBAA', 'B', 1) FROM DUAL;

-- B ���ڸ� Ž���ϴµ�, ���� �ε����� ���� 4.
-- Ž�� ����� ���� ù��° �ε������� ī����
SELECT INSTR('AABAACAABBAA', 'B', 4) FROM DUAL;

-- B ���� Ž���ϴµ� ���� ù��°���� Ž��
-- Ž�� ����� ���� ù��° �ε������� ī����
SELECT INSTR('AABAACAABBAA', 'B', -1) FROM DUAL;

-- Ž�� ����� ���� ù��° �ε������� ī����
-- �ι�° 'B'�� Ž��.
-- Ž�� ����� ���� ù��° �ε������� ī����
SELECT INSTR('AABAACAABBAA', 'B', 1, 2) FROM DUAL;

-- Ž�� ����� ���� ù��° �ε������� ī����
-- �ι�° 'B'�� Ž��.
-- Ž�� ����� ���� ù��° �ε������� ī����
SELECT INSTR('AABAACAABBAA', 'B', -1, 3) FROM DUAL;

-- EMPLOYEE ���̺���, EMAIL�� _ ��ġ��, @ ��ġ ��ȸ
SELECT EMAIL, INSTR(EMAIL , '_', 1, 1), INSTR(EMAIL, '@') FROM EMPLOYEE;

/*
    SUBSTR : ���ڿ����� Ư�� ���ڿ��� �����ؼ� ��ȯ(JAVA�� substring�� ����)
    
    SUBSTR(STRING, POSITION, [LENGTH])
    - STRING : ����Ÿ���÷� �Ǵ� ���ڿ�
    - POSITION : ���ڿ��� ������ ���� ��ġ ��.
    - LENGTH : ������ ������ ���� (���� ����, ���� ��, ������)
    
*/

SELECT 'SHOWMETHEMONEY' FROM DUAL;

-- 'SHOWMETHEMONEY'�� 7��°���� ������(������ ���� �� ���� ��)
SELECT SUBSTR('SHOWMETHEMONEY', 7) FROM DUAL;

-- 'SHOWMETHEMONEY'�� 5��°���� 2���ڱ��� 
SELECT SUBSTR('SHOWMETHEMONEY', 5, 2) FROM DUAL;

-- 'SHOWMETHEMONEY'�� 1��°���� 6���ڱ���
SELECT SUBSTR('SHOWMETHEMONEY', 5, 2) FROM DUAL;

-- 'SHOWMETHEMONEY'�� 1��°���� 6���ڱ���
SELECT SUBSTR('SHOWMETHEMONEY', -8, 3) FROM DUAL;

SELECT EMP_NAME, EMP_NO, SUBSTR(EMP_NO, 8, 1) AS "����" FROM EMPLOYEE;

-- ���� ����� ���
SELECT EMP_NAME, EMP_NO FROM EMPLOYEE WHERE SUBSTR(EMP_NO, 9,1) IN ('2', '4');

--���� ���
SELECT EMP_NAME, EMP_NO FROM EMPLOYEE WHERE SUBSTR(EMP_NO, 9,1) IN ('1', '3');

-- �̸����� ID �� ��ȸ. @ ������ �� == ID
SELECT EMAIL, SUBSTR(EMAIL, 1, INSTR(EMAIL, '@')-1) AS "ID��" FROM EMPLOYEE;

/*
    LPAD / RPAD
    - ���ڿ� ��ȸ ��, ������ ���ϰ��� ���� �ϱ� ���� ���.
    
    LPAD/RPAD (��� ���ڿ�, ���� ��ȯ ���ڿ��� ����, [���� ���� �Ӥ� ����� ����])    
*/
-- �� �ึ�� ���̰� �ٸ� �̸��� ��ȸ ��, 20���ڷ� ����, ���� ���� �� ���ʿ� ������ ���̸�ŭ # ��� 
SELECT EMAIL, LPAD(EMAIL, 20, '#') LPAD_EMAIL FROM EMPLOYEE;

-- �� �ึ�� ���̰� �ٸ� �̸��� ��ȸ ��, 20���ڷ� ����, ���� ���� �� ���ʿ� ������ ���̸�ŭ # ��� 
SELECT EMAIL, RPAD(EMAIL, 20, '#') RPAD_EMAIL FROM EMPLOYEE;

-- 3��° ���ް� �� �ۼ� ��, �������� ó�� ��.
SELECT EMAIL, LPAD(EMAIL, 20) LPAD_EMAIL FROM EMPLOYEE;

-- ������ ���ڿ��� ���̺���, ������ ���̰� �� ���� ���, ������ �κ��� �ڸ�
SELECT EMAIL, LPAD(EMAIL, 5, '#') LPAD_MEAIL FROM EMPLOYEE;


SELECT RPAD('631156-1', 14, '*') FROM DUAL;

SELECT EMP_NO, RPAD(SUBSTR(EMP_NO, 1, 8), 14, '*') EMP_NO_2 FROM EMPLOYEE;

/*
    LTRIM / RTRIM
    - ���ڿ��� Ư�� ���ڸ� ������ ������ ���ڿ��� ��ȯ
    
    LTRIM / RTRIM (STRING, ['�����ҹ��ڵ�']) => ���� �� ������ ����
*/

SELECT '    K   H   ' FROM DUAL;

-- ���ʿ��� ���������� ������ ����. ������ �ƴ� ���� Ž�� �� ����.
SELECT LTRIM('    K   H   ') FROM DUAL;
-- �����ʿ��� ���������� ������ ����. ������ �ƴ� ���� Ž�� �� ����.
SELECT RTRIM('    K   H   ') FROM DUAL;

SELECT LTRIM('0001230000543252', '0') FROM DUAL;
SELECT RTRIM('0001230000543252', '0') FROM DUAL;

-- ���������� Ž���ϴ� ���ڰ�, �ι�° ���ް��� ���ԵǸ� ����.
SELECT LTRIM('123321456', '123') FROM DUAL;
SELECT LTRIM('123123KH123123', '123') FROM DUAL;

/*
    TRIM
    - ���ڿ��� ��/��/���ʿ� �ִ� ������ ���ڵ��� ������ ������ ���ڿ��� ��ȯ
    
    TRIM(([ LEADING | TRALLING | BOTH ] �����ϰ����ϴ� ���ڵ� FROM) STRING)
    
    LEADING : ���ʺ��� (LTRIM�� ����)
    TRALLING : �����ʺ��� (RTRIM�� ����)
    BOTH : ���ʿ������� (���� ��, �⺻��)
*/

-- �⺻���� BOTH�̹Ƿ�, ���ʿ��� ���� ����
SELECT TRIM('   K   H   ') FROM DUAL;

-- 'ZZZZKHZZZZ'���� 'Z'�� ����. �⺻���� BOTH�̹Ƿ�, ���ʿ�������.
SELECT TRIM('Z' FROM 'ZZZZKHZZZZ') FROM DUAL;

-- '11132KH12322' ���� '1'�� ����. �⺻���� BOTH�̹Ƿ�, ���ʿ�������
SELECT TRIM('1' FROM '11132KH12322') FROM DUAL;

-- ���� ���ڴ� 1����
--SELECT TRIM('123' FROM '11132KG12322') FROM DUAL;

-- ������ ���� ����
SELECT TRIM(LEADING 'Z' FROM 'ZZZZKHZZZZ') FROM DUAL; -- LTRIM�� ����. ���ʿ������� ����
SELECT TRIM(LEADING 'Z' FROM 'ZZZZKHZZZZ') FROM DUAL; -- RTRIM�� ����, �����ʿ������� ����.
SELECT TRIM(BOTH 'Z' FROM 'ZZZZKHZZZZ') FROM DUAL; -- ���ʿ������� Z ����.

/*
    LOWER / UPPER / INITCAP
    
    LOWER : ��� ���� �ҹ��ڷ� ��ȯ (JAVA�� toLowerCase()�� ����)
    UPPER : ��� ���� �ҹ��ڷ� ��ȯ (JAVA�� toUpperCase()�� ����)
    INITCAP : ��� �ܾ��� ù ���ڸ� �빮�ڷ� ��ȯ
*/

SELECT LOWER('Welcome To Korea') FROM DUAL;
SELECT LOWER('dsdskdsdksjDSADKDADS') FROM DUAL;

SELECT UPPER('Welcome To Korea') FROM DUAL;
SELECT UPPER('dsdskdsdksjDSADKDADS') FROM DUAL;

-- ���� �������� ���� �տ� ���� �빮�ڷ� ��ȯ
SELECT INITCAP('welcome to korea') FROM DUAL;


/*
    CONCAT
    2���� ���ڿ� ���� �޾�, �ϳ��� ������ �� ����� ��ȯ
    
    CONCAT(STRING1, STRING2)
*/

SELECT CONCAT('HELLO', 'WORLD') FROM DUAL;
--SELECT CONCAT('HELO', 'WORLD', '!!!') FROM DUAL; -- ���ް��� 2��!!!

SELECT CONCAT(CONCAT('HELLO', 'WORLD'), '!!!') FROM DUAL;


/*
    REPLACE
    - ���ڿ��� ��ü���ִ� ���
    
    REPLACE(STRING, STR1, STR2)
*/

SELECT REPLACE('ABCDDESACVDAA', 'A', 'Z') FROM DUAL;
SELECT REPLACE('ABCDDESACVDAA', 'AB', 'Z') FROM DUAL;

SELECT EMAIL, REPLACE(EMAIL, 'kh.or.kr', 'naver.com') FROM EMPLOYEE;

SELECT EMAIL, REPLACE(EMAIL, SUBSTR(EMAIL,INSTR(EMAIL, '@')+1), 'naver.com') FROM EMPLOYEE;

/*
    ���� ó�� �Լ�
    
*/
/*
    ABS
    - ���޵� ������ ���밪�� �����ִ� �Լ� 
        - �ڹ��� Math.abs()�� ����
    ���밪 : 0���������� �Ÿ�
    
    ABS(NUMBER)
*/

SELECT ABS(5) FROM DUAL;
SELECT ABS(-5) FROM DUAL;
SELECT ABS(5.12) FROM DUAL;
SELECT ABS(-5.12) FROM DUAL;
SELECT ABS('432') FROM DUAL;

/*
    MOD
    - �� ���� ���� ������ ���� ��ȯ���ִ� �Լ�
    
    MOD(NUMBER1, NUMBER2)
    
*/

SELECT MOD(10, 3) FROM DUAL;

SELECT MOD(10.26, 3) FROM DUAL;

/*
    ROUND
    �ݿø��� ����� ��ȯ���ִ� �Լ�
*/

SELECT ROUND(123.456) FROM DUAL; -- �ι� ° �� �� �ۼ� ��, 0
SELECT ROUND(123.456, 1) FROM DUAL;
SELECT ROUND(123.456, 2) FROM DUAL;
SELECT ROUND(123.456, 3) FROM DUAL;

SELECT ROUND(123.456, 0) FROM DUAL;
SELECT ROUND(123.456, -1) FROM DUAL;
SELECT ROUND(123.456, -2) FROM DUAL;
SELECT ROUND(123.456, -3) FROM DUAL;

/*
    CEIL
    �Ҽ����� �ø�ó�� ���ִ� �Լ�
    
    
*/

SELECT CEIL(123.152) FROM DUAL;
SELECT CEIL(100.000001) FROM DUAL;

/*
    FLOOR
    �Ҽ��� �Ʒ� ���ڸ� ���� ó���ϴ� �Լ�
*/

SELECT FLOOR(123.000001) FROM DUAL;
SELECT FLOOR(123.99999999999) FROM DUAL;

/*
    TRUNC
    - �����ϴ��� �ǹ̸� ����
*/

SELECT TRUNC(123.456) FROM DUAL; --�ι� ° �Ű����� �� ���� ��, FLOOR�� ������ ���
SELECT TRUNC(123.456, 1) FROM DUAL; -- �Ҽ��� ù�� ° �ڸ� �� ������ �Ҽ��� ����
SELECT TRUNC(123.456, 2) FROM DUAL; -- �Ҽ��� �ι� ° �ڸ� �� ������ �Ҽ��� ����
SELECT TRUNC(123.456, -1) FROM DUAL; -- 1�� �ڸ� ���� ���� ��, 0���� ǥ��


/*
    <��¥ ó�� �Լ�>
*/

SELECT SYSDATE FROM DUAL;
/*
    MONTHS_BETWEEN (DATE1, DATE2)
    - �� ��¥ ������ ���� �� 
*/

-- EMPLOYEE ���̺���, �����, �Ի���, �ٹ��ϼ�, �ٹ����� �� 
SELECT EMP_NAME �����, HIRE_DATE �Ի�����, FLOOR(SYSDATE-HIRE_DATE) �ٹ��ϼ�, CEIL(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) �ٹ������� FROM EMPLOYEE;

/*
    ADD_MONTHS
    Ư�� DATE ����, ������ ���ڸ�ŭ �������� ���Ͽ� ��ȯ
    
*/

SELECT ADD_MONTHS(SYSDATE, 3) FROM DUAL;
SELECT ADD_MONTHS(SYSDATE, 6) FROM DUAL;
SELECT ADD_MONTHS(SYSDATE, -3) FROM DUAL;

-- �����Ⱓ�� 6�����̶�� �������� ��, �� ����� ������ �������ڸ� ��ȸ.
SELECT EMP_NAME, HIRE_DATE, ADD_MONTHS(HIRE_DATE, 6) AS "���� ����" FROM EMPLOYEE;

/*
    NEXT_DAY
    - Ư�� ��¥ ���Ŀ� ����� �ش� ������ ��¥�� ��ȯ���ִ� �Լ�
    
    NEXT_DAY(DATE, ����|����)
*/

SELECT NEXT_DAY(SYSDATE, '�Ͽ���') FROM DUAL;
SELECT NEXT_DAY(SYSDATE, '��') FROM DUAL;
SELECT NEXT_DAY(SYSDATE, '�ݿ���') FROM DUAL; -- ������ �ݿ����̸�, ���� �ݿ���
SELECT NEXT_DAY(SYSDATE, '��') FROM DUAL;
-- SELECT NEXT_DAY(SYSDATE, 'FRIDAY') FROM DUAL; -- �� �ѱ���� �����Ǿ� �־ ���� �߻�

SELECT NEXT_DAY(SYSDATE, 1) FROM DUAL; -- �Ͽ���
SELECT NEXT_DAY(SYSDATE, 2) FROM DUAL; -- ������
SELECT NEXT_DAY(SYSDATE, 3) FROM DUAL; -- ȭ����
SELECT NEXT_DAY(SYSDATE, 4) FROM DUAL; -- ������
SELECT NEXT_DAY(SYSDATE, 5) FROM DUAL; -- �����
SELECT NEXT_DAY(SYSDATE, 6) FROM DUAL; -- �ݿ���
SELECT NEXT_DAY(SYSDATE, 7) FROM DUAL; -- �����
-- SELECT NEXT_DAY(SYSDATE, 1) FROM DUAL; -- 1������ �Ͽ��Ϻ��� ~ ����ϱ����� �����մϴ�.

/*
    LAST_DAY
    - �ش���� ������ ��¥�� ��ȯ
    
*/

SELECT LAST_DAY(SYSDATE) FROM DUAL;
SELECT LAST_DAY(ADD_MONTHS(SYSDATE, 4)) FROM DUAL;

-- EMPLOYEE���� �����, �Ի���, �Ի��� ���� ������ ����, �Ի��Ѵ޿� �ٹ��� �ϼ�
SELECT EMP_NAME, HIRE_DATE, LAST_DAY(HIRE_DATE), LAST_DAY(HIRE_DATE)-HIRE_DATE FROM EMPLOYEE;

/*
    EXTRACT : Ư�� ��¥�κ��� �⵵|��|�� ���� �����ؼ� ��ȯ�ϴ� �Լ�
    
    EXTRACT(YEAR FROM DATE) : �⵵ ����
    EXTRACT(MONTH FROM DATE) : �� ����
    EXTRACT(DAY FROM DATE) : �� ����
*/

SELECT EMP_NAME, HIRE_DATE, EXTRACT(YEAR FROM HIRE_DATE) AS ����, EXTRACT(MONTH FROM HIRE_DATE) AS ��, EXTRACT(DAY FROM HIRE_DATE) AS ��
FROM EMPLOYEE;

/*
    ����ȯ �Լ�
    
    TO_CHAR : ���� �Ǵ� ��¥ Ÿ���� �����͸� ���� Ÿ������ ��ȯ���ִ� �Լ�
    
    TO_CHAR(����|��¥, [����])
*/

SELECT TO_CHAR(1234) FROM DUAL;
SELECT TO_CHAR(1234, '99999') FROM DUAL; -- 5ĭ �ڸ� Ȯ�� ��, ������ ����. ������ �������� ä��
SELECT TO_CHAR(1234, '99,999') FROM DUAL; -- 5ĭ �ڸ� Ȯ�� ��, ������ ����. ������ �������� ä�� (���� 99,999)
SELECT TO_CHAR(1234, '999') FROM DUAL; -- ������ �ڸ� ���� ���� �ڸ������ε�, ���� ���� õ�� �ڸ�
SELECT LTRIM(TO_CHAR(1234, '999,999,999')) FROM DUAL; -- ������ �������� ä�� �ڸ�����, LTRIM���� ����.
SELECT TO_CHAR(1234, 'L9999') FROM DUAL; -- ���� ������ ȭ�� ����.
SELECT TO_CHAR(1234, '$9999') FROM DUAL;

SELECT EMP_NAME, SALARY, TO_CHAR(SALARY, 'L999,999,999') FROM EMPLOYEE;

-- ��ũ��Ʈ�� ��µǴ� ǥ��� ����������, �ڷ����� �ٸ���.
SELECT TO_CHAR(SYSDATE), SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD/DAY') FROM DUAL;

-- AM : ����, PM : ����
SELECT TO_CHAR(SYSDATE, 'PM HH:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'AM HH:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD DAY DY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY"��"MM"��"DD"��"') FROM DUAL; -- ��,��,�� ���ڴ� �Լ� ���ο� �������� ���� �����̹Ƿ�, ""�� ǥ��

/*
    TO_DATE
    - ���� �Ǵ� ���� Ÿ���� �����͸� ��¥ ������ Ÿ������ ��ȯ���ִ� �Լ�
    
    TO_DATE(����|����, [����])
*/

SELECT TO_DATE(20100808) FROM DUAL;
SELECT TO_DATE(100808) FROM DUAL;
SELECT TO_DATE('070801') FROM DUAL; -- 0���� �����ϴ� ���, ''�� �����־����
SELECT TO_DATE('041030 143012') FROM DUAL; --  ���޵� ���ڿ��� ������ �� �� ���� => ����
SELECT TO_DATE('041030 143012', 'YYMMDD HH24MISS') FROM DUAL;

-- ���� ������ ������ ��ȯ��.
SELECT TO_DATE('140630', 'YYMMDD') FROM DUAL;
SELECT TO_DATE('980630', 'YYMMDD') FROM DUAL;

-- RR : 50�̸��� ���, ���缼��� ��ȯ. �ƴ� ��� ���� ����� ��ȯ
SELECT TO_DATE('140630', 'RRMMDD') FROM DUAL;
SELECT TO_DATE('980630', 'RRMMDD') FROM DUAL;

/*
    TO_NUMBER : ���� Ÿ���� �����͸� ���� Ÿ�� �����ͷ� ��ȯ
    
    TO_NUMBER(����, [����])
*/

SELECT '01234' FROM DUAL;
SELECT TO_NUMBER('01234') FROM DUAL;

SELECT TO_NUMBER('94823948239') FROM DUAL;
SELECT TO_NUMBER('123,456,789', '999,999,999') FROM DUAL; -- ù�� ° ���ް��� ������ �ι� ° ���ް����� �����ؾ���.


SELECT '50000' + '2000' FROM DUAL;
SELECT '50,000' + '2,000' FROM DUAL; -- ���� �߻�
SELECT TO_NUMBER('50,000', '99,999') + TO_NUMBER('2,000', '9,999') FROM DUAL;

-- �� ����� �����, �޿�, ���ʽ�, ���ʽ� ���� �� �޿�
SELECT EMP_NAME, SALARY, BONUS, SALARY + SALARY * BONUS FROM EMPLOYEE;

SELECT EMP_NAME, NVL(BONUS, 0) FROM EMPLOYEE;

SELECT EMP_NAME, SALARY, BONUS, SALARY + SALARY * NVL(BONUS,0) FROM EMPLOYEE;

-- NVL2 : ù�� ° ���ް��� NULL�� �ƴ� ���, �ι� ° ���ް� ����ϰ�, NULL�� ��� ���� ° ������ �� ���
SELECT EMP_NAME, BONUS,NVL2(BONUS, 1, 0) FROM EMPLOYEE;

/*
    ���� �Լ�
    
    DECODE
        DECODE(����÷���, �񱳰�1,�񱳰�1,�񱳰�2,�񱳰�2,......)
        
    CASE WHEN
*/

-- �� ����� ������ ���� '��', '��'�� ���
SELECT DECODE(SUBSTR(EMP_NO,8,1),'1','��','2','��','3','��','4','��')
FROM EMPLOYEE;

-- EMPLOYEE ���̺��� �� ���޺��� ������ �Ȼ�
/*
    J7�� �޿� 10% �λ�
    J6�� �޿� 15% �λ�
    J5�� �޿� 20% �λ�
    �� �ܴ� 5% �λ�
*/

SELECT EMP_NAME, JOB_CODE, DECODE(JOB_CODE, 'J7', SALARY*1.1, 
                                            'J6', SALARY*1.15,
                                            'J5', SALARY*1.2,
                                            SALARY*1.05) -- �� �� ���޿� ���� ó��
    AS "�λ�� �޿�" FROM EMPLOYEE;
/*
    ���� �Լ�
    CASE WHEN THEN
    
    CASE WHEN ���ǽ�1 THEN ���ǽ� 1�� ������ ��� 
         WHEN ���ǽ�2 THEN ���ǽ� 2�� ������ ���
         WHEN ���ǽ�3 THEN ���ǽ� 3�� ������ ���
         ELSE �� ��
    END
*/

SELECT CASE WHEN SUBSTR(EMP_NO, 8, 1) = '1' OR SUBSTR(EMP_NO, 8, 1) = '3' THEN '��'
            WHEN SUBSTR(EMP_NO, 8, 1) = '2' OR SUBSTR(EMP_NO, 8, 1) = '4' THEN '��'
            ELSE '����̾ƴմϴ�'
        END AS "����"
FROM EMPLOYEE;

SELECT CASE WHEN SUBSTR(EMP_NO, 8, 1) IN('1','3') THEN '��'
            WHEN SUBSTR(EMP_NO, 8, 1) IN('2','4') THEN '��'
            ELSE '����̾ƴմϴ�' -- �ʼ� �ƴ�.
        END AS "����"
FROM EMPLOYEE;

-----------------------------�׷� �Լ�-----------------------------
-- �׷� �Լ� : ���ް� N�� ������� 1��
/*
    SUM()
        - �հ踦 ���ϴ� �Լ�
        
    AVG()
        - ��հ��� ���ϴ� �Լ�
        
    COUNT()
        - ��ȸ�� ���� ������ ���ϴ� �Լ�
        
    MIN()
        - �ּҰ��� ���ϴ� �Լ�
        
    MAX()
        - �ִ밪�� ���ϴ� �Լ�
        
    MEDIAN()
        - �߰����� ���ϴ� �Լ�
*/

-- �� ������ �޿� �հ�
SELECT SUM(SALARY) FROM EMPLOYEE;

-- �� ������ �޿� ���
SELECT AVG(SALARY) FROM EMPLOYEE;

-- �� ���� ��
SELECT COUNT(*) FROM EMPLOYEE;

-- �ߺ��� �����ڵ带 ���� 1������ ǥ���ϰ�, ��� ���� ������ ��ȯ
SELECT COUNT(DISTINCT JOB_CODE) FROM employee;

-- �ߺ��� �����ϰ�, ��ȿ�� ���� ������ ��ȯ(NULL ����)
SELECT COUNT(DISTINCT DEPT_CODE) FROM employee;

-- ���� ������� ���� �� �հ�
SELECT SUM(SALARY)*12 FROM EMPLOYEE WHERE SUBSTR(EMP_NO, 8, 1 ) IN ('1', '3');

-- ���� �޿��� ���� �޴� ����� �޿�
SELECT MIN(SALARY) FROM EMPLOYEE;
SELECT MIN(HIRE_DATE) FROM EMPLOYEE; -- �Ի����� ���� ���� ����� �Ի���

-- ���� �޿��� ���� �޴�  ��� �޿�
SELECT MAX(SALARY) FROM EMPLOYEE;
SELECT MAX(HIRE_DATE) FROM EMPLOYEE; -- �Ի����� ���� ���� ����� �Ի��� 

SELECT MEDIAN(SALARY) FROM EMPLOYEE;
SELECT MEDIAN(HIRE_DATE) FROM EMPLOYEE;

SELECT SUM(SALARY) FROM EMPLOYEE;

-- ���޺� �޿� �հ�
SELECT JOB_CODE, SUM(SALARY) FROM EMPLOYEE;