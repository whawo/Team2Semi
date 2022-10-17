-- 챌린지 인증 테이블 생성
create table confirm(
confirm_idx number not null unique,
chal_idx number references chal(chal_idx) on delete set null,
confirm_nick varchar2(30)not null,
confirm_title varchar2(120) not null,
confirm_content varchar2(1500) not null,
confirm_date date default sysdate not null,
modified_date date,
CONSTRAINT confirm_pk primary key(confirm_idx, chal_idx)
);

-- 챌린지 인증 시퀀스 생성
create sequence confirm_seq;

-- 탈퇴 기록 테이블 생성
create table leave_count(
leave_idx number primary key,
leave_date date default sysdate not null,
value number(1) not null
);

-- 탈퇴 기록 시퀀스 생성
create sequence leave_seq;