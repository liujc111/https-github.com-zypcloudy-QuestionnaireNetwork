/*    ==脚本参数==

    源服务器版本 : SQL Server 2017 (14.0.1000)
    源数据库引擎版本 : Microsoft SQL Server Express Edition
    源数据库引擎类型 : 独立的 SQL Server

    目标服务器版本 : SQL Server 2017
    目标数据库引擎版本 : Microsoft SQL Server Standard Edition
    目标数据库引擎类型 : 独立的 SQL Server
*/
USE [master]
GO
/****** Object:  Database [Questionnaire]    Script Date: 2017/10/9 16:01:16 ******/
CREATE DATABASE [Questionnaire]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Questionnaire', FILENAME = N'D:\Software\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Questionnaire.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Questionnaire_log', FILENAME = N'D:\Software\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Questionnaire_log.ldf' , SIZE = 2304KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Questionnaire] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Questionnaire].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Questionnaire] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Questionnaire] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Questionnaire] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Questionnaire] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Questionnaire] SET ARITHABORT OFF 
GO
ALTER DATABASE [Questionnaire] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Questionnaire] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Questionnaire] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Questionnaire] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Questionnaire] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Questionnaire] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Questionnaire] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Questionnaire] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Questionnaire] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Questionnaire] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Questionnaire] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Questionnaire] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Questionnaire] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Questionnaire] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Questionnaire] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Questionnaire] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Questionnaire] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Questionnaire] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Questionnaire] SET  MULTI_USER 
GO
ALTER DATABASE [Questionnaire] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Questionnaire] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Questionnaire] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Questionnaire] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Questionnaire] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Questionnaire] SET QUERY_STORE = OFF
GO
USE [Questionnaire]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Questionnaire]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 2017/10/9 16:01:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[answerId] [int] IDENTITY(1,1) NOT NULL,
	[paperId] [int] NOT NULL,
	[userIp] [varchar](20) NULL,
	[answerTime] [datetime] NOT NULL,
 CONSTRAINT [PK_ANSWER] PRIMARY KEY CLUSTERED 
(
	[answerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompletionAnswer]    Script Date: 2017/10/9 16:01:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompletionAnswer](
	[caAnswerId] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[questionId] [int] NOT NULL,
	[paperId] [int] NOT NULL,
	[answerId] [int] NOT NULL,
	[caAnswer] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_COMPLETIONANSWER] PRIMARY KEY CLUSTERED 
(
	[caAnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Option]    Script Date: 2017/10/9 16:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Option](
	[optionId] [int] IDENTITY(1,1) NOT NULL,
	[questionId] [int] NOT NULL,
	[optionName] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_OPTION] PRIMARY KEY CLUSTERED 
