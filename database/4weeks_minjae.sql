create table userr(
user_id varchar2(20) primary key
    check(regexp_like(user_id, '^[a-z0-9]{8,20}$')),
user_nick varchar2(30) not null unique
check(regexp_like(user_nick, '^[가-힣][가-힣0-9]{0,9}$')),
user_pw varchar2(16) not null
--check(regexp_like(member_pw, '^[a-zA-Z0-9!@#$]{8,16}$')),
check(regexp_like(user_pw, '^[a-zA-Z0-9!@#$]{8,16}$')and
regexp_like(user_pw, '[a-z]')and
regexp_like(user_pw, '[A-Z]')and
regexp_like(user_pw, '[0-9]')and
regexp_like(user_pw, '[!@#$]')
),
user_email varchar2(100)
check(regexp_like(user_email, '@')),
create_date date default sysdate not null,
modified_date date default sysdate not null,
login_date date
);

create table adminn(
admin_id varchar2(20) primary key
    check(regexp_like(admin_id, '^[a-z0-9]{8,20}$')),
admin_pw varchar2(16) not null
--check(regexp_like(member_pw, '^[a-zA-Z0-9!@#$]{8,16}$')),
check(
    regexp_like(admin_pw, '^[a-zA-Z0-9!@#$]{8,16}$')
    and
    regexp_like(admin_pw, '[a-z]')
    and
    regexp_like(admin_pw, '[A-Z]')
    and
    regexp_like(admin_pw, '[0-9]')
    and
    regexp_like(admin_pw, '[!@#$]')
),
admin_add date default sysdate not null,
admin_login date
);

create table notice(
notie_no number primary key,
admin_id references adminn(admin_id) on delete cascade not null,
notice_title varchar2(120) not null,
notice_content varchar2(4000) not null,
notice_time date default sysdate not null,
notice_modified date
);

create table notice_img(
admin_id references adminn(admin_id) on delete cascade not null,
attachment_no references attachment(attachment_no) on delete cascade not null
);
