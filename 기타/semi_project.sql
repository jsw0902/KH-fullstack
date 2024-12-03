CREATE TABLE tbl_user (
    user_no varchar2(11) PRIMARY KEY,
    user_id VARCHAR2(50) UNIQUE NOT NULL,
    user_pw VARCHAR2(50) NOT NULL,
    user_email VARCHAR2(100) NOT NULL,
    nickname VARCHAR2(50),
    phone VARCHAR2(13),
    user_date DATE DEFAULT SYSDATE,
    grade NUMBER DEFAULT 1,
    point NUMBER DEFAULT 0
);

select * from tbl_user;

create sequence seq_user
maxvalue 99999
cycle;
commit;

//관리자는 일단 등급 100으로 지정
insert into tbl_user values(to_char(sysdate, 'yymmdd') || lpad(seq_user.nextval, 5, '0'),'admin','ap1234','admin@naver.com','관리자','010-1234-3423',sysdate,100,0);


CREATE TABLE tbl_board (
    board_id NUMBER PRIMARY KEY,
    board_name VARCHAR2(50) 
);

ALTER TABLE tbl_board ADD CONSTRAINT uq_board_name UNIQUE (board_name);

insert into tbl_board values(1,'공지사항');
insert into tbl_board values(2,'게시판2');
insert into tbl_board values(3,'게시판3');
insert into tbl_board values(4,'게시판4');
insert into tbl_board values(5,'젖닌갤러리');
insert into tbl_board values(6,'고소갤러리');
insert into tbl_board values(7,'피파온라인게시판');
insert into tbl_board values(8,'지방게시판');
select * from tbl_board;

CREATE TABLE tbl_notice (
    post_id varchar2(11) PRIMARY KEY,
    board_title VARCHAR2(100) NOT NULL,
    board_content CLOB,
    created_date DATE DEFAULT SYSDATE,
    read_count number default 0,
    likes NUMBER DEFAULT 0,
    board_id NUMBER REFERENCES tbl_board(board_id) ON DELETE CASCADE,
    user_no varchar2(11) REFERENCES tbl_user(user_no) ON DELETE CASCADE,
    notice_YN varchar2(10)
);

create sequence seq_notice
maxvalue 99999
cycle;

CREATE TABLE tbl_comment (
    comment_id VARCHAR2(12) PRIMARY KEY,
    reply_to VARCHAR2(12),  -- 답글이 달릴 경우 참조할 상위 댓글의 comment_id
    comments VARCHAR2(500) NOT NULL,
    comm_time DATE DEFAULT SYSDATE,
    user_no varchar2(11) REFERENCES tbl_user(user_no) ON DELETE CASCADE,
    post_id varchar2(11) REFERENCES tbl_notice(post_id) ON DELETE CASCADE,
    FOREIGN KEY (reply_to) REFERENCES tbl_comment(comment_id) ON DELETE CASCADE

);
select * from tbl_comment;

create sequence seq_comment
maxvalue 999999
cycle;



CREATE TABLE notice_file (
    file_id VARCHAR2(11) PRIMARY KEY,
    file_name VARCHAR2(50) NOT NULL,
    file_path VARCHAR2(200) NOT NULL,
    post_id varchar2(11) REFERENCES tbl_notice(post_id) ON DELETE CASCADE
);


create sequence seq_notice_file
maxvalue 99999
cycle;


CREATE TABLE tbl_item (
    item_id VARCHAR2(30) PRIMARY KEY,
    item_name VARCHAR2(30) NOT NULL,
    item_price NUMBER DEFAULT 0,
    require_rank NUMBER DEFAULT 1,
    item_info VARCHAR2(200),
    amount NUMBER DEFAULT 0,
    user_no varchar2(11) REFERENCES tbl_user(user_no) ON DELETE cascade
);

CREATE TABLE tbl_search (
    srch_name VARCHAR2(255) PRIMARY KEY,
    srch_amount NUMBER,
    srch_date DATE DEFAULT SYSDATE
);




create table like_control(
user_no varchar2(11) REFERENCES tbl_user(user_no) ON DELETE cascade,
post_id varchar2(11) references tbl_notice(post_id) on delete cascade,
PRIMARY KEY (user_no, post_id)
);


create table tbl_bann(
 user_id VARCHAR2(50) primary key,
 user_email VARCHAR2(100) NOT NULL,
 phone VARCHAR2(13)
);
    
CREATE TABLE tbl_scrap (
    scrap_id VARCHAR2(12) PRIMARY KEY,
    user_no VARCHAR2(11) REFERENCES tbl_user(user_no) ON DELETE CASCADE,
    board_name VARCHAR2(50) REFERENCES tbl_board(board_name) ON DELETE CASCADE,
    post_id VARCHAR2(11) REFERENCES tbl_notice(post_id) ON DELETE CASCADE,
    scrap_date DATE DEFAULT SYSDATE
);


CREATE SEQUENCE seq_scrap
    START WITH 1 
    INCREMENT BY 1
    MAXVALUE 999999
    CYCLE;
    
select * from tbl_scrap;   

DROP TABLE tbl_scrap CASCADE CONSTRAINTS;
DROP SEQUENCE seq_scrap;
    
create table tbl_bann(
 user_id VARCHAR2(50) primary key,
 user_email VARCHAR2(100) NOT NULL,
 phone VARCHAR2(13)
);
    
select * from tbl_bann;
    
 CREATE TABLE popular_post (
    id NUMBER PRIMARY KEY,
    post_id VARCHAR2(11) REFERENCES tbl_notice(post_id) ON DELETE CASCADE,
    board_id NUMBER REFERENCES tbl_board(board_id) ON DELETE CASCADE,
    likes NUMBER DEFAULT 0,
    views NUMBER DEFAULT 0,
    created_at DATE DEFAULT SYSDATE
);

CREATE SEQUENCE popular_post_seq
START WITH 1
INCREMENT BY 1
NOCACHE;   
CREATE OR REPLACE TRIGGER trg_popular_post_insert
AFTER UPDATE OF likes ON tbl_notice
FOR EACH ROW
DECLARE
    v_count NUMBER; -- 결과를 담을 변수 선언
BEGIN
    -- likes가 2 이상이고 notice_YN = 'N'인 경우
    IF :NEW.likes >= 2 AND :NEW.notice_YN = 'N' THEN
        -- popular_post에 동일한 post_id가 있는지 확인
        SELECT COUNT(*)
        INTO v_count
        FROM popular_post
        WHERE post_id = :NEW.post_id;

        -- 동일한 post_id가 없으면 삽입
        IF v_count = 0 THEN
            INSERT INTO popular_post (id, post_id, board_id, likes, views, created_at)
            VALUES (
                popular_post_seq.NEXTVAL, -- 시퀀스 사용
                :NEW.post_id, 
                :NEW.board_id,
                :NEW.likes,
                :NEW.read_count,
                SYSDATE
            );
        END IF;
    END IF;
END;
/  
    commit;