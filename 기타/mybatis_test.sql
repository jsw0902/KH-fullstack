
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
(seq_member.nextval, 'admin', '1234', '관리자', 'test@naver.com', '010-1234-1234', '부천', 1, sysdate);

insert into tbl_member VALUES
(seq_member.nextval, 'admin1', '1234', '관리자', 'test99@naver.com', '010-1234-1234', '부천', 1, sysdate);

commit;

CREATE or replace PROCEDURE procedure_ins_member as
begin
    for i in 1..75 loop
        INSERT into tbl_member VALUES (seq_member.nextval, 'user' || i, '1234', '유저' || i, 'test' || i || '@naver.com',
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

insert into tbl_member values (seq_member.nextval, 'user77', '1234', '유저77', 'test77@naver.com', '010-1234-1234', '서울 강남구 삼성동', 2, sysdate);
insert into tbl_member values (seq_member.nextval, 'user78', '1234', '유저78', 'test78@naver.com', '010-1234-1234', '경기 가평군', 2, sysdate);
insert into tbl_member values (seq_member.nextval, 'user79', '1234', '유저79', 'test79@naver.com', '010-1234-1234', '부산광역시 금정구', 2, sysdate);
insert into tbl_member values (seq_member.nextval, 'user80', '1234', '유저80', 'test80@naver.com', '010-1234-1234', '전라남도 목포시', 2, sysdate);
insert into tbl_member values (seq_member.nextval, 'user81', '1234', '유저81', 'test81@naver.com', '010-1234-1234', '서울 강서구 화곡동', 2, sysdate);
insert into tbl_member values (seq_member.nextval, 'user82', '1234', '유저82', 'test82@naver.com', '010-1234-1234', '부산광역시 해운대구', 2, sysdate);
insert into tbl_member values (seq_member.nextval, 'user83', '1234', '유저83', 'test83@naver.com', '010-1234-1234', '경기 성남시 분당구', 2, sysdate);

commit;

SELECT * 
    from tbl_member
where to_char(enroll_Date, 'yyyymmdd') = to_char(sysdate,'yyyymmdd');
    
-- 서울, 경기, 부산, 목포 4개의 체크박스

-- 서울 체크하고 조회
select *
    from tbl_member
where member_addr like '%서울%';

select *
    from tbl_member
where member_addr like '%서울%'
    or member_addr like '%경기%'
    or member_addr like '%부산%'
    or member_addr like '%목포%';
    
create table tbl_level(
    level_code number primary key,
    level_name varchar2(20)
);

insert into tbl_level values(1, '관리자');
insert into tbl_level values(2, '정회원');
insert into tbl_level values(3, '준회원');

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
    
    
    
    