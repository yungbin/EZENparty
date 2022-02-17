drop table product cascade constraints;
drop sequence product_seq;

-- pno(��ǰ��ȣ), pname(��ǰ��), price(����), unit(����)
-- image(��ǰ �̹���), title(����), content(����), writeDate(�����), hit(��ȸ��)
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

-- �Ϲ�ǳ�� 5��
insert into product(pno, pname, price, unit, image, content, pkind, categories)
values(product_seq.nextval,'��Ƽ�� ��� ǳ��[30����]','5000','300','/upload/image/princecrown.jpg',
'/upload/image/princecrownInfo.jpg','colorB', 'balloon');
insert into product(pno, pname, price, unit, image, content, pkind, categories)
values(product_seq.nextval,'��Ƽ�� ��� ǳ��[30����]','5000','300','/upload/image/princecrown.jpg',
'/upload/image/princecrownInfo.jpg','colorB', 'balloon');
insert into product(pno, pname, price, unit, image, content, pkind, categories)
values(product_seq.nextval,'��Ƽ�� ��� ǳ��[30����]','5000','300','/upload/image/princecrown.jpg',
'/upload/image/princecrownInfo.jpg','colorB', 'balloon');
insert into product(pno, pname, price, unit, image, content, pkind, categories)
values(product_seq.nextval,'��Ƽ�� ��� ǳ��[30����]','5000','300','/upload/image/princecrown.jpg',
'/upload/image/princecrownInfo.jpg','colorB', 'balloon');
insert into product(pno, pname, price, unit, image, content, pkind, categories)
values(product_seq.nextval,'��Ƽ�� ��� ǳ��[30����]','5000','300','/upload/image/princecrown.jpg',
'/upload/image/princecrownInfo.jpg','colorB', 'balloon');

-- �ڽ�Ƭ 5��
insert into product(pno, pname, price, unit, image, content, pkind, categories)
values(product_seq.nextval,'������ �ܰ��� �ǻ� / �����ҷ����ǻ� �ҷ����ڽ�����','30000','300','/upload/image/cos_1.jpg',
'/upload/image/cos_1_info.jpg','halloween', 'cos');
insert into product(pno, pname, price, unit, image, content, pkind, categories)
values(product_seq.nextval,'������ �ܰ��� �ǻ� / �����ҷ����ǻ� �ҷ����ڽ�����','30000','300','/upload/image/cos_1.jpg',
'/upload/image/cos_1_info.jpg','halloween', 'cos');
insert into product(pno, pname, price, unit, image, content, pkind, categories)
values(product_seq.nextval,'������ �ܰ��� �ǻ� / �����ҷ����ǻ� �ҷ����ڽ�����','30000','300','/upload/image/cos_1.jpg',
'/upload/image/cos_1_info.jpg','halloween', 'cos');
insert into product(pno, pname, price, unit, image, content, pkind, categories)
values(product_seq.nextval,'������ �ܰ��� �ǻ� / �����ҷ����ǻ� �ҷ����ڽ�����','30000','300','/upload/image/cos_1.jpg',
'/upload/image/cos_1_info.jpg','halloween', 'cos');
insert into product(pno, pname, price, unit, image, content, pkind, categories)
values(product_seq.nextval,'������ �ܰ��� �ǻ� / �����ҷ����ǻ� �ҷ����ڽ�����','30000','300','/upload/image/cos_1.jpg',
'/upload/image/cos_1_info.jpg','halloween', 'cos');

commit;