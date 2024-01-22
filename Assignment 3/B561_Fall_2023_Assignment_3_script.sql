
CREATE DATABASE fa23_a3;

\c fa23_a3;


DROP SCHEMA PUBLIC CASCADE;


CREATE SCHEMA PUBLIC;

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
 (1018,1001);

\qecho 'Problem 5' 
/*
Find the cname and headquarter of each company that employs
persons residing in Cupertino and earning more than 40000.

select c.cname, c.headquarter
from company c
where c.cname in (select w.cname
from worksfor w
where w.salary > 40000 and
w.pid = SOME (select p.pid
from person p
where p.city = "Cupertino"));

Translate the Pure SQL query to RA SQL using the translation algorithm step-by-step. */


\qecho 'Translating and in Where clause';
SELECT Q.CNAME,
	Q.HEADQUARTER
FROM
	(SELECT C.*
		FROM COMPANY C
		WHERE C.CNAME IN
				(SELECT W.CNAME
					FROM WORKSFOR W
					WHERE W.SALARY > 40000 INTERSECT
							(SELECT W.CNAME
								FROM WORKSFOR W
								WHERE W.PID = SOME
										(SELECT P.PID
											FROM PERSON P
											WHERE P.CITY = 'Cupertino'))))Q;

\qecho 'Translation of "in" and  "=SOME" operator';
SELECT Q.CNAME,
	Q.HEADQUARTER
FROM
	(SELECT C.*
		FROM COMPANY C, WORKSFOR W
		WHERE C.CNAME = W.CNAME
		AND W.SALARY > 40000 INTERSECT
							(SELECT C.*
								FROM COMPANY C, WORKSFOR W, PERSON P
								WHERE W.PID = P.PID
							 	AND C.CNAME = W.CNAME 
								AND  P.CITY = 'Cupertino'))Q;

\qecho 'Moving Constant condition';
SELECT Q.CNAME,
	Q.HEADQUARTER
FROM
	(SELECT C.*
		FROM COMPANY C,(SELECT W.* FROM WORKSFOR W WHERE  W.SALARY > 40000) W
		WHERE C.CNAME = W.CNAME
		 INTERSECT
							(SELECT C.*
								FROM COMPANY C,(SELECT W.* FROM WORKSFOR W)W, 
							   (SELECT P.* FROM PERSON P WHERE  P.CITY = 'Cupertino') P
								WHERE W.PID = P.PID
							 	AND C.CNAME = W.CNAME  ))Q;
								
\qecho 'Introducing Natural join final RA SQL';
SELECT Q.CNAME,
	Q.HEADQUARTER
FROM
	(SELECT C.*
		FROM COMPANY C
		NATURAL JOIN
			(SELECT W.*
				FROM WORKSFOR W
				WHERE W.SALARY > 40000) W INTERSECT
			(SELECT C.*
				FROM COMPANY C
				NATURAL JOIN
					(SELECT W.*
						FROM WORKSFOR W
						)W
				NATURAL JOIN
					(SELECT P.*
						FROM PERSON P
						WHERE P.CITY = 'Cupertino') P))Q;

\qecho 'Problem 6';
/*
Find the cname and headquarter of each company (1) that has
at least one employee, and (2) doesn’t have any employees who
earn $50,000 or more but are missing either the ’Programming’
or ’Networks’ skills.

 
A possible way to write this query in Pure SQL is

select c.cname, c.headquarter
from company c
where exists (select 1
               from worksfor w
               where w.cname = c.cname)
and not exists (select 1
               from worksfor w
               where w.cname = c.cname
               and w.salary >= 50000
               and (w.pid not in (select ps.pid
                                   from personskill ps
                                   where skill = 'Programming')
               or w.pid not in (select ps.pid
                                   from personskill ps
                                   where skill = 'Networks')));

Translate the Pure SQL query to RA SQL using the trans-
lation algorithm step-by-step.
*/ 

								   
\qecho 'Translation of "and" & "or" in the where clause';
SELECT Q.CNAME,
	Q.HEADQUARTER
