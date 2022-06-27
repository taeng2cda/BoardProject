drop table board;
drop table authority;
drop table users;
drop table files;

drop sequence board_seq;
drop sequence Files_seq;

-- 유저테이블 시큐리티 적용테이블
create table users
(
    userid varchar2(20) PRIMARY KEY,
    pw varchar2(1999) not null,
    name varchar2(11),
    phone varchar2(20),
    regdate Date
);


-- 유저 권한테이블
create table authority
(
    userid varchar2(20) not null,
    authority varchar2(50) not null,
    constraint fk_authority_users  foreign key(userid) references users(userid)
);

-- 유니크인덱스
create unique index ix_auth_userid on users_authority ( userid , authority );


-- 게시판테이블
create table board
(
	bnum number(10) PRIMARY KEY, 	--글번호
	userid varchar2(20) not null, 	--작성자 fk
	title varchar2(1999) not null,	--글제목
	content varchar2(1999) not null,	--글내용
	count number(10),				--조회수
	updatedate date,				--수정일
	boarddate date					--작성일
);

-- FK BOARD 테이블에 제약조건 추가
alter table board
add constraint userid foreign Key(userid) references users(userid);

Create Table Files --첨부파일
(
    file_id number(10) PRIMARY KEY, --시퀀스 pk
    bnum number(10), --첨부파일이 포함된 글번호  fk
    file_type varchar2(2) NOT NULL, --파일종류
    file_size number(10) NOT NULL, -- 파일크기
    org_name varchar2(30) NOT NULL, --원본 파일이름
    src_name varchar2(30) NOT NULL, -- 서버에 저장된 파일이름
    created_day date NOT NULL,
    CONSTRAINT bnum FOREIGN KEY(bnum) REFERENCES board(bnum)
);


-- 시퀀스 추가
CREATE SEQUENCE BOARD_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 9999
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE Files_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 9999
NOCYCLE
NOCACHE
NOORDER;


