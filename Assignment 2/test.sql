SELECT hm.eid, hm.mid
FROM hasManager hm
JOIN  Knows k ON
((k.pid1 = hm.mid AND k.pid2 = hm.eid) 
       OR (k.pid2 = hm.mid AND k.pid1 = hm.eid)
)


12) 


SELECT DISTINCT  WF.PID
FROM WORKSFOR WF
WHERE WF.CNAME = 'Amazon'
EXCEPT 
SELECT DISTINCT WF.PID
FROM WORKSFOR WF
JOIN KNOWS K ON (K.pid1 = wf.pid)
JOIn KNOWS K1 On ( K1.PID1 = WF.PID AND  K1.PID2 <> K.PID2 )
JOIN KNOWS K2 ON (K2.PID1 = WF.PID AND K2.PID2 <> K.PID2 AND  K2.PID2 <> K1.PID2 )
WHERE WF.CNAME = 'Amazon'
	
							