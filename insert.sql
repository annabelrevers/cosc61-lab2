# Author Inserts
# TODO: Error Inserts

INSERT INTO Author (AuthorFirstName, AuthorLastName, AuthorAffiliation)
VALUES
  ("Marshall","Jarvis","Adipiscing Fringilla Porttitor PC"),
  ("Philip","Terry","Dictum Augue Corp."),
  ("Jeremy","Murray","Mi Lacinia Institute"),
  ("Larissa","Hardin","Nec Tempus Foundation"),
  ("Yvette","Chan","Donec Felis Industries"),
  ("Regina","Ortiz","Erat Institute"),
  ("Honorato","Barlow","Ipsum Phasellus Ltd"),
  ("Chiquita","Zamora","Suspendisse Ac Inc."),
  ("Caldwell","Lancaster","Non Enim Institute"),
  ("Holly","Douglas","Sed Tortor Associates");
INSERT INTO Author (AuthorFirstName, AuthorLastName,AuthorAffiliation)
VALUES
  ("Hamilton","Fisher","Vitae Erat Company"),
  ("Coby","Stein","Leo Limited"),
  ("Orli","Callahan","Lectus Cum PC"),
  ("Miriam","Guerra","Mauris Suspendisse Limited"),
  ("Astra","Vaughan","Turpis Non LLC"),
  ("Nehru","Clements","A Feugiat Tellus Associates"),
  ("Gillian","Stark","Ipsum Non Corporation"),
  ("Leandra","Velazquez","Eu Euismod Institute"),
  ("Samantha","Brewer","Risus Associates"),
  ("Martina","Johns","Congue Elit Institute");
INSERT INTO Author (AuthorFirstName, AuthorLastName, AuthorAffiliation)
VALUES
  ("Laura","Sweeney","Facilisis Foundation"),
  ("Barrett","Kelley","Morbi Non Sapien PC"),
  ("Colorado","Mullins","Pede Blandit PC"),
  ("Amethyst","Jones","Pede Et Risus Inc."),
  ("Astra","Cantrell","Integer PC");

INSERT INTO Author (AuthorFirstName, AuthorLastName, AuthorAffiliation, AuthorEmail)
VALUES
  ("Dante","Boyd","Tincidunt Orci Quis Associates", "danteboyd@quis.com"),
  ("Ruby","Berg","Auctor Nunc Nulla Institute", "rubyberg@gmail.com"),
  ("Paula","Howard","Mauris Blandit Industries", "paulahoward@gmail.com"),
  ("Sage","Bolton","Cursus Diam Institute", "sagebolton@aol.com"),
  ("Nita","Anderson","Et Commodo PC", "nita@me.com");
  

SELECT * FROM Author;

# Editor Inserts

INSERT INTO Editor (EditorFirstName, EditorLastName)
VALUES
  ("Gray","Waters"),
  ("Ursula","Chavez"),
  ("Griffith","Robinson"),
  ("Caleb","Galloway"),
  ("Carson","Casey"),
  ("Michelle","Gibson"),
  ("Perry","Gilliam"),
  ("Lilah","Ramos"),
  ("Zane","Levy"),
  ("Dahlia","Dunlap");
INSERT INTO Editor (EditorFirstName, EditorLastName)
VALUES
  ("Owen","Strickland"),
  ("Linda","Fitzpatrick"),
  ("Keefe","Travis"),
  ("Tatum","Sandoval"),
  ("Charde","Craft"),
  ("Wing","Dickson"),
  ("Burke","Hartman"),
  ("Daquan","Gilmore"),
  ("Vanna","Torres"),
  ("Clark","Anthony");
INSERT INTO Editor (EditorFirstName, EditorLastName)
VALUES
  ("Audrey","Dickerson"),
  ("Nash","Burnett"),
  ("Wynter","Davidson"),
  ("Quentin","White"),
  ("Jordan","Carlson");

SELECT * FROM Editor;

# Insert Issue 

INSERT INTO Issue (PublicationYear, PeriodNumber, PageCount)
VALUES
  ("2016",3, 95),
  ("2003",4, 40),
  ("2019",3, 76);


INSERT INTO Issue (PublicationYear, PeriodNumber)
VALUES
  ("2020",3),
  ("2009",1),
  ("2018",4),
  ("2022",3),
  ("2008",3),
  ("2015",1),
  ("2011",2);


SELECT * FROM Issue;

# Insert ICode 

INSERT INTO ICode (InterestName)
VALUES
  ("ML"),
  ("english"),
  ("biology"),
  ("chemistry"),
  ("biology"),
  ("art history"), 
  ("databases");

SELECT * FROM ICode;

# Insert Manuscript 

INSERT INTO Manuscript (Title, PageCount, ManStatus)
VALUES
  ("Hi Annie, hope you are having a great day",96,"Recieved"),
  ("What lives in a pond",78,"Published"),
  ("Cabins for dummies",57,"Ready"),
  ("Fun sample title",15,"Rejected"),
  ("Sock wrestling",16,"Typesetting"),
  ("Random loud noise",44,"Rejected");
INSERT INTO Manuscript (Title, PageCount, ManStatus)
VALUES
  ("gang",82,"Rejected"),
  ("Test title 5",66,"Under Review"),
  ("Test title 6",56,"Under Review"),
  ("Test title 7",65,"Under Review"),
  ("Test title 8",22,"Published");

INSERT INTO Manuscript (Title, ICodeId, EditorId, PageCount, ManStatus)
VALUES
  ("All about databases", 1, 16, 70,"Accepted"),
  ("Machine Learning: A history", 4, 7, 61,"Recieved"),
  ("Biology for beginners", 3, 15, 72,"Typesetting"),
  ("The science behind hot tubs", 5, 2, 10,"Ready");

