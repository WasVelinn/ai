-- [VII] DDL, DCL, DML
-- SQL = DDL(테이블 생성, 테이블 삭제, 테이블 구조 변경, 테이블 모든 데이터 제거, 테이블명변경) +
--       DML(SELECT, INSERT, UPDATE, DELETE) +
--       DCL(사용자계정생성, 사용자에게권한부여, 권한박탈, 사용자계정삭제, 트랜잭션명령어)
-- ★ ★ ★ DDL ★ ★ ★ --
-- 1. 테이블 생성(CREATE TABLE 테이블명 ....) : 테이블 구조를 정의
DROP TABLE BOOK; -- 테이블 삭제
CREATE TABLE BOOK(
    BOOKID    NUMBER(4), -- BOOKID필드의 타입은 숫자 4자리.
    BOOKNAME  VARCHAR2(20), -- BOOKNAME필드의 타입은 문자 20byte
    PUBLISHER VARCHAR2(30), -- PUBLISHER필드의 타입은 문자 30byte
    RDATE     DATE,         -- RDATE필드의 타입은 DATE
    PRICE     NUMBER(8,2),  -- PRICE필드의 타입은 숫자 전체 8자리 중 소수점 2자리
    PRIMARY KEY(BOOKID) -- 제약조건 : BOOKID필드가 주키(PRIMARY KEY:NOT NULL, UNIQUE)
);
SELECT * FROM BOOK;
DESC BOOK;

DROP TABLE BOOK; -- 테이블 삭제
CREATE TABLE BOOK(
    BOOKID    NUMBER(4) PRIMARY KEY, 
    BOOKNAME  VARCHAR2(20),
    PUBLISHER VARCHAR2(30), 
    RDATE     DATE,         
    PRICE     NUMBER(8,2) 
);
SELECT * FROM BOOK;

    -- DEPT01테이블 : DEPTNO(숫자2:PK), DNAME(문자14), LOC(문자13)
CREATE TABLE DEPT01 (
    DEPTNO NUMBER(2), 
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13),
    PRIMARY KEY(DEPTNO)
);
-- EX. EMP와 유사한 EMP01테이블 : EMPNO(숫자4-PK), ENAME(문자10),SAL(숫자7,2), 
                -- DEPTNO(숫자2, DEPT01테이블의 DEPTNO와 연동:외래키 FK)
CREATE TABLE EMP01(
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(10),
    SAL   NUMBER(7,2),
    DEPTNO NUMBER(2) REFERENCES DEPT01(DEPTNO) -- FK
);
SELECT * FROM EMP01;
-- 외래키로 연결할 경우 : 참조테이블(DEPT01)에 데이터를 먼저 INSERT
INSERT INTO DEPT01 VALUES (10,'신림','IT');
INSERT INTO EMP01 VALUES (1000,'홍',9000,10);
DROP TABLE DEPT01; -- 참조하는 테이블이 있을 경우 테이블 삭제 안 됨
COMMIT; -- DML 명령어들을 데이터베이스에 적용

-- 서브쿼리를 이용한 테이블 생성
CREATE TABLE EMP02
    AS
    SELECT * FROM EMP; -- 서브쿼리결과로 EMP02테이블 생성(제약조건 미포함)
SELECT * FROM EMP02;
DESC EMP;
DESC EMP02;

CREATE TABLE EMP03 -- emp의 특정 필드
    AS 
    SELECT EMPNO, ENAME, DEPTNO FROM EMP;
SELECT * FROM EMP03;

CREATE TABLE EMP04 -- EMP의 특정 행(서브쿼리의 WHERE 절로 제한)
    AS
    SELECT * FROM EMP WHERE DEPTNO=10;
SELECT * FROM EMP04;
CREATE TABLE EMP05 -- EMP 구조만 추출(데이터는 추출하지 않고 구조만)
    AS
    SELECT * FROM EMP WHERE 0=1;
SELECT * FROM EMP05;

