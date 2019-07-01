-- 1. 조회년월의 급여 현황 조회(부서명칭, 사원이름순 정렬)
    SELECT D.DEPT_NAME
           , E.EMP_NAME
           , REGEXP_REPLACE(REVERSE(REGEXP_REPLACE(REVERSE(TO_CHAR(S.SALARY)), '([0-9]{3})', '\1,')), '^,', '') AS SALARY
      FROM TA_EMP E
           , TA_SALARY S
           , TA_DEPT D
     WHERE E.EMP_CODE = S.EMP_CODE
       AND S.DEPT_CODE = D.DEPT_CODE
       AND YYYYMM = TO_CHAR(TO_DATE('2018-03', 'YYYY-MM'), 'YYYYMM')
  ORDER BY D.DEPT_NAME, E.EMP_NAME;


-- 2. 조회년월의 급여 현황 및 부서별 합계 조회 (부서명칭, 사원이름순 정렬)
WITH EMP_INFO AS(
    SELECT D.DEPT_NAME
           , E.EMP_NAME
           , S.SALARY
      FROM TA_EMP E
           , TA_SALARY S
           , TA_DEPT D
     WHERE E.EMP_CODE = S.EMP_CODE
       AND S.DEPT_CODE = D.DEPT_CODE
       AND YYYYMM = TO_CHAR(TO_DATE('2018-03', 'YYYY-MM'), 'YYYYMM')
)
  SELECT DEPT_NAME
         , NVL(EMP_NAME, '합계') EMP_NAME
         , REGEXP_REPLACE(REVERSE(REGEXP_REPLACE(REVERSE(TO_CHAR(SUM(SALARY))), '([0-9]{3})', '\1,')), '^,', '') AS SALARY
    FROM EMP_INFO
GROUP BY ROLLUP(DEPT_NAME, EMP_NAME)
  HAVING DEPT_NAME IS NOT NULL
  ORDER BY DEPT_NAME;
	 
	 
-- 3. 조회년도 기준 부서별 전월/당월/전년 동월 급여를 조회
--[1번 방식 : 전월/당월/전년 가상테이블을 만들고 조인시켜 하는 방식]
WITH MASTER_SAL AS(
	  SELECT E.DEPT_CODE
			 , COUNT(E.EMP_CODE) EMP_CNT
			 , D.DEPT_NAME
		FROM TA_EMP E
			 , TA_DEPT D
	   WHERE E.DEPT_CODE = D.DEPT_CODE
	GROUP BY E.DEPT_CODE
			 , D.DEPT_NAME
ORDER BY E.DEPT_CODE
), PM_DEPT_SAL AS(
	  SELECT D.DEPT_CODE
			 , SUM(S.SALARY) SALARY
		FROM TA_SALARY S
			 , TA_DEPT D
	   WHERE S.DEPT_CODE = D.DEPT_CODE
		 AND YYYYMM = TO_CHAR(ADD_MONTHS(TO_DATE('2018-03', 'YYYY-MM'), -1), 'YYYYMM')
	GROUP BY D.DEPT_CODE, D.DEPT_NAME
), TM_DEPT_SAL AS(
	  SELECT D.DEPT_CODE
			 , SUM(S.SALARY) SALARY
		FROM TA_SALARY S
			 , TA_DEPT D
	   WHERE S.DEPT_CODE = D.DEPT_CODE
		 AND YYYYMM = TO_CHAR(ADD_MONTHS(TO_DATE('2018-03', 'YYYY-MM'), 0), 'YYYYMM')
	GROUP BY D.DEPT_CODE
), PYM_DEPT_SAL AS(
	  SELECT D.DEPT_CODE
			 , SUM(S.SALARY) SALARY
		FROM TA_SALARY S
			 , TA_DEPT D
	   WHERE S.DEPT_CODE = D.DEPT_CODE
		 AND YYYYMM = TO_CHAR(ADD_MONTHS(TO_DATE('2018-03', 'YYYY-MM'), -12), 'YYYYMM')
	GROUP BY D.DEPT_CODE
)
  SELECT NVL(MS.DEPT_NAME, '합계') AS DEPT_NAME
         , SUM(MS.EMP_CNT) AS EMP_CNT
         , REGEXP_REPLACE(REVERSE(REGEXP_REPLACE(REVERSE(TO_CHAR(SUM(PM.SALARY))), '([0-9]{3})', '\1,')), '^,', '') AS PMS
         , REGEXP_REPLACE(REVERSE(REGEXP_REPLACE(REVERSE(TO_CHAR(SUM(TM.SALARY))), '([0-9]{3})', '\1,')), '^,', '') AS TMS
         , REGEXP_REPLACE(REVERSE(REGEXP_REPLACE(REVERSE(TO_CHAR(SUM(PYM.SALARY))), '([0-9]{3})', '\1,')), '^,', '') AS PYMS
    FROM PM_DEPT_SAL PM
         , TM_DEPT_SAL TM
         , PYM_DEPT_SAL PYM
         , MASTER_SAL MS
   WHERE MS.DEPT_CODE = PM.DEPT_CODE
     AND MS.DEPT_CODE = TM.DEPT_CODE
     AND MS.DEPT_CODE = PYM.DEPT_CODE
