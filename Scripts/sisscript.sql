USE [StudentInformationSystem]
GO

/****** Object:  Table [dbo].[Assignments]    Script Date: 10/22/2018 10:52:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](50) NULL,
	[Type] [nvarchar](max) NULL,
	[DateCreated] [datetime2](7) NULL,
	[DueDate] [datetime] NULL,
	[Score] [nvarchar](50) NULL,
	[Grade] [nvarchar](50) NULL,
	[Notes] [nvarchar](max) NULL,
	[Result] [nvarchar](max) NULL,
	[DateModified] [datetime] NULL,
	[Reviewed] [nvarchar](50) NULL,
	[DocumentLink] [nvarchar](max) NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Assignments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssignmentScores]    Script Date: 10/22/2018 10:52:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignmentScores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Score] [nvarchar](50) NULL,
	[AssignmentId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[Grade] [nvarchar](50) NULL,
	[Notes] [nvarchar](max) NULL,
	[Result] [nvarchar](50) NULL,
	[DocumentLink] [nvarchar](max) NULL,
 CONSTRAINT [PK_AssignmentScores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 10/22/2018 10:52:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Note] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationPreferences]    Script Date: 10/22/2018 10:52:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationPreferences](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmailId] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[EmailOptIn] [bit] NULL,
	[SMSOptIn] [bit] NULL,
	[MailOptIn] [bit] NULL,
	[StudentId] [int] NOT NULL,
 CONSTRAINT [PK_NotificationPreferences] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 10/22/2018 10:52:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Class] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[PhoneNo] [nvarchar](50) NULL,
	[EmailId] [nvarchar](50) NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[AssignmentScores]  WITH CHECK ADD  CONSTRAINT [FK_AssignmentScores_Assignments] FOREIGN KEY([AssignmentId])
REFERENCES [dbo].[Assignments] ([Id])
GO
ALTER TABLE [dbo].[AssignmentScores] CHECK CONSTRAINT [FK_AssignmentScores_Assignments]
GO
ALTER TABLE [dbo].[AssignmentScores]  WITH CHECK ADD  CONSTRAINT [FK_AssignmentScores_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
GO
ALTER TABLE [dbo].[AssignmentScores] CHECK CONSTRAINT [FK_AssignmentScores_Students]
GO
ALTER TABLE [dbo].[NotificationPreferences]  WITH CHECK ADD  CONSTRAINT [FK_NotificationPreferences_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
GO
ALTER TABLE [dbo].[NotificationPreferences] CHECK CONSTRAINT [FK_NotificationPreferences_Students]
GO