-- 2. 테이블 구조 변경(ALTER TABLE 테이블명 ADD || MODIFY || DROP COLUMN)
-- (1) 필드 추가(ADD)
SELECT * FROM EMP03; -- EMPNO(수4), ENAME(문10), DEPTNO(수2)
ALTER TABLE EMP03 ADD (JOB VARCHAR2(20), SAL NUMBER(7,2));
SELECT * FROM EMP03;-- 추가된 필드의 데이터는 NULL로
ALTER TABLE EMP03 ADD COMM NUMBER(7,2);
-- (2) 필드 수정(MODIFY)
ALTER TABLE EMP03 MODIFY EMPNO VARCHAR2(4); -- 숫자데이터가 들어있으면 숫자로만 변경
ALTER TABLE EMP03 MODIFY EMPNO NUMBER(5);
ALTER TABLE EMP03 MODIFY EMPNO NUMBER(4);--숫자는 줄이는게 불가
ALTER TABLE EMP03 MODIFY ENAME VARCHAR2(100);
ALTER TABLE EMP03 MODIFY ENAME VARCHAR2(10);--문자데이터필드는 늘이거나 줄이는 거 가능
SELECT MAX(LENGTH(ENAME)) FROM EMP; -- ENAME글자수 최대값
ALTER TABLE EMP03 MODIFY ENAME VARCHAR2(6); -- 가능
ALTER TABLE EMP03 MODIFY ENAME VARCHAR2(5); -- 불가능(데이터보다 작은 자리수)
ALTER TABLE EMP03 MODIFY (SAL VARCHAR2(10), COMM NUMBER(3)); -- NULL필드는 마음대로 수정
-- (3) 필드 삭제 (DROP COLUMN)
ALTER TABLE EMP03 DROP COLUMN JOB;
SELECT * FROM EMP03;
ALTER TABLE EMP03 DROP COLUMN SAL;
ALTER TABLE EMP03 DROP COLUMN ENAME; -- 데이터까지 삭제(취소 불가)
SELECT * FROM EMP03;

-- 3. 테이블 삭제(DROP TABLE 테이블명)
DROP TABLE EMP03;
SELECT * FROM EMP03;
DROP TABLE DEPT01; 
-- EMP01테이블에서 DEPT테이블을 참조할 경우 EMP01을 삭제한 후 DEPT01 테이블 삭제 가능
DROP TABLE EMP01;
DROP TABLE DEPT01;

-- 4. 테이블 모든 데이터 제거(TRUNCATE TABLE 테이블명)
SELECT * FROM EMP02;
TRUNCATE TABLE EMP02; -- ROLLBACK 불가
SELECT * FROM EMP02;

-- 5. 테이블명 변경(RENAME 원테이블명 TO 바꿀테이블명)
RENAME EMP02 TO EMP2;
SELECT * FROM EMP02;
SELECT * FROM EMP2;

-- 6. 데이터 딕셔너리(DB자원을 효율적으로 관리하기 위한 시스템 테이블:접근불가)
--    VS.   데이터 딕셔너리뷰(접근가능한 읽기전용 가상의 테이블)
-- 데이터 딕셔너리 뷰의 종류
  -- (1) USER_xxx : 현계정이 소유하고 있는 객체(테이블, 제약조건, 뷰, 인덱스)
        -- USER_TABLES, USER_CONSTRAINTS, USER_VIEWS, USER_INDEXES
        SELECT * FROM USER_TABLES;
        SELECT * FROM USER_CONSTRAINTS;
        SELECT * FROM USER_VIEWS;
        SELECT * FROM USER_INDEXES;
  -- (2) ALL_xxx : 현 계정에서 접근 가능한 객체(테이블, 제약조건, 뷰, 인덱스)
        -- ALL_TABLES, ALL_CONSTRAINTS, ALL_VIEWS, ALL_INDEXES
        SELECT * FROM ALL_TABLES;
  -- (3) DBA_XXX : DBA권한에서만 접근 가능한 객체
        -- DBA_TABLES, DBA_CONSTRAINTS, DBA_VIEWS, DBA_INDEXES
        SELECT * FROM DBA_TABLES;
        SELECT * FROM DBA_VIEWS;

