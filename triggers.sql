# Trigger #1 
# We use the ICode table because the only time we insert an ICode is when a Reviewer has this ICODE

DROP TRIGGER IF EXISTS after_manuscript_submit;
DELIMITER $$
CREATE TRIGGER after_manuscript_submit BEFORE INSERT 
ON Manuscript
    FOR EACH ROW 
		IF (SELECT COUNT(ICodeId) FROM ICode WHERE ICodeId = NEW.ICodeId = 0) THEN
             set @msg = concat('LAB2: No reviewers for manuscript id ', cast(NEW.ManuscriptId as char));
			 signal sqlstate '45000' set message_text = @msg;
		END IF; $$
DELIMITER ;



# Trigger #2 

DROP TRIGGER IF EXISTS delete_reviewer;
DELIMITER $$
CREATE TRIGGER delete_reviewer BEFORE DELETE 
ON Reviewer
    FOR EACH ROW 
		UPDATE Manuscript
		SET ManStatus = "Recieved"
		WHERE  ManuscriptId IN SoleReviewerManuscript
            
        
		END IF; $$
        
DELIMITER ;
SELECT * FROM SoleReviewerManuscript;
SELECT * FROM ReviewQueue;

SELECT ManuscriptId, ReviewerId FROM Review;


SELECT * FROM Review;
SELECT ManuscriptId
SELECT ManuscriptId, ifnull(reviewerCount, 0) as reviewerCount
from Manuscript
LEFT JOIN 
	(Select  ICode.ICodeId, count(*) as reviewerCount 
	FROM ICode
	 LEFT JOIN ReviewerICodeGroup on ICode.ICodeId = ReviewerICodeGroup.ICodeId
	 LEFT JOIN Reviewer on Reviewer.ReviewerId = ReviewerICodeGroup.ReviewerId
	GROUP BY ICodeId
	) as numReviewers
     on numReviewers.ICodeId = Manuscript.ICodeId;

SELECT m.ManuscriptId FROM 
(SELECT ManuscriptId FROM Review WHERE (ReviewerId = 13 AND (SELECT COUNT(ManuscriptId) FROM Review WHERE ReviewerId = 13 = 1)) m
LEFT JOIN (SELECT * FROM Manuscript) mans
ON m.ManuscriptId = mans.ManuscriptId;


# Trigger #3 
# Update Accepted Manuscript to Typesetting

DROP TRIGGER IF EXISTS before_manuscript_accept;
DELIMITER $$
CREATE TRIGGER before_manuscript_accept BEFORE UPDATE 
ON Manuscript
    FOR EACH ROW 
		IF NEW.ManStatus = "Accepted" THEN
			 SET NEW.ManStatus = 'Typesetting';
		END IF; $$
DELIMITER ;


# Trigger #4
# Update DateUpdated whenever status is updated
DROP TRIGGER IF EXISTS after_status_update;
DELIMITER $$
CREATE TRIGGER after_status_update AFTER UPDATE 
ON Manuscript
    FOR EACH ROW 
			UPDATE Manuscript
            SET DateUpdated = CURRENT_TIME();
            WHERE Manuscript
		END IF; $$
DELIMITER ;








