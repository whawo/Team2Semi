
-- 사진첨부(attachment) 시퀀스, 테이블 생성
create sequence attachment_seq;
create table attachment (
    attachment_no number primary key,
    attachment_name varchar2(256) not null,
    attachment_type varchar2(30) not null,
    attachment_size number not null check(attachment_size >= 0),
    attachment_time date default sysdate not null
);

-- 챌린지 대표 이미지(chal_profile) 테이블 생성
create table chal_profile(
    attachment_no references attachment(attachment_no) on delete cascade not null,
    chal_no references chal(chal_no) on delete cascade not null,
    primary key(attachment_no, chal_no)
);

-- 프로필 이미지(user_img) 테이블 생성
create table user_img (
    attachment_no references attachment(attachment_no) on delete cascade not null,
    user_id references chal_user(user_id) on delete cascade not null,
    primary key(attachment_no, user_id)
);

-- 인증글 이미지(confirm_img) 테이블 생성
create table confirm_img (
    attachment_no references attachment(attachment_no) on delete cascade not null,
    confirm_no references chal_confirm(confirm_no) on delete cascade not null,
    user_id references chal_user(user_id) on delete cascade not null,
    primary key(attachment_no, user_id, confirm_no)
);

-- 댓글(reply) 시퀀스, 테이블 생성
create sequence reply_seq;
create table reply(
    reply_no number primary key,
    confirm_no references chal_confirm(confirm_no) on delete cascade,
    user_id references chal_user(user_id) on delete set null,
    reply_nick references chal_user(user_nick) on delete set null,
    reply_content varchar2(4000) not null,
    reply_date date default sysdate not null,
    reply_update date,
    reply_blind char(1) check(reply_blind = 'Y')
);

-- 인증글 좋아요(confirm_like) 테이블 생성
create table confirm_like (
user_id references chal_user(user_id) on delete cascade not null,
confirm_no references chal_confirm(confirm_no) on delete cascade not null,
like_date date default sysdate not null,
primary key(user_id, confirm_no)
);