-- ★ ★ ★ DML ★ ★ ★ --
-- 1. INSERT INTO 테이블명 VALUES (값1, 값2, ...); 모든 필드 데이터 입력
  --  INSERT INTO 테이블명 (필드명1, 필드명2, ..) VALUES (값1, 값2, ..); 언급된 필드외는 NULL로 입력
SELECT * FROM DEPT01;
INSERT INTO DEPT01 VALUES (50, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT01 VALUES (60, 'SALES', NULL); -- 명시적 NULL 데이터 추가
INSERT INTO DEPT01 (DEPTNO, DNAME, LOC) VALUES (70, 'RESEARCH', '신림');
INSERT INTO DEPT01 (LOC, DNAME, DEPTNO) VALUES ('신길','IT',80);
INSERT INTO DEPT01 (DEPTNO, DNAME) VALUES (90, 'OPERATION'); -- 묵시적으로 NULL 추가
SELECT * FROM DEPT01;
-- 서브쿼리를 이용한 INSERT
INSERT INTO DEPT01 SELECT * FROM DEPT WHERE DEPTNO<40;
SELECT * FROM DEPT01;
  -- EX. BOOK(ID는 11, 책이름은 스포츠의 의학, 출판사는 한솔출판, 출판일 오늘, 가격은 90,000
INSERT INTO BOOK 
    VALUES (11, '스포츠의 의학', '한솔출판', SYSDATE, TO_NUMBER('90,000','99,999'));
SELECT * FROM BOOK;
  -- EX. BOOK(ID는 12, 책이름은 스포츠 과학, 출판사는 NULL, 출판일 오늘, 가격은 50,000
INSERT INTO BOOK (BOOKID, BOOKNAME, RDATE, PRICE)
    VALUES (12, '스포츠 과학', SYSDATE, 50000);
SELECT * FROM BOOK;
 -- 트랜젝션 명령어 : DML명령어들을 DB에 적용(COMMIT) + DML명령어들 취소(ROLLBACK)
COMMIT;
INSERT INTO BOOK (BOOKID, BOOKNAME, RDATE, PRICE)
    VALUES (13, '스포츠 과학', SYSDATE, 50000);
ROLLBACK;

-- ※ 연습문제 (pdf 1페이지) ※
DROP TABLE SAM01;
CREATE TABLE SAM01(
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB   VARCHAR2(9),
    SAL   NUMBER(7,2)
);
SELECT * FROM SAM01;
INSERT INTO SAM01 (EMPNO, ENAME, JOB, SAL) 
    VALUES (1000,'APPLE','POLICE',10000);
INSERT INTO SAM01 VALUES (1010,'BANANA','NURSE',15000);
INSERT INTO SAM01 VALUES (1020,'ORANGE','DOCTOR',25000);
INSERT INTO SAM01 (EMPNO, ENAME, SAL) VALUES (1030,'VERY',25000);
INSERT INTO SAM01 VALUES (1040,'CAT',NULL, 2000);
INSERT INTO SAM01 
    SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE DEPTNO=10;
SELECT * FROM SAM01;
COMMIT;

-- 2. UPDATE 테이블명 SET 필드명1=값1 [,필드명2=값2,.. 필드N=값N] [WHERE 조건];
DROP TABLE EMP01;
CREATE TABLE EMP01 AS SELECT EMPNO, ENAME, HIREDATE, SAL, DEPTNO FROM EMP;
    -- EX. 부서번호를 30으로 수정
    UPDATE EMP01 SET DEPTNO=30;
    SELECT * FROM EMP01;
    -- EX. 모든 직원(EMP01)의 급여(SAL)을 10%인상
    UPDATE EMP01 SET SAL=SAL*1.1;
    SELECT * FROM EMP01;
    ROLLBACK;
    -- EX. 10번 부서 직원의 입사일을 오늘로, 부서번호를 30번으로 수정하시오
    UPDATE EMP01 
        SET HIREDATE=SYSDATE, 
            DEPTNO=30 
        WHERE DEPTNO=10;
    SELECT * FROM EMP01;
    -- EX. SAL이 3000인 사원만 급여를 10% 인상시키시오
    UPDATE EMP01 SET SAL=SAL*1.1 WHERE SAL>=3000;
    SELECT * FROM EMP01;
    -- EX. DALLAS에 근무하는 직원의 급여를 1000$ 인상시키시오(서브쿼리)
    UPDATE EMP01 SET SAL=SAL+1000
        WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE LOC='DALLAS');
    -- EX. EMP에서 SCOTT의 부서번호는 30, SAL과 COMM은 500$씩 인상, JOB은 'NAMAGER'
            -- 상사를 'KING'으로 수정
    COMMIT;
    UPDATE EMP SET DEPTNO=30,
                   SAL = SAL + 500,
                   COMM = NVL(COMM,0) + 500,
                   JOB = 'MANAGER',
                   MGR = (SELECT EMPNO FROM EMP WHERE ENAME='KING')
        WHERE ENAME='SCOTT';
    SELECT * FROM EMP WHERE ENAME='SCOTT';
    ROLLBACK;
    -- DEPT01에서 60번 부서의 지역명을 20번 부서 지역명으로 수정
    UPDATE DEPT01 SET LOC = (SELECT LOC FROM DEPT01 WHERE DEPTNO=20)
        WHERE DEPTNO=60;
    SELECT * FROM DEPT01;
    -- EMP01에서 모든 사원의 급여와 입사일을 'KING'의 급여와 입사일로 수정
    UPDATE EMP01 SET SAL=(SELECT SAL FROM EMP01 WHERE ENAME='KING'),
                    HIREDATE=(SELECT HIREDATE FROM EMP01 WHERE ENAME='KING');
    ROLLBACK;
    UPDATE EMP01 
        SET (SAL, HIREDATE)=(SELECT SAL, HIREDATE FROM EMP01 WHERE ENAME='KING');
    SELECT * FROM EMP01;

-- 3. DELETE FROM 테이블명 [WHERE 조건];
SELECT * FROM EMP01;
DELETE FROM EMP01; -- DML명령어는 취소 가능(DDL은 취소 불가)
SELECT * FROM EMP01;
ROLLBACK;
SELECT * FROM DEPT01;

-- DELETE 시 다른 테이블에서 참조하는 데이터는 삭제 불가
DROP TABLE EMP01 CASCADE CONSTRAINTS; -- 참조테이블이 있어도 강제로 테이블 삭제
DROP TABLE DEPT01 CASCADE CONSTRAINTS;
CREATE TABLE DEPT01 (
    DEPTNO NUMBER(2), 
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13),
    PRIMARY KEY(DEPTNO)
);
CREATE TABLE EMP01(
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(10),
    SAL   NUMBER(7,2),
    DEPTNO NUMBER(2) REFERENCES DEPT01(DEPTNO) -- FK
);
-- 외래키로 연결할 경우 : 참조테이블(DEPT01)에 데이터를 먼저 INSERT
INSERT INTO DEPT01 VALUES (10,'신림','IT');
INSERT INTO EMP01 VALUES (1000,'홍',9000,10);
DELETE FROM DEPT01; -- 참조 데이터가 있을 경우 에러
    SELECT * FROM EMP01;
    INSERT INTO EMP01 SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO=10;
    -- 'MILLER' 사원 퇴사
    DELETE FROM EMP01 WHERE ENAME='MILLER';
    -- 10번 부서 직원 삭제
    DELETE FROM EMP01 WHERE DEPTNO=10;
    -- 서브쿼리를 내포한 DELETE문 예제 : 부서명이 SALES인 사원을 삭제
    DELETE FROM EMP01 
        WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='SALES');
    -- SAM01 : JOB이 정해지지 않은 사원 삭제
    DELETE FROM SAM01 WHERE JOB IS NULL;
    -- SAM01 : ENAME이 ORANGE인 사원 삭제
    DELETE FROM SAM01 WHERE ENAME='ORANGE';
    SELECT * FROM SAM01;
    COMMIT;

