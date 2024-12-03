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
    
    


//���� ���� ��ȸ ���
select count(*) from tbl_notice a;


create table tbl_notice_file(
    file_no varchar2(10) PRIMARY key,   -- ���� ��ȣ
    notice_no varchar2(10) REFERENCES tbl_notice(notice_no) on delete CASCADE,
    file_name varchar2(300),        -- ����ڰ� ���ε��� ���� ���� ��Ī
    file_path varchar2(300)          -- ������ �ߺ��� ���ϸ� ������ ��, �� ������ �����ϱ� ���� ������ ���ϸ�
);

create SEQUENCE seq_notice_file
MAXVALUE 9999
cycle;
