


# Trigger #3 
DELIMITER $$

DROP TRIGGER IF EXISTS after_manuscript_accepted;
CREATE TRIGGER after_manuscript_accepted
	AFTER UPDATE ON Manuscript
    FOR EACH ROW BEGIN
		IF ( UPDATE(ManStatus) )
			UPDATE Manuscript 
			SET Title = "Typesetting";
END$$
DELIMITER ;

SELECT * FROM Manuscript;
SET SQL_SAFE_UPDATES=0;
UPDATE Manuscript SET ManStatus = "Accepted" where ManuscriptId = 1;

SELECT * FROM Manuscript;