-- ※ DDL, DML 연습문제 (pdf 2페이지) ※
-- 1. 테이블생성
DROP TABLE MY_DATA;
CREATE TABLE MY_DATA(
    ID NUMBER(4) ,
    NAME VARCHAR2(10),
    USERID VARCHAR2(30),
    SALARY NUMBER(10,2),
    PRIMARY KEY(ID)
);
-- 2. 데이터 입력
INSERT INTO MY_DATA (ID, NAME, USERID, SALARY) 
    VALUES (1, 'Scott', 'sscott', TO_NUMBER('10,000.00', '99,999.99'));
INSERT INTO MY_DATA VALUES (2, 'Ford', 'fford',13000.00);
INSERT INTO MY_DATA VALUES (3, 'Patel', 'ppatel',33000);
INSERT INTO MY_DATA VALUES (4,'Report','rreport',23500);
INSERT INTO MY_DATA  VALUES (5, 'Good', 'ggood',44450);
-- 3. 입력한 자료 확인
SELECT ID, NAME, USERID, TO_CHAR(SALARY, '99,999,999.99') 
    FROM MY_DATA;
-- 4. 트랜젝션 작업 반영
COMMIT;
-- 5. ID가 3인 사람 수정
UPDATE MY_DATA SET SALARY=65000.00 WHERE ID=3;
COMMIT;
-- 6. Ford 삭제
DELETE FROM MY_DATA WHERE NAME='Ford';
COMMIT;
-- 7. SALARY가 15,000이하인 사람의 급여를 15,000으로 변경
UPDATE MY_DATA SET SALARY = 15000 WHERE SALARY <= 15000;
SELECT * FROM MY_DATA;
-- 8 테이블 삭제
DROP TABLE MY_DATA;

