-- Script for Assignment 4

-- Creating database with full name

CREATE DATABASE assignment4;

-- Connecting to database 
\c assignment4

-- Relation schemas and instances for assignment 2
CREATE TABLE Person(pid integer,
                    pname text,
                    city text,
                    primary key (pid));

CREATE TABLE Company(cname text,
                     headquarter text,
                     primary key (cname));

CREATE TABLE Skill(skill text,
                   primary key (skill));


CREATE TABLE worksFor(pid integer,
                      cname text,
                      salary integer,
                      primary key (pid),
                      foreign key (pid) references Person (pid),
                      foreign key (cname) references Company(cname));


CREATE TABLE companyLocation(cname text,
                             city text,
                             primary key (cname, city),
                             foreign key (cname) references Company (cname));


CREATE TABLE personSkill(pid integer,
                         skill text,
                         primary key (pid, skill),
                         foreign key (pid) references Person (pid) on delete cascade,
                         foreign key (skill) references Skill (skill) on delete cascade);


CREATE TABLE hasManager(eid integer,
                        mid integer,
                        primary key (eid, mid),
                        foreign key (eid) references Person (pid),
                        foreign key (mid) references Person (pid));

CREATE TABLE Knows(pid1 integer,
                   pid2 integer,
                   primary key(pid1, pid2),
                   foreign key (pid1) references Person (pid),
                   foreign key (pid2) references Person (pid));



INSERT INTO Person VALUES
     (1001,'Jean','Cupertino'),
     (1002,'Vidya', 'Cupertino'),
     (1003,'Anna', 'Seattle'),
     (1004,'Qin', 'Seattle'),
     (1005,'Megan', 'MountainView'),
     (1006,'Ryan', 'Chicago'),
     (1007,'Danielle','LosGatos'),
     (1008,'Emma', 'Bloomington'),
     (1009,'Hasan', 'Bloomington'),
     (1010,'Linda', 'Chicago'),
     (1011,'Nick', 'MountainView'),
     (1012,'Eric', 'Cupertino'),
     (1013,'Lisa', 'Indianapolis'), 
     (1014,'Deepa', 'Bloomington'), 
     (1015,'Chris', 'Denver'),
     (1016,'YinYue', 'Chicago'),
     (1017,'Latha', 'LosGatos'),
     (1018,'Arif', 'Bloomington'),
     (1019,'John', 'NewYork');

INSERT INTO Company VALUES
     ('Apple', 'Cupertino'),
     ('Amazon', 'Seattle'),
     ('Google', 'MountainView'),
     ('Netflix', 'LosGatos'),
     ('Microsoft', 'Redmond'),
     ('IBM', 'NewYork'),
     ('ACM', 'NewYork'),
     ('Yahoo', 'Sunnyvale');


INSERT INTO worksFor VALUES
     (1001,'Apple', 65000),
     (1002,'Apple', 45000),
     (1003,'Amazon', 55000),
     (1004,'Amazon', 55000),
     (1005,'Google', 60000),
     (1006,'Amazon', 55000),
     (1007,'Netflix', 50000),
     (1008,'Amazon', 50000),
     (1009,'Apple',60000),
     (1010,'Amazon', 55000),
     (1011,'Google', 70000), 
     (1012,'Apple', 50000),
     (1013,'Yahoo', 55000),
     (1014,'Apple', 50000), 
     (1015,'Amazon', 60000),
     (1016,'Amazon', 55000),
     (1017,'Netflix', 60000),
     (1018,'Apple', 50000),
     (1019,'Microsoft', 50000);

INSERT INTO companyLocation VALUES
   ('Apple', 'Bloomington'),
   ('Amazon', 'Chicago'),
   ('Amazon', 'Denver'),
   ('Amazon', 'Columbus'),
   ('Google', 'NewYork'),
   ('Netflix', 'Indianapolis'),
   ('Netflix', 'Chicago'),
   ('Microsoft', 'Bloomington'),
   ('Apple', 'Cupertino'),
   ('Amazon', 'Seattle'),
   ('Google', 'MountainView'),
   ('Netflix', 'LosGatos'),
   ('Microsoft', 'Redmond'),
   ('IBM', 'NewYork'),
   ('Yahoo', 'Sunnyvale');

