drop table product cascade constraints;
drop sequence product_seq;

-- pno(상품번호), pname(상품명), price(가격), color(색상), unit(수량)
-- image(상품 이미지), title(제목), content(내용), writeDate(등록일), hit(조회수)
create table product(
pno number primary key,
pname varchar2(100) not null,
price number(10) not null,
color varchar2(15) default 'none',
unit number(10) default 1,
image varchar2(100) not null,
content varchar2(3000) not null,
writeDate date default sysdate,
hit number default 0
);
create sequence product_seq;

insert into product(pno, pname, price, color, unit, image, content)
values(product_seq.nextval,'파티용 고급 풍선','300000','red','300','/upload/image/Balloon.jpg','저렴하게 팝니다.');
commit;

-- to_char 이용해서 숫자값에 3자리 마다 콤마(,) 찍기
-- select TO_CHAR(price , '999,999,999,999,999') from product