# No ICode
INSERT INTO Manuscript (Title, PageCount, ICodeId, ManStatus)
VALUES
  ("Unknown ICode Paper",10, 100, "Recieved");
  
SELECT * FROM Manuscript;
UPDATE Manuscript SET ManStatus = "Accepted" WHERE ManuscriptId = 1;
SELECT * FROM Manuscript;

DELETE FROM Reviewer WHERE ReviewerId = 13;