INSERT INTO Skill VALUES
   ('Programming'),
   ('AI'),
   ('Networks'),
   ('OperatingSystems'),
   ('Databases');

INSERT INTO personSkill VALUES
 (1001,'Programming'),
 (1001,'AI'),
 (1002,'Programming'),
 (1002,'AI'),
 (1004,'AI'),
 (1004,'Programming'),
 (1005,'AI'),
 (1005,'Programming'),
 (1005,'Networks'),
 (1006,'Programming'),
 (1006,'OperatingSystems'),
 (1007,'OperatingSystems'),
 (1007,'Programming'),
 (1009,'OperatingSystems'),
 (1009,'Networks'),
 (1010,'Networks'),
 (1011,'Networks'),
 (1011,'OperatingSystems'),
 (1011,'AI'),
 (1011,'Programming'),
 (1012,'AI'),
 (1012,'OperatingSystems'),
 (1012,'Programming'),
 (1013,'Programming'),
 (1013,'OperatingSystems'),
 (1013,'Networks'),
 (1014,'OperatingSystems'),
 (1014,'AI'),
 (1014,'Networks'),
 (1015,'Programming'),
 (1015,'AI'),
 (1016,'OperatingSystems'),
 (1016,'AI'),
 (1017,'Networks'),
 (1017,'Programming'),
 (1018,'AI'),
 (1019,'Networks'),
 (1010,'Databases'),
 (1011,'Databases'),
 (1013,'Databases'),
 (1014,'Databases'),
 (1017,'Databases'),
 (1019,'Databases'),
 (1005,'Databases'),
 (1006,'AI'),
 (1009,'Databases');
 

INSERT INTO hasManager VALUES
 (1004, 1003),
 (1006, 1003),
 (1015, 1003),
 (1016, 1004),
 (1016, 1006),
 (1008, 1015),
 (1010, 1008),
 (1013, 1007),
 (1017, 1013),
 (1002, 1001),
 (1009, 1001),
 (1014, 1012),
 (1011, 1005);


INSERT INTO Knows VALUES
 (1011,1009),
 (1007,1016),
 (1011,1010),
 (1003,1004),
 (1006,1004),
 (1002,1014),
 (1009,1005),
 (1018,1009),
 (1007,1017),
 (1017,1019),
 (1019,1013),
 (1016,1015),
 (1001,1012),
 (1015,1011),
 (1019,1006),
 (1013,1002),
 (1018,1004),
 (1013,1007),
 (1014,1006),
 (1004,1014),
 (1001,1014),
 (1010,1013),
 (1010,1014),
 (1004,1019),
 (1018,1007),
 (1014,1005),
 (1015,1018),
 (1014,1017),
 (1013,1018),
 (1007,1008),
 (1005,1015),
 (1017,1014),
 (1015,1002),
 (1018,1013),
 (1018,1010),
 (1001,1008),
 (1012,1011),
 (1002,1015),
 (1007,1013),
 (1008,1007),
 (1004,1002),
 (1015,1005),
 (1009,1013),
 (1004,1012),
 (1002,1011),
 (1004,1013),
 (1008,1001),
 (1008,1019),
 (1019,1008),
 (1001,1019),
 (1019,1001),
 (1004,1003),
 (1006,1003),
 (1015,1003),
 (1016,1004),
 (1016,1006),
 (1008,1015),
 (1010,1008),
 (1017,1013),
 (1002,1001),
 (1009,1001),
 (1011,1005),
 (1014,1012),
 (1010,1002),
 (1010,1012),
 (1010,1018);

\qecho 'Problem 1'
/*Find each pair (c, pn) where c is the city and pn is the name of the person
that lives in c, and earns the highest salary among all persons living in c.
You must not use set predicates in this query.*/
WITH MaxSal AS (
    SELECT p.city, MAX(w.salary) AS max_salary
    FROM Person p
    JOIN worksFor w ON p.pid = w.pid
    GROUP BY p.city
)