-- ※ DML 연습문제 (pdf 3페이지) ※
--1. EMP 테이블과 같은 구조와 같은 내용의 테이블 EMP01을 생성(테이블이 있을시
    -- 제거한 후)하고, 모든 사원의 부서번호를 30번으로 수정합니다.
DROP TABLE EMP01;
CREATE TABLE EMP01 AS SELECT * FROM EMP;
SELECT * FROM EMP01;
UPDATE EMP01 SET DEPTNO=30;
-- 2. EMP01테이블의 모든 사원의 급여를 10% 인상시키는 UPDATE문을 작성
UPDATE EMP01 SET SAL=SAL*1.1;
-- 3. 급여가 3000이상인 사원만 급여를 10%인상
UPDATE EMP01 
    SET SAL=SAL*1.1 
    WHERE SAL>=3000;
-- 4. EMP01테이블에서 ‘DALLAS’에서 근무하는 직원들의 월급을 1000인상
UPDATE EMP01 
        SET SAL= SAL+1000 
    WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE LOC='DALLAS');
-- 5. SCOTT사원의 부서번호는 20번으로, 직급은 MANAGER로 한꺼번에 수정
UPDATE EMP01 
        SET DEPTNO=20, 
            JOB='MANAGER' 
    WHERE ENAME='SCOTT';
-- 6. 부서명이 SALES인 사원을 모두 삭제하는 SQL작성
DELETE FROM EMP01 
    WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='SALES');
-- 7. 사원명이 ‘FORD’인 사원을 삭제하는 SQL 작성
DELETE FROM EMP01 WHERE ENAME='FORD';
-- 8. SAM01 테이블에서 JOB이 NULL인 사원을 삭제하시오
DELETE FROM SAM01 WHERE JOB IS NULL;
-- 9. SAM01테이블에서 ENAME이 ORANGE인 사원을 삭제하시오
DELETE FROM SAM01 WHERE ENAME='ORANGE';
--10. 급여가 1500이하인 사람의 급여를 1500으로 수정
UPDATE EMP01 SET SAL=1500 WHERE SAL<=1500;
-- 11. JOB이 ‘MANAGER’인 사원의 급여를 10%인하하시오
UPDATE EMP01 SET SAL=SAL*0.9 WHERE JOB='MANAGER' ;

