-- Script for Assignment 1

-- Creating database with full name

CREATE DATABASE adcassingment1;

-- Connecting to database 
\c adcassingment1

-- Relation schemas and instances for assignment 1

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


CREATE TABLE hasManager1(eid integer,
                        mid integer,
                        primary key (eid, mid),
                        foreign key (eid) references Person (pid),
                        foreign key (mid) references Person (pid));

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
     (1006,'Amazon', 60000),
     (1007,'Netflix', 50000),
     (1008,'Amazon', 50000),
     (1009,'Apple',60000),
     (1010,'Amazon', 55000),
     (1011,'Google', 70000), 
     (1012,'Apple', 45000),
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
 (1019,'Networks');

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
 (1014,1012);



\qecho 'Problem 1'

-- Provide 4 conceptually different examples that illustrate how the
-- presence or absence of primary and foreign keys affect insert and
-- deletes in these relations.  To solve this problem, you will need to
-- experiment with the relation schemas and instances for this
-- assignment.  For example, you should consider altering primary keys
-- and foreign key constraints and then consider various sequences of
-- insert and delete operations.  You may need to change some of the
-- relation instances to observe the desired effects.  Certain inserts
-- and deletes should succeed but other should generate error
-- conditions.  (Consider the lecture notes about keys, foreign keys,
-- and inserts and deletes as a guide to solve this problem.)

\qecho 'Problem 1 conceptual example 1'

-- insterting values with valid tuple 
-- QUERY: INSERT INTO Person VALUES (1050,'Jangs','Bloomington');

-- instering Pid which is already present this will throw an error as Primary key should be unique.
-- QUERY : INSERT INTO Person VALUES (1010,'Jk','Bloomington');
-- ERROR:  Key (pid)=(1010) already exists.duplicate key value violates unique constraint "person_pkey" 

-- Deleting the Pid which has a foreign key reference. This will show a error of foreign key violation.
-- QUERY : DELETE FROM Person p WHERE p.pid = 1010;
-- ERROR:  Key (pid)=(1010) is still referenced from table "worksfor".update or delete on table "person" violates foreign key constraint "worksfor_pid_fkey" on table "worksfor" 

-- Deleting valid Pid that we just inserted as it does not have any foreign key reference. 
-- QUERY: DELETE FROM Person p WHERE p.pid = 1050;

\qecho 'Problem 1 conceptual example 2'
-- let's us look at the cascade delete operation since hasManager does not have cascade delete if we delete any eid from it, it should throw a error 
-- QUERY: SELECT * FROM hasManager WHERE mid = 1003;

-- there are 3 values with mid as 1003 let's try to delete this from person(main table), this should throw an error as  
-- we have not applied CASCADE Delete in which it will delete the tuple with 1003 id.

-- QUERY: DELETE FROM Person WHERE pid = 1003;

-- ERROR:  Key (pid)=(1003) is still referenced from table "worksfor".update or delete on table "person" violates foreign key constraint 

\qecho 'Problem 1 conceptual example 3'

-- Attempting to insert a location for a non-existent company
-- QUERY: INSERT INTO companyLocation(cname, city) VALUES ('Jangs', 'Bloomington');

-- ERROR: Foreign key constraint violation
-- ERROR:  Key (cname)=(Jangs) is not present in table "company".insert or update on table "companylocation" violates foreign key constraint "companylocation_cname_fkey" 


\qecho 'Problem 1 conceptual example 4 ' 
-- Attempting to insert an employee who worksFor a non-existent company
-- QUERY: INSERT INTO worksFor(pid, cname, salary) VALUES (1050, 'NonExistentCompany', 50000);
-- ERROR: Foreign key constraint violation


	
 

\qecho 'Problem 2'

-- Find the pid, pname of each person who (a) lives in MountainView, (b)
-- works for a company which is headquartered in MountainView
-- , and (c) has a salary less than or equal to 60000

SELECT P.pid , P.pname
FROM Person P
WHERE P.city = 'MountainView'
AND P.pid IN (
		SELECT W.pid
		FROM  worksFor W , Company C
		WHERE W.cname = C.cname 
		AND
		C.headquarter = 'MountainView'
		AND
			W.salary <= 60000);


\qecho 'Problem 3'
-- Find each company that has atleast 2 employees working for it.

SELECT DISTINCT C1.cname
FROM worksFor AS C1, worksFor AS C2
WHERE C1.cname = C2.cname AND C1.pid <> C2.pid;


\qecho 'Problem 4'
-- Find the ID of each person who knows someone living in Bloomington and having Networks skill.
SELECT P.pid
FROM Person P
WHERE P.pid IN (
		SELECT K.pid1
		FROM Knows K
		WHERE K.pid2 IN (SELECT P2.pid 
						 FROM Person P2
						 WHERE P2.city = 'Bloomington') AND 
					     K.pid2 IN (
					 		      SELECT PS.pid
					 				FROM personSkill PS
					 				WHERE PS.skill ='Networks'))
ORDER BY P.pid;
		
\qecho 'Problem 5'
-- Find the pairs of pids (p1, p2) such that p1 and p2 both have atleast one common skill.
SELECT DISTINCT PS1.pid, PS2.pid 
FROM personSkill PS1, personSkill PS2
WHERE PS1.pid < PS2.pid
AND PS1.skill IN (
	SELECT PS3.skill 
	FROM personSkill PS3 
	WHERE PS3.pid = PS2.pid);


