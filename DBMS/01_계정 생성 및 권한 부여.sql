-- admin(������) �������� �����Ͽ�, test1�̶�� ���� ����, ��й�ȣ�� 1234�� ����
CREATE USER test1 IDENTIFIED BY 1234;

-- test1 ������ ���� �� ���� ���� �ο�.
GRANT CONNECT, RESOURCE TO test1;

CREATE USER KH IDENTIFIED BY 1234;


GRANT CONNECT, RESOURCE TO KH;