GROUP BY ROLLUP(MS.DEPT_NAME);

--[2번 방식 : DECODE를 이용하여 전월/당월/전년 피벗하는 방식]
WITH STEP_1 AS(-- 전월/당월/전년 데이터
    SELECT S.YYYYMM
           , D.DEPT_CODE
           , D.DEPT_NAME
           , S.EMP_CODE
           , S.SALARY
      FROM TA_SALARY S
           , TA_DEPT D
     WHERE S.DEPT_CODE = D.DEPT_CODE
       AND
           (
                  YYYYMM = TO_CHAR(ADD_MONTHS(TO_DATE('2018-03', 'YYYY-MM'), -1), 'YYYYMM')
               OR YYYYMM = TO_CHAR(ADD_MONTHS(TO_DATE('2018-03', 'YYYY-MM'), 0), 'YYYYMM')
               OR YYYYMM = TO_CHAR(ADD_MONTHS(TO_DATE('2018-03', 'YYYY-MM'), -12), 'YYYYMM')
           )
), STEP_2 AS(-- 전월/당월/전년 합계
      SELECT YYYYMM
             , DEPT_CODE
             , DEPT_NAME
             , COUNT(DEPT_NAME) EMP_CNT
             , SUM(SALARY) SALARY
        FROM STEP_1
    GROUP BY YYYYMM
             , DEPT_NAME
             , DEPT_CODE
), STEP_3 AS(-- 전월/당월/전년 피벗
    SELECT DEPT_NAME
           , EMP_CNT
           , DEPT_CODE
           , DECODE(YYYYMM, TO_CHAR(ADD_MONTHS(TO_DATE('2018-03', 'YYYY-MM'), -1), 'YYYYMM'), SALARY, NULL) PMS
           , DECODE(YYYYMM, TO_CHAR(ADD_MONTHS(TO_DATE('2018-03', 'YYYY-MM'), 0), 'YYYYMM'), SALARY, NULL) TMS
           , DECODE(YYYYMM, TO_CHAR(ADD_MONTHS(TO_DATE('2018-03', 'YYYY-MM'), -12), 'YYYYMM'), SALARY, NULL) PYMS
      FROM STEP_2
), STEP_4 AS(-- 피벗 정렬
      SELECT DEPT_NAME
             , EMP_CNT
             , MAX(PMS) PMS
             , MAX(TMS) TMS
             , MAX(PYMS) PYMS
        FROM STEP_3
    GROUP BY DEPT_NAME
             , EMP_CNT
             , DEPT_CODE
    ORDER BY DEPT_NAME
), STEP_5 AS(-- 부서 합계
      SELECT NVL(DEPT_NAME, '합계') AS DEPT_NAME
             , SUM(EMP_CNT) AS EMP_CNT
             , REGEXP_REPLACE(REVERSE(REGEXP_REPLACE(REVERSE(TO_CHAR(SUM(PMS))), '([0-9]{3})', '\1,')), '^,', '') AS PMS
             , REGEXP_REPLACE(REVERSE(REGEXP_REPLACE(REVERSE(TO_CHAR(SUM(TMS))), '([0-9]{3})', '\1,')), '^,', '') AS TMS
             , REGEXP_REPLACE(REVERSE(REGEXP_REPLACE(REVERSE(TO_CHAR(SUM(PYMS))), '([0-9]{3})', '\1,')), '^,', '') AS PYMS
        FROM STEP_4
    GROUP BY ROLLUP(DEPT_NAME)
)
SELECT *
  FROM STEP_5