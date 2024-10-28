select * from tbl_member;

insert into tbl_member VALUES(
to_char(sysdate, 'yymmdd') || lpad(seq_member.nextval, 4, '0'), 'user1', '1234!@#$', '유저1', 'text@naver.com', '010-1234-1234', '주소', 3,sysdate
);
insert into tbl_member VALUES(
to_char(sysdate, 'yymmdd') || lpad(seq_member.nextval, 4, '0'), 'user2', '1234!@#$', '유저2', 'text@naver.com', '010-1234-1234', '주소', 3,sysdate
);
insert into tbl_member VALUES(
to_char(sysdate, 'yymmdd') || lpad(seq_member.nextval, 4, '0'), 'user3', '1234!@#$', '유저3', 'text@naver.com', '010-1234-1234', '주소', 3,sysdate
);
insert into tbl_member VALUES(
to_char(sysdate, 'yymmdd') || lpad(seq_member.nextval, 4, '0'), 'user4', '1234!@#$', '유저4', 'text@naver.com', '010-1234-1234', '주소', 3,sysdate
);
insert into tbl_member VALUES(
to_char(sysdate, 'yymmdd') || lpad(seq_member.nextval, 4, '0'), 'user5', '1234!@#$', '유저5', 'text@naver.com', '010-1234-1234', '주소', 3,sysdate
);

COMMIT;




create table tbl_notice_type(
    notice_cd number primary key,
    notice_cd_nm varchar2(30) UNIQUE not null,
    use_yn char(1) DEFAULT 'N' check(use_yn in ('Y', 'N'))
);

INSERT into tbl_notice_type values (1,'공지사항', DEFAULT);
INSERT into tbl_notice_type values (2,'자유게시판', DEFAULT);
INSERT into tbl_notice_type values (3,'질문게시판', DEFAULT);
INSERT into tbl_notice_type values (4,'FAQ', DEFAULT);
INSERT into tbl_notice_type values (5,'1:1문의', DEFAULT);


update tbl_notice_type
set use_yn = 'Y';

COMMIT;


create table tbl_notice(
    notice_no varchar2(10) primary KEY, --게시글 번호
    notice_cd number REFERENCES tbl_notice_type(notice_cd) not null, -- 게시글 종류 코드
    notice_title varchar2(200) not null, -- 게시글 제목
    notice_content varchar2(4000) not null, -- 게시글 내용
    notice_writer varchar2(10) REFERENCES tbl_member(member_id) not null, -- 작성글
    notice_date date not null, --작성일
    read_count number default 0 --조회수
);

create SEQUENCE seq_notice
MAXVALUE 9999
cycle;

insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 1 , 'testTitle', 'testContent', 'user1',sysdate, default);


insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 2 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 3 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'),4 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'), 5 , 'testTitle', 'testContent', 'user1',sysdate, default);
insert into tbl_notice values (to_char(sysdate,'yymmdd') || lpad(seq_notice.nextval, 4, '0'),2 , 'testTitle', 'testContent', 'user1',sysdate, default);


select count(*) from tbl_notice;

select notice_cd, count(*)
from tbl_notice
group by notice_cd;

select a.notict_no,
(select notice_cd_nm from tbl_notice_type 2 where z.notice_cd = a.notice_cd) notice_cd_nm,
a.notice_cd,
a.notice_title
from tbl_notice a
where notice_cd != '1';