SELECT p.city AS c, p.pname AS pn
FROM Person p
JOIN worksFor w ON p.pid = w.pid
JOIN MaxSal ms ON p.city = ms.city AND w.salary = ms.max_salary;



\qecho 'Problem 2'
/*Find the pid and name of each person who has fewer than 2 of the combined
set of job skills of persons who work for Netflix. By combined set
of jobskills we mean the set
{s | s is a jobskill of an employee of Netflix }*/

WITH CNETFLIX AS
	(SELECT DISTINCT PS.SKILL
		FROM WORKSFOR WF
		JOIN PERSONSKILL PS ON WF.PID = PS.PID
		WHERE WF.CNAME = 'Netflix' )
SELECT P.PID,
	P.PNAME
FROM PERSON P
LEFT JOIN PERSONSKILL PS ON P.PID = PS.PID
LEFT JOIN CNETFLIX CN ON PS.SKILL = CN.SKILL
GROUP BY P.PID,
	P.PNAME
HAVING COUNT(DISTINCT CN.SKILL) < 2;


\qecho 'Problem 3'
/*Find each pairs (s1; s2) of skills such that the set of persons with skill s1
is the same as the set of persons with skill s2.*/

WITH SKILLSET AS
	(SELECT S1.SKILL AS S1,
			S2.SKILL AS S2
		FROM SKILL S1,
			SKILL S2)
SELECT DISTINCT SS.S1,
	SS.S2
FROM SKILLSET SS
WHERE NOT EXISTS
		(SELECT Q.PID
			FROM
				(SELECT PS1.PID
					FROM PERSONSKILL PS1
					WHERE PS1.SKILL = SS.S1
					EXCEPT SELECT PS2.PID
					FROM PERSONSKILL PS2
					WHERE PS2.SKILL = SS.S2 ) Q)
ORDER BY 1;



\qecho 'Problem 4'
/*Find each pid of a person who knows at least three people who (a) work for
Apple and (b) who make less than 60000. You must not use set predicates
in this query.*/
SELECT K.PID1 AS PID
FROM KNOWS K
JOIN WORKSFOR WF ON K.PID2 = WF.PID
WHERE WF.CNAME = 'Apple'
	AND WF.SALARY < 60000
GROUP BY K.PID1
HAVING COUNT(DISTINCT K.PID2) >= 3;


\qecho 'Problem 5'
/*Find the cname of each company, such that some person that works there
knows at-least half of the people that work at Google. You must not use
set predicates in this query.*/
WITH googleEmp AS (
    SELECT pid
    FROM worksFor
    WHERE cname = 'Google'
),
KnowsGoogleEmp AS (
    SELECT k.pid1, COUNT(DISTINCT k.pid2) AS KGE
    FROM Knows k
    JOIN googleEmp ge ON k.pid2 = ge.pid
    GROUP BY k.pid1
)
SELECT DISTINCT wf.cname
FROM worksFor wf
JOIN KnowsGoogleEmp kg ON wf.pid = kg.pid1
WHERE kg.KGE >= (SELECT COUNT(*)/2 FROM googleEmp);


\qecho 'Problem 6'
/*
Find each pair (c, a) where c is the cname of each company that has at
least one manager, and a is the minimum salary of an employee at that
company, provided that the employee is not a manager. You must not use
set predicates in this query.*/
WITH MANAGERS AS
	(SELECT DISTINCT MID
		FROM HASMANAGER),
	EMPWITHMANAGERS AS
	(SELECT DISTINCT W.CNAME,
			W.PID
		FROM WORKSFOR W
		JOIN HASMANAGER HM ON W.PID = HM.EID)
SELECT EWM.CNAME,
	MIN(W.SALARY) AS A
FROM EMPWITHMANAGERS EWM
JOIN WORKSFOR W ON EWM.PID = W.PID
LEFT JOIN MANAGERS M ON W.PID = M.MID
WHERE M.MID IS NULL
GROUP BY EWM.CNAME
ORDER BY 1;



