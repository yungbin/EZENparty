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
writer varchar2(20) default '관리자'
);

CREATE SEQUENCE notice_seq;

INSERT INTO notice(no, title, content, kind, startDate, endDate, writer)
VALUES (notice_seq.nextval, '현재 공지사항', '현재 공지사항 내용', '공지사항', '2022-02-01', '2022-02-28', '관리자');

INSERT INTO notice(no, title, content, kind, startDate, endDate, writer)
VALUES (notice_seq.nextval, '진행중인 이벤트', '진행중인 이벤트 내용', '이벤트', '2022-02-01', '2022-02-28', '관리자');

INSERT INTO notice(no, title, content, kind, startDate, endDate, writer)
VALUES (notice_seq.nextval, '예약 이벤트', '예약 이벤트 내용', '이벤트', '2022-03-01', '2022-03-31', '관리자');

COMMIT;