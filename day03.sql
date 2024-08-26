--10번 및 30번 부서에 속하는 모든 사원 중 급여가 1500을 넘는 사원의
--사원번호, 이름 및 급여를 조회하세요 

SELECT EMPLOYEE_ID ,FIRST_NAME,SALARY FROM EMPLOYEES
WHERE DEPARTMENT_ID IN(10,30) AND SALARY > 1500;

--관리자가 없는 모든 사원에 이름 및 직종을 출력하세요
--MANAGER_ID 
SELECT FIRST_NAME, JOB_ID FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

--직업이 IT_PROG 또는 SA_MAN이면서 급여가 1000,3000,5000이 아닌 사원들의
--이름, 직종 및 급여를 조회하세요

SELECT FIRST_NAME,JOB_ID,SALARY FROM EMPLOYEES
WHERE JOB_ID IN ('IT_PROG','SA_MAN') AND SALARY NOT IN (1000,3000,5000);

--TBL_STUDENT
--학번, 이름, 전공, 성별, 생일
--BAN_CHAR 체크 제약조건 위배 
INSERT INTO TBL_STUDENT (ID,NAME,MAJOR,GENDER,BIRTH)
VALUES (0,'홍길동','컴퓨터공학과','M','1980-01-02');

--BAN_CHAR 체크 제약조건 위배 
--INSERT INTO TBL_STUDENT (ID,NAME,MAJOR,GENDER,BIRTH)
--VALUES (0,'홍길동','컴퓨터공학과','M','1979-01-02');

INSERT INTO TBL_STUDENT (ID,NAME,MAJOR,GENDER,BIRTH)
VALUES (1,'박디비','컴퓨터공학과','W','1990-02-06');

SELECT *FROM TBL_STUDENT;

--DEFAULT값 사용해보기 
INSERT INTO TBL_STUDENT (ID,NAME,MAJOR,BIRTH)
VALUES (2,'홍길동','컴퓨터공학과','1994-08-26');

--INSERT할때 컬럼명을 생략하면 DEFAULT값을 넣을 수 없다. 
INSERT INTO TBL_STUDENT
VALUES (3,'이자바','컴퓨터공학과','M','1994-08-26');

--FLOWER테이블에 데이터 넣기
--꽃이름, 꽃색깔, 가격 (장미꽃,빨간색,3000)

INSERT INTO FLOWER VALUES('장미꽃','빨간색','3000');
INSERT INTO FLOWER VALUES('해바라기','노란색','2000');
INSERT INTO FLOWER VALUES('튤립','흰색','4000');

SELECT *FROM FLOWER;

--POT테이블에 데이터 추가하기 
--화분번호, 화분색깔, 화분모양, 꽃이름
--화분테이블에 데이터를 추가할 때 꽃 테이블에 있는 꽃만 추가할 수 있다.
INSERT INTO POT VALUES(202408260001,'검은색','사각형','장미꽃');

CREATE TABLE FLOWER2(
    F_NAME2 VARCHAR2(200) PRIMARY KEY,
    F_COLOR2 VARCHAR2(100),
    F_PRICE2 NUMBER
);

--다른 테이블에 있는 데이터를 조회해서 추가하는 것이 가능하다. 
INSERT INTO FLOWER2(F_NAME2, F_COLOR2,F_PRICE2)
SELECT F_NAME, F_COLOR, F_PRICE
FROM FLOWER;

SELECT * FROM FLOWER2;

--여러 테이블에 한번에 데이터를 추가하는 것도 가능 
INSERT ALL
  INTO FLOWER VALUES('개나리','노란색',5000)
  INTO FLOWER2 VALUES ('계란꽃','흰색',7000)
SELECT *FROM DUAL;

SELECT *FROM FLOWER f;
SELECT *FROM FLOWER2 f;

--삭제
SELECT * FROM POT;

DELETE FROM POT
WHERE F_NAME='장미꽃';

SELECT * FROM FLOWER;

DELETE FROM FLOWER
WHERE F_NAME='장미꽃';

--PK와 FK로 연결된 테이블에서 외래키로 참조되고 있는 데이터는
--부모테이블에서 삭제가 불가능하다. (자식테이블에서 먼저 삭제 후 부모테이블에서 사용가능)

--STUDENT테이블에서 이름이 홍길동인 사람 삭제하기
DELETE FROM TBL_STUDENT
WHERE NAME = '홍길동';

SELECT * FROM TBL_STUDENT;

--학생테이블에서 학번 1번인 학생의 이름을 홍길동으로, 성별을 남자로 수정하기

UPDATE TBL_STUDENT 
SET NAME = '홍길동',
GENDER ='M'
WHERE ID = 1;

--회원과 관련된 기능
--로그인->SELECT
--회원가입-> INSERT
--회원정보수정->UPDATE 
--회원탈퇴->DELETE 

--상품과 관련된 기능
--검색->SELECT
--상품추가->INSERT
--재고수정(100->99) ->UPDATE
--상품숙제->DELETE 

--C (CREATE,INSERT) R(READ,SELECT) U(UPDATE) D(DELETE)

--사원테이블에서 급여를 많이 받는 순서 대로 사번,이름,급여, 입사일순으로 출력하되
--급여가 같은경우 입사가 빠른 순으로 정렬해주세요 

SELECT EMPLOYEE_ID,FIRST_NAME,SALARY,HIRE_DATE 
FROM EMPLOYEES
ORDER BY SALARY DESC, HIRE_DATE ASC;
--컬럼의 순서를 알고 있다면 번호로 정렬할 수 있다. 
--ORDER BY '8' DESC, '6' ASC;

