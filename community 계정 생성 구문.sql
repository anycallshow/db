CREATE TABLE "MEMBER" (
   "MEMBER_NO"   NUMBER   PRIMARY KEY,
   "MEMBER_ID" VARCHAR2(30) NOT NULL,
   "MEMBER_EMAIL"   VARCHAR2(50) NOT NULL,
   "MEMBER_PW"   VARCHAR2(30) NOT NULL,
   "MEMBER_NICK"   VARCHAR2(30) NOT NULL,
   "MEMBER_TEL"   CHAR(11) NOT NULL,
   "MEMBER_ADDR"   VARCHAR2(500),
   "PROFILE_IMG"   VARCHAR2(200),
   "ENROLL_DT"   DATE DEFAULT SYSDATE ,
   "SECESSION_FL"   CHAR(1)   DEFAULT 'N'
);


COMMENT ON COLUMN "MEMBER"."MEMBER_NO" IS '회원 번호';
COMMENT ON COLUMN "MEMBER"."MEMBER_EMAIL" IS '회원 이메일(아이디)';
COMMENT ON COLUMN "MEMBER"."MEMBER_PW" IS '회원 비밀번호';
COMMENT ON COLUMN "MEMBER"."MEMBER_NICK" IS '회원 닉네임(중복x)';
COMMENT ON COLUMN "MEMBER"."MEMBER_TEL" IS '전화번호(- 미포함)';
COMMENT ON COLUMN "MEMBER"."MEMBER_ADDR" IS '회원 주소';
COMMENT ON COLUMN "MEMBER"."PROFILE_IMG" IS '회원 프로필 이미지';
COMMENT ON COLUMN "MEMBER"."ENROLL_DT" IS '회원 가입일';
COMMENT ON COLUMN "MEMBER"."SECESSION_FL" IS '탈퇴여부(Y:탈퇴, N:미탈퇴)';


-- 회원 번호 시퀀스
CREATE SEQUENCE SEQ_MEMBER_NO;

INSERT INTO MEMBER
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'anycallshow', 'anycallshow@naver.com', 'qweasdzxc2', '김동휘',
        '01058512963', '06234,,서울특별시 강남구 테헤란로14길 6,,3층 G강의장',
        NULL, DEFAULT, DEFAULT);
        
COMMIT;

SELECT MEMBER_NO,MEMBER_EMAIL,MEMBER_NICK,MEMBER_TEL,
    MEMBER_ADDR, PROFILE_IMG, 
    TO_CHAR( ENROLL_DT, 'YYYY-MM-DD HH24:MI:SS') AS ENROLL_DT
FROM MEMBER
WHERE MEMBER_EMAIL = 'user01@kh.or.kr'
AND MEMBER_PW = 'pass01!'
AND SECESSION_FL = 'N';

SELECT MEMBER_NO,MEMBER_ID,MEMBER_EMAIL,MEMBER_NICK,MEMBER_TEL,
    MEMBER_ADDR, PROFILE_IMG, 
    TO_CHAR( ENROLL_DT, 'YYYY-MM-DD HH24:MI:SS') AS ENROLL_DT
FROM MEMBER
WHERE MEMBER_EMAIL = 'anycallshow@naver.com'
AND MEMBER_NICK = '김동휘'
AND SECESSION_FL = 'N';






