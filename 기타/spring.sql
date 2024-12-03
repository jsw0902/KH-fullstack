CREATE TABLE tbl_member (
    member_id VARCHAR2(30) PRIMARY key,
    member_Pw VARCHAR2(30) not null,
    member_name VARCHAR2(30) not null,
    member_phone char(13) not null,
    member_age number,
    member_gender char(1) check(member_gender in('M','W'))not null,
    enroll_date date not NULL
);

insert into tbl_member VALUES ('admin', '1234', '°ü¸®ÀÚ', '010-1234-1234', 10, 'M', sysdate);

commit;