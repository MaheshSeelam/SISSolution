USE [master]
GO
/****** Object:  Database [StudentInformationSystem]    Script Date: 10/24/2018 5:39:19 PM ******/
CREATE DATABASE [StudentInformationSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentInformationSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\StudentInformationSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudentInformationSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\StudentInformationSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [StudentInformationSystem] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentInformationSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentInformationSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentInformationSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentInformationSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentInformationSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentInformationSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentInformationSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentInformationSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentInformationSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentInformationSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentInformationSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentInformationSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentInformationSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentInformationSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentInformationSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentInformationSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudentInformationSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentInformationSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentInformationSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentInformationSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentInformationSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentInformationSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentInformationSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentInformationSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StudentInformationSystem] SET  MULTI_USER 
GO
ALTER DATABASE [StudentInformationSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentInformationSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentInformationSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentInformationSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudentInformationSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StudentInformationSystem] SET QUERY_STORE = OFF
GO
USE [StudentInformationSystem]
GO
/****** Object:  Table [dbo].[Assignments]    Script Date: 10/24/2018 5:39:19 PM ******/
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
/****** Object:  Table [dbo].[AssignmentScores]    Script Date: 10/24/2018 5:39:19 PM ******/
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
/****** Object:  Table [dbo].[Courses]    Script Date: 10/24/2018 5:39:19 PM ******/
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
/****** Object:  Table [dbo].[NotificationPreferences]    Script Date: 10/24/2018 5:39:19 PM ******/
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
/****** Object:  Table [dbo].[Students]    Script Date: 10/24/2018 5:39:19 PM ******/
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
SET IDENTITY_INSERT [dbo].[Assignments] ON 

INSERT [dbo].[Assignments] ([Id], [Subject], [Type], [DateCreated], [DueDate], [Score], [Grade], [Notes], [Result], [DateModified], [Reviewed], [DocumentLink], [Name]) VALUES (1, N'CompScience101', N'1st Quarter Exam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Assignments] ([Id], [Subject], [Type], [DateCreated], [DueDate], [Score], [Grade], [Notes], [Result], [DateModified], [Reviewed], [DocumentLink], [Name]) VALUES (2, N'Mechanical Engg101', N'1st Quarter Exam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Assignments] OFF
SET IDENTITY_INSERT [dbo].[AssignmentScores] ON 

INSERT [dbo].[AssignmentScores] ([Id], [Score], [AssignmentId], [StudentId], [Grade], [Notes], [Result], [DocumentLink]) VALUES (1, N'50', 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[AssignmentScores] ([Id], [Score], [AssignmentId], [StudentId], [Grade], [Notes], [Result], [DocumentLink]) VALUES (2, N'50', 1, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[AssignmentScores] ([Id], [Score], [AssignmentId], [StudentId], [Grade], [Notes], [Result], [DocumentLink]) VALUES (3, N'60', 2, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[AssignmentScores] ([Id], [Score], [AssignmentId], [StudentId], [Grade], [Notes], [Result], [DocumentLink]) VALUES (4, N'70', 2, 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[AssignmentScores] OFF
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([Id], [Name], [Class], [Address], [PhoneNo], [EmailId]) VALUES (1, N'Mike', N'BTECH Mech 1st Year', N'Hyd', N'001', N'John@gmail.com')
INSERT [dbo].[Students] ([Id], [Name], [Class], [Address], [PhoneNo], [EmailId]) VALUES (2, N'Steve', N'BTECH Mech 1st Year', N'Hyd', N'002', N'Steve@gmail.com')
INSERT [dbo].[Students] ([Id], [Name], [Class], [Address], [PhoneNo], [EmailId]) VALUES (3, N'Kiran', N'BTECH Mech 1st Year', N'Hyd', N'003', N'Kiran@gmail.com')
SET IDENTITY_INSERT [dbo].[Students] OFF
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
USE [master]
GO
ALTER DATABASE [StudentInformationSystem] SET  READ_WRITE 
GO
