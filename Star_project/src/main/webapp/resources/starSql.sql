Member


create table St_member (
email varchar2(100) NOT NULL,
pwd varchar2(4000) NOT NULL,
nick varchar2(200) ,
birth varchar2(500) NOT NULL,
gender varchar2(10) NOT NULL,
addr varchar2(4000) NOT NULL,
tel varchar2(100) NOT NULL,
regd8 DATE default sysdate,
grade NUMBER(5,0) DEFAULT 0,
sratrcount NUMBER(2,0) DEFAULT 0,
name varchar2(500) NOT NULL,
coupon NUMBER(5,0) DEFAULT 0
);

alter table St_member add constraint pk_member
primary key(email);


-------------------------------------------------------


Card   


create table St_gcard (
gnum varchar2(500) NOT NULL,
gprice NUMBER(11,0) DEFAULT 0,
gname varchar2(100),
email varchar2(100)
);

alter table St_gcard add constraint pk_cardnum
primary key(gnum);

-------------------------------------------------------


Tumbler


CREATE TABLE st_tumbler (
tcount number(11,0),
tcontent varchar2(4000),
timg varchar2(4000) DEFAULT 'NONE',
tname varchar2(100)  NOT NULL,
tprice NUMBER(11,0)  NOT NULL,
ttotal NUMBER(11,0)
);


-------------------------------------------------------


Coffee  


CREATE TABLE st_coffee (
cname varchar2(100) NOT NULL,
cprice number(11,0) NOT NULL,
ccontent varchar2(4000) NOT NULL,
cimg varchar2(4000) DEFAULT 'NONE',
ctotalcount NUMBER(11,0),
CATEGORY varchar2(100) NOT NULL,
HC varchar2(100) NOT NULL
);



-------------------------------------------------------


Cbag

create table St_cbag (
email varchar2(100),
cname varchar2(300) NOT NULL,
cprice NUMBER(11,0) NOT NULL,
camount NUMBER(5,0) DEFAULT 1,
csize varchar2(100) DEFAULT 'T',
CBAGNO NUMBER(22,127) NOT NULL,
cimg varchar2(4000) DEFAULT 'NONE',
HC VARCHAR2(100) DEFAULT 'h'
);


alter table St_cbag add constraint pk_cbagno
primary key(cbagno);

create sequence seq_cbag_cbagno
start with 1
increment by 1
nocycle nocache;


--------------------------------------------------


Tbag


create table St_tbag (
tbagno NUMBER(5,0) NOT NULL,
email varchar2(100),
tname varchar2(100) NOT NULL,
tprice NUMBER(11,0) NOT NULL,
tamount NUMBER(5,0) DEFAULT 1,
timg VARCHAR2(4000) DEFAULT 'NONE'
);

alter table St_tbag add constraint pk_tbagno
primary key(tbagno);

create sequence seq_tbag_tbagno
start with 1
increment by 1
nocycle nocache;



--------------------------------------------------


Corder


create table St_corder (
email VARCHAR2(500),
cname varchar2(300) NOT NULL,
camount NUMBER(5) DEFAULT 1,
cprice NUMBER(11),
cpay varchar2(500) NOT NULL,
cbuyday DATE DEFAULT sysdate,
csize varchar2(100) DEFAULT 'T',
CONO NUMBER,
ADDR VARCHAR2(1000),
NAME VARCHAR2(100),
TEL VARCHAR2(100),
COUPON VARCHAR2(100) DEFAULT 'none',
hc VARCHAR2(100)
);

alter table ST_CORDER add constraint pk_cono
primary key(cono);

create sequence seq_corder_cono
start with 1
increment by 1
nocycle nocache; 

--------------------------------------------------


Torder


CREATE TABLE st_torder (
tamount NUMBER(5,0) NOT NULL,
name varchar2(100) NOT NULL,
addr varchar2(4000) NOT NULL,
tel varchar2(100) NOT NULL,
email varchar2(100) NOT NULL,
tname varchar2(100) NOT NULL,
tprice NUMBER(11,0) NOT NULL,
tpay varchar2(500) NOT NULL,
tono NUMBER,
tbuyday DATE DEFAULT sysdate
);

alter table ST_TORDER add constraint pk_tono
primary key(tono);

create sequence seq_corder_tono
start with 1
increment by 1
nocycle nocache;


--------------------------------------------------


Board


CREATE TABLE st_board (
bno NUMBER(11,0) NOT NULL,
email varchar2(100),
viewcount NUMBER(11,0) DEFAULT 0,
bregd8 DATE DEFAULT sysdate,
bmodd8 DATE DEFAULT sysdate,
bcontent varchar2(4000),
cmtcnt NUMBER(11,0) DEFAULT 0,
noticenum NUMBER(2,0) DEFAULT 0,
btitle varchar2(4000) NOT NULL,
b_file varchar2(4000) DEFAULT 'NONE'
);


alter table st_board add constraint pk_bno
primary key(bno);

create sequence seq_board_bno
start with 1
increment by 1
nocycle nocache;



--------------------------------------------------


Comment


CREATE TABLE st_comment (
cno NUMBER(11,0) NOT NULL,
bno NUMBER(11,0),
writer varchar2(100) NOT NULL,
COMM varchar2(3000) NOT NULL,
cregd8 DATE DEFAULT sysdate,
cmodd8 DATE DEFAULT sysdate
);

alter table st_comment add constraint pk_cno
primary key(cno);

create sequence seq_comment_cno
start with 1
increment by 1
nocycle nocache;



--------------------------------------------------


Map

CREATE TABLE st_map (
place varchar2(200) NOT NULL,
region varchar2(4000) NOT NULL,
width varchar2(500) NOT NULL,
height varchar2(500) NOT NULL 
);



