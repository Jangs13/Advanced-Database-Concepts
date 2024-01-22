
CREATE DATABASE assignment2;

\c assignment2;


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
   ('Databases'),
   ('WebDevelopment');

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
 (1017,'Programming'),
 (1018,'AI'),
 (1019,'Networks'),
 (1003,'WebDevelopment');

INSERT INTO hasManager VALUES
 (1004, 1003),
 (1006, 1003),
 (1015, 1003),
 (1016, 1004),
 (1016, 1006),
 (1008, 1015),
 (1010, 1008),
 (1007, 1017),
 (1002, 1001),
 (1009, 1001),
 (1014, 1012),
 (1011, 1005);

TRUNCATE TABLE Knows;

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
 (1012,1001),
 (1014,1001),
 (1018,1001),
 (1001,1001),
 (1002,1002),
 (1003,1003),
 (1004,1004),
 (1005,1005),
 (1006,1006),
 (1007,1007),
 (1008,1008),
 (1009,1009),
 (1010,1010),
 (1011,1011),
 (1012,1012),
 (1013,1013),
 (1014,1014),
 (1015,1015),
 (1016,1016),
 (1017,1017),
 (1018,1018),
 (1019,1019);


create table PC(parent integer,
               child integer);
insert into PC values
(1,2),
(1,3),
(1,4),
(2,5),
(2,6),
(3,7),
(5,8),
(8,9),
(8,10),
(8,11),
(7,12),
(7,13),
(12,14),
(14,15);

--Find each triple (c, p, s) where c is the cname of a company, p is the pid of a person
--who earns the lowest salary at that company and knows at least someone who has Operating Systems skill, and s is the salary of p.
\qecho 'Problem-1a'
--Formulate this query in Pure SQL by only using the
--EXISTS or NOT EXISTS set predicates. You can not use the set operations INTERSECT, UNION, and EXCEPT.

SELECT WF.CNAME AS C,
	WF.PID AS P,
	WF.SALARY AS S
FROM WORKSFOR WF
WHERE NOT EXISTS
		(SELECT 1
			FROM WORKSFOR WF2
			WHERE WF.CNAME = WF2.CNAME
				AND WF2.SALARY < WF.SALARY)
	AND EXISTS
		(SELECT 1
			FROM KNOWS K
			WHERE WF.PID = K.PID1
				AND EXISTS
					(SELECT 1
						FROM PERSONSKILL PS
						WHERE PS.PID = K.PID2
							AND PS.SKILL = 'OperatingSystems'));
							


\qecho 'Problem-1b'
--Formulate this query in Pure SQL by only using the IN, NOT IN, SOME, or ALL set membership predicates.
--You can not use the set operations INTERSECT, UNION, and EXCEPT.
SELECT WF.CNAME AS C,
	WF.PID AS P,
	WF.SALARY AS S
FROM WORKSFOR WF
WHERE WF.SALARY <= ALL
		(SELECT WF2.SALARY
			FROM WORKSFOR WF2
			WHERE WF.CNAME = WF2.CNAME )
	AND WF.PID IN
		(SELECT K.PID1
			FROM KNOWS K
			WHERE K.PID2 IN
					(SELECT PS.PID
						FROM PERSONSKILL PS
						WHERE PS.SKILL = 'OperatingSystems'));
	


\qecho 'Problem-1c'
--Formulate this query in Pure SQL by only using the set operations INTERSECT, UNION, and EXCEPT.


SELECT Q.CNAME AS C,
	Q.PID AS P,
	Q.SALARY AS S
FROM
	(SELECT DISTINCT WF.CNAME ,
			WF.PID,
			WF.SALARY
		FROM WORKSFOR WF,
			KNOWS K,
			PERSONSKILL PS
		WHERE WF.PID = K.PID1
			AND PS.PID = K.PID2
			AND PS.SKILL = 'OperatingSystems'
		EXCEPT SELECT DISTINCT WF.CNAME,
			WF.PID,
			WF.SALARY
		FROM WORKSFOR WF,
			KNOWS K,
			PERSONSKILL PS,
			WORKSFOR WF2
		WHERE WF.PID = K.PID1
			AND PS.PID = K.PID2
			AND PS.SKILL = 'OperatingSystems'
			AND WF.CNAME = WF2.CNAME
			AND WF2.SALARY < WF.SALARY )Q;



