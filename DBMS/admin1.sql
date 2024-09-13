drop user kh cascade;
drop user examA cascade;
create user kh IDENTIFIED by 1234;
grant connect, resource to kh;
create user examA IDENTIFIED by 1234;
grant connect, resource to examA;