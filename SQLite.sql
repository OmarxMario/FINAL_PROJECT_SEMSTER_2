--update 
DROP TABLE IF EXISTS Repositories;

CREATE TABLE IF NOT EXISTS Repositories(repo_name TEXT,owner_username TEXT, primary_language TEXT, stargazers_count REAL,forks_count REAL,watchers_count REAL,open_issues_count REAL,created_at TEXT,updated_at TEXT,license_name TEXT,reserved INTEGER);
-- i searched and found that its best to insert 
INSERT INTO Repositories 
SELECT * FROM github_projects;
-- display the frist 10 rows
SELECT * 
FROM Repositories LIMIT 10;
--filtration

-- i have a condtion (and or not) why not on this one
SELECT * FROM Repositories
WHERE (reserved>10000 AND NOT reserved IS NULL) OR (reserved=10000 AND NOT reserved IS NULL);
--filtering the text the coanitnese machine
SELECT * FROM Repositories 
WHERE repo_name LIKE '%Machine%';
--count and take the avrge at the same time 
SELECT 
COUNT(*) AS total_repositories,
AVG(stargazers_count) AS average_stars 
FROM Repositories;
--display the top 10 repo

SELECT * 
FROM Repositories 
ORDER BY reserved DESC

LIMIT 10;
-- group repostory by prog languge 
SELECT primary_language, COUNT(*) AS repo_count 
FROM Repositories 
GROUP BY primary_language;
--display hwo is above 10
SELECT primary_language, COUNT(*) AS repo_count 
FROM Repositories 
GROUP BY primary_language 
HAVING COUNT(*) > 5;
--a and or not statement 
SELECT * 
FROM Repositories 
WHERE stargazers_count>3 
AND (primary_language='Python' OR primary_language='Jupyter Notebook')
AND NOT license_name='MIT';