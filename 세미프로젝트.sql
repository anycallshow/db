-- 테이블 생성

CREATE TABLE "MEMBER" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"MEMBER_EMAIL"	VARCHAR2(50)		NOT NULL,
	"MEMBER_PW"	VARCHAR2(200)		NOT NULL,
	"MEMBER_NM"	VARCHAR2(30)		NOT NULL,
	"MEMBER_TEL"	VARCHAR2(100)		NOT NULL,
	"MEMBER_TYPE"	CHAR(1)		NOT NULL,
	"SECESSION_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"ENROLL_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"MEMBER_ADDR"	VARCHAR2(500)		NULL,
	"PROFILE_IMG"	VARCHAR2(500)		NULL,
	"MEMBER_ID"	VARCHAR2(50)		NOT NULL
);

COMMENT ON COLUMN "MEMBER"."MEMBER_NO" IS '회원번호(시퀀스)';
COMMENT ON COLUMN "MEMBER"."MEMBER_EMAIL" IS '회원이메일';
COMMENT ON COLUMN "MEMBER"."MEMBER_PW" IS '비밀번호';
COMMENT ON COLUMN "MEMBER"."MEMBER_NM" IS '이름';
COMMENT ON COLUMN "MEMBER"."MEMBER_TEL" IS '전화번호';
COMMENT ON COLUMN "MEMBER"."MEMBER_TYPE" IS '회원유형(일반회원U,관리자M)';
COMMENT ON COLUMN "MEMBER"."SECESSION_FL" IS '탈퇴여부(정상N,삭제Y)';
COMMENT ON COLUMN "MEMBER"."ENROLL_DT" IS '회원가입일';
COMMENT ON COLUMN "MEMBER"."MEMBER_ADDR" IS '주소';
COMMENT ON COLUMN "MEMBER"."PROFILE_IMG" IS '프로필 이미지';
COMMENT ON COLUMN "MEMBER"."MEMBER_ID" IS '회원아이디';

-- 회원 번호 시퀀스
CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE;

-- 회원 데이터 삽입
INSERT INTO MEMBER 
VALUES(SEQ_MEMBER_NO.NEXTVAL,'user01@naver.com', 'pass01!', '유저일','01012341234','U',DEFAULT, DEFAULT, '인천광역시 부평구', NULL, 'user01');



CREATE TABLE "BOARD" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"BOARD_TITLE"	VARCHAR2(60)		NOT NULL,
	"BOARD_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"CREATE_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"READ_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"BOARD_ST"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"STAR_RATING"	VARCHAR2(15)	DEFAULT 0	NULL,
	"CATEGORY"	CHAR(1)		NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"BOARD_CD"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "BOARD"."BOARD_NO" IS '게시글 번호(시퀀스)';
COMMENT ON COLUMN "BOARD"."BOARD_TITLE" IS '게시글 제목';
COMMENT ON COLUMN "BOARD"."BOARD_CONTENT" IS '게시글 내용';
COMMENT ON COLUMN "BOARD"."CREATE_DT" IS '작성일';
COMMENT ON COLUMN "BOARD"."READ_COUNT" IS '조회수';
COMMENT ON COLUMN "BOARD"."BOARD_ST" IS '게시글 상태';
COMMENT ON COLUMN "BOARD"."STAR_RATING" IS '별점';
COMMENT ON COLUMN "BOARD"."CATEGORY" IS '카테고리';
COMMENT ON COLUMN "BOARD"."MEMBER_NO" IS '작성자';
COMMENT ON COLUMN "BOARD"."BOARD_CD" IS '게시판 코드';

-- 게시글 번호 시퀀스
CREATE SEQUENCE SEQ_BOARD_NO NOCACHE;