-- Find the name, salary and city of each person
-- who (a) lives in a city where no one has the Networks skill and
-- (b) earns the highest salary in his/her company.

\qecho 'Problem-2a'
--Formulate this query in Pure SQL by only using the
--EXISTS or NOT EXISTS set predicates. You can not use the set operations INTERSECT, UNION, and EXCEPT.


SELECT P.PNAME,
	WF.SALARY,
	P.CITY
FROM PERSON P,
	WORKSFOR WF
WHERE P.PID = WF.PID
	AND NOT EXISTS
		(SELECT 1
			FROM PERSON P1,
				PERSONSKILL PS
			WHERE P1.CITY = P.CITY
				AND P1.PID = PS.PID
				AND PS.SKILL = 'Networks')
	AND NOT EXISTS
		(SELECT 1
			FROM WORKSFOR WF2
			WHERE WF.CNAME = WF2.CNAME
				AND WF2.SALARY > WF.SALARY);
				
\qecho 'Problem-2b'
--Formulate this query in Pure SQL by only using the IN, NOT IN, SOME, or ALL set membership predicates.
--You can not use the set operations INTERSECT, UNION, and EXCEPT.

				
SELECT P.PNAME,
	WF.SALARY,
	P.CITY
FROM PERSON P,
	WORKSFOR WF
WHERE P.PID = WF.PID
	AND P.CITY NOT IN
		(SELECT P1.CITY
			FROM PERSON P1,
				PERSONSKILL PS
			WHERE P1.PID = PS.PID
				AND PS.SKILL = 'Networks' )
	AND WF.SALARY >= ALL
		(SELECT WF2.SALARY
			FROM WORKSFOR WF2
			WHERE WF.CNAME = WF2.CNAME );


\qecho 'Problem-2c'
--Formulate this query in Pure SQL by only using the set operations INTERSECT, UNION, and EXCEPT.

SELECT DISTINCT Q.PNAME,
	Q.SALARY,
	Q.CITY
FROM (
							(SELECT P.PNAME,
									WF.SALARY,
									P.CITY
								FROM PERSON P,
									WORKSFOR WF
								WHERE P.PID = WF.PID )
						EXCEPT
							(SELECT P.PNAME,
									WF.SALARY,
									P.CITY
								FROM PERSON P,
									WORKSFOR WF,
									PERSON P1,
									PERSONSKILL PS
								WHERE P.PID = WF.PID
									AND P1.CITY = P.CITY
									AND P1.PID = PS.PID
									AND PS.SKILL = 'Networks')
						EXCEPT
							(SELECT P.PNAME,
									WF.SALARY,
									P.CITY
								FROM PERSON P,
									WORKSFOR WF,
									WORKSFOR WF2
								WHERE P.PID = WF.PID
									AND WF.CNAME = WF2.CNAME
									AND WF2.SALARY > WF.SALARY))Q;
   




--Find each pair (c1, c2) of cnames of different companies such that
--no employee of c1 and no employee of c2 live in Chicago.
\qecho 'Problem-3a'
--Formulate this query in Pure SQL by only using the
--EXISTS or NOT EXISTS set predicates. You can not use the set operations INTERSECT, UNION, and EXCEPT.
SELECT C1.CNAME,
	C2.CNAME
FROM COMPANY C1,
	COMPANY C2
WHERE C1.CNAME <> C2.CNAME
	AND NOT EXISTS
		(SELECT 1
			FROM WORKSFOR WF
			WHERE WF.CNAME = C1.CNAME
				AND EXISTS
					(SELECT 1
						FROM PERSON P
						WHERE P.PID = WF.PID
							AND P.CITY = 'Chicago' ))
	AND NOT EXISTS
		(SELECT 1
			FROM WORKSFOR WF2
			WHERE WF2.CNAME = C2.CNAME
				AND EXISTS
					(SELECT 1
						FROM PERSON P1
						WHERE P1.PID = WF2.PID
							AND P1.CITY = 'Chicago' ));


				

