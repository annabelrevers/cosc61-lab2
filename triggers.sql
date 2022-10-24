# Trigger #1 
# We use the ICode table because the only time we insert an ICode is when a Reviewer has this ICODE

DROP TRIGGER IF EXISTS after_manuscript_submit;
DELIMITER $$
CREATE TRIGGER after_manuscript_submit BEFORE INSERT 
ON Manuscript
    FOR EACH ROW 
		IF (SELECT COUNT(ICodeId) FROM ReviewerICodeGroup WHERE ICodeId = NEW.ICodeId = 0) THEN
             set @msg = concat('LAB2: No reviewers for ICode id ', cast(NEW.ICodeId as char));
			 signal sqlstate '45000' set message_text = @msg;
		END IF; $$
DELIMITER ;



# Trigger #2 

DROP TRIGGER IF EXISTS delete_reviewer;
DELIMITER $$
CREATE TRIGGER delete_reviewer BEFORE DELETE 
ON Reviewer
    FOR EACH ROW 
        BEGIN
        SET @rev_id = OLD.ReviewerId;
        
        IF (SELECT EXISTS(SELECT 1 FROM ExistReviewersWithICode)) THEN
			UPDATE 
				Manuscript M, 
				ExistReviewersWithICode Acc
			SET M.ManStatus = "Recieved"
			WHERE M.ManuscriptId  = Acc.ManuscriptId;
		END IF;
        
        IF (SELECT EXISTS(SELECT 1 FROM NoOtherReviewersWithICode)) THEN
			UPDATE 
				Manuscript M, 
				NoOtherReviewersWithICode Rej
			SET M.ManStatus = "Rejected"
			WHERE M.ManuscriptId  = Rej.ManuscriptId;
		END IF;
		
        DELETE FROM Review WHERE ReviewerId = OLD.ReviewerId;
        DELETE FROM ReviewerICodeGroup WHERE ReviewerId = OLD.ReviewerId;
        END$$
		
        
DELIMITER ;


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








