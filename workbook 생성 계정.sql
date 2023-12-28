-- 오라클 11G 이전 버전의 SQL 작성을 가능하게 하는 구문.
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;


-- C## : 일반 사용자(사용자 계정을 의미)

-- 계정 생성
--CREATE USER C##workbook IDENTIFIED BY workbook1234;
CREATE USER workbook IDENTIFIED BY workbook1234;

-- 접속, 기본 객체 생성 권한
--GRANT CONNECT, RESOURCE TO C##workbook;
GRANT CONNECT, RESOURCE TO workbook;