\qecho 'Problem-3b'
--Formulate this query in Pure SQL by only using the IN, NOT IN, SOME, or ALL set membership predicates.
--You can not use the set operations INTERSECT, UNION, and EXCEPT.

SELECT C1.CNAME,
	C2.CNAME
FROM COMPANY C1,
	COMPANY C2
WHERE C1.CNAME <> C2.CNAME
	AND C1.CNAME NOT IN
		(SELECT WF.CNAME
			FROM WORKSFOR WF
			WHERE WF.PID IN
					(SELECT P.PID
						FROM PERSON P
						WHERE P.CITY = 'Chicago' ))
	AND C2.CNAME NOT IN
		(SELECT WF2.CNAME
			FROM WORKSFOR WF2
			WHERE WF2.PID IN
					(SELECT P1.PID
						FROM PERSON P1
						WHERE P1.CITY = 'Chicago' ));

\qecho 'Problem-3c'
--Formulate this query in Pure SQL by only using the set operations INTERSECT, UNION, and EXCEPT.

SELECT DISTINCT C1.CNAME,C2.CNAME
FROM COMPANY C1,COMPANY C2
WHERE C1.CNAME <> C2.CNAME

EXCEPT

(SELECT  DISTINCT C1.CNAME,C2.CNAME 
FROM COMPANY C1,COMPANY C2, WORKSFOR WF, PERSON P
WHERE C1.CNAME <> C2.CNAME
AND WF.CNAME = C1.CNAME
AND P.PID = WF.PID
AND P.CITY = 'Chicago')
 
EXCEPT (SELECT  DISTINCT C1.CNAME,C2.CNAME 
FROM COMPANY C1,COMPANY C2, WORKSFOR WF1, PERSON P1
WHERE C1.CNAME <> C2.CNAME
AND WF1.CNAME = C2.CNAME
AND P1.PID = WF1.PID
AND P1.CITY = 'Chicago'	);


--Reconsider Problem 1. Formulate this query in RA SQL
\qecho 'Problem-4b'

SELECT DISTINCT WF.CNAME ,
	WF.PID,
	WF.SALARY
FROM WORKSFOR WF
JOIN KNOWS K ON (WF.PID = K.PID1)
JOIN PERSONSKILL PS ON (PS.PID = K.PID2)
WHERE PS.SKILL = 'OperatingSystems'
EXCEPT
SELECT DISTINCT WF.CNAME ,
	WF.PID,
	WF.SALARY
FROM WORKSFOR WF
JOIN KNOWS K ON (WF.PID = K.PID1)
JOIN PERSONSKILL PS ON(PS.PID = K.PID2)
JOIN WORKSFOR WF2 ON (WF.CNAME = WF2.CNAME
																						AND WF2.SALARY < WF.SALARY)
WHERE PS.SKILL = 'OperatingSystems';


--Reconsider Problem 2. Formulate this query in RA SQL
\qecho 'Problem-5b'

	(SELECT P.PNAME,
			WF.SALARY,
			P.CITY
		FROM PERSON P
		NATURAL JOIN WORKSFOR WF)
EXCEPT
	(SELECT P.PNAME,
			WF.SALARY,
			P.CITY
		FROM (PERSON P
								JOIN WORKSFOR WF ON P.PID = WF.PID)
		JOIN PERSON P1 ON (P1.PID = P.PID
																					AND P1.CITY = P.CITY)
		JOIN PERSONSKILL PS ON P.PID = PS.PID
		WHERE PS.SKILL = 'Networks')
EXCEPT
	(SELECT P.PNAME,
			WF.SALARY,
			P.CITY
		FROM PERSON P
		NATURAL JOIN WORKSFOR WF
		JOIN WORKSFOR WF2 ON WF.CNAME = WF2.CNAME
		AND WF2.SALARY > WF.SALARY);

--Reconsider Problem 3. Formulate this query in RA SQL
\qecho 'Problem-6b'

SELECT DISTINCT C1.CNAME,
	C2.CNAME
