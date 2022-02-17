-- 질문 답변 스키마
DROP TABLE qna;
DROP SEQUENCE qna_seq;

-- 객체 생성
CREATE TABLE qna(
no NUMBER PRIMARY KEY,
title VARCHAR2(300) NOT NULL,
content VARCHAR2(2000) NOT NULL,
id VARCHAR2(20) NOT NULL REFERENCES member(id),
writeDate DATE DEFAULT SYSDATE,
refNo NUMBER REFERENCES qna(no),
ordNo NUMBER,
levNo NUMBER,
parentNo NUMBER REFERENCES qna(no) ON DELETE CASCADE
);
CREATE SEQUENCE qna_seq;

-- 샘플 데이터
-- 질문하기
INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo)
VALUES(qna_seq.NEXTVAL, '제품 문의 합니다', '문의 합니다.', 'test', qna_seq.NEXTVAL, 1, 0);

-- 답변하기
-- 질문을 보고 답변한다.
-- 보고 있는 글(1번 글) : 부모글(parentNo) -> 1
-- 관련 글(refNo) : 최초 질문의 글번호 -> 1번
-- 순서 번호(ordNo) : 데이터를 표시할 질문을 위에 그에 대한 답변은 아래 
--           답변이 여러개면 최근의 작성된 답변을 위에
-- 들여쓰기 번호(levNo) : 화면에 얼마나 들여쓰기 할지를 정하는 번호
-- 1번에 대한 답변
INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
VALUES(qna_seq.NEXTVAL, '제품문의 합니다.', '이제품은 뭔가요?', 'admin', 1, 2, 1, 1);

SELECT * FROM qna;
COMMIT;
