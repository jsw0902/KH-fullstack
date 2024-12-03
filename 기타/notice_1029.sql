select rownum, a.* 
    from
        (
            select  a.*
            from tbl_notice a
            where notice_Cd = '1'
            order by notice_no desc
    ) a
where rownum between 6 and 10;


select * from tbl_member;

select rownum, a.*
from(
select a.*
from tbl_notice a
where notice_Cd = '1'
order by notice_no desc) a;
    
select rownum, a.*
from tbl_notice a
where notice_cd = '1'
and rownum between 6 and 10;

select *
    from(
        select rownum as rnum, a.*
            from (
                select a.*
                    from tbl_notice a
                    where notice_Cd = '1'
                    order by notice_no desc
                    )a
            )
where rnum between 1 and 10;
    
    


//내부 쿼리 조회 대상
select count(*) from tbl_notice a;


create table tbl_notice_file(
    file_no varchar2(10) PRIMARY key,   -- 파일 번호
    notice_no varchar2(10) REFERENCES tbl_notice(notice_no) on delete CASCADE,
    file_name varchar2(300),        -- 사용자가 업로드한 실제 파일 명칭
    file_path varchar2(300)          -- 서버에 중복된 파일명 존재할 때, 각 파일을 구분하기 위한 관리용 파일명
);

create SEQUENCE seq_notice_file
MAXVALUE 9999
cycle;
