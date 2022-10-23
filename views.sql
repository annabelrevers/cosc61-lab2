# LeadAuthorManuscripts

DROP VIEW IF EXISTS LeadAuthorManuscripts;
CREATE VIEW LeadAuthorManuscripts AS
SELECT a.ManuscriptId, AuthorLastName, a.AuthorId, ManStatus, DateUpdated FROM
(SELECT ManuscriptId, AuthorId FROM AuthorGroup WHERE OrderNum = 1) a
LEFT JOIN (SELECT AuthorLastName, AuthorId FROM Author) b
ON a.AuthorId = b.AuthorId
LEFT JOIN (SELECT ManStatus, ManuscriptId, DateUpdated FROM Manuscript) c 
ON a.ManuscriptId = c.ManuscriptId
ORDER BY AuthorLastName ASC, AuthorId ASC, DateUpdated DESC;

SELECT * FROM LeadAuthorManuscripts;

# AnyAuthorManuscripts

DROP VIEW IF EXISTS AnyAuthorManuscripts;
CREATE VIEW AnyAuthorManuscripts AS 
SELECT a.ManuscriptId, AuthorLastName, a.AuthorId, ManStatus FROM
(SELECT ManuscriptId, AuthorId FROM AuthorGroup) a
LEFT JOIN (SELECT AuthorLastName, AuthorId FROM Author) b
ON a.AuthorId = b.AuthorId
LEFT JOIN (SELECT ManStatus, ManuscriptId, DateUpdated FROM Manuscript) c 
ON a.ManuscriptId = c.ManuscriptId
ORDER BY AuthorLastName ASC, DateUpdated DESC;

SELECT * FROM AnyAuthorManuscripts;

# PublishedIssues

DROP VIEW IF EXISTS PublishedIssues;
CREATE VIEW PublishedIssues AS 
SELECT PublicationYear, PeriodNumber, Title, StartingPage, issues.IssueId FROM 
(SELECT IssueId, PublicationYear, PeriodNumber FROM Issue WHERE PageCount >= 75 AND PageCount <= 100) issues
LEFT JOIN (SELECT Title, StartingPage, IssueId FROM Manuscript) mans
ON issues.IssueId = mans.IssueId
ORDER BY PublicationYear DESC, IssueId ASC, StartingPage ASC;

SELECT * FROM PublishedIssues;

# ReviewQueue

DROP VIEW IF EXISTS ReviewQueue;
CREATE VIEW ReviewQueue AS
SELECT mans.ManuscriptId, AuthorId, GROUP_CONCAT(ReviewerId) FROM 
(SELECT ManuscriptId, DateUpdated FROM Manuscript WHERE ManStatus = "Under Review") mans
LEFT JOIN (SELECT AuthorId, ManuscriptId FROM AuthorGroup WHERE OrderNum = 1) author
ON mans.ManuscriptId = author.ManuscriptId
LEFT JOIN (SELECT ReviewerId, ManuscriptId FROM Review ) revs 
ON revs.ManuscriptId = author.ManuscriptId
GROUP BY ManuscriptId, AuthorId
ORDER BY DateUpdated DESC;

SELECT * FROM ReviewQueue;

# WhatsLeft
DROP VIEW IF EXISTS WhatsLeft;
CREATE VIEW WhatsLeft AS 
SELECT ManuscriptId, ManStatus, DateUpdated FROM Manuscript;

SELECT * FROM WhatsLeft;

# ReviewStatus



DROP FUNCTION IF EXISTS ViewRevId;
DELIMITER $$
CREATE FUNCTION ViewRevId()    
RETURNS INT
DETERMINISTIC 
BEGIN
# see stackoverflow.com/questions/14511760 and read ALL the info TWICE or MORE.  wh 04/13/2017
    RETURN @rev_id;
END$$

DELIMITER ;

SET @rev_id = 13;
SET @test = ViewRevId();
SELECT @test;


DROP VIEW IF EXISTS ReviewStatus;
CREATE VIEW ReviewStatus AS 
SELECT FeedbackDate, reviews.ManuscriptId, Title, A_Rating, C_Rating, M_Rating, E_Rating, Recommendation FROM 
(SELECT FeedbackDate, ManuscriptId, A_Rating, C_Rating, M_Rating, E_Rating, Recommendation FROM Review WHERE ReviewerId = ViewRevId()) reviews
LEFT JOIN (SELECT Title, ManuscriptId FROM Manuscript) titles
ON titles.ManuscriptId = reviews.ManuscriptId;

SELECT * FROM ReviewStatus




