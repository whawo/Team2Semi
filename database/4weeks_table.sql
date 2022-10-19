-------------------------------------------------------------------
-- 첨부파일 관련 테이블
-------------------------------------------------------------------
-- 사진첨부(attachment) 시퀀스, 테이블 생성
drop sequence attachment_seq;
create sequence attachment_seq;

drop table attachment;
create table attachment (
attachment_no number primary key,
attachment_name varchar2(256) not null,
attachment_type varchar2(30) not null,
attachment_size number not null check(attachment_size >= 0),
attachment_time date default sysdate not null
);

-- 유저 프로필 이미지(user_img) 테이블 생성
drop table user_img;
create table user_img (
attachment_no references attachment(attachment_no) on delete cascade not null,
user_id references chal_user(user_id) on delete cascade not null,
primary key(attachment_no, user_id)
);

-- 챌린지 대표 이미지(chal_img) 테이블 생성
drop table chal_img;
create table chal_img(
attachment_no references attachment(attachment_no) on delete cascade not null,
chal_no references chal(chal_no) on delete cascade not null,
primary key(attachment_no, chal_no)
);

-- 인증글 이미지(confirm_img) 테이블 생성
drop table confirm_img;
create table confirm_img (
attachment_no references attachment(attachment_no) on delete cascade not null,
confirm_no references chal_confirm(confirm_no) on delete cascade not null,
user_id references chal_user(user_id) on delete cascade not null,
primary key(attachment_no, confirm_no, user_id)
);

-- 어드민 공지글 이미지(notice_img) 테이블 생성
drop table_notice_img;
create table notice_img(
attachment_no references attachment(attachment_no) on delete cascade not null,
notice_no references notice(notice_no) on delete cascade not null,
primary key(attachment_no, notice_no)
);

-------------------------------------------------------------------
-- 유저 관련 테이블
-------------------------------------------------------------------
-- 유저(chal_user) 테이블 생성
drop table chal_user;
create table chal_user(
user_id varchar2(20) primary key check(regexp_like(user_id, '^[a-z0-9]{6,20}$')),
user_nick varchar2(30) not null unique check(regexp_like(user_nick, '^[가-힣a-z0-9]{4,10}$')),
user_pw varchar2(16) not null check(regexp_like(user_pw, '^[a-zA-Z0-9!@#$]{8,16}$')),
user_email varchar2(100) check(regexp_like(user_email, '^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$')),
create_date date default sysdate not null,
modified_date date,
login_date date
);

-- 본인확인 이메일 시퀀스, 테이블 생성
create sequence verify_seq;

drop table verify;
create table verify(
verify_no number primary key,
user_id references chal_user(user_id) on delete cascade,
verify_key char(8) not null check(regexp_like(verify_key, '^[A-Z0-9]{8}$')),
send_time date default sysdate not null,
limit_time date default sysdate+10/(24*60) not null
);

-- 탈퇴 기록(leave_count) 시퀀스, 테이블 생성
create sequence leave_seq;

drop table leave_count;
create table leave_count(
leave_no number primary key,
leave_date date default sysdate not null,
value number(1) not null
);

-------------------------------------------------------------------
-- 챌린지 개설 관련 테이블
-------------------------------------------------------------------
-- 챌린지 개설(chal) 시퀀스, 테이블 생성
create sequence chal_seq;

drop table chal;
create table chal(
chal_no number primary key,
user_id references chal_user(user_id) on delete set null,
chal_title varchar2(120) not null,
chal_content varchar2(1500) not null,
chal_person number(2) default 1 not null check(chal_person <= 10),
chal_topic references chal_topic(chal_topic) on delete set null,
start_date date not null,
end_date date not null
);

-- 챌린지 주제(chal_topic) 테이블 생성(DB에 직접 등록)
drop table chal_topic;
create table chal_topic(
chal_topic varchar2(30) primary key,
create_date date default sysdate not null
);

-- 챌린지 주제(chal_topic) 등록 구문(고정, 더미 아님)
insert into chal_topic(chal_topic) values('운동');
insert into chal_topic(chal_topic) values('식습관');
insert into chal_topic(chal_topic) values('생활');
insert into chal_topic(chal_topic) values('정서');
insert into chal_topic(chal_topic) values('취미');
insert into chal_topic(chal_topic) values('학습');
insert into chal_topic(chal_topic) values('환경');
insert into chal_topic(chal_topic) values('그외');
commit;
-------------------------------------------------------------------
-- 챌린지 참가 관련 테이블
-------------------------------------------------------------------
-- 챌린지 참가자(participant) 시퀀스, 테이블 생성
create sequence participant_seq;

drop table participant;
create table participant (
participant_no number primary key,
chal_no references chal(chal_no) on delete set null,
user_id references chal_user(user_id) on delete set null,
participant_join date default sysdate not null
);

-------------------------------------------------------------------
-- 챌린지 인증 관련 테이블
-------------------------------------------------------------------
-- 챌린지 인증(chal_confirm) 시퀀스, 테이블 생성
create sequence confirm_seq;

drop table chal_confirm;
create table chal_confirm(
confirm_no number not null unique,
chal_no number references chal(chal_no) on delete set null,
confirm_title varchar2(120) not null,
confirm_content varchar2(1500) not null,
confirm_date date default sysdate not null,
modified_date date,
constraints confirm_pk primary key(confirm_no, chal_no)
);

-- 인증글 좋아요(confirm_like) 테이블 생성
drop table confirm_like;
create table confirm_like (
user_id references chal_user(user_id) on delete cascade not null,
confirm_no references chal_confirm(confirm_no) on delete cascade not null,
like_date date default sysdate not null,
primary key(user_id, confirm_no)
);

-- 댓글(reply) 시퀀스, 테이블 생성
drop sequence reply_seq;
create sequence reply_seq;

drop table reply;
create table reply(
reply_no number primary key,
confirm_no references chal_confirm(confirm_no) on delete cascade,
user_id references chal_user(user_id) on delete set null,
reply_content varchar2(4000) not null,
reply_date date default sysdate not null,
reply_update date,
reply_blind char(1) check(reply_blind = 'Y')
);

-------------------------------------------------------------------
-- 어드민 관련 테이블
-------------------------------------------------------------------
-- 어드민 유저(chal_admin) 테이블 생성
drop table chal_admin;
create table chal_admin(
admin_id varchar2(20) primary key check(regexp_like(admin_id, '^[a-z0-9]{6,20}$')),
admin_pw varchar2(16) not null check(regexp_like(admin_pw, '^[a-zA-Z0-9!@#$]{8,16}$')),
admin_add date default sysdate not null,
admin_login date
);

-- 어드민 공지글 시퀀스, 테이블 생성
create sequence notice_seq;

drop table notice;
create table notice(
notice_no number primary key,
admin_id references chal_admin(admin_id) on delete set null,
notice_title varchar2(120) not null,
notice_content varchar2(4000) null,
notice_time date default sysdate not null,
notice_modified date
);