\qecho 'Problem 7'
\qecho 'a'
CREATE OR REPLACE FUNCTION numberOfSkills(c text)
RETURNS TABLE (pid integer, salary int, numberOfSkills bigint) AS
$$
    SELECT 
        w.pid,
        w.salary,
        COUNT(ps.skill) AS numberOfSkills
    FROM worksFor w
    LEFT JOIN personSkill ps ON w.pid = ps.pid
    WHERE w.cname = c
    GROUP BY w.pid, w.salary
    ORDER BY numberofSkills;
$$ LANGUAGE SQL;

SELECT * FROM WORKSFOR
WHERE cname = 'ACM';

\qecho 'b'
SELECT * FROM numberOfSkills ('Apple');

SELECT * FROM numberOfSkills ('Amazon');

SELECT * FROM numberOfSkills ('ACM');

\qecho 'c'
CREATE OR REPLACE FUNCTION numberOfSkills(c text)
RETURNS TABLE (pid integer, salary int, numberOfSkills bigint) AS
$$
    SELECT 
        w.pid,
        w.salary,
        (SELECT COUNT(ps.skill) FROM personSkill ps WHERE ps.pid = w.pid) AS numberOfSkills
    FROM worksFor w
    WHERE w.cname = c
    ORDER BY numberofSkills;
$$ LANGUAGE SQL;

\qecho 'd'
SELECT * FROM numberOfSkills ('Apple');

SELECT * FROM numberOfSkills ('Amazon');

SELECT * FROM numberOfSkills ('ACM');

\qecho 'e'


SELECT C.CNAME,
	WF.PID
FROM COMPANY C
NATURAL JOIN WORKSFOR WF
WHERE WF.SALARY > 50000
	AND
		(SELECT NUMBEROFSKILLS
			FROM NUMBEROFSKILLS(C.CNAME)
			WHERE PID = WF.PID) =
		(SELECT MAX(NUMBEROFSKILLS)
			FROM NUMBEROFSKILLS(C.CNAME));



\qecho 'Problem 8'
/*Find the pid and name of each person who knows all the persons who (a)
live in Seattle, (b) make at least 45000, and (c) have at least one skill.*/
CREATE OR REPLACE FUNCTION KNOWS_EMP (PERSON_ID int) RETURNS TABLE (PID int) AS $$
   select k.pid2
   from   knows k
  	where k.pid1 =person_id ;
  $$ LANGUAGE SQL;


CREATE OR REPLACE VIEW SAL_CITY AS
SELECT DISTINCT P.PID
FROM PERSON P,
	WORKSFOR W,
	PERSONSKILL PS
WHERE P.PID = W.PID
	AND W.SALARY >= 45000
	AND P.PID = PS.PID
	AND P.CITY = 'Seattle';


SELECT P.PID,
	P.PNAME
FROM PERSON P
WHERE NOT EXISTS
		(SELECT *
			FROM SAL_CITY
			EXCEPT SELECT *
			FROM KNOWS_EMP(P.PID));



\qecho 'Problem 9'
/*Find the cname of each company who only employs managers who make
more than 50000.*/

CREATE OR REPLACE FUNCTION ISMANAGER(COMPANY_NAME varchar) RETURNS TABLE(PID int) AS $$
   SELECT w.pid
   FROM worksfor w
   WHERE w.cname = company_name
   AND w.pid IN (SELECT mid FROM hasManager);
$$ LANGUAGE SQL;


CREATE OR REPLACE VIEW MANAGER_SAL AS
SELECT W.PID
FROM WORKSFOR W
WHERE W.SALARY > 50000
	AND W.PID IN
		(SELECT MID
			FROM HASMANAGER);


SELECT C.CNAME
FROM COMPANY C
WHERE NOT EXISTS (
																			(SELECT *
																				FROM ISMANAGER(C.CNAME))
																		EXCEPT
																			(SELECT PID
																				FROM MANAGER_SAL));



