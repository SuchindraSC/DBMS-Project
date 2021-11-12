CREATE VIEW MultipleView AS
SELECT lab.name, lab.ADDRESS, hired_candidates.email, hired_candidates.mobile_num
FROM lab, hired_candidates
WHERE lab.name = hired_candidates.first_name;


select * from [dbo].[lab]

select * from [dbo].[hired_candidates]

select * from MultipleView