-- ★ ★ ★ 제약조건
-- (1) PRIMARY KEY : 테이블의 각 행을 유일한 값으로 식별하기 위한 필드
-- (2) FOREIGN KEY : 데이블의 열이 다른 테이블의 열을 참조
-- (3) NOT NULL : NULL을 미포함
-- (4) UNIQUE : 모든 행의 값이 유일. NULL값은 허용(NULL은 여러개 입력 가능)
-- (5) CHECK(조건) : 해당 조건이 만족(NULL값 허용)
-- DEFAULT 기본값 : 기본값 설정(INSERT 시 해당 열을 입력하지 않으면 NULL이 아닌 기본값으로 입력)

-- 설계된 DEPT1 & EMP1 테이블
DROP TABLE EMP1;
DROP TABLE DEPT1;
CREATE TABLE DEPT1 (
    DEPTNO NUMBER(2) PRIMARY KEY,
    DNAME  VARCHAR2(14) NOT NULL UNIQUE,
    LOC    VARCHAR2(13) NOT NULL
);
CREATE TABLE EMP1(
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(10) NOT NULL,
    JOB   VARCHAR2(9)  NOT NULL,
    MGR   NUMBER(4),
    HIREDATE DATE DEFAULT SYSDATE,
    SAL   NUMBER(7,2) CHECK(SAL>0),
    COMM  NUMBER(7,2) CHECK(COMM>=0),
    DEPTNO NUMBER(2),
    FOREIGN KEY(DEPTNO) REFERENCES DEPT1(DEPTNO)
);
INSERT INTO EMP1 (EMPNO, ENAME, JOB, DEPTNO)
    VALUES (1001, 'HONG', 'MANAGER', 10);-- 에러(10번부서 참조 오류)
INSERT INTO DEPT1 SELECT * FROM DEPT;
SELECT * FROM DEPT;
INSERT INTO DEPT1 (DEPTNO, LOC, DNAME) VALUES (40, '신림', 'IT'); -- PRIMARY KEY 오류
INSERT INTO DEPT1 VALUES (50, 'SALES', '신림'); -- UNIQUE 오류
INSERT INTO DEPT1 VALUES (50, 'IT', NULL); -- NOT NULL 오류
INSERT INTO DEPT1 (DEPTNO, DNAME) VALUES (50, 'IT'); -- NOT NULL 오류
SELECT * FROM EMP1;
INSERT INTO EMP1 (EMPNO, ENAME, JOB, DEPTNO) 
    VALUES (1001, 'HONG', 'MANAGER', 10); -- HIREDATE에는 DEFAULT값 입력
INSERT INTO EMP1 (EMPNO, JOB, DEPTNO) VALUES (1002, 'MANAGER', 10); -- NOT NULL 오류
INSERT INTO EMP1 (EMPNO, ENAME, JOB, SAL, COMM, DEPTNO)
    VALUES (1002, 'LEE', 'MANAGER', 10, -1, 20); -- CHECK 오류
INSERT INTO EMP1 (EMPNO, ENAME, JOB, HIREDATE, SAL, DEPTNO)
    VALUES (1003, 'PARK', 'MANAGER', '24/01/01', 1000, 20);
-- SCOTT 화면 -- 
-- ★ ★ ★ DCL : 계정생성, 권한부여, 권한박탈, 계정삭제 ★ ★ ★ --
CREATE USER scott2 IDENTIFIED BY tiger;
GRANT CREATE SESSION TO scott2; -- 로그인 권한 부여
GRANT CREATE TABLE TO scott2; -- 테이블 생성 권한 부여
GRANT ALL ON EMP TO scott2; -- EMP 테이블에 대한 모든 권한 부여
select * from emp;
REVOKE ALL ON EMP FROM scott2; -- emp테이블에 대한 모든 권한 박탈
DROP USER scott2 CASCADE; -- 사용자 계정 삭제