FROM
	(SELECT C.CNAME,
			C.HEADQUARTER
		FROM COMPANY C
		WHERE EXISTS
				(SELECT 1
					FROM WORKSFOR W
					WHERE W.CNAME = C.CNAME)
			AND NOT EXISTS
				(SELECT W.CNAME
					FROM WORKSFOR W
					WHERE W.CNAME = C.CNAME
						AND W.SALARY >= 50000 INTERSECT
							(SELECT W.CNAME
								FROM WORKSFOR W
								WHERE (W.PID NOT IN
																(SELECT PS.PID
																	FROM PERSONSKILL PS
																	WHERE SKILL = 'Programming'))
								UNION SELECT W.CNAME
								FROM WORKSFOR W
								WHERE (W.PID NOT IN
																(SELECT PS.PID
																	FROM PERSONSKILL PS
																	WHERE SKILL = 'Networks'))) ))Q;	
\qecho 'Translation of    "[NOT] EXISTS" operator ';
SELECT Q.CNAME,
	Q.HEADQUARTER
FROM
	(SELECT DISTINCT C.CNAME,
			C.HEADQUARTER
		FROM COMPANY C,
			WORKSFOR W
		WHERE W.CNAME = C.CNAME
		EXCEPT
			(SELECT DISTINCT C1.CNAME,
					C1.HEADQUARTER
				FROM COMPANY C1,
					WORKSFOR W1
				WHERE W1.CNAME = C1.CNAME
					AND W1.SALARY >= 50000
					AND W1.PID NOT IN
						(SELECT PS.PID
							FROM PERSONSKILL PS
							WHERE PS.SKILL = 'Programming'))
		EXCEPT
			(SELECT DISTINCT C2.CNAME,
					C2.HEADQUARTER
				FROM COMPANY C2,
					WORKSFOR W2
				WHERE W2.CNAME = C2.CNAME
					AND W2.SALARY >= 50000
					AND W2.PID NOT IN
						(SELECT PS.PID
							FROM PERSONSKILL PS
							WHERE PS.SKILL = 'Networks')))Q;

\qecho 'translating not in'
SELECT q.cname, q.headquarter
FROM(SELECT DISTINCT C.CNAME, C.HEADQUARTER
FROM COMPANY C, WORKSFOR W
WHERE W.CNAME = C.CNAME

EXCEPT

(SELECT DISTINCT C1.CNAME, C1.HEADQUARTER
 FROM COMPANY C1, WORKSFOR W1
 WHERE W1.CNAME = C1.CNAME
 AND W1.SALARY >= 50000
 EXCEPT 
 SELECT DISTINCT C1.CNAME, C1.HEADQUARTER
 FROM COMPANY C1, WORKSFOR W1, PERSONSKILL PS
 WHERE W1.CNAME = C1.CNAME
 AND W1.SALARY >= 50000
 AND W1.PID = PS.PID 
 AND PS.SKILL = 'Programming')

EXCEPT

(SELECT DISTINCT C2.CNAME, C2.HEADQUARTER
 FROM COMPANY C2, WORKSFOR W2
 WHERE W2.CNAME = C2.CNAME
 AND W2.SALARY >= 50000 
 AND W2.PID NOT IN (SELECT PS.PID FROM PERSONSKILL PS WHERE PS.SKILL = 'Networks')))q;
 
 \qecho 'While translating not in I was facing error so continue with introducing join'
 SELECT q.cname, q.headquarter