\qecho 'Problem 10'
/*Find the pid and name of each person who knows at least 4 people who
each have at most 2 skills.*/
CREATE OR REPLACE FUNCTION KNOWSPERSON(PID INTEGER) RETURNS TABLE (PID INTEGER) AS $$
SELECT K.pid2
From knows K
WHERE k.pid1 = PID
$$ LANGUAGE SQL;


CREATE  OR REPLACE VIEW KP_ATMOST2SKILLS AS
	(SELECT PS.PID
		FROM PERSONSKILL PS
		GROUP BY PS.PID
		HAVING COUNT (PS.SKILL) <= 2);


SELECT P.PID,
	P.PNAME
FROM PERSON P
WHERE 
		(SELECT COUNT (Q.PID)
			FROM
				(SELECT PID
					FROM KNOWSPERSON(P.PID) INTERSECT SELECT PID
					FROM KP_ATMOST2SKILLS)Q) >= 4;

\qecho 'Problem 11'
/*Find the cname of each company that employs an odd number of persons
where at least two persons have the salary greater than or equal to 55000*/

CREATE OR REPLACE FUNCTION ODD_PID (COMPANY_NAME varchar) RETURNS TABLE (PID INTEGER) AS $$
BEGIN
   RETURN QUERY
   WITH OddCompanies AS (
        SELECT wf.cname
        FROM worksFor wf
        GROUP BY wf.cname
        HAVING MOD(COUNT(wf.pid), 2) = 1
    )
   SELECT wf.pid
   FROM worksFor wf
   WHERE wf.cname = Company_name AND wf.cname IN (SELECT cname FROM OddCompanies);
END;
$$ LANGUAGE PLPGSQL;


CREATE OR REPLACE VIEW SAL_GTE AS
	(SELECT WF.PID
		FROM WORKSFOR WF
		WHERE SALARY >= 55000 );


SELECT C.CNAME
FROM COMPANY C
WHERE
		(SELECT COUNT(*)
			FROM
				(SELECT PID
					FROM ODD_PID(C.CNAME) INTERSECT SELECT PID
					FROM SAL_GTE) AS Q) >= 2;

\qecho 'Problem 12'
/*Find the pairs (p1, p2) of different person pids such that the person with
pid p1 and the person with pid p2 have the same number of skills.*/
CREATE OR REPLACE FUNCTION personHasSkills (pid INTEGER)
RETURNS TABLE (skill_count BIGINT) AS
$$
BEGIN
RETURN QUERY
	SELECT COUNT(ps.skill)
	FROM personSkill ps
	WHERE ps.pid = personHasSkills.pid
	GROUP BY ps.pid;
END;
$$ LANGUAGE plpgsql;


SELECT distinct p1.pid, p2.pid
FROM person p1, person p2
WHERE p1.pid <> p2.pid AND
EXISTS
	  (SELECT skill_count
	   FROM personHasSkills(p1.pid)
	   INTERSECT
	  (SELECT skill_count
	   FROM personHasSkills(p2.pid)));



\qecho 'Problem 13'
/*Write a trigger to check for primary key constraint. Trigger should include
definition and function.*/
CREATE OR REPLACE FUNCTION CHECK_PRIMARY_KEY_CONSTRAINT() RETURNS TRIGGER AS $$
BEGIN
IF NEW.cname IN (SELECT cname FROM Company) THEN
RAISE EXCEPTION 'Cname already exists';
END IF;
RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';


CREATE OR REPLACE TRIGGER CHECK_PRIMARY_KEY_
BEFORE
INSERT ON COMPANY
FOR EACH ROW EXECUTE PROCEDURE CHECK_PRIMARY_KEY_CONSTRAINT();


INSERT INTO COMPANY
VALUES('Google','NewYork');

\qecho 'Problem 14'
/*Write a trigger to check for referential integrity constraint. Trigger should
include definition and function.*/
CREATE OR REPLACE FUNCTION RF_INTEGRITY() RETURNS TRIGGER AS $$
BEGIN

    IF NOT EXISTS (SELECT 1 FROM Person WHERE pid = NEW.pid) THEN
        RAISE EXCEPTION 'pid does not exist in Person table';
    END IF;


    IF NOT EXISTS (SELECT 1 FROM Company WHERE cname = NEW.cname) THEN
        RAISE EXCEPTION 'cname does not exist in Company table';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;


