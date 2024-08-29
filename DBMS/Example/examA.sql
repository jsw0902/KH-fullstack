SELECT * FROM TB_DEPARTMENT;
SELECT * FROM tb_student;
SELECT * FROM tb_professor;
SELECT * FROM tb_class;
-- 1. 춘 기술대학교의 학과 이름과 계열을 표시하시오 단, 출력 헤더는 "학과 명", "계열"으로 표시
SELECT department_name "학과 명", category 계열 FROM TB_DEPARTMENT;

-- 2. 학과의 학과 정원을 다음과 같은 형태로 화면에 출력한다.
SELECT department_name || '의 정원은' || CAPACITY || '명 입니다. 'AS "학과별 정원" FROM tb_department;


--3. 도서관에서 대출 도서 장기 연체자 들을 찾아 이름을 게시하고자 한다. 그 대상자들의 학번이 다음과 같을 때 대상자들을 찾는 적절한 SQL 구문을 작성하시오.
-- 연체자 학번 : A513079, A513090, A513091, A513110, A513119
SELECT STUDENT_NAME FROM TB_STUDENT WHERE student_no IN ('A513079','A513090','A513091','A513110','A513119')ORDER BY student_name DESC;


-- 4. 입학정원이 20명 이상 30명 이하인 학과들의 학과 이름과 계열을 출력하시오.
SELECT department_name, category FROM TB_DEPARTMENT WHERE capacity BETWEEN 20 AND 30;

-- 5. 춘 기술대학교는 총장을 제외하고 모든 교수들이 소속 학과를 가지고 있다. 그럼 춘 기술대학교 총장의 이름을 알아낼 수 있는 SQL 문장을 작성하시오.
SELECT professor_name FROM TB_PROFESSOR WHERE department_no IS NULL ;

-- 6. 수강신청을 하려고 한다. 선수과목 여부를 확인해야 하는데, 선수과목이 존재하는 과목들은 어떤과목인지 과목번호를 조회해보시오
SELECT CLASS_NO FROM tb_class WHERE preattending_class_no IS NOT NULL;

-- 7. 춘 대학에는 어떤 계열(CATEGORY)들이 있는지 조회해보시오.
SELECT DISTINCT CATEGORY FROM tb_department ORDER BY 1;