FROM(SELECT DISTINCT C.CNAME, C.HEADQUARTER
FROM COMPANY C
	 Natural join WORKSFOR W

EXCEPT

((SELECT DISTINCT C1.CNAME, C1.HEADQUARTER
 FROM COMPANY C1
 NATURAL JOIN WORKSFOR W1
 WHERE  W1.SALARY >= 50000
 EXCEPT 
 SELECT DISTINCT C1.CNAME, C1.HEADQUARTER
 FROM COMPANY C1
 NATURAL JOIN (SELECT W1.* FROM WORKSFOR W1 WHERE W1.SALARY >= 50000) W1
 NATURAL JOIN (SELECT PS.* FROM PERSONSKILL PS WHERE PS.SKILL = 'Programming') PS
 )

UNION

(SELECT DISTINCT C2.CNAME, C2.HEADQUARTER
 FROM COMPANY C2
 NATURAL JOIN WORKSFOR W2
 WHERE  W2.SALARY >= 50000
 EXCEPT 
 SELECT DISTINCT C2.CNAME, C2.HEADQUARTER
 FROM COMPANY C2
 NATURAL JOIN (SELECT W2.* FROM WORKSFOR W2 WHERE W2.SALARY >= 50000) W2
 NATURAL JOIN (SELECT PS1.* FROM PERSONSKILL PS1 WHERE PS1.SKILL = 'Networks') PS1
 )))q;
 
\qecho 'Problem 7';
/*
Find the pid and city of each person who does not know anyone
working for 'Amazon'.
• Formulate this query in Pure SQL.
• Translate the Pure SQL query to RA SQL using the translation algorithm step-by-step.
*/ -- Pure SQL
SELECT P.PID,
	P.CITY
FROM PERSON P
WHERE FALSE = ALL
		(SELECT EXISTS
				(SELECT 1
					FROM WORKSFOR W
					WHERE P1.PID = W.PID
						AND W.CNAME = 'Amazon')
			AND (P.PID,
									P1.PID) = SOME
				(SELECT K.PID1,
						K.PID2
					FROM KNOWS K)
			FROM PERSON P1);
			
\qecho 'Translation of ‘and’ in the ‘where’ clause';
SELECT P.PID,
	P.CITY
FROM PERSON P
WHERE FALSE = ALL
		(SELECT EXISTS (
																			(SELECT W.*
																				FROM WORKSFOR W
																				WHERE P1.PID = W.PID
																					AND W.CNAME = 'Amazon') INTERSECT
																			(SELECT W.*
																				FROM WORKSFOR W
																				WHERE P1.PID = W.PID
																					AND (P.PID,
																											P1.PID) = SOME
																						(SELECT K.PID1,
																								K.PID2
																							FROM KNOWS K)))
			FROM PERSON P1);
			
				
			
\qecho 'Translation of "IN" and  "=SOME" operator';
SELECT q.pid,q.city
FROM( SELECT P.PID,
	P.CITY
FROM PERSON P
WHERE FALSE = ALL
		(SELECT EXISTS (
																			(SELECT W.*
																				FROM WORKSFOR W
																				WHERE P1.PID = W.PID
																					AND W.CNAME = 'Amazon') INTERSECT
																			(SELECT W.*
																				FROM WORKSFOR W,KNOWS K,PERSON P1
																				WHERE P1.PID = W.PID
																			 	AND	  P.PID = K.PID1
																			    AND   P1.PID = K.PID2
																			 ))
			FROM PERSON P1))q;


\qecho ' Tranlating "FALSE = ALL AND EXISITS caluse"';	 
		 	 
SELECT Q.PID,
	Q.CITY
FROM
	(SELECT P.*
		FROM PERSON P
		EXCEPT
			(SELECT P.*
				FROM PERSON P,
					WORKSFOR W,
					KNOWS K,
					PERSON P1
				WHERE P1.PID = W.PID
					AND W.CNAME = 'Amazon'
					AND P.PID = K.PID1
					AND P1.PID = K.PID2))Q;	 
		 
		 

\qecho ' Introducting JOIN and Removing constant condition'
		 	 
SELECT Q.PID,
	Q.CITY
FROM
	(SELECT P.*
		FROM PERSON P
		EXCEPT
			(SELECT P.*
				FROM PERSON P
					JOIN KNOWS K ON (P.PID = K.PID1)
			 		JOIN PERSON P1 ON (P1.PID = K.PID2)
			 		JOIN (SELECT W.* FROM WORKSFOR W WHERE W.CNAME = 'Amazon') W ON (P1.PID = W.PID)
					
				))Q;	 
	


