DROP TABLE grade CASCADE CONSTRAINTS;
CREATE TABLE grade(
gradeNo NUMBER(2) PRIMARY KEY,
gradeName VARCHAR2(20) NOT NULL
);
DROP TABLE member CASCADE CONSTRAINTS;

CREATE TABLE member(
id VARCHAR2(20) PRIMARY KEY,
pw VARCHAR2(20) NOT NULL,
name VARCHAR2(30) NOT NULL,
birth DATE NOT NULL,
tel VARCHAR2(13),
address VARCHAR2(1000) NOT NULL,
email VARCHAR2(50) NOT NULL,
regDate DATE DEFAULT SYSDATE,
conDate DATE DEFAULT SYSDATE,
status VARCHAR2(6) DEFAULT '����' CHECK (status in ('����','����','Ż��','�޸�')) ,
photo VARCHAR2(50),
gradeNo NUMBER(2) DEFAULT 1 REFERENCES grade(gradeNo)
);
INSERT INTO grade VALUES(1, '�Ϲ�ȸ��');
INSERT INTO grade VALUES(9, '������');
-- ������ ���� - ��޹�ȣ�� 9�� �ݵ�� ����� �Ѵ�.
INSERT INTO member(id, pw, name, birth, tel, address, email, photo, gradeNo)
VALUES('admin', '1111', 'limg', '1998-01-01', '010-1111-2222', ' - ', 'ezpt@nate.com','/upload/member/admin.jpg', 9);
-- �Ϲ�ȸ�� ���� - ��޹�ȣ�� �⺻���� 1�� �ȴ�.
INSERT INTO member(id, pw, name, birth, tel, address, email, photo)
VALUES('test', '1111', 'ȫ�浿', '1994-01-01', '010-3333-4444', ' - ', 'hong@naver.com','/upload/member/test.jpg');
COMMIT;
drop SEQUENCE member_seq;
create sequence member_seq START WITH 1000; -- ȸ�������� ������ ������
INSERT INTO member(id, pw, name, birth, tel, address, email, photo)
(select id || member_seq.nextval, pw, name, birth, tel , address, email, photo from member);
commit;
select * from grade;
select * from member;