CREATE TABLE "REPLY" (
	"REPLY_NO"	NUMBER		NOT NULL,
	"REPLY_CONTENT"	VARCHAR2(500)		NOT NULL,
	"CREATE_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"REPLY_ST"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"BOARD_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "REPLY"."REPLY_NO" IS '댓글 번호(시퀀스)';
COMMENT ON COLUMN "REPLY"."REPLY_CONTENT" IS '댓글 내용';
COMMENT ON COLUMN "REPLY"."CREATE_DT" IS '댓글 작성일';
COMMENT ON COLUMN "REPLY"."REPLY_ST" IS '댓글 상태( Y : 블라인드)';
COMMENT ON COLUMN "REPLY"."BOARD_NO" IS '댓글이 작성된 게시글 번호';
COMMENT ON COLUMN "REPLY"."MEMBER_NO" IS '댓글 작성자';

-- 댓글번호 시퀀스
CREATE SEQUENCE SEQ_REPLY_NO NOCACHE;

CREATE TABLE "BOARD_TYPE" (
	"BOARD_CD"	NUMBER		NOT NULL,
	"BOARD_NM"	VARCHAR2(50)		NOT NULL
);

COMMENT ON COLUMN "BOARD_TYPE"."BOARD_CD" IS '게시판 코드';
COMMENT ON COLUMN "BOARD_TYPE"."BOARD_NM" IS '게시판 이름';

CREATE TABLE "MESSAGE" (
	"MESSAGE_NO"	NUMBER		NOT NULL,
	"MESSAGE_CT"	VARCHAR2(2000)		NOT NULL,
	"WRITE_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"DELETE_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"SENDER_NO"	NUMBER		NOT NULL,
	"RECIEVER_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "MESSAGE"."MESSAGE_NO" IS '쪽지번호(시퀀스)';
COMMENT ON COLUMN "MESSAGE"."MESSAGE_CT" IS '쪽지내용';
COMMENT ON COLUMN "MESSAGE"."WRITE_DT" IS '작성일';
COMMENT ON COLUMN "MESSAGE"."DELETE_FL" IS '삭제여부(정상N,삭제Y)';
COMMENT ON COLUMN "MESSAGE"."SENDER_NO" IS '쪽지를 보낸 회원';
COMMENT ON COLUMN "MESSAGE"."RECIEVER_NO" IS '쪽지를 받은 회원';

-- 쪽지번호 시퀀스
CREATE SEQUENCE SEQ_MESSAGE_NO NOCACHE;

CREATE TABLE "REPORT" (
	"REPORT_NO"	NUMBER		NOT NULL,
	"REPORT_CD"	NUMBER		NOT NULL,
	"REPORT_CONTENT"	VARCHAR2(500)		NOT NULL,
	"REPORTER"	NUMBER		NOT NULL,
	"BOARD_NO"	NUMBER		NULL,
	"REPLY_NO"	NUMBER		NULL,
	"REPLY_ST"	CHAR(1)	DEFAULT 'N'	NOT NULL
);

COMMENT ON COLUMN "REPORT"."REPORT_NO" IS '신고 번호(시퀀스)';
COMMENT ON COLUMN "REPORT"."REPORT_CD" IS '신고 사유 코드';
COMMENT ON COLUMN "REPORT"."REPORT_CONTENT" IS '신고 내용';
COMMENT ON COLUMN "REPORT"."REPORTER" IS '신고자';
COMMENT ON COLUMN "REPORT"."BOARD_NO" IS '신고된 게시글 번호';
COMMENT ON COLUMN "REPORT"."REPLY_NO" IS '신고된 댓글 번호';
COMMENT ON COLUMN "REPORT"."REPLY_ST" IS '신고처리 상태(N:미처리 , Y:처리, H: 보류)';

-- 신고번호 시퀀스
CREATE SEQUENCE SEQ_REPORT_NO NOCACHE;

CREATE TABLE "LIKE" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "LIKE"."BOARD_NO" IS '게시글번호';
COMMENT ON COLUMN "LIKE"."MEMBER_NO" IS '회원번호';

CREATE TABLE "REPORT_CATEGORY" (
	"REPORT_CD"	NUMBER		NOT NULL,
	"REPORT_NM"	VARCHAR2(50)		NOT NULL
);

COMMENT ON COLUMN "REPORT_CATEGORY"."REPORT_CD" IS '신고 사유 코드';
COMMENT ON COLUMN "REPORT_CATEGORY"."REPORT_NM" IS '신고 사유';

CREATE TABLE "BOARD_IMG" (
	"IMG_NO"	NUMBER		NOT NULL,
	"IMG_RENAME"	VARCHAR2(500)		NOT NULL,
	"IMG_ORIGINAL"	VARCHAR2(500)		NOT NULL,
	"IMG_LEVEL"	NUMBER		NOT NULL,
	"BOARD_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "BOARD_IMG"."IMG_NO" IS '이미지 번호(시퀀스)';
COMMENT ON COLUMN "BOARD_IMG"."IMG_RENAME" IS '이미지 저장경로';
COMMENT ON COLUMN "BOARD_IMG"."IMG_ORIGINAL" IS '이미지 원본명';
COMMENT ON COLUMN "BOARD_IMG"."IMG_LEVEL" IS '이미지 지정 위치 번호';
COMMENT ON COLUMN "BOARD_IMG"."BOARD_NO" IS '게시글 번호(시퀀스)';

-- 이미지 번호 시퀀스
CREATE SEQUENCE SEQ_BOARD_IMG_NO NOCACHE;

CREATE TABLE "LOCKDOWN" (
	"LOCKDOWN_NO"	NUMBER		NOT NULL,
	"LOCKDOWN_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"LOCKDOWN_TERM"	NUMBER		NOT NULL,
	"REPORT_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "LOCKDOWN"."LOCKDOWN_NO" IS '제재 번호(시퀀스)';
COMMENT ON COLUMN "LOCKDOWN"."LOCKDOWN_DATE" IS '제재 시작일';
COMMENT ON COLUMN "LOCKDOWN"."LOCKDOWN_TERM" IS '제재 일수';
COMMENT ON COLUMN "LOCKDOWN"."REPORT_NO" IS '신고 번호';

-- 제제번호 시퀀스
CREATE SEQUENCE SEQ_LOCKDOWN_NO NOCACHE;

CREATE TABLE "LOCATION_CATEGORY" (
	"LOCATION_CD"	VARCHAR2(20)		NOT NULL,
	"LOCATION_NM"	VARCHAR2(500)		NOT NULL
);

COMMENT ON COLUMN "LOCATION_CATEGORY"."LOCATION_CD" IS '지역 코드';
COMMENT ON COLUMN "LOCATION_CATEGORY"."LOCATION_NM" IS '지역 명칭';

CREATE TABLE "CATEGORY_CODE" (
	"LOCATION_CD"	VARCHAR2(20)		NOT NULL,
	"CITY_CD"	VARCHAR2(20)		NULL
);

COMMENT ON COLUMN "CATEGORY_CODE"."LOCATION_CD" IS '시군구 명칭';
COMMENT ON COLUMN "CATEGORY_CODE"."CITY_CD" IS '시도 명칭';

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"MEMBER_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
	"BOARD_NO"
);

ALTER TABLE "REPLY" ADD CONSTRAINT "PK_REPLY" PRIMARY KEY (
	"REPLY_NO"
);

ALTER TABLE "BOARD_TYPE" ADD CONSTRAINT "PK_BOARD_TYPE" PRIMARY KEY (
	"BOARD_CD"
);

ALTER TABLE "MESSAGE" ADD CONSTRAINT "PK_MESSAGE" PRIMARY KEY (
	"MESSAGE_NO"
);

ALTER TABLE "REPORT" ADD CONSTRAINT "PK_REPORT" PRIMARY KEY (
	"REPORT_NO"
);

ALTER TABLE "LIKE" ADD CONSTRAINT "PK_LIKE" PRIMARY KEY (
	"BOARD_NO",
	"MEMBER_NO"
);

ALTER TABLE "REPORT_CATEGORY" ADD CONSTRAINT "PK_REPORT_CATEGORY" PRIMARY KEY (
	"REPORT_CD"
);

ALTER TABLE "BOARD_IMG" ADD CONSTRAINT "PK_BOARD_IMG" PRIMARY KEY (
	"IMG_NO"
);

ALTER TABLE "LOCKDOWN" ADD CONSTRAINT "PK_LOCKDOWN" PRIMARY KEY (
	"LOCKDOWN_NO"
);

ALTER TABLE "LOCATION_CATEGORY" ADD CONSTRAINT "PK_LOCATION_CATEGORY" PRIMARY KEY (
	"LOCATION_CD"
);

ALTER TABLE "CATEGORY_CODE" ADD CONSTRAINT "PK_CATEGORY_CODE" PRIMARY KEY (
	"LOCATION_CD"
);

ALTER TABLE "LIKE" ADD CONSTRAINT "FK_BOARD_TO_LIKE_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD" (
	"BOARD_NO"
);

ALTER TABLE "LIKE" ADD CONSTRAINT "FK_MEMBER_TO_LIKE_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "CATEGORY_CODE" ADD CONSTRAINT "FK_LOCATION_CATEGORY_TO_CATEGORY_CODE_1" FOREIGN KEY (
	"LOCATION_CD"
)
REFERENCES "LOCATION_CATEGORY" (
	"LOCATION_CD"
);




-- 게시글 샘플데이터 삽입
BEGIN 
    FOR I IN 1..200 LOOP 
    
        INSERT INTO BOARD 
        VALUES (SEQ_BOARD_NO.NEXTVAL, 
                SEQ_BOARD_NO.CURRVAL || '번째 게시글',
                SEQ_BOARD_NO.CURRVAL || '번째 게시글 내용입니다.',
                DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, 1, 1
                );
    END LOOP;
END;

