/*

Database: spec_web

*/

/****** Object:  Table dbo.ABS_Call_Control    Script Date: 9/8/2016 1:41:05 PM ******/
CREATE TABLE dbo.ABS_Call_Control(
	Call_Control_ID int IDENTITY(1,1) NOT NULL,
	ORG_ID varchar(24) NOT NULL,
	MTG_CODE varchar(24) NOT NULL,
	Comments varchar(4000) NULL,
	CallOpen_Dt datetime NOT NULL,
	CallClose_Dt datetime NOT NULL,
	AcptOpen_Dt datetime NULL,
	AcptClose_Dt datetime NULL,
	MaxCoAuth int NULL,
	MaxFileCnt int NULL,
	Add_Dt datetime NOT NULL,
	AddUser_CustID varchar(20) NOT NULL,
	Mod_Dt datetime NULL,
	ModUser_CustID varchar(20) NULL,
	AcptAbstract_Dt datetime NULL,
	AcptManuscript_Dt datetime NULL,
PRIMARY KEY CLUSTERED 
(
	Call_Control_ID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON PRIMARY
) ON PRIMARY

GO


/****** Object:  Table dbo.ABS_Submissions    Script Date: 9/8/2016 1:45:23 PM ******/
CREATE TABLE dbo.ABS_Submissions(
	Submission_ID int IDENTITY(1,1) NOT NULL,
	Call_Control_ID int NOT NULL,
	Auth_CustID varchar(20) NOT NULL,
	IsPresenter bit NOT NULL,
	Submission_Title varchar(500) NOT NULL,
	Submitor_ST varchar(1) NULL,
	Committee_ST varchar(1) NULL,
	Submission_STEP1 varchar(1) NULL,
	Submission_STEP2 varchar(1) NULL,
	Submission_STEP3 varchar(1) NULL,
	Add_Dt datetime NOT NULL,
	AddUser_CustID varchar(20) NOT NULL,
	Mod_Dt datetime NULL,
	ModUser_CustID varchar(20) NULL,
	PresentationNo int NULL,
	PresentationDay varchar(20) NULL,
	PresentationDate datetime NULL,
	PresentationTime varchar(50) NULL,
	SessionTime varchar(50) NULL,
	PresentationType varchar(200) NULL,
	SessionInfo varchar(500) NULL,
	revised_abstract_uploaded bit NOT NULL,
	manuscript_uploaded bit NOT NULL,
	EventTypeDescription varchar(50) NULL,
 CONSTRAINT PK__ABS_Subm__D6E1C4AB53D83C2D PRIMARY KEY CLUSTERED 
(
	Submission_ID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON PRIMARY
) ON PRIMARY

GO


ALTER TABLE dbo.ABS_Submissions ADD  CONSTRAINT DF_ABS_Submissions_IsPresenter  DEFAULT ((1)) FOR IsPresenter
GO

ALTER TABLE dbo.ABS_Submissions ADD  CONSTRAINT DF__ABS_Submi__Submi__589CF14A  DEFAULT ('O') FOR Submitor_ST
GO

ALTER TABLE dbo.ABS_Submissions ADD  CONSTRAINT DF__ABS_Submi__Commi__59911583  DEFAULT ('O') FOR Committee_ST
GO

ALTER TABLE dbo.ABS_Submissions ADD  CONSTRAINT DF__ABS_Submi__Submi__5A8539BC  DEFAULT ('0') FOR Submission_STEP1
GO

ALTER TABLE dbo.ABS_Submissions ADD  CONSTRAINT DF__ABS_Submi__Submi__5B795DF5  DEFAULT ('0') FOR Submission_STEP2
GO

ALTER TABLE dbo.ABS_Submissions ADD  CONSTRAINT DF__ABS_Submi__Submi__5C6D822E  DEFAULT ('0') FOR Submission_STEP3
GO

ALTER TABLE dbo.ABS_Submissions ADD  CONSTRAINT DF__ABS_Submi__revis__10E14A6D  DEFAULT ((0)) FOR revised_abstract_uploaded
GO

ALTER TABLE dbo.ABS_Submissions ADD  CONSTRAINT DF__ABS_Submi__manus__11D56EA6  DEFAULT ((0)) FOR manuscript_uploaded
GO

ALTER TABLE dbo.ABS_Submissions  WITH CHECK ADD  CONSTRAINT FK__ABS_Submi__Call___55C0849F FOREIGN KEY(Call_Control_ID)
REFERENCES dbo.ABS_Call_Control (Call_Control_ID)
GO

ALTER TABLE dbo.ABS_Submissions CHECK CONSTRAINT FK__ABS_Submi__Call___55C0849F
GO

ALTER TABLE dbo.ABS_Submissions  WITH CHECK ADD  CONSTRAINT check_ST_C CHECK  ((Committee_ST='O' OR Committee_ST='A' OR Committee_ST='R' OR Committee_ST='S'))
GO

ALTER TABLE dbo.ABS_Submissions CHECK CONSTRAINT check_ST_C
GO

ALTER TABLE dbo.ABS_Submissions  WITH CHECK ADD  CONSTRAINT check_ST_S CHECK  ((Submitor_ST='O' OR Submitor_ST='A' OR Submitor_ST='D'))
GO

ALTER TABLE dbo.ABS_Submissions CHECK CONSTRAINT check_ST_S
GO



/****** Object:  Table dbo.ABS_Call_Questions    Script Date: 9/8/2016 1:44:31 PM ******/
CREATE TABLE dbo.ABS_Call_Questions(
	Call_Control_ID int NOT NULL,
	Primary_Question_ID int NOT NULL,
	SubPrimary_Question_ID int NOT NULL,
	QuestionHeader varchar(2000) NULL,
	QuestionNote varchar(2000) NULL,
	ReqFlag bit NOT NULL,
	HdrCnt int NULL,
	ChoiceCnt int NULL,
	Obj1Choice varchar(20) NULL,
	Obj1Type varchar(20) NULL,
	Obj1Text varchar(600) NULL,
	Obj1Note varchar(450) NULL,
	Obj2Type varchar(20) NULL,
	Obj2Text varchar(600) NULL,
	Obj2Note varchar(450) NULL,
	Obj2Reqd bit NOT NULL,
	Add_Dt datetime NOT NULL,
	AddUser_CustID varchar(20) NOT NULL,
	Mod_Dt datetime NULL,
	ModUser_CustID varchar(20) NULL,
 CONSTRAINT pk_PrimeSubID PRIMARY KEY CLUSTERED 
(
	Call_Control_ID ASC,
	Primary_Question_ID ASC,
	SubPrimary_Question_ID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON PRIMARY
) ON PRIMARY

GO

ALTER TABLE dbo.ABS_Call_Questions ADD  CONSTRAINT DF__ABS_Call___ReqFl__6D78129F  DEFAULT ((0)) FOR ReqFlag
GO

ALTER TABLE dbo.ABS_Call_Questions ADD  CONSTRAINT DF__ABS_Call___Obj2R__6E6C36D8  DEFAULT ((0)) FOR Obj2Reqd
GO

ALTER TABLE dbo.ABS_Call_Questions  WITH NOCHECK ADD  CONSTRAINT FK__ABS_Call___Call___6C83EE66 FOREIGN KEY(Call_Control_ID)
REFERENCES dbo.ABS_Call_Control (Call_Control_ID)
GO

ALTER TABLE dbo.ABS_Call_Questions CHECK CONSTRAINT FK__ABS_Call___Call___6C83EE66
GO


/****** Object:  Table dbo.ABS_Call_SubQuestions    Script Date: 9/8/2016 1:44:51 PM ******/
CREATE TABLE dbo.ABS_Call_SubQuestions(
	Call_Control_ID int NOT NULL,
	Primary_Question_ID int NOT NULL,
	SubPrimary_Question_ID int NOT NULL,
	Secondary_Question_ID int NOT NULL,
	Secondary_Choice_ID int NOT NULL,
	QuestionHeader varchar(450) NULL,
	QuestionNote varchar(450) NULL,
	ReqFlag bit NOT NULL,
	HdrCnt int NULL,
	ChoiceCnt int NULL,
	Obj1Choice varchar(20) NULL,
	Obj1Type varchar(20) NULL,
	Obj1Text varchar(450) NULL,
	Obj1Note varchar(450) NULL,
	Obj2Type varchar(20) NULL,
	Obj2Text varchar(450) NULL,
	Obj2Note varchar(450) NULL,
	Obj2Reqd bit NOT NULL,
	Add_Dt datetime NOT NULL,
	AddUser_CustID varchar(20) NOT NULL,
	Mod_Dt datetime NULL,
	ModUser_CustID varchar(20) NULL,
 CONSTRAINT pk_PrimeSubQuestionID PRIMARY KEY CLUSTERED 
(
	Call_Control_ID ASC,
	Primary_Question_ID ASC,
	SubPrimary_Question_ID ASC,
	Secondary_Question_ID ASC,
	Secondary_Choice_ID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON PRIMARY
) ON PRIMARY


ALTER TABLE dbo.ABS_Call_SubQuestions ADD  DEFAULT ((0)) FOR ReqFlag
GO

ALTER TABLE dbo.ABS_Call_SubQuestions ADD  DEFAULT ((0)) FOR Obj2Reqd
GO

ALTER TABLE dbo.ABS_Call_SubQuestions  WITH NOCHECK ADD  CONSTRAINT fk_PrimeSubQuestionID FOREIGN KEY(Call_Control_ID, Primary_Question_ID, SubPrimary_Question_ID)
REFERENCES dbo.ABS_Call_Questions (Call_Control_ID, Primary_Question_ID, SubPrimary_Question_ID)
GO

ALTER TABLE dbo.ABS_Call_SubQuestions CHECK CONSTRAINT fk_PrimeSubQuestionID
GO



/****** Object:  Table dbo.ABS_Static_Questions    Script Date: 9/8/2016 1:45:38 PM ******/

CREATE TABLE dbo.ABS_Static_Questions(
	Static_Question_ID int NOT NULL,
	Static_SubQuestion_ID int NOT NULL,
	QuestionHeader varchar(450) NULL,
	QuestionNote varchar(450) NULL,
	ReqFlag bit NOT NULL,
	Obj1Choice varchar(20) NULL,
	Obj1Type varchar(20) NULL,
	Obj1Text varchar(600) NULL,
	Obj1Note varchar(450) NULL,
	Obj2Type varchar(20) NULL,
	Obj2Text varchar(600) NULL,
	Obj2Note varchar(450) NULL,
	Obj2Reqd bit NOT NULL,
	Add_Dt datetime NOT NULL,
	AddUser_CustID varchar(20) NOT NULL,
	Mod_Dt datetime NULL,
	ModUser_CustID varchar(20) NULL,
	ORGID varchar(1000) NULL,
 CONSTRAINT pk_StaticQuestionID PRIMARY KEY CLUSTERED 
(
	Static_Question_ID ASC,
	Static_SubQuestion_ID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON PRIMARY
) ON PRIMARY

GO


ALTER TABLE dbo.ABS_Static_Questions ADD  CONSTRAINT DF__ABS_Stati__ReqFl__5F29F348  DEFAULT ((0)) FOR ReqFlag
GO

ALTER TABLE dbo.ABS_Static_Questions ADD  CONSTRAINT DF__ABS_Stati__Obj2R__601E1781  DEFAULT ((0)) FOR Obj2Reqd
GO

USE spec_web
GO

/****** Object:  Table dbo.ABS_Static_SubQuestions    Script Date: 9/8/2016 1:45:58 PM ******/

CREATE TABLE dbo.ABS_Static_SubQuestions(
	Static_Question_ID int NOT NULL,
	Static_SubQuestion_ID int NOT NULL,
	Secondary_StaticQuestion_ID int NOT NULL,
	Secondary_StaticChoice_ID int NOT NULL,
	QuestionHeader varchar(450) NULL,
	QuestionNote varchar(450) NULL,
	ReqFlag bit NOT NULL,
	Obj1Choice varchar(20) NULL,
	Obj1Type varchar(20) NULL,
	Obj1Text varchar(450) NULL,
	Obj1Note varchar(450) NULL,
	Obj2Type varchar(20) NULL,
	Obj2Text varchar(450) NULL,
	Obj2Note varchar(450) NULL,
	Obj2Reqd bit NOT NULL,
	Add_Dt datetime NOT NULL,
	AddUser_CustID varchar(20) NOT NULL,
	Mod_Dt datetime NULL,
	ModUser_CustID varchar(20) NULL,
 CONSTRAINT pk_StaticSubQuestionID PRIMARY KEY CLUSTERED 
(
	Static_Question_ID ASC,
	Static_SubQuestion_ID ASC,
	Secondary_StaticQuestion_ID ASC,
	Secondary_StaticChoice_ID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON PRIMARY
) ON PRIMARY

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE dbo.ABS_Static_SubQuestions ADD  DEFAULT ((0)) FOR ReqFlag
GO

ALTER TABLE dbo.ABS_Static_SubQuestions ADD  DEFAULT ((0)) FOR Obj2Reqd
GO

ALTER TABLE dbo.ABS_Static_SubQuestions  WITH NOCHECK ADD  CONSTRAINT fk_StaticPrimSubQuestionID FOREIGN KEY(Static_Question_ID, Static_SubQuestion_ID)
REFERENCES dbo.ABS_Static_Questions (Static_Question_ID, Static_SubQuestion_ID)
GO

ALTER TABLE dbo.ABS_Static_SubQuestions CHECK CONSTRAINT fk_StaticPrimSubQuestionID
GO


/****** Object:  Table dbo.ABS_Call_FileUpload    Script Date: 9/8/2016 1:41:45 PM ******/

CREATE TABLE dbo.ABS_Call_FileUpload(
	Call_Control_ID int NOT NULL,
	Indx int NOT NULL,
	Category varchar(450) NULL,
	Comment varchar(2000) NULL,
	Add_Dt datetime NOT NULL,
	AddUser_CustID varchar(20) NOT NULL,
	Mod_Dt datetime NULL,
	ModUser_CustID varchar(20) NULL,
 CONSTRAINT pk_FileUpload PRIMARY KEY CLUSTERED 
(
	Call_Control_ID ASC,
	Indx ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON PRIMARY
) ON PRIMARY

GO

ALTER TABLE dbo.ABS_Call_FileUpload  WITH CHECK ADD  CONSTRAINT fk_FileUploadCallID FOREIGN KEY(Call_Control_ID)
REFERENCES dbo.ABS_Call_Control (Call_Control_ID)
GO

ALTER TABLE dbo.ABS_Call_FileUpload CHECK CONSTRAINT fk_FileUploadCallID
GO

/****** Object:  Table [dbo].[ABS_Presenter]    Script Date: 9/12/2016 9:00:15 AM ******/
CREATE TABLE [dbo].[ABS_Presenter](
	[Presenter_ID] [int] IDENTITY(1,1) NOT NULL,
	[Submission_ID] [int] NOT NULL,
	[Presenter_Auth_ID] [varchar](20) NULL,
	[Presenter_FirstName] [varchar](255) NULL,
	[Presenter_LastName] [varchar](255) NULL,
	[Presenter_LabelName] [varchar](255) NULL,
	[Presenter_City] [varchar](255) NULL,
	[Presenter_State] [varchar](10) NULL,
	[Presenter_Email] [varchar](255) NULL,
	[Presenter_Institution] [varchar](255) NULL,
	[Presenter_List_Number] [int] NULL,
	[DiscloseEmailDate] [datetime] NULL,
	[DiscloseCurrentDate] [datetime] NULL,
	[Add_Dt] [datetime] NOT NULL,
	[AddUser_CustID] [varchar](20) NOT NULL,
	[Mod_Dt] [datetime] NULL,
	[ModUser_CustID] [varchar](20) NULL,
 CONSTRAINT [PK_ABS_Presenter_ID] PRIMARY KEY CLUSTERED 
(
	[Presenter_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[ABS_Presenter]  WITH CHECK ADD  CONSTRAINT [FK_ABS_Presenter_submission_id] FOREIGN KEY([Submission_ID])
REFERENCES [dbo].[ABS_Submissions] ([Submission_ID])
GO

ALTER TABLE [dbo].[ABS_Presenter] CHECK CONSTRAINT [FK_ABS_Presenter_submission_id]
GO

/****** Object:  Table [dbo].[ABS_Disclosure_Tracking]    Script Date: 9/12/2016 8:59:25 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ABS_Disclosure_Tracking](
	[ABS_disclosure_tracking_id] [int] IDENTITY(1,1) NOT NULL,
	[spec_customer_id] [varchar](20) NOT NULL,
	[aaos_master_customer_id] [varchar](12) NOT NULL,
	[org_id] [varchar](10) NOT NULL,
	[adddate] [datetime] NOT NULL,
 CONSTRAINT [PK_ABS_Disclosure_Tracking] PRIMARY KEY CLUSTERED 
(
	[ABS_disclosure_tracking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


/****** Object:  Table [dbo].[ABS_Submission_Question_Results]    Script Date: 9/12/2016 9:02:45 AM ******/
CREATE TABLE [dbo].[ABS_Submission_Question_Results](
	[Submission_ID] [int] NOT NULL,
	[Primary_Question_ID] [int] NOT NULL,
	[SubPrimary_Question_ID] [int] NOT NULL,
	[Secondary_Question_ID] [int] NOT NULL,
	[Secondary_Choice_ID] [int] NOT NULL,
	[Obj1Type] [varchar](20) NULL,
	[Obj1Result] [varchar](450) NULL,
	[Obj2Type] [varchar](20) NULL,
	[Obj2Result] [varchar](450) NULL,
	[Add_Dt] [datetime] NOT NULL,
	[AddUser_CustID] [varchar](20) NOT NULL,
	[Mod_Dt] [datetime] NULL,
	[ModUser_CustID] [varchar](20) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[ABS_Submission_Question_Results]  WITH CHECK ADD  CONSTRAINT [FK__ABS_Submi__Submi__762D5431] FOREIGN KEY([Submission_ID])
REFERENCES [dbo].[ABS_Submissions] ([Submission_ID])
GO

ALTER TABLE [dbo].[ABS_Submission_Question_Results] CHECK CONSTRAINT [FK__ABS_Submi__Submi__762D5431]
GO


/****** Object:  Table [dbo].[ABS_Submission_CoAuthors]    Script Date: 9/12/2016 9:02:30 AM ******/
CREATE TABLE [dbo].[ABS_Submission_CoAuthors](
	[Submission_CoAuthor_ID] [int] IDENTITY(1,1) NOT NULL,
	[Submission_ID] [int] NOT NULL,
	[SubmAuth_ID] [varchar](20) NOT NULL,
	[CoAuth_CustID] [varchar](20) NULL,
	[CoAuth_ListNo] [int] NULL,
	[CoAuth_LabelNm] [varchar](450) NULL,
	[CoAuth_CityST] [varchar](450) NULL,
	[CoAuth_LastNm] [varchar](450) NULL,
	[CoAuth_Email] [varchar](450) NULL,
	[CoAuth_Institution] [varchar](450) NULL,
	[DisclosureAction] [varchar](250) NULL,
	[DiscloseEmailDt] [datetime] NULL,
	[Add_Dt] [datetime] NOT NULL,
	[AddUser_CustID] [varchar](20) NOT NULL,
	[Mod_Dt] [datetime] NULL,
	[ModUser_CustID] [varchar](20) NULL,
 CONSTRAINT [PK_ABS_SubmissionCoAuthors] PRIMARY KEY CLUSTERED 
(
	[Submission_CoAuthor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[ABS_Submission_CoAuthors]  WITH CHECK ADD  CONSTRAINT [FK__ABS_Submi__Submi__74450BBF] FOREIGN KEY([Submission_ID])
REFERENCES [dbo].[ABS_Submissions] ([Submission_ID])
GO

ALTER TABLE [dbo].[ABS_Submission_CoAuthors] CHECK CONSTRAINT [FK__ABS_Submi__Submi__74450BBF]
GO

/****** Object:  Table [dbo].[ABS_Session]    Script Date: 9/12/2016 9:01:46 AM ******/
CREATE TABLE [dbo].[ABS_Session](
	[Session_ID] [int] IDENTITY(1,1) NOT NULL,
	[Call_Control_ID] [int] NOT NULL,
	[Session_Name] [varchar](250) NOT NULL,
	[Session_Description] [varchar](250) NULL,
	[Session_Start_Date] [datetime] NOT NULL,
	[Session_End_Date] [datetime] NOT NULL,
	[Session_Color] [varchar](250) NULL,
	[Allow_Concurrent] [bit] NOT NULL,
	[addoper] [varchar](20) NOT NULL,
	[adddate] [datetime] NOT NULL,
	[modoper] [varchar](20) NULL,
	[moddate] [datetime] NULL,
	[Session_Track_Header] [varchar](250) NULL,
 CONSTRAINT [PK_ABS_Session] PRIMARY KEY CLUSTERED 
(
	[Session_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[ABS_Session] ADD  CONSTRAINT [DF_ABS_Session_Allow_Concurrent]  DEFAULT ((0)) FOR [Allow_Concurrent]
GO


/****** Object:  Table [dbo].[ABS_Scoring]    Script Date: 9/12/2016 9:00:52 AM ******/
CREATE TABLE [dbo].[ABS_Scoring](
	[Submission_ID] [int] NOT NULL,
	[ScoringType_ID] [int] NOT NULL,
	[Scoring_Control_ID] [int] NOT NULL,
	[User_CustID] [varchar](20) NOT NULL,
	[Assign_Code_Nm] [varchar](60) NOT NULL,
	[RecuseFlag] [bit] NOT NULL,
	[Score] [decimal](5, 2) NOT NULL,
	[ScoreDt] [datetime] NULL,
	[ScoreComment] [varchar](4000) NULL,
 CONSTRAINT [pk_ScoringID] PRIMARY KEY CLUSTERED 
(
	[Submission_ID] ASC,
	[ScoringType_ID] ASC,
	[Scoring_Control_ID] ASC,
	[User_CustID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[ABS_Scoring] ADD  DEFAULT ((0)) FOR [RecuseFlag]
GO

ALTER TABLE [dbo].[ABS_Scoring] ADD  DEFAULT ((0)) FOR [Score]
GO

ALTER TABLE [dbo].[ABS_Scoring]  WITH CHECK ADD  CONSTRAINT [FK__ABS_Scori__Submi__5F49EED9] FOREIGN KEY([Submission_ID])
REFERENCES [dbo].[ABS_Submissions] ([Submission_ID])
GO

ALTER TABLE [dbo].[ABS_Scoring] CHECK CONSTRAINT [FK__ABS_Scori__Submi__5F49EED9]
GO


/****** Object:  Table [dbo].[ABS_Scoring_Control]    Script Date: 9/12/2016 9:01:18 AM ******/
CREATE TABLE [dbo].[ABS_Scoring_Control](
	[Scoring_Control_ID] [int] IDENTITY(1,1) NOT NULL,
	[Call_Control_ID] [int] NOT NULL,
	[ScoreOpen_Dt] [datetime] NOT NULL,
	[ScoreClose_Dt] [datetime] NOT NULL,
	[ScoreFile_Typ] [varchar](450) NOT NULL,
	[Add_Dt] [datetime] NOT NULL,
	[AddUser_CustID] [varchar](20) NOT NULL,
	[Mod_Dt] [datetime] NULL,
	[ModUser_CustID] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Scoring_Control_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[ABS_Scoring_Control]  WITH CHECK ADD FOREIGN KEY([Call_Control_ID])
REFERENCES [dbo].[ABS_Call_Control] ([Call_Control_ID])
GO

/****** Object:  Table [dbo].[ABS_Scoring_Types]    Script Date: 9/12/2016 9:01:34 AM ******/
CREATE TABLE [dbo].[ABS_Scoring_Types](
	[ScoringType_ID] [int] NOT NULL,
	[Scoring_Control_ID] [int] NOT NULL,
	[Scoring_Type_Nm] [varchar](200) NULL,
	[ScoreType_Desc] [varchar](2000) NULL,
	[ScoreMin] [int] NULL,
	[ScoreMax] [int] NULL,
	[ScoreIncrement] [decimal](3, 2) NULL,
 CONSTRAINT [pk_ScoringTypeID] PRIMARY KEY CLUSTERED 
(
	[ScoringType_ID] ASC,
	[Scoring_Control_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[ABS_Scoring_Types]  WITH CHECK ADD FOREIGN KEY([Scoring_Control_ID])
REFERENCES [dbo].[ABS_Scoring_Control] ([Scoring_Control_ID])
GO


/****** Object:  Table [dbo].[ABS_Schedule]    Script Date: 9/12/2016 9:00:29 AM ******/
CREATE TABLE [dbo].[ABS_Schedule](
	[ABS_Schedule_ID] [int] IDENTITY(1,1) NOT NULL,
	[Submission_ID] [int] NOT NULL,
	[Presentation_Number] [int] NOT NULL,
	[Presentation_Start_date] [datetime] NULL,
	[Presentation_End_Date] [datetime] NULL,
	[Presentation_Type] [varchar](200) NULL,
	[Committee_Accept] [bit] NULL,
	[adddate] [datetime] NOT NULL,
	[addoper] [varchar](20) NULL,
	[moddate] [datetime] NULL,
	[modoper] [varchar](20) NULL,
	[Session_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ABS_Schedule_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
