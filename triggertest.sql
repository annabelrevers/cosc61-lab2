# TRIGGER #1 TEST - No ICode
INSERT INTO Manuscript (Title, PageCount, ICodeId, ManStatus)
VALUES
  ("Unknown ICode Paper",10, 100, "Recieved");

# TRIGGER #2 TEST - Delete Reviewer with one manuscript where there is another reviewer that has that ICode, and one where there is now
DELETE FROM Reviewer WHERE ReviewerId = 13;
# Check the new statuses
SELECT * FROM Review;
SELECT * FROM Reviewer;
SELECT * FROM Manuscript;

  
# TRIGGER #3 TEST - Change a Manuscript Status to Accept to see it change to Typesetting
SELECT * FROM Manuscript;
UPDATE Manuscript SET ManStatus = "Accepted" WHERE ManuscriptId = 1;
SELECT * FROM Manuscript;