FROM COMPANY C1
JOIN COMPANY C2 ON(C1.CNAME <> C2.CNAME)
EXCEPT
	(SELECT DISTINCT C1.CNAME,
			C2.CNAME
		FROM COMPANY C1
		JOIN COMPANY C2 ON (C1.CNAME <> C2.CNAME)
		JOIN WORKSFOR WF ON (WF.CNAME = C1.CNAME)
		NATURAL JOIN PERSON P
		WHERE P.CITY = 'Chicago')
EXCEPT
	(SELECT DISTINCT C1.CNAME,
			C2.CNAME
		FROM COMPANY C1
		JOIN COMPANY C2 ON (C1.CNAME <> C2.CNAME)
		JOIN WORKSFOR WF1 ON (WF1.CNAME = C2.CNAME)
		NATURAL JOIN PERSON P1
		WHERE P1.CITY = 'Chicago');




\qecho 'Problem 10'

/*Create a materialized view CompanyKnownPerson such that, for each company,
the view returns the pid of Persons who are known by at least two different people (other than pid)
from the same company and the pid earns more salary than them. Then test your view.*/
CREATE MATERIALIZED VIEW COMPANYKNOWNPERSON AS
SELECT DISTINCT P.PID
FROM PERSON P
NATURAL JOIN WORKSFOR W1
JOIN WORKSFOR W2 ON (W1.CNAME = W2.CNAME
																					AND W2.SALARY < W1.SALARY)
JOIN KNOWS K1 ON(K1.PID1 = W2.PID
																	AND P.PID = K1.PID2)
JOIN KNOWS K2 ON (K1.PID1 <> K2.PID1
																		AND P.PID = K2.PID2)
JOIN WORKSFOR W3 ON (W3.CNAME = W1.CNAME
																					AND W3.SALARY < W1.SALARY
																					AND W3.PID = K2.PID1);

SELECT * FROM CompanyKnownPerson;

\qecho 'Problem 11'

/*Create a parameterized view SkillOnlyOnePerson (skill1 text) that returns pair of different persons pid1, pid2 such that
pid1 should have the skill identified by skill1 and pid2 should not have the skill identified by skill1.
Note that pid2 should have at least one skill.
Test your view for skill1 = WebDevelopment.*/
CREATE FUNCTION SkillOnlyOnePerson (skill1 text)
	RETURNS TABLE (pid1 int, pid2 int) AS 
	$$
		SELECT DISTINCT ps1.pid , ps2.pid 
		FROM personSkill ps1 , personSkill ps2
		WHERE ps1.pid <> ps2.pid
		AND ps1.skill = 'WebDevelopment'
		AND ps2.skill <> 'WebDevelopment'
		AND ps2.skill IS NOT NULL;
		$$ LANGUAGE SQL; 
		
SELECT * FROM SkillOnlyOnePerson('WebDevelopment');


\qecho 'Problem 12'
/*Let PC(parent: integer, child: integer) be a rooted parent-child tree. So a pair (n,m) in PC indicates that node n is a parent of node m.
The sameGeneration(n1, n2) binary relation is inductively defined using the following two rules:
If n is a node in PC, then the pair (n,n) is in the sameGeneration relation. (Base rule)
If n_1 is the parent of m1 in PC and n2 is the parent of m2 in Tree and (n1,n2) is a pair in the sameGeneration relation then (m1,m2) is a pair in the sameGeneration relation. (Inductive Rule)
Write a recursive view for the sameGeneration relation.
Test your view. */

WITH RECURSIVE sameGeneration AS (
    -- Base Case: Every node is in the same generation as itself.
    SELECT parent AS n1, parent AS n2 FROM PC
    UNION
    SELECT child AS n1, child AS n2 FROM PC
    
    UNION
    
    -- Inductive Case: If n1 is parent of m1 and n2 is parent of m2, and (n1, n2) is in the sameGeneration, then (m1, m2) is in the sameGeneration
    SELECT pc1.child AS m1, pc2.child AS m2
    FROM sameGeneration sg
    JOIN PC pc1 ON sg.n1 = pc1.parent
    JOIN PC pc2 ON sg.n2 = pc2.parent
)
SELECT * FROM sameGeneration;



-- Connect to default database
\c postgres

-- Drop database created for this assignment
DROP DATABASE assignment2;

