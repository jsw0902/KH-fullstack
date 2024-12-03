
create table tbl_member(
    member_no NUMBER PRIMARY key,
    member_id varchar(20) UNIQUE not null,
    member_pw varchar(30) not null,
    member_name varchar(30) not null,
    member_email varchar(100) UNIQUE not null,
    member_phone char(13) not null,
    member_addr varchar(200) not null,
    member_level number DEFAULT 3 not null,
    enroll_date date DEFAULT sysdate not null
);

create SEQUENCE seq_member;

insert into tbl_member VALUES
(seq_member.nextval, 'admin', '1234', '������', 'test@naver.com', '010-1234-1234', '��õ', 1, sysdate);

insert into tbl_member VALUES
(seq_member.nextval, 'admin1', '1234', '������', 'test99@naver.com', '010-1234-1234', '��õ', 1, sysdate);

commit;

CREATE or replace PROCEDURE procedure_ins_member as
begin
    for i in 1..75 loop
        INSERT into tbl_member VALUES (seq_member.nextval, 'user' || i, '1234', '����' || i, 'test' || i || '@naver.com',
                                        '010-1234-5678', 'addr' || i, 2, sysdate);
                                        
        end loop;
        commit;
    end;
/
select * from tbl_member;

begin
    procedure_ins_member;
    end;
/

insert into tbl_member values (seq_member.nextval, 'user77', '1234', '����77', 'test77@naver.com', '010-1234-1234', '���� ������ �Ｚ��', 2, sysdate);
insert into tbl_member values (seq_member.nextval, 'user78', '1234', '����78', 'test78@naver.com', '010-1234-1234', '��� ����', 2, sysdate);
insert into tbl_member values (seq_member.nextval, 'user79', '1234', '����79', 'test79@naver.com', '010-1234-1234', '�λ걤���� ������', 2, sysdate);
insert into tbl_member values (seq_member.nextval, 'user80', '1234', '����80', 'test80@naver.com', '010-1234-1234', '���󳲵� ������', 2, sysdate);
insert into tbl_member values (seq_member.nextval, 'user81', '1234', '����81', 'test81@naver.com', '010-1234-1234', '���� ������ ȭ�', 2, sysdate);
insert into tbl_member values (seq_member.nextval, 'user82', '1234', '����82', 'test82@naver.com', '010-1234-1234', '�λ걤���� �ؿ�뱸', 2, sysdate);
insert into tbl_member values (seq_member.nextval, 'user83', '1234', '����83', 'test83@naver.com', '010-1234-1234', '��� ������ �д籸', 2, sysdate);

commit;

SELECT * 
    from tbl_member
where to_char(enroll_Date, 'yyyymmdd') = to_char(sysdate,'yyyymmdd');
    
-- ����, ���, �λ�, ���� 4���� üũ�ڽ�

-- ���� üũ�ϰ� ��ȸ
select *
    from tbl_member
where member_addr like '%����%';

select *
    from tbl_member
where member_addr like '%����%'
    or member_addr like '%���%'
    or member_addr like '%�λ�%'
    or member_addr like '%����%';
    
create table tbl_level(
    level_code number primary key,
    level_name varchar2(20)
);

insert into tbl_level values(1, '������');
insert into tbl_level values(2, '��ȸ��');
insert into tbl_level values(3, '��ȸ��');

commit;

select *
    from tbl_member,
         tbl_level
    where member_level = level_code;
    
select *
    from tbl_member
    join tbl_level on (member_level = level_code);
        
        
select a.*,
        (select level_name from tbl_level z where z.level_code = a.member_level) level_name
    from tbl_member a;
    
    
    
    