-- ※ DDL, DML 연습문제 (pdf 4~5페이지) ※
DROP TABLE BOOK;
DROP TABLE BOOKCATEGORY;
CREATE TABLE BOOKCATEGORY (
    cCODE NUMBER(3) PRIMARY KEY,
    cNAME VARCHAR2(100) NOT NULL UNIQUE,
    OFFICE_LOC VARCHAR2(100)
);
CREATE TABLE BOOK(
    cCODE     NUMBER(3), 
    bNO       VARCHAR2(20),
    bNAME     VARCHAR2(60) NOT NULL,
    PUBLISHER VARCHAR2(50),
    PUBYEAR   NUMBER(4) DEFAULT TO_CHAR(SYSDATE, 'YYYY'),
    FOREIGN KEY(cCODE) REFERENCES BOOKCATEGORY(cCODE),
    PRIMARY KEY(bNO)
);
-- 데이터 INSERT
INSERT INTO BOOKCATEGORY (cCODE, cNAME, OFFICE_LOC)
    VALUES (100, '철학','3층 인문실');
INSERT INTO BOOKCATEGORY VALUES (400, 'IT', '4층 과학실');
INSERT INTO BOOK (cCODE, bNO, BNAME, PUBLISHER)
    VALUES (100, '100A01','철학자의 삶','MBC출판');
INSERT INTO BOOK VALUES (400, '400A01','이것이 DB다','다음출판',2022);
-- 데이터 출력
SELECT BNO, BNAME, PUBLISHER, PUBYEAR, CNAME, OFFICE_LOC
    FROM BOOKCATEGORY C, BOOK B
    WHERE C.cCODE=B.cCODE;

-- ※ DDL, DML 연습문제 (pdf 6~7페이지) ※
-- MAJOR & STUDENT 테이블 생성, 데이터 입력, 출력 (SQL활용 평가 문제)
-- DROP 순서는 자식 테이블부터
DROP TABLE STUDENT;
DROP TABLE MAJOR;

CREATE TABLE MAJOR(
    mCODE NUMBER(2) PRIMARY KEY,
    mNAME VARCHAR2(30) UNIQUE,
    mOFFICE VARCHAR2(50));
CREATE TABLE STUDENT(
    SNO VARCHAR2(3) PRIMARY KEY,
    sNAME VARCHAR2(50) ,
    sSCORE NUMBER(3) CHECK (sSCORE BETWEEN 1 AND 100),
    mCODE NUMBER(2) REFERENCES MAJOR(mCODE) );
    
DROP TABLE STUDENT;
DROP TABLE MAJOR;
CREATE TABLE MAJOR(
    mCODE NUMBER(2),
    mNAME VARCHAR2(50),
    mOFFICE VARCHAR2(255),
    PRIMARY KEY(mCODE), 
    UNIQUE(mNAME));
CREATE TABLE STUDENT(
    SNO VARCHAR2(10),
    sNAME VARCHAR2(50),
    sSCORE NUMBER(3),
    mCODE NUMBER(2),
    PRIMARY KEY(sNO),
    CHECK (sSCORE>=1 AND sSCORE<=100),
    FOREIGN KEY(mCODE) REFERENCES MAJOR(mCODE));
INSERT INTO MAJOR VALUES (1, '컴퓨터공학','A101호');
INSERT INTO MAJOR VALUES (2, '빅데이터','A102호');
SELECT * FROM MAJOR;
INSERT INTO STUDENT VALUES ('101','홍길동', 99, 1);
INSERT INTO STUDENT VALUES ('102','신길동',100, 2);
INSERT INTO STUDENT VALUES ('103','신길동',-9, 2); -- CHECK 제약조건
INSERT INTO STUDENT VALUES ('104','신길동',90, 3);  -- FOREIGN KEY 제약조건
INSERT INTO STUDENT VALUES (102, '박길동', 90, 2);-- PRIMARY KEY 제약조건=(NOT NULL+UNIQUE)
INSERT INTO STUDENT VALUES (NULL, '박길동', 90, 2);-- PRIMARY KEY 제약조건=(NOT NULL+UNIQUE)
SELECT S.*, MNAME, MOFFICE
    FROM STUDENT S, MAJOR M 
    WHERE S.MCODE=M.MCODE;
UPDATE STUDENT SET SSCORE=100, MCODE=2
    WHERE SNO='101';
SELECT * FROM STUDENT;
DELETE FROM STUDENT WHERE SNO='101';