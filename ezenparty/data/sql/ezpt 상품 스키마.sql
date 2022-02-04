drop table product cascade constraints;
drop sequence product_seq;

-- pno(��ǰ��ȣ), pname(��ǰ��), price(����), color(����), unit(����)
-- image(��ǰ �̹���), title(����), content(����), writeDate(�����), hit(��ȸ��)
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
values(product_seq.nextval,'��Ƽ�� ��� ǳ��','300000','red','300','/upload/image/Balloon.jpg','�����ϰ� �˴ϴ�.');
commit;

-- to_char �̿��ؼ� ���ڰ��� 3�ڸ� ���� �޸�(,) ���
-- select TO_CHAR(price , '999,999,999,999,999') from product