(
	[optionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OptionAnswer]    Script Date: 2017/10/9 16:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OptionAnswer](
	[optionAnswerId] [int] IDENTITY(1,1) NOT NULL,
	[optionId] [int] NOT NULL,
	[questionId] [int] NOT NULL,
	[answerId] [int] NOT NULL,
 CONSTRAINT [PK_OPTIONANSWER] PRIMARY KEY CLUSTERED 
(
	[optionAnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paper]    Script Date: 2017/10/9 16:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paper](
	[paperId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[title] [nvarchar](200) NOT NULL,
	[paperType] [int] NOT NULL,
	[answerCount] [int] NOT NULL,
	[paperStatus] [int] NOT NULL,
	[createTime] [datetime] NOT NULL,
 CONSTRAINT [PK_PAPER] PRIMARY KEY CLUSTERED 
(
	[paperId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 2017/10/9 16:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[questionId] [int] IDENTITY(1,1) NOT NULL,
	[paperId] [int] NOT NULL,
	[questionName] [nvarchar](20) NOT NULL,
	[questionType] [int] NOT NULL,
 CONSTRAINT [PK_QUESTION] PRIMARY KEY CLUSTERED 
(
	[questionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2017/10/9 16:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[nickname] [nvarchar](20) NULL,
	[email] [varchar](20) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[head] [varchar](max) NULL,
	[regTime] [datetime] NOT NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Answer] ON 

INSERT [dbo].[Answer] ([answerId], [paperId], [userIp], [answerTime]) VALUES (17, 2, N'192.168.254.1', CAST(N'2017-06-08T00:19:54.000' AS DateTime))
INSERT [dbo].[Answer] ([answerId], [paperId], [userIp], [answerTime]) VALUES (18, 1, N'192.168.254.1', CAST(N'2017-06-08T00:20:23.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Answer] OFF
SET IDENTITY_INSERT [dbo].[Option] ON 

INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (1, 1, N'选项0')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (2, 1, N'选项1')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (3, 1, N'选项2')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (4, 1, N'选项3')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (5, 2, N'选项0')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (6, 2, N'选项1')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (7, 2, N'选项2')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (8, 2, N'选项3')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (9, 4, N'选项0')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (10, 4, N'选项1')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (11, 4, N'选项2')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (12, 4, N'选项3')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (13, 5, N'选项0')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (14, 5, N'选项1')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (15, 5, N'选项2')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (16, 5, N'选项3')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (17, 7, N'选项0')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (18, 7, N'选项1')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (19, 7, N'选项2')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (20, 7, N'选项3')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (21, 8, N'选项0')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (22, 8, N'选项1')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (23, 8, N'选项2')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (24, 8, N'选项3')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (25, 9, N'选项0')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (26, 9, N'选项1')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (27, 9, N'选项2')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (28, 9, N'选项3')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (29, 10, N'选项0')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (30, 10, N'选项1')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (31, 10, N'选项2')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (32, 10, N'选项3')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (33, 12, N'选项0')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (34, 12, N'选项1')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (35, 12, N'选项2')
INSERT [dbo].[Option] ([optionId], [questionId], [optionName]) VALUES (36, 12, N'选项3')
SET IDENTITY_INSERT [dbo].[Option] OFF
SET IDENTITY_INSERT [dbo].[OptionAnswer] ON 

INSERT [dbo].[OptionAnswer] ([optionAnswerId], [optionId], [questionId], [answerId]) VALUES (16, 1, 1, 18)
INSERT [dbo].[OptionAnswer] ([optionAnswerId], [optionId], [questionId], [answerId]) VALUES (17, 5, 1, 18)
INSERT [dbo].[OptionAnswer] ([optionAnswerId], [optionId], [questionId], [answerId]) VALUES (18, 6, 1, 18)
INSERT [dbo].[OptionAnswer] ([optionAnswerId], [optionId], [questionId], [answerId]) VALUES (19, 7, 1, 18)
SET IDENTITY_INSERT [dbo].[OptionAnswer] OFF
SET IDENTITY_INSERT [dbo].[Paper] ON 

INSERT [dbo].[Paper] ([paperId], [userId], [title], [paperType], [answerCount], [paperStatus], [createTime]) VALUES (1, 1, N'大学生学习压力调查', 0, 15, 1, CAST(N'2017-06-07T17:08:48.000' AS DateTime))
INSERT [dbo].[Paper] ([paperId], [userId], [title], [paperType], [answerCount], [paperStatus], [createTime]) VALUES (2, 1, N'test', 0, 2, 1, CAST(N'2017-06-07T17:09:18.000' AS DateTime))
INSERT [dbo].[Paper] ([paperId], [userId], [title], [paperType], [answerCount], [paperStatus], [createTime]) VALUES (3, 1, N'qwe', 0, 1, 0, CAST(N'2017-06-07T17:09:21.000' AS DateTime))
INSERT [dbo].[Paper] ([paperId], [userId], [title], [paperType], [answerCount], [paperStatus], [createTime]) VALUES (4, 1, N'1234', 0, 0, 0, CAST(N'2017-06-07T17:09:53.000' AS DateTime))
INSERT [dbo].[Paper] ([paperId], [userId], [title], [paperType], [answerCount], [paperStatus], [createTime]) VALUES (5, 1, N'412', 0, 0, 1, CAST(N'2017-06-07T22:22:56.000' AS DateTime))
INSERT [dbo].[Paper] ([paperId], [userId], [title], [paperType], [answerCount], [paperStatus], [createTime]) VALUES (6, 1, N'满意度', 0, 0, 0, CAST(N'2017-06-08T09:33:31.000' AS DateTime))
INSERT [dbo].[Paper] ([paperId], [userId], [title], [paperType], [answerCount], [paperStatus], [createTime]) VALUES (7, 1, N'三下乡', 0, 0, 0, CAST(N'2017-06-08T09:36:21.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Paper] OFF
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([questionId], [paperId], [questionName], [questionType]) VALUES (1, 1, N'题目', 0)
INSERT [dbo].[Question] ([questionId], [paperId], [questionName], [questionType]) VALUES (2, 1, N'题目', 1)
INSERT [dbo].[Question] ([questionId], [paperId], [questionName], [questionType]) VALUES (3, 1, N'题目', 3)
INSERT [dbo].[Question] ([questionId], [paperId], [questionName], [questionType]) VALUES (4, 2, N'题目', 0)
INSERT [dbo].[Question] ([questionId], [paperId], [questionName], [questionType]) VALUES (5, 2, N'题目', 1)
INSERT [dbo].[Question] ([questionId], [paperId], [questionName], [questionType]) VALUES (6, 2, N'题目', 3)
INSERT [dbo].[Question] ([questionId], [paperId], [questionName], [questionType]) VALUES (7, 3, N'题目', 0)
INSERT [dbo].[Question] ([questionId], [paperId], [questionName], [questionType]) VALUES (8, 3, N'题目', 1)
INSERT [dbo].[Question] ([questionId], [paperId], [questionName], [questionType]) VALUES (9, 3, N'题目', 0)
INSERT [dbo].[Question] ([questionId], [paperId], [questionName], [questionType]) VALUES (10, 5, N'题目', 0)
INSERT [dbo].[Question] ([questionId], [paperId], [questionName], [questionType]) VALUES (11, 5, N'题目', 3)
INSERT [dbo].[Question] ([questionId], [paperId], [questionName], [questionType]) VALUES (12, 5, N'题目', 1)
SET IDENTITY_INSERT [dbo].[Question] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([userId], [nickname], [email], [password], [head], [regTime]) VALUES (1, N'null', N'314705487@qq.com', N'123456', N'null', CAST(N'2017-06-07T17:08:36.000' AS DateTime))
INSERT [dbo].[User] ([userId], [nickname], [email], [password], [head], [regTime]) VALUES (2, N'null', N'314705487@qq.com', N'123456', N'null', CAST(N'2017-06-08T15:48:32.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_ANSWER_REFERENCE_PAPER] FOREIGN KEY([paperId])
REFERENCES [dbo].[Paper] ([paperId])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_ANSWER_REFERENCE_PAPER]
GO
ALTER TABLE [dbo].[CompletionAnswer]  WITH CHECK ADD  CONSTRAINT [FK_COMPLETI_REFERENCE_ANSWER] FOREIGN KEY([answerId])
REFERENCES [dbo].[Answer] ([answerId])
GO
ALTER TABLE [dbo].[CompletionAnswer] CHECK CONSTRAINT [FK_COMPLETI_REFERENCE_ANSWER]
GO
ALTER TABLE [dbo].[CompletionAnswer]  WITH CHECK ADD  CONSTRAINT [FK_COMPLETI_REFERENCE_PAPER] FOREIGN KEY([paperId])
REFERENCES [dbo].[Paper] ([paperId])
GO
ALTER TABLE [dbo].[CompletionAnswer] CHECK CONSTRAINT [FK_COMPLETI_REFERENCE_PAPER]
GO
ALTER TABLE [dbo].[CompletionAnswer]  WITH CHECK ADD  CONSTRAINT [FK_COMPLETI_REFERENCE_QUESTION] FOREIGN KEY([questionId])
REFERENCES [dbo].[Question] ([questionId])
GO
ALTER TABLE [dbo].[CompletionAnswer] CHECK CONSTRAINT [FK_COMPLETI_REFERENCE_QUESTION]
GO
ALTER TABLE [dbo].[Option]  WITH CHECK ADD  CONSTRAINT [FK_OPTION_REFERENCE_QUESTION] FOREIGN KEY([questionId])
REFERENCES [dbo].[Question] ([questionId])
GO
ALTER TABLE [dbo].[Option] CHECK CONSTRAINT [FK_OPTION_REFERENCE_QUESTION]
GO
ALTER TABLE [dbo].[OptionAnswer]  WITH CHECK ADD  CONSTRAINT [FK_OPTIONAN_REFERENCE_ANSWER] FOREIGN KEY([answerId])
REFERENCES [dbo].[Answer] ([answerId])
GO
ALTER TABLE [dbo].[OptionAnswer] CHECK CONSTRAINT [FK_OPTIONAN_REFERENCE_ANSWER]
GO
ALTER TABLE [dbo].[OptionAnswer]  WITH CHECK ADD  CONSTRAINT [FK_OPTIONAN_REFERENCE_OPTION] FOREIGN KEY([optionId])
REFERENCES [dbo].[Option] ([optionId])
GO
ALTER TABLE [dbo].[OptionAnswer] CHECK CONSTRAINT [FK_OPTIONAN_REFERENCE_OPTION]
GO
ALTER TABLE [dbo].[OptionAnswer]  WITH CHECK ADD  CONSTRAINT [FK_OPTIONAN_REFERENCE_QUESTION] FOREIGN KEY([questionId])
REFERENCES [dbo].[Question] ([questionId])
GO
ALTER TABLE [dbo].[OptionAnswer] CHECK CONSTRAINT [FK_OPTIONAN_REFERENCE_QUESTION]
GO
ALTER TABLE [dbo].[Paper]  WITH CHECK ADD  CONSTRAINT [FK_PAPER_REFERENCE_USER] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[Paper] CHECK CONSTRAINT [FK_PAPER_REFERENCE_USER]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_QUESTION_REFERENCE_PAPER] FOREIGN KEY([paperId])
REFERENCES [dbo].[Paper] ([paperId])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_QUESTION_REFERENCE_PAPER]
GO
USE [master]
GO
ALTER DATABASE [Questionnaire] SET  READ_WRITE 
GO