\qecho 'Problem 6'
-- Find the ID, cname, and salary of each person who works for company which is located in Cupertino and who has the
-- next to lowest salary (i.e., the second lowest salary) at that company.

SELECT p.pid,cl.cname,wf.salary
FROM companyLocation cl, Person p, worksFor wf
WHERE p.pid=wf.pid AND wf.cname=cl.cname 
AND cl.city='Cupertino' 
AND wf.salary IN (
	SELECT DISTINCT wf1.salary
	from worksFor wf1 
	ORDER BY wf1.salary limit 1 offset 1) ;
	
\qecho 'Problem 7'
-- Find the ID of managers having AI skill who is the manager for atleast 2 people
SELECT p.pid
FROM Person p
WHERE p.pid IN (SELECT hm.mid 
			   FROM hasManager hm
			   WHERE hm.mid IN (SELECT  ps.pid
								FROM personSkill ps
							   	WHERE ps.skill = 'AI')
			   AND 
			   hm.mid IN (SELECT DISTINCT hm1.mid
			   FROM hasManager hm1
			   WHERE EXISTS(SELECT 1
						   FROM hasManager hm2
						   WHERE hm1.mid = hm2.mid AND hm1.eid <> hm2.eid  )));


\qecho 'Problem 8'
-- For each company, list the company name having atleast 2 employees along with the 
-- least salary made by employees who work for it. (The query is expected to return the
-- company name and salary fields as output)
SELECT DISTINCT wf.cname, wf.salary
FROM worksFor wf
WHERE wf.pid IN (SELECT DISTINCT wf1.pid
				FROM worksFor wf1, worksFor wf2
				WHERE wf1.cname = wf2.cname
				AND wf1.pid <> wf2.pid)
				
				AND NOT EXISTS (SELECT 1
										FROM worksFor wf2
										WHERE wf2.cname = wf.cname
										AND wf2.salary < wf.salary);


\qecho 'Problem 9'
-- Find the ID, name and city of each person who knows atleast one person who knows
-- another person making a salary of more than 65000

SELECT 	p.pid, p.pname, p.city
FROM Person p
WHERE p.pid IN  (
			SELECT k.pid1
			FROM Knows k   -- Atleast one or p1
			WHERE  k.pid2 IN (SELECT k1.pid1
							 FROM Knows k1
							 WHERE k1.pid1 = k.pid2
								  AND k1.pid2 IN(SELECT  wf.pid 
							FROM worksFor wf
							WHERE wf.salary > 65000) )); 


\qecho 'Problem 10'
SELECT p.pid,p.pname,w.cname,w.salary
FROM Person p , worksFor w , Company c
WHERE (p.pid = w.pid 
AND p.city = 'Bloomington'
AND w.salary >= 40000
AND w.cname = c.cname
AND c.headquarter = 'Seattle');

\qecho 'Problem 11'
SELECT ps.pid 
FROM personSkill ps, hasManager hm, Person m
WHERE ps.skill = 'Programming'
AND hm.eid = ps.pid
AND hm.mid = m.pid
AND EXISTS (SELECT 1
		   FROM personSkill ms
		   WHERE ms.pid = m.pid
		   AND ms.skill <> 'Programming');




\qecho 'Problem 12'
SELECT ps.skill 
FROM Person p , personSkill ps
WHERE p.pid = ps.pid
AND EXISTS (SELECT 1
		   FROM Person m, hasManager hm
		   WHERE hm.eid = p.pid
		   AND hm.mid = m.pid
		   AND m.city = 'Bloomington');

\qecho 'Problem 13'
SELECT m.pid, m.pname
FROM Person m
WHERE NOT EXISTS (
  SELECT 1
  FROM hasManager hm
  WHERE hm.mid = m.pid
    AND NOT EXISTS (
      SELECT 1
      FROM Person e
      WHERE hm.eid = e.pid
        AND e.city = m.city
    )
)
ORDER BY m.pid;



\qecho 'Problem 18'
select not exists (select 1
from hasManager hm1
where not exists (select 1
from hasManager  hm2
where hm1.mid = hm2.mid AND hm1.eid <> hm2.eid ));


\qecho 'Problem 19'

-- SELECT hm.eid,hm.mid, wf1.salary as emp_sal, wf2.salary as manager_sal
-- FROM hasManager hm, worksFor wf1, worksFor wf2
-- WHERE hm.eid = wf1.pid AND hm.mid = wf2.pid
-- AND wf2.salary > wf1.salary; 



SELECT EXISTS (
    SELECT 1
    FROM hasManager hm, worksFor wf_e
    WHERE hm.eid = wf_e.pid
    AND NOT EXISTS (
        SELECT 1
        FROM worksFor wf_m
        WHERE hm.mid = wf_m.pid
        AND wf_e.salary >= wf_m.salary
    )
);



\qecho 'Problem 20'

SELECT NOT EXISTS (
    SELECT 1
    FROM hasManager hm
    WHERE NOT EXISTS (
        SELECT 1
        FROM worksFor wf_e, worksFor wf_m
        WHERE hm.eid = wf_e.pid AND hm.mid = wf_m.pid
		AND wf_e.cname = wf_m.cname
    )
);


-- Connect to default database
\c postgres;

-- Drop database created for this assignment
DROP DATABASE adcassingment1;




