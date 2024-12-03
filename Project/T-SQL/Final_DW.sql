/****** Object:  Database College_Completion_DW    Script Date: 13/05/2024 11:28:57 am ******/
/*
Kimball Group, The Microsoft Data Warehouse Toolkit
Generate a database from the datamodel worksheet, version: 4

You can use this Excel workbook as a data modeling tool during the logical design phase of your project.
As discussed in the book, it is in some ways preferable to a real data modeling tool during the inital design.
We expect you to move away from this spreadsheet and into a real modeling tool during the physical design phase.
The authors provide this macro so that the spreadsheet isn't a dead-end. You can 'import' into your
data modeling tool by generating a database using this script, then reverse-engineering that database into
your tool.

Uncomment the next lines if you want to drop and create the database
*/
/*
DROP DATABASE College_Completion_DW
GO
CREATE DATABASE College_Completion_DW
GO
ALTER DATABASE College_Completion_DW
SET RECOVERY SIMPLE
GO
*/
USE College_Completion_DW
;
IF EXISTS (SELECT Name from sys.extended_properties where Name = 'Description')
    EXEC sys.sp_dropextendedproperty @name = 'Description'
EXEC sys.sp_addextendedproperty @name = 'Description', @value = 'Default description - you should change this.'
;





/* Drop table dbo.DimCarnegie */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimCarnegie') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimCarnegie 
;