CREATE OR REPLACE TRIGGER RF_INTEGRITY_TGR
BEFORE
INSERT
OR
UPDATE ON WORKSFOR
FOR EACH ROW EXECUTE FUNCTION RF_INTEGRITY();


INSERT INTO WORKSFOR
VALUES(1001,'Airbnb', 65000);

\qecho 'Problem 15'
/*Consider two relations R(A:integer,B:integer) and S(B:integer)
and a view with the following definition:*/

-- select distinct r.A
-- from R r, S s
-- where r.A > 10 and r.B = s.B;

/*Suppose we want to maintain this view as a materialized
view called V(A:integer) upon the insertion of tuples in R
and in S. (You do not have to consider deletions in this question.)

Define SQL insert triggers and their associated trigger functions
on the relations R and S that implement this materialized view.
Write your trigger functions in the language 'plpgsql.'

Make sure that your trigger functions act in an incremental way
and that no duplicates appear in the materialized view.*/


--TEST YOUR TRIGGERS ACROSS THE BELOW RECORDS.

/* -----------*/

CREATE TABLE IF NOT EXISTS R(A INT, B INT);
CREATE TABLE IF NOT EXISTS S(B INT);
CREATE TABLE IF NOT EXISTS V(A INT);

/* -----------*/
--Create TRIGGERS Insert_R and Insert_S

CREATE OR REPLACE FUNCTION Insert_R()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.A NOT IN (SELECT A FROM V) THEN
        INSERT INTO V
		SELECT NEW.A
		FROM S s
		WHERE NEW.A > 10 AND NEW.B = s.B;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE PLPGSQL;

CREATE OR REPLACE TRIGGER Insert_R_TRG
AFTER INSERT ON R
FOR EACH ROW EXECUTE FUNCTION Insert_R();

CREATE OR REPLACE FUNCTION Insert_S()
RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO V
	SELECT r.A
	FROM R r
	WHERE r.A > 10 AND 
		  NEW.B = r.B AND 
		  r.A NOT IN (SELECT A FROM V);
    RETURN NULL;
END;
$$ LANGUAGE PLPGSQL;

CREATE OR REPLACE TRIGGER Insert_S_TRG
AFTER INSERT ON S
FOR EACH ROW EXECUTE FUNCTION Insert_S();

/* -----------*/

INSERT INTO R VALUES(15,35);
INSERT INTO S VALUES(35);
SELECT * FROM V;


INSERT INTO R VALUES(4,12);
INSERT INTO S VALUES(12);
SELECT * FROM V;

INSERT INTO R VALUES(26,13);
INSERT INTO S VALUES(11);
SELECT * FROM V;


INSERT INTO R VALUES(101,106);
INSERT INTO S VALUES(106);
SELECT * FROM V;


DROP TABLE IF EXISTS R;
DROP TABLE IF EXISTS S;
DROP TABLE IF EXISTS V;

/* -----------*/



\qecho 'Problem 16'
/*Consider applying the following constraint over the relation personSkill.
"Each skill of a person who works for Apple should also be the skill of
the person who works for Google". Write a trigger that maintains the
constraint when inserting new pairs of (pid,skill) into the personSkill relation.(
You can ignore the constraint restriction to hold upon the already
existing previous records).*/


/* SECTION 16 BEGIN */
CREATE OR REPLACE FUNCTION Knowing() 
RETURNS TRIGGER AS $$
BEGIN
insert into knows (select distinct new.pid pid1, hm.mid pid2
						from worksfor w ,hasmanager hm
						where w.pid = hm.mid
					   and  w.pid <> new.pid and
				   		w.cname = new.cname);					
RETURN NULL;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER knowingskill 
AFTER
UPDATE ON WORKSFOR
FOR EACH ROW EXECUTE PROCEDURE Knowing();

/* -----------*/

/* NEW RECORDS TO BE INSERTED*/


