-- Create a VIEW which has first names, last names, and email of all employees who apply more than one jobs.
CREATE VIEW apply_multiple_job AS
SELECT
	u.FirstName, u.LastName, u.Email,
    COUNT(uaj.JobId) AS NumberJobApplied
FROM userapplyjob uaj
JOIN user u
	ON uaj.UserId = u.UserId
GROUP BY uaj.UserId
HAVING COUNT(uaj.JobId) > 1;

-- Create a VIEW which shows the employers (first name, last name, and email) who post more than 3 jobs.
CREATE VIEW post_morethan3_job AS
SELECT
	u.FirstName, u.LastName, u.Email,
    COUNT(epj.UserID) AS NumberJobPosted
FROM employerpostjob epj
JOIN user u
	ON epj.UserId = u.UserId
GROUP BY epj.UserId
HAVING COUNT(epj.UserID) > 3;

-- Create a view which shows all users that have both roles (employee and employer)
CREATE VIEW have_two_roles AS
SELECT
	u.FirstName, u.LastName, u.Email
FROM employer er, employee ee, user u
WHERE er.UserId = ee.UserId AND er.UserId = u.UserId



