/*
1) ���� �� �� C:\Users\user1\AppData\Roaming\SQL Developer ���� ���� ����
2) SqlDeveloper �����
3) system/1234 ����
4) �Ʒ� ��ɾ� ���������� ����.
5) ������� user�� ���� ��, ��� ���� ����.
*/
drop user kh cascade;

create user kh IDENTIFIED by 1234;

grant connect, resource to kh;
