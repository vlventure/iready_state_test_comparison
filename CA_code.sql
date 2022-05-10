/* import table into sql*/

COPY "CA_state_test"("student_id", "grade", "state_ela_score", "state_ela_proficiency", 
				  "state_math_score", "state_math_proficiency")
FROM '/Users/veronicaventure/Desktop/Copy of Candidate Programming Project - Data/State Test Scores-Table 1.csv'
DELIMITER ','
CSV HEADER;

COPY "iready_test"("subject", "school_id", "user_id", "grade", 
				   "iready_score", "iready_placement")
FROM '/Users/veronicaventure/Desktop/Copy of Candidate Programming Project - Data/i-Ready Scores-Table 1 copy.csv'
DELIMITER ','
CSV HEADER;

/*data cleaning process*/

/* check if id matches grade for state_test data */

SELECT CAST(student_id AS character varying), 
CAST(grade AS character varying) 
FROM "CA_state_test"
WHERE 
CAST(student_id AS character varying) LIKE '___3%' AND 
CAST(grade AS character varying) != '3'
OR
CAST(student_id AS character varying) LIKE '___4%' AND 
CAST(grade AS character varying) != '4'
OR
CAST(student_id AS character varying) LIKE '___5%' AND 
CAST(grade AS character varying) != '5'
OR
CAST(student_id AS character varying) LIKE '___6%' AND 
CAST(grade AS character varying) != '6'
OR
CAST(student_id AS character varying) LIKE '___7%' AND 
CAST(grade AS character varying) != '7'
OR
CAST(student_id AS character varying) LIKE '___8%' AND 
CAST(grade AS character varying) != '8';

SELECT CAST(student_id AS character varying), 
CAST(grade AS character varying) 
FROM "CA_state_test"
WHERE 
CAST(student_id AS character varying) LIKE '____3%' AND 
CAST(grade AS character varying) != '3'
OR
CAST(student_id AS character varying) LIKE '____4%' AND 
CAST(grade AS character varying) != '4'
OR
CAST(student_id AS character varying) LIKE '____5%' AND 
CAST(grade AS character varying) != '5'
OR
CAST(student_id AS character varying) LIKE '____6%' AND 
CAST(grade AS character varying) != '6'
OR
CAST(student_id AS character varying) LIKE '____7%' AND 
CAST(grade AS character varying) != '7'
OR
CAST(student_id AS character varying) LIKE '____8%' AND 
CAST(grade AS character varying) != '8';

/* there are 8 ids that do not match the grade*/

/* update table so that grade matches id */
UPDATE "CA_state_test"
SET grade = 3
WHERE student_id = 30030024;


UPDATE "CA_state_test"
SET grade = 6
WHERE student_id = 30060024;

UPDATE "CA_state_test"
SET grade = 7
WHERE student_id = 70070010;


UPDATE "CA_state_test"
SET grade = 3
WHERE student_id = 130030014;

UPDATE "CA_state_test"
SET grade = 5
WHERE student_id = 130050009;

UPDATE "CA_state_test"
SET grade = 8
WHERE student_id = 170080014;

UPDATE "CA_state_test"
SET grade = 3
WHERE student_id = 180030019;


UPDATE "CA_state_test"
SET grade = 7
WHERE student_id = 190070024;

/* check if scores are within ranges*/
SELECT MAX(state_ela_score) as max_ela, MIN(state_ela_score) as min_ela,
MAX(state_math_score) as max_math, MIN(state_math_score) as min_math
FROM 
"CA_state_test";
/* check how many math scores are greater than 120 */
SELECT * FROM "CA_state_test"
WHERE state_math_score > 120;

/* set NULL */
UPDATE "CA_state_test"
SET state_math_score = NULL
WHERE state_math_score = 199;

UPDATE "CA_state_test"
SET state_math_proficiency = NULL
WHERE state_math_score is NULL;


/* check that proficiency matches score*/
SELECT * FROM "CA_state_test"
WHERE state_ela_score >=60 AND state_ela_proficiency !=1
OR state_ela_score <60 AND state_ela_proficiency !=0
OR state_math_score >=60 AND state_math_proficiency !=1
OR state_math_score <60 AND state_math_proficiency !=0;

/*update table*/

UPDATE "CA_state_test"
SET state_ela_proficiency = 1
WHERE student_id = 90060007;


/* go through similar process with iready_test table*/

