
--INNER JOIN
select e.id,e.first_name,e1.tech_name,e1.framework from hired_candidates e inner join tech_stack e1 on e.id=e1.id

--OUTER JOIN
--1. LEFT OUTER JOIN
select e.id,e.first_name,e1.tech_name,e1.framework from hired_candidates e left outer join tech_stack e1 on e.id=e1.id 

--2. RIGHT OUTER JOIN
select e.id,e.first_name,e1.tech_name,e1.framework from hired_candidates e right outer join tech_stack e1 on e.id=e1.id 

--3. FULL OUTER JOIN
select e.id,e.first_name,e1.tech_name,e1.framework from hired_candidates e full outer join tech_stack e1 on e.id=e1.id 

--CROSS JOIN
select e.id,e.first_name,e1.tech_name,e1.framework from hired_candidates e cross join tech_stack e1    

--SELF JOIN
select * from hired_candidates e inner join hired_candidates e1 on e.first_name=e1.middle_name



