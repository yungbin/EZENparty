DROP TABLE cart CASCADE CONSTRAINTS;
DROP SEQUENCE cart_seq;

CREATE TABLE cart(
    pno NUMBER PRIMARY KEY,
    image varchar2(100) not null,
    pname VARCHAR2(100) NOT NULL,
    unit NUMBER(10) DEFAULT 1,
    price NUMBER(10) NOT NULL
);

CREATE SEQUENCE cart_seq;

INSERT INTO cart(pno, image, pname, unit, price)
VALUES(CART_SEQ.nextval, '/upload/image/Balloon.jpg', '파티용 고급 풍선', '1', '300000');
COMMIT;