SELECT CAST(user_id AS character varying), 
CAST(grade AS character varying) 
FROM iready_test
WHERE 
CAST(user_id AS character varying) LIKE '___3%' AND 
CAST(grade AS character varying) != '3'
OR
CAST(user_id AS character varying) LIKE '___4%' AND 
CAST(grade AS character varying) != '4'
OR
CAST(user_id AS character varying) LIKE '___5%' AND 
CAST(grade AS character varying) != '5'
OR
CAST(user_id AS character varying) LIKE '___6%' AND 
CAST(grade AS character varying) != '6'
OR
CAST(user_id AS character varying) LIKE '___7%' AND 
CAST(grade AS character varying) != '7'
OR
CAST(user_id AS character varying) LIKE '___8%' AND 
CAST(grade AS character varying) != '8';

Update iready_test
Set grade = 3
WHERE user_id = 30030024;

SELECT CAST(user_id AS character varying), 
CAST(grade AS character varying) 
FROM iready_test
WHERE 
CAST(user_id AS character varying) LIKE '____3%' AND 
CAST(grade AS character varying) != '3'
OR
CAST(user_id AS character varying) LIKE '____4%' AND 
CAST(grade AS character varying) != '4'
OR
CAST(user_id AS character varying) LIKE '____5%' AND 
CAST(grade AS character varying) != '5'
OR
CAST(user_id AS character varying) LIKE '____6%' AND 
CAST(grade AS character varying) != '6'
OR
CAST(user_id AS character varying) LIKE '____7%' AND 
CAST(grade AS character varying) != '7'
OR
CAST(user_id AS character varying) LIKE '____8%' AND 
CAST(grade AS character varying) != '8';

UPDATE iready_test
SET grade = 3
WHERE user_id = 180030019;

UPDATE iready_test
SET grade = 8
WHERE user_id = 170080014;


SELECT MIN(iready_score), MAX(iready_score) FROM iready_test;

/* check for scores out of range*/

SELECT * FROM iready_test
WHERE iready_score <100 OR iready_score >800;

/* update scores out of range*/
UPDATE iready_test
SET iready_score = NULL
WHERE user_id = 30050022 AND subject ='ela';


UPDATE iready_test
SET iready_score = NULL
WHERE user_id = 40050003 AND subject ='math';

/*prepare data for join*/

/* create table with only ela */
SELECT * INTO iready_ela FROM iready_test WHERE SUBJECT = 'ela';

/*create table with only math */
SELECT * INTO iready_ela FROM iready_test WHERE SUBJECT = 'math';

/* update column names */

ALTER TABLE iready_ela
RENAME iready_score TO iready_ela_score;
ALTER TABLE iready_ela
RENAME iready_placement TO iready_ela_placement;
ALTER TABLE iready_math
RENAME iready_score TO iready_math_score;
ALTER TABLE iready_math
RENAME iready_placement TO iready_math_placement;

/*join Iready ela and math tables */

SELECT iready_ela.school_id, iready_ela.user_id, iready_ela.grade, iready_ela_score,
iready_ela_placement, iready_math_score, iready_math_placement
FROM iready_ela INNER JOIN iready_math 
ON iready_ela.user_id = iready_math.user_id

CREATE TABLE iready_ela_math AS 
	SELECT iready_ela.school_id, iready_ela.user_id, iready_ela.grade, iready_ela_score,
		iready_ela_placement, iready_math_score, iready_math_placement
	FROM iready_ela INNER JOIN iready_math 
	ON iready_ela.user_id = iready_math.user_id;

/* do all the tables have the same number of rows? */
SELECT COUNT(user_id)
FROM iready_math; /* 2993*/

SELECT COUNT(user_id)
FROM iready_ela; /*2995*/

SELECT COUNT(student_id)
FROM "CA_state_test"; /*2998*/

SELECT COUNT(user_id)
FROM iready_ela_math; /*2992*/


/* ids that appear in iready_ela but not iready_math*/
SELECT iready_ela.user_id FROM iready_ela
LEFT JOIN iready_math 
ON iready_ela.user_id = iready_math.user_id
WHERE iready_math.user_id is NULL; /* 50060004, 90080020, 150080023*/



/* ids that appear in iready_math but not iready_ela*/
SELECT iready_math.user_id FROM iready_math
LEFT JOIN iready_ela 
ON iready_math.user_id = iready_ela.user_id
WHERE iready_ela.user_id is NULL; /* 30060001*/


/* ids that appear in iready_ela_math but not CA_state_test*/
SELECT iready_ela_math.user_id FROM iready_ela_math
LEFT JOIN "CA_state_test"
ON iready_ela_math.user_id = "CA_state_test".student_id
WHERE "CA_state_test".student_id is NULL; /* 30070014, 80080020*/

