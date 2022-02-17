DROP TABLE notice CASCADE CONSTRAINTS;
DROP SEQUENCE notice_seq;

CREATE TABLE notice(
no number PRIMARY KEY,
title varchar2(300) NOT NULL,
content varchar2(2000) NOT NULL,
kind varchar(20) NOT NULL,
startDate date default '9999-12-31',
endDate date default '9999-12-31',
writeDate date default SYSDATE,
writer varchar2(20) default '������'
);

CREATE SEQUENCE notice_seq;

INSERT INTO notice(no, title, content, kind, startDate, endDate, writer)
VALUES (notice_seq.nextval, '���� ��������', '���� �������� ����', '��������', '2022-02-01', '2022-02-28', '������');

INSERT INTO notice(no, title, content, kind, startDate, endDate, writer)
VALUES (notice_seq.nextval, '�������� �̺�Ʈ', '�������� �̺�Ʈ ����', '�̺�Ʈ', '2022-02-01', '2022-02-28', '������');

INSERT INTO notice(no, title, content, kind, startDate, endDate, writer)
VALUES (notice_seq.nextval, '���� �̺�Ʈ', '���� �̺�Ʈ ����', '�̺�Ʈ', '2022-03-01', '2022-03-31', '������');

COMMIT;