\qecho 'Problem 8'; 
/*
Find the cname of each company that (1) is not located in Sunnyvale, (2) employs at least one person and (3) whose workers
who make strictly less 70000 neither have the programming skill
nor the AI skill.
• Formulate this query in Pure SQL.
• Translate the Pure SQL query to RA SQL using the translation algorithm step-by-step.
*/ -- Pure SQL
SELECT C.CNAME
FROM COMPANY C
WHERE C.CNAME IN
		(SELECT W.CNAME
			FROM WORKSFOR W
			WHERE NOT EXISTS
					(SELECT 1
						FROM COMPANYLOCATION CL
						WHERE W.CNAME = CL.CNAME
							AND CL.CITY = 'Sunnyvale'))
	AND TRUE = ALL
		(SELECT P.PID NOT IN
				(SELECT PS.PID
					FROM PERSONSKILL PS
					WHERE PS.SKILL = 'Programming'
						OR PS.SKILL = 'AI')
			FROM PERSON P
			WHERE P.PID IN
					(SELECT W.PID
						FROM WORKSFOR W
						WHERE W.CNAME = C.CNAME
							AND W.SALARY < 70000));


\qecho 'Translation of "and" & "OR" in where clause'
SELECT q.cname
FROM(SELECT C.CNAME
FROM COMPANY C
WHERE C.CNAME IN
		(SELECT W.CNAME
			FROM WORKSFOR W
			WHERE NOT EXISTS
					(SELECT CL.CNAME
						FROM COMPANYLOCATION CL
						WHERE W.CNAME = CL.CNAME
					 	INTERSECT
					    SELECT CL.CNAME
						FROM COMPANYLOCATION CL
						WHERE CL.CITY = 'Sunnyvale'))
	AND TRUE = ALL
		(SELECT P.PID NOT IN
				(SELECT PS.PID
					FROM PERSONSKILL PS
					WHERE PS.SKILL = 'Programming'
				    UNION
				 	SELECT PS.PID
					FROM PERSONSKILL PS
				    WHERE PS.SKILL = 'AI')
			FROM PERSON P
			WHERE P.PID IN
					(SELECT W.PID
						FROM WORKSFOR W 
						WHERE W.CNAME = C.CNAME
					    INTERSECT
					 	SELECT W.PID
						FROM WORKSFOR W
					    WHERE W.SALARY < 70000)))q;
						
-- \qecho 'Translation of "[NOT] IN"  in AND TRUE = ALL clause'
-- SELECT q.cname
-- FROM(SELECT C.CNAME
-- FROM COMPANY C
-- WHERE C.CNAME 
-- 		(SELECT W.CNAME
-- 			FROM WORKSFOR W
-- 			 EXCEPT
-- 					(SELECT W.CNAME
-- 						FROM WORKSFOR W, COMPANYLOCATION CL
-- 						WHERE W.CNAME = CL.CNAME AND  CL.CITY = 'Sunnyvale'
-- 					 	))
-- 	AND TRUE = ALL
-- 		(SELECT P.PID NOT IN
-- 				(SELECT PS.PID
-- 					FROM PERSONSKILL PS
-- 					WHERE PS.SKILL = 'Programming'
-- 				    UNION
-- 				 	SELECT PS.PID
-- 					FROM PERSONSKILL PS
-- 				    WHERE PS.SKILL = 'AI')
-- 			FROM PERSON P, WORKSFOR W 
-- 			WHERE P.PID = W.PID AND W.CNAME = C.CNAME AND W.SALARY < 70000
-- 					))q;
					
					
\qecho 'Translating "[NOT]IN" and "=TRUE ALL" '; 
SELECT Q.CNAME
FROM
	(SELECT C.*
		FROM COMPANY C,
			WORKSFOR W
		WHERE C.CNAME = W.CNAME
		EXCEPT
			(SELECT C.*
				FROM COMPANY C,
					WORKSFOR W,
					COMPANYLOCATION CL
				WHERE C.CNAME = W.CNAME
					AND W.CNAME = CL.CNAME
					AND CL.CITY = 'Sunnyvale' )
		EXCEPT SELECT DISTINCT C.*
		FROM COMPANY C,
			WORKSFOR W,
			PERSON P,
			WORKSFOR W1,
			PERSONSKILL PS
		WHERE W.CNAME = C.CNAME
			AND P.PID = W1.PID
			AND W1.CNAME = C.CNAME
			AND W1.SALARY < 70000
			AND P.PID = PS.PID
			AND (PS.SKILL = 'Programming'
								OR PS.SKILL = 'AI') )Q;