INSERT INTO Person VALUES
    (2001,'Kevin','Cupertino');
INSERT INTO worksFor VALUES
    (2001,'Apple', 65000);

INSERT INTO Person VALUES
    (2002,'Julia', 'Cupertino');
INSERT INTO worksFor VALUES
	(2002,'Google', 45000);
INSERT INTO SKILL VALUES('Devops');	
INSERT INTO personSkill VALUES
	(2002,'Devops');
     
INSERT INTO Person VALUES
    (2003,'Dora', 'Seattle');
INSERT INTO worksFor VALUES	 
	(2003,'Google', 55000);
INSERT INTO SKILL VALUES('Cloud');
INSERT INTO personSkill VALUES
	(2003,'Cloud');

INSERT INTO Person VALUES
     (2004,'Peter', 'Seattle');
INSERT INTO worksFor VALUES	 
	 (2004,'Apple', 55000);
INSERT INTO SKILL VALUES('Design');
INSERT INTO personSkill VALUES
	 (2004,'Design');


INSERT INTO Person VALUES
    (2005,'Alex','Cupertino');
INSERT INTO worksFor VALUES
    (2005,'Apple', 65000);

/* -----------*/

/* TEST YOUR RESULTS*/

SELECT * FROM PERSONSKILL WHERE PID = 2001;
SELECT * FROM PERSONSKILL WHERE PID = 2002;
SELECT * FROM PERSONSKILL WHERE PID = 2003;
SELECT * FROM PERSONSKILL WHERE PID = 2004;
SELECT * FROM PERSONSKILL WHERE PID = 2005;

/* -----------*/

/* RETAINING THE ORIGINAL DATA*/

DELETE FROM PERSONSKILL PS WHERE PS.PID IN (2002,2003,2004);
DELETE FROM SKILL S WHERE S.SKILL IN ('Devops','Cloud','Design');
DELETE FROM WORKSFOR W WHERE W.PID IN (2001,2002,2003,2004,2005);
DELETE FROM PERSON P WHERE P.PID IN (2001,2002,2003,2004,2005);

/* SECTION 16 END */



\qecho 'Problem 17'
/*Consider applying the following constraint over the relation knows. "Whenever
a person moves from a company A to a company B, he/she should
know all the managers working at the new company B." Refer to section
Q5 from the data file to retain the data to the original state.*/

/* SECTION Q17 BEGIN */

CREATE TABLE KNOWS_COPY AS SELECT * FROM KNOWS;

CREATE OR REPLACE FUNCTION RETAIN_DATA(P INT, C TEXT)
RETURNS VOID AS $$
BEGIN
UPDATE WORKSFOR SET CNAME = C
WHERE WORKSFOR.PID = P;
TRUNCATE TABLE KNOWS;
INSERT INTO KNOWS SELECT * FROM KNOWS_COPY;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION Knowing() 
RETURNS TRIGGER AS $$
BEGIN
insert into knows (select distinct new.pid pid1, hm.mid pid2
						from worksfor w ,hasmanager hm
						where w.pid = hm.mid
					   and  w.pid <> new.pid and
				   		w.cname = new.cname);					
RETURN NULL;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER knowingskill 
AFTER
UPDATE ON WORKSFOR
FOR EACH ROW EXECUTE PROCEDURE Knowing();


UPDATE WORKSFOR SET CNAME='Apple' WHERE WORKSFOR.PID = 1005;

/* Check your trigger and return the results*/
select * from knows k where k.pid1 = 1005;
/* retaining the data */
SELECT * FROM RETAIN_DATA(1005,'Google');


UPDATE WORKSFOR SET CNAME='Google' WHERE WORKSFOR.PID = 1012;

/* Check your trigger and return the results*/
select * from knows k where k.pid1 = 1005;

/* retaining the data */
SELECT * FROM RETAIN_DATA(1012,'Apple');


DROP TABLE KNOWS_COPY;


/* SECTION Q17 END */

-- Connect to default database
\c postgres

-- Drop database created for this assignment
DROP DATABASE assignment4;