/* ids that appear in CA_state_test but not iready_ela_math*/
SELECT "CA_state_test".student_id FROM "CA_state_test"
LEFT JOIN iready_ela_math
ON "CA_state_test".student_id = iready_ela_math.user_id
WHERE iready_ela_math.user_id is NULL; /* 30060001, 50060004, 90030001, 90080020, 120060009
										130050017, 140030001, 150080023 */



/*INNER JOIN TABLES*/


CREATE TABLE state_iready AS 
SELECT "CA_state_test".student_id, iready_ela_math.school_id, 
		iready_ela_math.grade, "CA_state_test".state_ela_score, 
		"CA_state_test".state_ela_proficiency, "CA_state_test".state_math_score,
		"CA_state_test".state_math_proficiency, iready_ela_math.iready_ela_score,
		iready_ela_math.iready_ela_placement, iready_ela_math.iready_math_score,
		iready_ela_math.iready_math_placement
FROM "CA_state_test" INNER JOIN iready_ela_math
ON "CA_state_test".student_id = iready_ela_math.user_id;


/* number of students for each subject and grade */

SELECT grade, COUNT(state_ela_score) as ela_state, COUNT(state_math_score) as math_state,
COUNT(iready_ela_score) as ela_iready, COUNT (iready_math_score) as math_iready
FROM state_iready
GROUP BY grade ORDER BY grade;



/* turn table into csv*/
COPY state_iready 
TO '/Users/veronicaventure/Desktop/Copy of Candidate Programming Project - Data/psql/state_iready.csv'
DELIMITER ','
CSV HEADER;


/* iready proficiency: first split placement columns into text part and number part*/
SELECT * , split_part(iready_ela_placement::TEXT, ' ', 1) ela_placement_level,
split_part(iready_ela_placement::TEXT, ' ', 2) ela_placement_grade, 
split_part(iready_math_placement::TEXT, ' ', 1) math_placement_level,
split_part(iready_math_placement::TEXT, ' ', 2) math_placement_grade
FROM state_iready 
LIMIT 10;

CREATE TABLE state_iready_proficiency AS
SELECT * , split_part(iready_ela_placement::TEXT, ' ', 1) ela_placement_level,
split_part(iready_ela_placement::TEXT, ' ', 2) ela_placement_grade, 
split_part(iready_math_placement::TEXT, ' ', 1) math_placement_level,
split_part(iready_math_placement::TEXT, ' ', 2) math_placement_grade
FROM state_iready;

/* create table with placement grades as ints */


CREATE TABLE proficiency_all AS
SELECT student_id, grade, state_ela_proficiency, state_math_proficiency,
ela_placement_level, CAST(Replace(ela_placement_grade, 'K', '0') AS INT) AS ela_place_int,
math_placement_level,
CAST(replace (math_placement_grade, 'K', '0') AS INT) AS math_place_int
FROM state_iready_prof2;

/* create table with iready proficiency columns */

CREATE TABLE proficiency_iready_state AS
SELECT *, 
CASE
	WHEN ela_placement_level = 'Mid' THEN 1
	WHEN ela_placement_level = 'Late' THEN 1
	WHEN ela_place_int > grade THEN 1
	ELSE 0
END AS iready_ela_prof,
CASE 
	WHEN math_placement_level = 'Mid' THEN 1
	WHEN math_placement_level = 'Late' THEN 1
	WHEN math_place_int > grade THEN 1
	ELSE 0
END AS iready_math_prof
FROM proficiency_all;

/* check how many proficiency scores match between tests */

CREATE TABLE prof_match AS
SELECT COUNT(CASE WHEN state_ela_proficiency = iready_ela_prof THEN 1 ELSE NULL END)as ela_match,
COUNT (CASE WHEN state_ela_proficiency != iready_ela_prof THEN 1 ELSE NULL END) as ela_no_match, 
COUNT (CASE WHEN state_math_proficiency = iready_math_prof THEN 1 ELSE NULL END) as math_match,
COUNT (CASE WHEN state_math_proficiency != iready_math_prof THEN 1 ELSE NULL END) as math_no_match
FROM proficiency_iready_state;


/* create tables for each grade */
SELECT * INTO grade_3 FROM state_iready WHERE grade = 3;
SELECT * INTO grade_4 FROM state_iready WHERE grade = 4;
SELECT * INTO grade_5 FROM state_iready WHERE grade = 5;
SELECT * INTO grade_6 FROM state_iready WHERE grade = 6;
SELECT * INTO grade_7 FROM state_iready WHERE grade = 7;
SELECT * INTO grade_8 FROM state_iready WHERE grade = 8;


/* save tables for each grade code is the same for each grade except number changes */
COPY grade_3
TO '/Users/veronicaventure/Desktop/Copy of Candidate Programming Project - Data/psql/grade_3.csv'
DELIMITER ','
CSV HEADER;