/* Create table dbo.DimCarnegie */
CREATE TABLE dbo.DimCarnegie (
   [keyCarnegie]  int IDENTITY  NOT NULL
,  [institutionType]  varchar(255)   NOT NULL
,  [programSize]  varchar(255)   NULL
, CONSTRAINT [PK_dbo.DimCarnegie] PRIMARY KEY CLUSTERED 
( [keyCarnegie] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCarnegie
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimCarnegie', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCarnegie
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCarnegie
;

SET IDENTITY_INSERT dbo.DimCarnegie ON
;
INSERT INTO dbo.DimCarnegie (keyCarnegie, institutionType, programSize)
VALUES (-1, '', '')
;
SET IDENTITY_INSERT dbo.DimCarnegie OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'keyCarnegie', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCarnegie', @level2type=N'COLUMN', @level2name=N'keyCarnegie'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'institutionType', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCarnegie', @level2type=N'COLUMN', @level2name=N'institutionType'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'programSize', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCarnegie', @level2type=N'COLUMN', @level2name=N'programSize'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Khóa thay thế khóa chính', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCarnegie', @level2type=N'COLUMN', @level2name=N'keyCarnegie'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Loại Trường Đại học dựa trên phân loại của hệ thống Qũy Carnegie', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCarnegie', @level2type=N'COLUMN', @level2name=N'institutionType'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Quy mô chương trình của Trường Đại học', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCarnegie', @level2type=N'COLUMN', @level2name=N'programSize'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1,2,3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCarnegie', @level2type=N'COLUMN', @level2name=N'keyCarnegie'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Masters Colleges and Universities, Research Universities', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCarnegie', @level2type=N'COLUMN', @level2name=N'institutionType'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'very high research activity, larger programs', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCarnegie', @level2type=N'COLUMN', @level2name=N'programSize'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCarnegie', @level2type=N'COLUMN', @level2name=N'keyCarnegie'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCarnegie', @level2type=N'COLUMN', @level2name=N'institutionType'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCarnegie', @level2type=N'COLUMN', @level2name=N'programSize'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCarnegie', @level2type=N'COLUMN', @level2name=N'keyCarnegie'; 
;





/* Drop table dbo.DimCohort */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimCohort') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimCohort 
;

/* Create table dbo.DimCohort */
CREATE TABLE dbo.DimCohort (
   [keyCohort]  int IDENTITY  NOT NULL
,  [race]  varchar(50)   NOT NULL
,  [cohort]  varchar(255)   NOT NULL
,  [gender]  varchar(50)   NOT NULL
,  [year]  int   NOT NULL
, CONSTRAINT [PK_dbo.DimCohort] PRIMARY KEY CLUSTERED 
( [keyCohort] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCohort
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimCohort', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCohort
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCohort
;

SET IDENTITY_INSERT dbo.DimCohort ON
;
INSERT INTO dbo.DimCohort (keyCohort, race, cohort, gender, year)
VALUES (-1, '', '', '', -1)
;
SET IDENTITY_INSERT dbo.DimCohort OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'keyCohort', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCohort', @level2type=N'COLUMN', @level2name=N'keyCohort'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'race', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCohort', @level2type=N'COLUMN', @level2name=N'race'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'cohort', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCohort', @level2type=N'COLUMN', @level2name=N'cohort'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'gender', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCohort', @level2type=N'COLUMN', @level2name=N'gender'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'year', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCohort', @level2type=N'COLUMN', @level2name=N'year'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Thay thế khóa chính', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCohort', @level2type=N'COLUMN', @level2name=N'keyCohort'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Chủng tộc', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCohort', @level2type=N'COLUMN', @level2name=N'race'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Nhóm học sinh tốt nghiệp cùng một khóa học hoặc năm học', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCohort', @level2type=N'COLUMN', @level2name=N'cohort'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Giới tính', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCohort', @level2type=N'COLUMN', @level2name=N'gender'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Năm thực hiện thống kê', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCohort', @level2type=N'COLUMN', @level2name=N'year'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCohort', @level2type=N'COLUMN', @level2name=N'keyCohort'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'A, Ai, B, W, H', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCohort', @level2type=N'COLUMN', @level2name=N'race'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Bachelor''s, Degree-seeking students at 2-year institutions,...', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCohort', @level2type=N'COLUMN', @level2name=N'cohort'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'F, M, B', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCohort', @level2type=N'COLUMN', @level2name=N'gender'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'2020, 2021, 2022,...', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCohort', @level2type=N'COLUMN', @level2name=N'year'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCohort', @level2type=N'COLUMN', @level2name=N'keyCohort'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCohort', @level2type=N'COLUMN', @level2name=N'race'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCohort', @level2type=N'COLUMN', @level2name=N'cohort'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCohort', @level2type=N'COLUMN', @level2name=N'gender'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCohort', @level2type=N'COLUMN', @level2name=N'year'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCohort', @level2type=N'COLUMN', @level2name=N'keyCohort'; 
;





/* Drop table dbo.DimLocation */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimLocation') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimLocation 
;

/* Create table dbo.DimLocation */
CREATE TABLE dbo.DimLocation (
   [keyLocation]  int IDENTITY  NOT NULL
,  [keyState]  int   NOT NULL
,  [city]  varchar(50)   NOT NULL
, CONSTRAINT [PK_dbo.DimLocation] PRIMARY KEY CLUSTERED 
( [keyLocation] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimLocation
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimLocation', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimLocation
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimLocation
;

SET IDENTITY_INSERT dbo.DimLocation ON
;
INSERT INTO dbo.DimLocation (keyLocation, keyState, city)
VALUES (-1, -1, 'None')
;
SET IDENTITY_INSERT dbo.DimLocation OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'keyLocation', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'keyLocation'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'keyState', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'keyState'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'city', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'city'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Khóa thay thế khóa chính', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'keyLocation'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Khóa của tiểu bang', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'keyState'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Thành phố', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'city'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'keyLocation'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3...', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'keyState'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Alabama, Birmingham', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'city'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'keyLocation'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'keyState'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'city'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimLocation', @level2type=N'COLUMN', @level2name=N'keyLocation'; 
;





/* Drop table dbo.DimState */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimState') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimState 
;

/* Create table dbo.DimState */
CREATE TABLE dbo.DimState (
   [keyState]  int IDENTITY  NOT NULL
,  [name]  varchar(255)   NOT NULL
,  [stateAbbr]  varchar(50)   NOT NULL
,  [stateCode]  varchar(50)   NOT NULL
,  [statePost]  varchar(50)   NOT NULL
, CONSTRAINT [PK_dbo.DimState] PRIMARY KEY CLUSTERED 
( [keyState] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimState
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DimState', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimState
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimState
;

SET IDENTITY_INSERT dbo.DimState ON
;
INSERT INTO dbo.DimState (keyState, name, stateAbbr, stateCode, statePost)
VALUES (-1, 'none', 'none', '1', '1')
;
SET IDENTITY_INSERT dbo.DimState OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'keyState', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimState', @level2type=N'COLUMN', @level2name=N'keyState'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'nameState', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimState', @level2type=N'COLUMN', @level2name=N'name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'stateAbbr', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimState', @level2type=N'COLUMN', @level2name=N'stateAbbr'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'stateCode', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimState', @level2type=N'COLUMN', @level2name=N'stateCode'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'statePost', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimState', @level2type=N'COLUMN', @level2name=N'statePost'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'hay thế khóa chính', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimState', @level2type=N'COLUMN', @level2name=N'keyState'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'tên tiểu bang và lãnh thổ', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimState', @level2type=N'COLUMN', @level2name=N'name'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'tên viết tắt của tiểu bang và lãnh thổ', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimState', @level2type=N'COLUMN', @level2name=N'stateAbbr'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'mã số của tiểu bang và lãnh thổ', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimState', @level2type=N'COLUMN', @level2name=N'stateCode'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'mã của tiểu bang và lãnh thổ', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimState', @level2type=N'COLUMN', @level2name=N'statePost'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimState', @level2type=N'COLUMN', @level2name=N'keyState'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'United States, Alabama, Alaska, Arizona', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimState', @level2type=N'COLUMN', @level2name=N'name'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'US, AL, AK, AZ', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimState', @level2type=N'COLUMN', @level2name=N'stateAbbr'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'0 , 1, 2, 4', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimState', @level2type=N'COLUMN', @level2name=N'stateCode'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'U.S., Ala., Alaska, Ariz', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimState', @level2type=N'COLUMN', @level2name=N'statePost'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimState', @level2type=N'COLUMN', @level2name=N'keyState'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimState', @level2type=N'COLUMN', @level2name=N'name'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimState', @level2type=N'COLUMN', @level2name=N'stateAbbr'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimState', @level2type=N'COLUMN', @level2name=N'stateCode'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimState', @level2type=N'COLUMN', @level2name=N'statePost'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimState', @level2type=N'COLUMN', @level2name=N'keyState'; 
;





/* Drop table dbo.FactDetail */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.FactDetail') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.FactDetail 
;

/* Create table dbo.FactDetail */
CREATE TABLE dbo.FactDetail (
   [keyInstitution]  int IDENTITY  NOT NULL
,  [keyCarnegie]  int   NOT NULL
,  [keyLocation]  int   NOT NULL
,  [unitID]  int   NULL
,  [chronname]  varchar(max)   NULL
,  [level]  varchar(50)   NULL
,  [control]  varchar(50)   NULL
,  [site]  varchar(max)   NULL
,  [hbcu]  bit   NULL
,  [flagship]  smallint   NULL
,  [long_x]  real   NULL
,  [lat_y]  real   NULL
,  [cohort_size]  real   NULL
,  [student_count]  int   NULL
,  [awards_per_value]  real   NULL
,  [awards_per_state_value]  real   NULL
,  [awards_per_natl_value]  real   NULL
,  [exp_award_value]  int    NULL
,  [exp_award_state_value]  int    NULL
,  [exp_award_natl_value]  int    NULL
,  [exp_award_percentile]  int    NULL
,  [ft_pct]  real   NULL
,  [fte_value]  int    NULL
,  [fte_percentile]  smallint   NULL
,  [med_sat_value]  real   NULL
,  [grad_100_value]  real   NULL
,  [grad_100_percentile]  real   NULL
,  [grad_150_value]  real   NULL
,  [grad_150_percentile]  real   NULL
,  [pell_value]  real   NULL
,  [pell_percentile]  real   NULL
,  [retain_value]  real   NULL
,  [retain_percentile]  real   NULL
,  [start_date]  date   NULL
,  [end_date]  date   NULL
, CONSTRAINT [PK_dbo.FactDetail] PRIMARY KEY NONCLUSTERED 
( [keyInstitution] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactDetail
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FactDetail', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactDetail
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactDetail
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'keyInstitution', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'keyInstitution'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'keyCarnegie', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'keyCarnegie'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'keyLocation', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'keyLocation'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'unitID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'unitID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'chronname', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'chronname'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'level', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'level'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'control', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'control'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'site', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'site'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'hbcu', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'hbcu'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'flagship', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'flagship'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'long_x', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'long_x'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'lat_y', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'lat_y'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'cohort_size', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'cohort_size'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'student_count', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'student_count'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'awards_per_value', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'awards_per_value'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'awards_per_state_value', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'awards_per_state_value'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'awards_per_natl_value', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'awards_per_natl_value'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'exp_award_value', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'exp_award_value'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'exp_award_state_value', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'exp_award_state_value'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'exp_award_natl_value', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'exp_award_natl_value'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'exp_award_percentile', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'exp_award_percentile'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ft_pct', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'ft_pct'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'fte_value', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'fte_value'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'fte_percentile', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'fte_percentile'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'med_sat_value', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'med_sat_value'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'grad_100_value', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'grad_100_value'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'grad_100_percentile', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'grad_100_percentile'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'grad_150_value', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'grad_150_value'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'grad_150_percentile', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'grad_150_percentile'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'pell_value', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'pell_value'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'pell_percentile', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'pell_percentile'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'retain_value', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'retain_value'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'retain_percentile', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'retain_percentile'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'start_date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'start_date'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'end_date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'end_date'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Id trường đại học', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'unitID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'tên trường đại học', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'chronname'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Trường đại học 4 năm hay 2 năm (Đại học hay cao đẳng)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'level'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Kiểu trường (Công lập, tư nhân, tư nhân nhưng phi lợi nhuận)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'control'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Địa chỉ website của trường', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'site'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Biểu thị các trường đại học và trường đại học dành cho người da đen trong lịch sử', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'hbcu'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Biểu thị các tổ chức công cộng hàng đầu', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'flagship'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Kinh độ', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'long_x'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Vĩ độ', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'lat_y'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Số lượng người trong nhóm', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'cohort_size'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Tổng số sinh viên đại học năm 2010', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'student_count'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Tỷ lệ hoàn thành trên 100 sinh viên đại học FTE (trung bình năm 2011, 2012 và 2013)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'awards_per_value'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Tỷ lệ hoàn thành trên 100 sinh viên đại học FTE, trung bình của tiểu bang và ngành', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'awards_per_state_value'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Tỷ lệ hoàn thành trên 100 sinh viên đại học FTE, trung bình toàn ngành', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'awards_per_natl_value'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Ước tính chi tiêu giáo dục (chi phí liên quan đến giảng dạy, nghiên cứu, dịch vụ công, dịch vụ sinh viên, hỗ trợ học tập, hỗ trợ', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'exp_award_value'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Chi tiêu cho mỗi lần hoàn thành, mức trung bình của tiểu bang và ngành', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'exp_award_state_value'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Chi tiêu cho mỗi lần hoàn thành, trung bình toàn ngành', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'exp_award_natl_value'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Chỉ tiêu phần trăm hoàn thành', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'exp_award_percentile'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Tỷ lệ sinh viên đại học theo học toàn thời gian', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'ft_pct'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Tổng số sinh viên đại học tương đương toàn thời gian', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'fte_value'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Số phần trăm sinh viên đại học tương đương toàn thời gian', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'fte_percentile'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Giá trị SAT ước tính trung bình cho học sinh mới nhập học', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'med_sat_value'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'tỷ lệ phần trăm sinh viên đại học lần đầu, toàn thời gian, tìm kiếm bằng cấp hoàn thành chương trình cấp bằng hoặc chứng chỉ tro', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'grad_100_value'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Xếp hạng phần trăm của tổ chức đối với những người hoàn thành trong vòng 100 phần trăm thời gian bình thường trong ngành', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'grad_100_percentile'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'tỷ lệ phần trăm sinh viên đại học lần đầu, toàn thời gian, tìm kiếm bằng cấp hoàn thành chương trình cấp bằng hoặc chứng chỉ tro', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'grad_150_value'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Xếp hạng phần trăm của tổ chức đối với những người hoàn thành trong vòng 150 phần trăm thời gian bình thường trong ngành', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'grad_150_percentile'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'tỷ lệ sinh viên đại học nhận được Pell Grant', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'pell_value'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Xếp hạng phần trăm của tổ chức đối với người nhận Pell đại học trong ngành', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'pell_percentile'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Tỷ lệ sinh viên năm nhất được giữ lại năm thứ hai', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'retain_value'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Xếp hạng phần trăm của tổ chức về tỷ lệ giữ chân sinh viên năm nhất trong ngành', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'retain_percentile'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Ngày thêm dữ liệu vào bảng fact', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'start_date'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Ngày dữ liệu trong bảng fact kết thúc', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'end_date'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'keyInstitution'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1,2,3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'keyCarnegie'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'keyLocation'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'100654, 100663', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'unitID'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Alabama A&M University', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'chronname'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'4-year', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'level'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Public, Standard auditing', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'control'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'www.aamu.edu/', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'site'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'X, nulll', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'hbcu'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'null', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'flagship'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'-86.568502', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'long_x'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'34.783368', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'lat_y'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'882', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'cohort_size'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'4051', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'student_count'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'14.2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'awards_per_value'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'18.8', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'awards_per_state_value'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'21.5', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'awards_per_natl_value'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'105331', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'exp_award_value'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'75743', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'exp_award_state_value'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'66436', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'exp_award_natl_value'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'90', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'exp_award_percentile'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'93.8', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'ft_pct'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'3906', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'fte_value'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'33', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'fte_percentile'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'823', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'med_sat_value'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'29.4', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'grad_100_value'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'15', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'grad_100_percentile'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'29.1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'grad_150_value'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'14', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'grad_150_percentile'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'71.2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'pell_value'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'98', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'pell_percentile'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'63.1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'retain_value'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'17', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'retain_percentile'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'12/05/2024', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'start_date'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'keyInstitution'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'keyCarnegie'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'keyLocation'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimCarnegie.keyCarnegie', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'keyCarnegie'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimLocation.keyLocation', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactDetail', @level2type=N'COLUMN', @level2name=N'keyLocation'; 
;





/* Drop table dbo.FactGraduation */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.FactGraduation') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.FactGraduation 
;

/* Create table dbo.FactGraduation */
CREATE TABLE dbo.FactGraduation (
   [keyInstitution]  int   NOT NULL
,  [keyCohort]  int   NOT NULL
,  [cohort_size]  int   NULL
,  [grad_100]  float   NULL
,  [grad_150]  float   NULL
,  [grad_100_rate]  float   NULL
,  [grad_150_rate]  float   NULL
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactGraduation
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FactGraduation', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactGraduation
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'keyInstitution', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactGraduation', @level2type=N'COLUMN', @level2name=N'keyInstitution'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'keyCohort', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactGraduation', @level2type=N'COLUMN', @level2name=N'keyCohort'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'cohort_size', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactGraduation', @level2type=N'COLUMN', @level2name=N'cohort_size'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'grad_100', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactGraduation', @level2type=N'COLUMN', @level2name=N'grad_100'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'grad_150', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactGraduation', @level2type=N'COLUMN', @level2name=N'grad_150'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'grad_100_rate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactGraduation', @level2type=N'COLUMN', @level2name=N'grad_100_rate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'grad_150_rate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactGraduation', @level2type=N'COLUMN', @level2name=N'grad_150_rate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Khoá của tổ chức', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactGraduation', @level2type=N'COLUMN', @level2name=N'keyInstitution'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Khoá của nhóm người tốt nghiệp', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactGraduation', @level2type=N'COLUMN', @level2name=N'keyCohort'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Mục tiêu của nhóm sinh viên hoặc cá nhân ', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactGraduation', @level2type=N'COLUMN', @level2name=N'cohort_size'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Số lượng sinh viên tốt nghiệp trong 100% thời gian bình thường hoặc mong đợi', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactGraduation', @level2type=N'COLUMN', @level2name=N'grad_100'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Số lượng sinh viên tốt nghiệp trong 150% thời gian bình thường hoặc mong đợi', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactGraduation', @level2type=N'COLUMN', @level2name=N'grad_150'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Tỷ lệ phần trăm sinh viên tốt nghiệp trong 100% thời gian bình thường hoặc mong đợi', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactGraduation', @level2type=N'COLUMN', @level2name=N'grad_100_rate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Tỷ lệ phần trăm sinh viên tốt nghiệp trong 150% thời gian bình thường hoặc mong đợi', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactGraduation', @level2type=N'COLUMN', @level2name=N'grad_150_rate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactGraduation', @level2type=N'COLUMN', @level2name=N'keyInstitution'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3 ', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactGraduation', @level2type=N'COLUMN', @level2name=N'keyCohort'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'2y all, 4y bach,...', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactGraduation', @level2type=N'COLUMN', @level2name=N'cohort_size'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'5, 12, 25, 30,...', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactGraduation', @level2type=N'COLUMN', @level2name=N'grad_100'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'150, 40, 65, 86,..', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactGraduation', @level2type=N'COLUMN', @level2name=N'grad_150'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'3.9, 22.7, 18.7, 19.2,...', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactGraduation', @level2type=N'COLUMN', @level2name=N'grad_100_rate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'23.5, 21.6, 24.9, 24.7,...', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactGraduation', @level2type=N'COLUMN', @level2name=N'grad_150_rate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactGraduation', @level2type=N'COLUMN', @level2name=N'keyInstitution'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactGraduation', @level2type=N'COLUMN', @level2name=N'keyCohort'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from FactDetail.keyInstitution', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactGraduation', @level2type=N'COLUMN', @level2name=N'keyInstitution'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from DimCohort.keyCohort', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactGraduation', @level2type=N'COLUMN', @level2name=N'keyCohort'; 
;
ALTER TABLE dbo.DimLocation ADD CONSTRAINT
   FK_dbo_DimLocation_keyState FOREIGN KEY
   (
   keyState
   ) REFERENCES DimState
   ( keyState )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactDetail ADD CONSTRAINT
   FK_dbo_FactDetail_keyCarnegie FOREIGN KEY
   (
   keyCarnegie
   ) REFERENCES DimCarnegie
   ( keyCarnegie )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactDetail ADD CONSTRAINT
   FK_dbo_FactDetail_keyLocation FOREIGN KEY
   (
   keyLocation
   ) REFERENCES DimLocation
   ( KeyLocation )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactGraduation ADD CONSTRAINT
   FK_dbo_FactGraduation_keyInstitution FOREIGN KEY
   (
   keyInstitution
   ) REFERENCES FactDetail
   ( keyInstitution )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactGraduation ADD CONSTRAINT
   FK_dbo_FactGraduation_keyCohort FOREIGN KEY
   (
   keyCohort
   ) REFERENCES DimCohort
   ( keyCohort )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
