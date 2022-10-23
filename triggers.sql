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
		IF (SELECT COUNT(ManuscriptId) FROM Review WHERE ReviewerId = OLD.ReviewerId = 1) THEN
            UPDATE 
				Manuscript.ManStatus
			SET 
				Manuscript.ManStatus = "Recieved"
			FROM 
				(SELECT ManuscriptId FROM Review WHERE ReviewerId = OLD.ReviewerId = 1) m
				LEFT JOIN * FROM ManuscriptId) mans
				ON m.ManuscriptId = mans.ManuscriptId;
            
        
		END IF; $$
        
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








