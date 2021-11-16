--Add Primary Key
CREATE TABLE demo2 (
NAME VARCHAR(50),
ADDRESS VARCHAR(50)
);

INSERT INTO demo2 VALUES ('SUCHINDRA', 'MUMBAI');

ALTER TABLE demo2 ADD ID int identity(1,1) primary key

select * from demo2



--Add Foreign Key
CREATE TABLE demo3 (
ID int identity(1,1) primary key,
FIRST_NAME VARCHAR(50),
LOCATION VARCHAR(50)
)

INSERT INTO demo3 VALUES ('SUCHINDRA', 'MUMBAI');

ALTER TABLE demo3 ADD DEMOID int CONSTRAINT DEMO_ID FOREIGN KEY(DEMOID) REFERENCES demo2(ID);