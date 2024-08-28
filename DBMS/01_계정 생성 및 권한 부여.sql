-- admin(관리자) 계정으로 접속하여, test1이라는 계정 생성, 비밀번호를 1234로 지정
CREATE USER test1 IDENTIFIED BY 1234;

-- test1 계정에 접속 및 조작 권한 부여.
GRANT CONNECT, RESOURCE TO test1;

CREATE USER KH IDENTIFIED BY 1234;


GRANT CONNECT, RESOURCE TO KH;