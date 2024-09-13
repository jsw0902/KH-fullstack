/*
    TBL_DEL_MEMBER(삭제 회원 정보 테이블)
*/
CREATE TABLE TBL_DEL_MEMBER(
    DEL_MEMBER_ID VARCHAR2(20) PRIMARY KEY, -- 삭제 회원 ID
    DEL_MEMBER_NAME VARCHAR2(20) NOT NULL,  -- 삭제 회원 이름
    DEL_MEMBER_PHONE CHAR(13) NOT NULL,     -- 삭제 회원 전화번호
    DEL_DATE DATE                           -- 삭제 일자 
);

select * from tbl_member where member_id = 'jsw92';
select * from tbl_del_member where del_member_id = 'jsw92';