INSERT INTO Manuscript (Title, EditorId, PageCount, ManStatus)
VALUES
  ("Test title 1", 8, 70,"Published"),
  ("Test title 2", 9, 61,"Recieved"),
  ("Test title 100", 10, 72,"Typesetting"),
  ("Test title 100000", 11, 10,"Ready");
  
INSERT INTO Manuscript (Title, ICodeId, EditorId, IssueId, StartingPage, PageCount, ManStatus)
VALUES
  ("Help me I am tired", 1, 16, 1, 1, 70,"Accepted"),
  ("I have a headache", 4, 7, 2, 10, 61,"Recieved"),
  ("happy weekend", 3, 15, 3, 3, 72,"Typesetting"),
  ("scrubbin and tubbin", 5, 2, 1, 71, 10,"Ready");
  
SELECT * FROM Manuscript;

# Insert Reviewer

INSERT INTO Reviewer (ReviewerFirstName, ReviewerLastName, ReviewerAffiliation, ReviewerEmail)
VALUES
  ("Raven","Carson","Dolor Tempus Non Associates", "rc@gmail.com"),
  ("Irma","Fitzgerald","Dictum Phasellus Incorporated", "if@gmail.com"),
  ("Barclay","Weiss","Non Hendrerit Consulting", "bw@gmail.com"),
  ("Erin","Sargent","Facilisis Lorem Company", "es@gmail.com"),
  ("Jaime","Mejia","Vel Corp.", "jm@gmail.com"),
  ("Laurel","Peters","Mi Felis Associates", "lp@gmail.com"),
  ("Jamalia","Horn","Phasellus Corporation", "jh@gmail.com"),
  ("Brendan","Clements","Et Institute", "bc@gmail.com"),
  ("Suki","Huber","Mollis Vitae Associates", "sh@gmail.com"),
  ("Fletcher","Olson","Aliquet Diam Corporation", "fo@gmail.com");
INSERT INTO Reviewer (ReviewerFirstName, ReviewerLastName, ReviewerAffiliation, ReviewerEmail)
VALUES
  ("Neil","Serrano","Augue Scelerisque Consulting", "ns@gmail.com"),
  ("Elvis","Ellison","Purus Sapien Gravida Inc.", "ee@gmail.com"),
  ("Chantale","Ayala","Mauris Limited", "ca@gmail.com"),
  ("Wang","May","Viverra Ltd", "wm@gmail.com"),
  ("Leila","Clark","Vel Arcu Ltd", "lc@gmail.com"),
  ("Carol","Hoffman","Aenean LLP", "ch@gmail.com"),
  ("Jordan","Carter","In Industries", "jc@gmail.com"),
  ("Nell","Pittman","Congue Incorporated", "np@gmail.com"),
  ("Lisandra","Ware","Nunc Industries", "lw@gmail.com"),
  ("Nicole","Pacheco","Sed Turpis Corp.", "np@gmail.com");
INSERT INTO Reviewer (ReviewerFirstName, ReviewerLastName, ReviewerAffiliation, ReviewerEmail)
VALUES
  ("Drew","Spencer","Nulla Facilisis Company", "ds@gmail.com"),
  ("Clayton","Goodwin","Non Feugiat Nec Corp.", "cg@gmail.com"),
  ("Bryar","Howard","Imperdiet Erat Nonummy Company", "bh@gmail.com"),
  ("Prescott","Vang","Donec Egestas Industries", "pv@gmail.com"),
  ("Jerome","Ford","Vitae Limited", "jf@gmail.com"); 

SELECT * FROM Reviewer;

# Insert Review 

INSERT INTO Review (ReviewerId, ManuscriptId)
VALUES 
	(20, 15),
    (24, 1),
    (17, 5),
    (19, 8),
    (10, 3);
INSERT INTO Review (ReviewerId, ManuscriptId)
VALUES 
	(20, 9),
    (24, 10),
    (17, 8);

INSERT INTO Review (ReviewerId, ManuscriptId, A_Rating, C_Rating, M_Rating, E_Rating, Recommendation, FeedbackDate)
VALUES 
	(13, 2, 1, 2, 3, 4, 10, CURRENT_TIMESTAMP),
    (15, 4, 2, 3, 4, 5, 0, CURRENT_TIMESTAMP);
INSERT INTO Review (ReviewerId, ManuscriptId, A_Rating, C_Rating, M_Rating, E_Rating, Recommendation, FeedbackDate)
VALUES 
	(13, 4, 2, 3, 4, 5, 0, CURRENT_TIMESTAMP);
INSERT INTO Review (ReviewerId, ManuscriptId, A_Rating, C_Rating, M_Rating, E_Rating, Recommendation, FeedbackDate)
VALUES 
	(15, 2, 2, 3, 4, 5, 0, CURRENT_TIMESTAMP);
	


SELECT * FROM Review;

# ReviewerICodeGroup

INSERT INTO ReviewerICodeGroup (ReviewerId, ICodeId)
VALUES 
	(10, 2),
    (10, 3), 
    (11, 4), 
    (12, 6), 
    (12, 1),
    (12, 2);

SELECT * FROM ReviewerICodeGroup;

# Author Group
INSERT INTO AuthorGroup (AuthorId, ManuscriptId, OrderNum)
VALUES 
	(26, 10, 1),
    (5, 10, 2), 
    (27, 4, 1), 
    (28, 5, 1), 
    (28, 6, 2),
    (5, 7, 2);

INSERT INTO AuthorGroup (AuthorId, ManuscriptId, OrderNum)
VALUES 
	(14, 8, 1),
    (15, 9, 2);
INSERT INTO AuthorGroup (AuthorId, ManuscriptId, OrderNum)
VALUES 
	(16, 9, 1);

SELECT * FROM AuthorGroup;