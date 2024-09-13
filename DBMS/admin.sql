/*
1) 오류 날 시 C:\Users\user1\AppData\Roaming\SQL Developer 내부 폴더 삭제
2) SqlDeveloper 재실행
3) system/1234 접속
4) 아래 명령어 순차적으로 실행.
5) 재생성된 user로 접속 후, 백업 파일 실행.
*/
drop user kh cascade;

create user kh IDENTIFIED by 1234;

grant connect, resource to kh;
