SELECT * FROM tb_department;
SELECT * FROM tb_student;
SELECT * FROM tb_PROFESSOR;
-- 1. 영어영문학과(학과코드 002) 학생들의 학번, 이이름, 입학년도를 입학년도가 빠른 순으로 표시하는 SQL 문장을 작성하시오
SELECT STUDENT_NO 학번 , STUDENT_NAME 이름, TO_CHAR(ENTRANCE_DATE, 'yyyy-MM-DD') AS 입학년도 FROM tb_student 
WHERE DEPARTMENT_NO IN(002) ORDER BY ENTRANCE_DATE;

-- 2. 춘 기술대학교의 교수 중 이름이 세 글자가 아닌 교수가 한 명 있다고 한다. 그 교수의 이름과 주민번호를 화면에 출력하는 SQL 문장을 작성하시오.
SELECT PROFESSOR_NAME, PROFESSOR_SSN FROM tb_professor WHERE LENGTH (PROFESSOR_NAME) != 3;  
SELECT SYSDATE FROM DUAL;
/*
    3. 춘 기술대학교의 남자 교수들의 이름과 나이를 출력하는 SQL문장을 작성하시오.
    단 이때 나이가 적은 사람에서 많은 사람 순서로 화면에 출력되도록 만드시오
    (단, 교수 중 2000년 이후 출생자는 없으며, 나이는 만나이가 아닌 일반 나이로 계산한다.)
*/

-- 4.