\qecho 'Introducing Joins and removing constant constraint'
SELECT q.cname
FROM(SELECT C.*
FROM COMPANY C
	 NATURAL JOIN WORKSFOR W
 
EXCEPT 
(SELECT C.*
	FROM Company C
 	NATURAL JOIN WORKSFOR W
 	NATURAL JOIN (SELECT CL.* FROM COMPANYLOCATION CL WHERE CL.CITY = 'Sunnyvale')CL
 )
					
	 EXCEPT 
	 (SELECT DISTINCT C.*
FROM COMPANY C 
	 NATURAL JOIN WORKSFOR W 
	 NATURAL JOIN (SELECT W1.* FROM WORKSFOR W1 WHERE W1.SALARY < 70000)
	 NATURAL JOIN PERSON P
	 JOIN PERSONSKILL PS ON (P.PID = PS.PID)
     WHERE 
	  PS.SKILL = 'Programming'
		 	OR PS.SKILL ='AI'
		))q;

\qecho 'Translating OR again to union as it was getting confusing before'
SELECT q.cname
FROM(SELECT C.*
FROM COMPANY C
	 NATURAL JOIN WORKSFOR W
 
EXCEPT 
(SELECT C.*
	FROM Company C
 	NATURAL JOIN WORKSFOR W
 	NATURAL JOIN (SELECT CL.* FROM COMPANYLOCATION CL WHERE CL.CITY = 'Sunnyvale')CL
 )
					
	 EXCEPT 
	 (SELECT DISTINCT C.*
      FROM COMPANY C 
	 NATURAL JOIN WORKSFOR W 
	 NATURAL JOIN (SELECT W1.* FROM WORKSFOR W1 WHERE W1.SALARY < 70000)
	 NATURAL JOIN PERSON P
	 JOIN (SELECT PS.* FROM PERSONSKILL PS WHERE PS.SKILL = 'Programming') PS ON (P.PID = PS.PID)
     UNION
	 SELECT DISTINCT C.*
	 FROM COMPANY C 
	 NATURAL JOIN WORKSFOR W 
	 NATURAL JOIN (SELECT W1.* FROM WORKSFOR W1 WHERE W1.SALARY < 70000)
	 NATURAL JOIN PERSON P 
	 JOIN (SELECT PS.* FROM PERSONSKILL PS WHERE PS.SKILL = 'AI') PS ON (P.PID = PS.PID)
	  
		))q;
		
		
\qecho 'Problem 9'; 
/*
Find the ID of managers with AI skill who are managing atleast
2 people

• Formulate this query in Pure SQL.

• Translate the Pure SQL query to RA SQL using the trans-
lation algorithm step-by-step.
*/ -- Pure SQL



\qecho 'Translation of and in where';
SELECT q.pid
FROM(
select ps.pid
from personSkill ps
WHERE  ps.skill = 'AI'
INTERSECT 
SELECT hm.MID
FROM personSkill ps,hasManager hm1, hasManager hm
where ps.pid = hm.mid
and hm1.mid = hm.mid
and hm.eid <> hm1.eid)q;



\qecho 'Introducing join and removing constant conditions'
SELECT q.pid
FROM(
select ps.pid
from (select ps.* from personSkill ps WHERE  ps.skill = 'AI') ps

INTERSECT 
	
SELECT hm.MID
FROM personSkill ps
	JOIN hasManager hm ON (ps.pid = hm.mid)
	JOIN hasManager hm1 ON (hm1.mid = hm.mid AND hm.eid <>hm1.eid))q;



\c postgres;


DROP DATABASE fa23_a3;