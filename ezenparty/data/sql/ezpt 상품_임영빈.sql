drop table product cascade constraints;
drop sequence product_seq;

-- pno(상품번호), pname(상품명), price(가격), unit(수량)
-- image(상품 이미지), title(제목), content(내용), writeDate(등록일), hit(조회수)
create table product(
pno number primary key,
pname varchar2(100) not null,
price number(10) not null,
unit number(10) default 1,
image varchar2(100) not null,
content varchar2(3000) not null,
writeDate date default sysdate,
pkind varchar2(30) not null,
categories varchar2(30) not null
);
create sequence product_seq;

-- 일반풍선 5개
insert into product(pno, pname, price, unit, image, content, pkind, categories)
values(product_seq.nextval,'파티용 고급 풍선[30개입]','5000','300','/upload/image/princecrown.jpg',
'/upload/image/princecrownInfo.jpg','colorB', 'balloon');
insert into product(pno, pname, price, unit, image, content, pkind, categories)
values(product_seq.nextval,'파티용 고급 풍선[30개입]','5000','300','/upload/image/princecrown.jpg',
'/upload/image/princecrownInfo.jpg','colorB', 'balloon');
insert into product(pno, pname, price, unit, image, content, pkind, categories)
values(product_seq.nextval,'파티용 고급 풍선[30개입]','5000','300','/upload/image/princecrown.jpg',
'/upload/image/princecrownInfo.jpg','colorB', 'balloon');
insert into product(pno, pname, price, unit, image, content, pkind, categories)
values(product_seq.nextval,'파티용 고급 풍선[30개입]','5000','300','/upload/image/princecrown.jpg',
'/upload/image/princecrownInfo.jpg','colorB', 'balloon');
insert into product(pno, pname, price, unit, image, content, pkind, categories)
values(product_seq.nextval,'파티용 고급 풍선[30개입]','5000','300','/upload/image/princecrown.jpg',
'/upload/image/princecrownInfo.jpg','colorB', 'balloon');

-- 코스튬 5개
insert into product(pno, pname, price, unit, image, content, pkind, categories)
values(product_seq.nextval,'죽음의 외과의 의상 / 성인할로윈의상 할로윈코스프레','30000','300','/upload/image/cos_1.jpg',
'/upload/image/cos_1_info.jpg','halloween', 'cos');
insert into product(pno, pname, price, unit, image, content, pkind, categories)
values(product_seq.nextval,'죽음의 외과의 의상 / 성인할로윈의상 할로윈코스프레','30000','300','/upload/image/cos_1.jpg',
'/upload/image/cos_1_info.jpg','halloween', 'cos');
insert into product(pno, pname, price, unit, image, content, pkind, categories)
values(product_seq.nextval,'죽음의 외과의 의상 / 성인할로윈의상 할로윈코스프레','30000','300','/upload/image/cos_1.jpg',
'/upload/image/cos_1_info.jpg','halloween', 'cos');
insert into product(pno, pname, price, unit, image, content, pkind, categories)
values(product_seq.nextval,'죽음의 외과의 의상 / 성인할로윈의상 할로윈코스프레','30000','300','/upload/image/cos_1.jpg',
'/upload/image/cos_1_info.jpg','halloween', 'cos');
insert into product(pno, pname, price, unit, image, content, pkind, categories)
values(product_seq.nextval,'죽음의 외과의 의상 / 성인할로윈의상 할로윈코스프레','30000','300','/upload/image/cos_1.jpg',
'/upload/image/cos_1_info.jpg','halloween', 'cos');

commit;