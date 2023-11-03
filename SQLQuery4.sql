CREATE DATABASE Spotify
USE Spotify


CREATE TABLE Artists(
ID INT PRIMARY KEY IDENTITY ,
Name NVARCHAR(200) NOT NULL,
Age INT ,
)

CREATE TABLE Albums(
ID INT PRIMARY KEY IDENTITY ,
Name NVARCHAR(200) NOT NULL,
ReleaseDate DATE ,
ArtistID INT FOREIGN KEY REFERENCES Artists(ID)
)


CREATE TABLE Musics(
ID INT PRIMARY KEY IDENTITY ,
Name NVARCHAR(200) NOT NULL,
Duration INT ,
ArtistID INT FOREIGN KEY REFERENCES Artists(ID),
ALbumsID INT FOREIGN KEY REFERENCES Albums(ID)
)

INSERT INTO Artists VALUES
('Mehemmed',19),
('Kamil',20),
('Eli',24)



INSERT INTO Albums VALUES
('Gunesli', '2023-04-22', 1),
('Ayli', '2022-05-20', 1),
('Quraqli', '2021-06-22', 2),
('POP', '2020-03-22', 2),
('bass', '2022-02-21', 3)

INSERT INTO Musics VALUES
('Track 1',180,1,1),
('Track 2',200,1,2),
('Track 3',150,2,3),
('Track 4',220,3,4),
('Track 5',190,3,5)

/* SHERT 1 */

CREATE VIEW MusicDetails AS
SELECT m.ID , m.Name as 'Music name' , a.Name as 'Album name' 
FROM Musics as m
JOIN Albums as a
ON 
m.ALbumsID = a.ID

/* SHERT 2 */

SELECT * FROM MusicDetails

CREATE PROCEDURE USR_InsertArtist @Name NVARCHAR(200),@Age INT
AS
INSERT INTO Artists (Name, Age)
VALUES (@Name, @Age)

EXEC USR_InsertArtist 'Akif',23

SELECT * FROM Artists

CREATE PROCEDURE USR_DeleteArtist @ID INT
AS
DELETE FROM Artists 
WHERE ID = @ID

EXEC USR_DeleteArtist 4


CREATE PROCEDURE USR_UpdateArtist @ID INT
AS
UPDATE Artists
SET Age = 32
WHERE ID = @ID

EXEC USR_UpdateArtist 1


/* SHERT 3 */

CREATE VIEW VW_AlbumDetails_COUNT AS
SELECT a.Name as 'Album name' ,COUNT(*) AS 'COUNT'
FROM Albums as a
JOIN Musics as m
ON 
m.ALbumsID = a.ID
GROUP BY a.Name

SELECT * FROM VW_AlbumDetails_COUNT


/* SHERT 4 */

CREATE PROCEDURE USR_CHECK_DURATION @Duration INT
AS
SELECT * FROM Musics
WHERE Duration > @Duration

EXEC USR_CHECK_DURATION 200

/* SHERT 5 */

CREATE PROCEDURE USR_CHECK_DATE @Date DATE
AS
SELECT * FROM Albums
WHERE ReleaseDate > @Date

EXEC USR_CHECK_DATE '2022.01.01' 