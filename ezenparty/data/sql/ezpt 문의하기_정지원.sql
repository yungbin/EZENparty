-- ���� �亯 ��Ű��
DROP TABLE qna;
DROP SEQUENCE qna_seq;

-- ��ü ����
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

-- ���� ������
-- �����ϱ�
INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo)
VALUES(qna_seq.NEXTVAL, '��ǰ ���� �մϴ�', '���� �մϴ�.', 'test', qna_seq.NEXTVAL, 1, 0);

-- �亯�ϱ�
-- ������ ���� �亯�Ѵ�.
-- ���� �ִ� ��(1�� ��) : �θ��(parentNo) -> 1
-- ���� ��(refNo) : ���� ������ �۹�ȣ -> 1��
-- ���� ��ȣ(ordNo) : �����͸� ǥ���� ������ ���� �׿� ���� �亯�� �Ʒ� 
--           �亯�� �������� �ֱ��� �ۼ��� �亯�� ����
-- �鿩���� ��ȣ(levNo) : ȭ�鿡 �󸶳� �鿩���� ������ ���ϴ� ��ȣ
-- 1���� ���� �亯
INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo)
VALUES(qna_seq.NEXTVAL, '��ǰ���� �մϴ�.', '����ǰ�� ������?', 'admin', 1, 2, 1, 1);

SELECT * FROM qna;
COMMIT;