--사원테이블에서 부서번호가 빠른순, 부서번호가 같다면 직종이 빠른순,직종도 같다면 급여를 
--많이 받는 순으로 정렬하여 사번,이름,부서번호,직종,급여순으로 출력

SELECT EMPLOYEE_ID,FIRST_NAME,DEPARTMENT_ID,JOB_ID,SALARY
FROM EMPLOYEES e 
ORDER BY DEPARTMENT_ID,JOB_ID ,SALARY DESC;

--입사일이 빠른순으로 급여가 15000이상인 사원들의 사번,이름,급여,입사일을 조회 

SELECT EMPLOYEE_ID,FIRST_NAME,SALARY,HIRE_DATE
FROM EMPLOYEES
WHERE SALARY > 15000
ORDER BY HIRE_DATE;

--문자와 관련된 함수 

--ASCII()
--지정된 문자의 ASCII값을 반환한다.
SELECT ASCII('A') FROM DUAL;

--CHR()
--지정된 숫자의 ASCII문자를 반환한다.
SELECT CHR(65) FROM DUAL;

--RPAD(데이터,고정길이,문자)
--데이터를 왼쪽으로 몰아서 정렬 후 생긴 빈 공백에 특정 문자를 채워 반환
SELECT RPAD(DEPARTMENT_NAME,10,'*') FROM DEPARTMENTS;

-- LPAD(데이터,고정길이,문자)
-- 데이터를 오른쪽으로 몰아서 정렬 후 생긴 빈 공백에 특정문자를 채워 반환 
SELECT LPAD(DEPARTMENT_NAME,10,'*') FROM DEPARTMENTS;

-- TRIM() : 문자열 공백 문자들을 삭제한다
SELECT TRIM('  TRIM  ') FROM DUAL;

-- RTRIM()
-- 오른쪽 공백제거
-- LTRIM()
-- 왼쪽 공백 제거 

-- INSTR()
-- 특정문자의 위치를 반환
SELECT INSTR('HELLOW', 'O') FROM DUAL;

--INSTR(데이터,찾을문자,검색위치,몇번째 나오는지)
SELECT INSTR('HELLOW', 'L',1,2) FROM DUAL;

--찾는 문자열이 없으면 0을 반환한다.
SELECT INSTR('HELLOW', 'Z') FROM DUAL;

--initcap()
--첫 문자를 대문자로 변환하는 함수 (공백이나 / 를 구분자로 인식)
SELECT INITCAP('good morning') FROM dual;

--length()
--주어진 문자열의 길이를 반환
SELECT LENGTH ('JHON') FROM DUAL;

--CONCAT()
--주어진 두 문자열을 연결
SELECT CONCAT('HELLOW','WORLD')FROM DUAL;

-- SUBSTR()
-- 문자열의 시작 위치부터 길이만큼 자른 후 변환
-- 길이는 생략 가능하며, 생략 시 문자열의 끝까지 반환한다. 
SELECT SUBSTR('Hello oracle', 2), substr('Hello Oracle',7,5)
FROM dual;

-- REPLACE(데이터,원래글자,바꿀글자)
SELECT REPLACE('GOOD MORNING','MORNING','EVENING') FROM DUAL;

--UPPER() : 주어진 문자열을 전부 대문자로 바꾼다. 
--LOWER() : 주어진 문자열을 전부 소문자로 바꾼다. 
SELECT UPPER('good mornig') FROM dual;
SELECT LOWER('GOOD MORNIG') FROM dual;

--테이블 만들어야되는데 못만듬.. 문제만이라도 보기 

--NO가 1000인 데이터의 PRICE 20 증가시키세요
--UPDATE PRODUCT2 SET 
--PRICE = PRICE + 20
--WHERE "NO" = 1000;

--NAME '세탁기'인 데이터를 모두 삭제하세요 
--DELETE FROM PRODUCT2
--WHERE NAME = '세탁기';

--SELECT * FROM PRODUCT2 ORDER BY PRICE DESC;

--1. 정규화의 필요성으로 거리가 먼 것은? 2

--1) 데이터 구조의 안정성 최대화
--2) 중복 데이터의 활성화
--3) 데이터 수정, 삭제 시 이상현상의 최소화
--4) 테이블 불일치 위험의 최소화

--2. 관계 데이터베이스의 정규화에 대한 설명으로 옳지 않은 것은? 2 

--1) 정규화를 거치지 않으면 여러 가지 다른 종류의 정보가 하나의 릴레이션에 표현되기 때문에 릴레이션을 조작할 때 이상현상이 발생할 수 있다.
--2) 정규화의 목적은 각 릴레이션에 분산된 종속성을 하나의 릴레이션에 통합하는 것이다.->통합이 아니라 쪼개는것
--3) 이상현상은 속성 간에 존재하는 함수 종속성이 원인이다.
--4) 정규화가 잘못되면 데이터의 불필요한 중복을 야기하여 릴레이션을 조작할 때 문제가 된다.

--3. 제2정규형에서 제3정규형이 되기 위한 조건은? 1

--1) 이행적 함수 종속을 제거해야 한다.
--2) 부분 함수 종속을 제거해야 한다.
--3) 다치종속을 제거해야 한다.
--4) 결정자가 후보키가 아닌 함수적 종속을 제거해야 한다.

-->도메인 원자값,부분종속제거,이행 종속제거

--데이터베이스 설계 순서로 옳은 것은?
--2.요구사항 분석 → 개념적 모델링 → 논리적 모델링 → 물리적 모델링 → 데이터베이스 구현

--스키마에 대해 아는대로 쓰시오 
--데이터베이스의 제약 조건에 대해 전반적인 명세를 기술한것
--개념: 전체적인 뷰
--내부: 데이터를 어디에 저장을 할것인가
--외부: 사용자 입장에서 어떻게 사용할 것인가 




















































