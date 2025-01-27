USE [master]
GO
/****** Object:  Database [Event_Management]    Script Date: 18-04-2024 06:58:13 PM ******/
CREATE DATABASE [Event_Management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Event_Management', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Event_Management.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Event_Management_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Event_Management_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Event_Management] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Event_Management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Event_Management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Event_Management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Event_Management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Event_Management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Event_Management] SET ARITHABORT OFF 
GO
ALTER DATABASE [Event_Management] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Event_Management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Event_Management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Event_Management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Event_Management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Event_Management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Event_Management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Event_Management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Event_Management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Event_Management] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Event_Management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Event_Management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Event_Management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Event_Management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Event_Management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Event_Management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Event_Management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Event_Management] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Event_Management] SET  MULTI_USER 
GO
ALTER DATABASE [Event_Management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Event_Management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Event_Management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Event_Management] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Event_Management] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Event_Management] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Event_Management] SET QUERY_STORE = ON
GO
ALTER DATABASE [Event_Management] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Event_Management]
GO
/****** Object:  Table [dbo].[TBL_admin]    Script Date: 18-04-2024 06:58:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_admin](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[EmailId] [nvarchar](230) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[MobileNumber] [bigint] NOT NULL,
 CONSTRAINT [PK_TBL_admin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_Event]    Script Date: 18-04-2024 06:58:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Event](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EventName] [nvarchar](max) NOT NULL,
	[EventStartDate] [date] NOT NULL,
	[EventEndDate] [date] NOT NULL,
	[AddDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[EventImage] [text] NULL,
 CONSTRAINT [PK_TBL_Event] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_EventActivity]    Script Date: 18-04-2024 06:58:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_EventActivity](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Event_Id] [bigint] NOT NULL,
	[EventActivityName] [nvarchar](max) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[AddDate] [date] NOT NULL,
	[isActive] [bit] NOT NULL,
	[Price] [bigint] NULL,
 CONSTRAINT [PK_TBL_EventActivity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_User]    Script Date: 18-04-2024 06:58:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_User](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[EmailId] [nvarchar](230) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[MobileNumber] [bigint] NOT NULL,
 CONSTRAINT [PK_TBL_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TBL_admin] ON 

INSERT [dbo].[TBL_admin] ([Id], [Name], [EmailId], [Password], [MobileNumber]) VALUES (1, N'darshan', N'darshan01@gmail.com', N'Darshan@123', 9510484425)
SET IDENTITY_INSERT [dbo].[TBL_admin] OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_Event] ON 

INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (12, N'Ramnavmi', CAST(N'2024-04-27' AS Date), CAST(N'2024-04-27' AS Date), CAST(N'2024-04-10T21:49:00.343' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 01-19-03 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (13, N'Holi', CAST(N'2024-04-21' AS Date), CAST(N'2024-04-21' AS Date), CAST(N'2024-04-10T08:07:04.803' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 01-51-24 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (14, N'dhuleti', CAST(N'2024-04-28' AS Date), CAST(N'2024-04-29' AS Date), CAST(N'2024-04-09T18:25:09.267' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 02-26-33 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (15, N'asfgihawrhgbrgfh', CAST(N'2024-04-28' AS Date), CAST(N'2024-04-30' AS Date), CAST(N'2024-04-09T04:43:13.730' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 02-56-31 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (16, N'Diwali', CAST(N'2024-04-29' AS Date), CAST(N'2024-05-01' AS Date), CAST(N'2024-04-08T15:01:18.190' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (17, N'bestuvarshvsdfb', CAST(N'2024-04-30' AS Date), CAST(N'2024-05-02' AS Date), CAST(N'2024-04-08T01:19:22.653' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_12-04-2024 12-19-33 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (65, N'Holi', CAST(N'2024-06-04' AS Date), CAST(N'2024-06-10' AS Date), CAST(N'2024-03-11T15:46:56.837' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (66, N'ramzan', CAST(N'2024-06-05' AS Date), CAST(N'2024-06-11' AS Date), CAST(N'2024-03-11T02:05:01.300' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (67, N'id-a-milad', CAST(N'2024-06-06' AS Date), CAST(N'2024-06-12' AS Date), CAST(N'2024-03-10T12:23:05.760' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (68, N'hanuman', CAST(N'2024-06-06' AS Date), CAST(N'2024-06-12' AS Date), CAST(N'2024-03-09T22:41:10.223' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (69, N'Ramnavni', CAST(N'2024-06-07' AS Date), CAST(N'2024-06-13' AS Date), CAST(N'2024-03-09T08:59:14.687' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (70, N'bestuvarsh', CAST(N'2024-06-08' AS Date), CAST(N'2024-06-14' AS Date), CAST(N'2024-03-08T19:17:19.147' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (71, N'tajposhi', CAST(N'2024-06-09' AS Date), CAST(N'2024-06-15' AS Date), CAST(N'2024-03-08T05:35:23.610' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (72, N'egerhgerhweh', CAST(N'2024-06-09' AS Date), CAST(N'2024-06-16' AS Date), CAST(N'2024-03-07T15:53:28.073' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_16-04-2024 12-12-04 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (73, N'Ganesha Chaturthi', CAST(N'2024-04-21' AS Date), CAST(N'2024-04-30' AS Date), CAST(N'2024-04-17T17:24:23.613' AS DateTime), 0, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_17-04-2024 05-24-22 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (74, N'Chandi Padvo', CAST(N'2024-04-25' AS Date), CAST(N'2024-04-25' AS Date), CAST(N'2024-04-17T17:26:17.683' AS DateTime), 0, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_17-04-2024 05-26-17 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (75, N'Bakri eid', CAST(N'2024-06-12' AS Date), CAST(N'2024-06-18' AS Date), CAST(N'2024-03-05T22:47:41.460' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_17-04-2024 05-28-56 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (76, N'Navratri', CAST(N'2024-06-12' AS Date), CAST(N'2024-06-19' AS Date), CAST(N'2024-03-05T09:05:45.920' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (77, N'Bhaibid', CAST(N'2024-06-13' AS Date), CAST(N'2024-06-20' AS Date), CAST(N'2024-03-04T19:23:50.383' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (78, N'Gudi Padvo', CAST(N'2024-06-14' AS Date), CAST(N'2024-06-21' AS Date), CAST(N'2024-03-04T05:41:54.847' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (79, N'Maha Shivaratri', CAST(N'2024-06-15' AS Date), CAST(N'2024-06-21' AS Date), CAST(N'2024-03-03T15:59:59.307' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (80, N'Durga Ashtami', CAST(N'2024-06-15' AS Date), CAST(N'2024-06-22' AS Date), CAST(N'2024-03-03T02:18:03.770' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (81, N'Maha Navami', CAST(N'2024-06-16' AS Date), CAST(N'2024-06-23' AS Date), CAST(N'2024-03-02T12:36:08.233' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (82, N'Vijaya Dashami', CAST(N'2024-06-17' AS Date), CAST(N'2024-06-24' AS Date), CAST(N'2024-03-01T22:54:12.693' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (83, N'Dhan Teras', CAST(N'2024-06-17' AS Date), CAST(N'2024-06-25' AS Date), CAST(N'2024-03-01T09:12:17.157' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (84, N'Annakut ', CAST(N'2024-06-18' AS Date), CAST(N'2024-06-25' AS Date), CAST(N'2024-02-29T19:30:21.620' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (85, N'Akshaya Tritiya', CAST(N'2024-06-19' AS Date), CAST(N'2024-06-26' AS Date), CAST(N'2024-02-29T05:48:26.080' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (86, N'Krishna Janmashtami', CAST(N'2024-06-20' AS Date), CAST(N'2024-06-27' AS Date), CAST(N'2024-02-28T16:06:30.543' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (87, N'Laal Loi', CAST(N'2024-06-20' AS Date), CAST(N'2024-06-28' AS Date), CAST(N'2024-02-28T02:24:35.003' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (88, N'Thaipusam', CAST(N'2024-06-21' AS Date), CAST(N'2024-06-29' AS Date), CAST(N'2024-02-27T12:42:39.467' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (89, N'Hindi New Year ', CAST(N'2024-06-22' AS Date), CAST(N'2024-06-30' AS Date), CAST(N'2024-02-26T23:00:43.930' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (90, N'Savitri Pooja  ', CAST(N'2024-06-23' AS Date), CAST(N'2024-06-30' AS Date), CAST(N'2024-02-26T09:18:48.390' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (91, N'Guru Purnima   ', CAST(N'2024-06-23' AS Date), CAST(N'2024-07-01' AS Date), CAST(N'2024-02-25T19:36:52.853' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (92, N'	
Krishna Janmashtami ', CAST(N'2024-06-24' AS Date), CAST(N'2024-07-02' AS Date), CAST(N'2024-02-25T05:54:57.317' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (93, N'	Dusshera ', CAST(N'2024-06-25' AS Date), CAST(N'2024-07-03' AS Date), CAST(N'2024-02-24T16:13:01.777' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (94, N'	
Chhath Puja ', CAST(N'2024-06-26' AS Date), CAST(N'2024-07-04' AS Date), CAST(N'2024-02-24T02:31:06.240' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (95, N'Kartik Poornima ', CAST(N'2024-06-26' AS Date), CAST(N'2024-07-04' AS Date), CAST(N'2024-02-23T12:49:10.703' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (96, N'	
Geeta Jayanti ', CAST(N'2024-06-27' AS Date), CAST(N'2024-07-05' AS Date), CAST(N'2024-02-22T23:07:15.163' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (97, N'Dhanu Sankranti ', CAST(N'2024-06-28' AS Date), CAST(N'2024-07-06' AS Date), CAST(N'2024-02-22T09:25:19.627' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (98, N'Vaisakhi ', CAST(N'2024-06-29' AS Date), CAST(N'2024-07-07' AS Date), CAST(N'2024-02-21T19:43:24.090' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (99, N'Pongal  ', CAST(N'2024-06-29' AS Date), CAST(N'2024-07-08' AS Date), CAST(N'2024-02-21T06:01:28.550' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (100, N'April Fools Day', CAST(N'2024-06-30' AS Date), CAST(N'2024-07-09' AS Date), CAST(N'2024-02-20T16:19:33.013' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (101, N'Surya Grahan', CAST(N'2024-07-01' AS Date), CAST(N'2024-07-09' AS Date), CAST(N'2024-02-20T02:37:37.477' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (102, N'Gandhi jaynti', CAST(N'2024-07-01' AS Date), CAST(N'2024-07-10' AS Date), CAST(N'2024-02-19T12:55:41.937' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (103, N' World Cancer Day', CAST(N'2024-07-02' AS Date), CAST(N'2024-07-11' AS Date), CAST(N'2024-02-18T23:13:46.400' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_11-04-2024 04-43-37 PM.jpg')
INSERT [dbo].[TBL_Event] ([Id], [EventName], [EventStartDate], [EventEndDate], [AddDate], [IsActive], [EventImage]) VALUES (104, N'Suit and sadi Day', CAST(N'2024-04-30' AS Date), CAST(N'2024-04-30' AS Date), CAST(N'2024-04-18T18:17:47.120' AS DateTime), 1, N'C:\Users\Priya Sutariya\Desktop\Darshan Vaghani\Week 10\Event Management\Expenses Management\image\img_18-04-2024 06-17-46 PM.jpg')
SET IDENTITY_INSERT [dbo].[TBL_Event] OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_EventActivity] ON 

INSERT [dbo].[TBL_EventActivity] ([Id], [Event_Id], [EventActivityName], [StartDate], [EndDate], [AddDate], [isActive], [Price]) VALUES (1, 12, N'visiting temples', CAST(N'2024-04-27T18:00:00.000' AS DateTime), CAST(N'2024-04-27T08:00:00.000' AS DateTime), CAST(N'2024-04-11' AS Date), 1, 500)
INSERT [dbo].[TBL_EventActivity] ([Id], [Event_Id], [EventActivityName], [StartDate], [EndDate], [AddDate], [isActive], [Price]) VALUES (2, 12, N'Reading the Ramayana', CAST(N'2024-04-27T09:00:00.000' AS DateTime), CAST(N'2024-04-27T10:00:00.000' AS DateTime), CAST(N'2024-04-11' AS Date), 1, 200)
INSERT [dbo].[TBL_EventActivity] ([Id], [Event_Id], [EventActivityName], [StartDate], [EndDate], [AddDate], [isActive], [Price]) VALUES (3, 12, N'singing bhajans or kirtans', CAST(N'2024-04-27T18:00:00.000' AS DateTime), CAST(N'2024-04-27T22:00:00.000' AS DateTime), CAST(N'2024-04-11' AS Date), 1, 100)
INSERT [dbo].[TBL_EventActivity] ([Id], [Event_Id], [EventActivityName], [StartDate], [EndDate], [AddDate], [isActive], [Price]) VALUES (4, 13, N'Colours Play', CAST(N'2024-04-21T13:00:00.000' AS DateTime), CAST(N'2024-04-21T15:00:00.000' AS DateTime), CAST(N'2024-04-11' AS Date), 1, 1000)
INSERT [dbo].[TBL_EventActivity] ([Id], [Event_Id], [EventActivityName], [StartDate], [EndDate], [AddDate], [isActive], [Price]) VALUES (5, 13, N'Music and Dance', CAST(N'2024-04-21T16:00:00.000' AS DateTime), CAST(N'2024-04-21T18:00:00.000' AS DateTime), CAST(N'2024-04-11' AS Date), 1, 950)
INSERT [dbo].[TBL_EventActivity] ([Id], [Event_Id], [EventActivityName], [StartDate], [EndDate], [AddDate], [isActive], [Price]) VALUES (6, 13, N'Colorful Water Balloon Fight', CAST(N'2024-04-21T18:00:00.000' AS DateTime), CAST(N'2024-04-21T19:00:00.000' AS DateTime), CAST(N'2024-04-11' AS Date), 1, 1250)
INSERT [dbo].[TBL_EventActivity] ([Id], [Event_Id], [EventActivityName], [StartDate], [EndDate], [AddDate], [isActive], [Price]) VALUES (7, 16, N'wefcadscasd', CAST(N'2024-04-20T16:43:00.000' AS DateTime), CAST(N'2024-04-21T16:43:00.000' AS DateTime), CAST(N'2024-04-11' AS Date), 0, NULL)
INSERT [dbo].[TBL_EventActivity] ([Id], [Event_Id], [EventActivityName], [StartDate], [EndDate], [AddDate], [isActive], [Price]) VALUES (8, 16, N'wefcadscasd', CAST(N'2024-04-20T16:43:00.000' AS DateTime), CAST(N'2024-04-21T16:43:00.000' AS DateTime), CAST(N'2024-04-11' AS Date), 0, NULL)
INSERT [dbo].[TBL_EventActivity] ([Id], [Event_Id], [EventActivityName], [StartDate], [EndDate], [AddDate], [isActive], [Price]) VALUES (9, 73, N'Ganesh sthapna', CAST(N'2024-04-21T06:00:00.000' AS DateTime), CAST(N'2024-04-21T07:00:00.000' AS DateTime), CAST(N'2024-04-17' AS Date), 0, NULL)
INSERT [dbo].[TBL_EventActivity] ([Id], [Event_Id], [EventActivityName], [StartDate], [EndDate], [AddDate], [isActive], [Price]) VALUES (10, 75, N'Bakri cutting', CAST(N'2024-04-28T06:30:00.000' AS DateTime), CAST(N'2024-04-28T06:35:00.000' AS DateTime), CAST(N'2024-04-17' AS Date), 1, 100)
INSERT [dbo].[TBL_EventActivity] ([Id], [Event_Id], [EventActivityName], [StartDate], [EndDate], [AddDate], [isActive], [Price]) VALUES (11, 104, N'Catwalk', CAST(N'2024-04-30T18:00:00.000' AS DateTime), CAST(N'2024-04-30T20:00:00.000' AS DateTime), CAST(N'2024-04-18' AS Date), 1, 2222)
SET IDENTITY_INSERT [dbo].[TBL_EventActivity] OFF
GO
SET IDENTITY_INSERT [dbo].[TBL_User] ON 

INSERT [dbo].[TBL_User] ([Id], [Name], [EmailId], [Password], [MobileNumber]) VALUES (1, N'darshan', N'darshan0@gmail.com', N'Darshan@123', 9510484425)
INSERT [dbo].[TBL_User] ([Id], [Name], [EmailId], [Password], [MobileNumber]) VALUES (2, N'darshan', N'darshan01@gmail.com', N'Darshan@123', 9510484425)
INSERT [dbo].[TBL_User] ([Id], [Name], [EmailId], [Password], [MobileNumber]) VALUES (3, N'Darshan', N'darshan58@gmail.com', N'Darshan@123', 9510484425)
INSERT [dbo].[TBL_User] ([Id], [Name], [EmailId], [Password], [MobileNumber]) VALUES (8, N'Darshan', N'darshan07@gmail.com', N'sdgdfghbdfbfbdf', 546546565)
INSERT [dbo].[TBL_User] ([Id], [Name], [EmailId], [Password], [MobileNumber]) VALUES (9, N'Darshan', N'darshan5@gmail.com', N'Darshan@123', 9510484425)
SET IDENTITY_INSERT [dbo].[TBL_User] OFF
GO
ALTER TABLE [dbo].[TBL_EventActivity]  WITH CHECK ADD  CONSTRAINT [FK_TBL_EventActivity_TBL_Event] FOREIGN KEY([Event_Id])
REFERENCES [dbo].[TBL_Event] ([Id])
GO
ALTER TABLE [dbo].[TBL_EventActivity] CHECK CONSTRAINT [FK_TBL_EventActivity_TBL_Event]
GO
/****** Object:  StoredProcedure [dbo].[SP_ActivityPrice]    Script Date: 18-04-2024 06:58:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Darshan>
-- Create date: <03-04-2024>
-- Description:	<update the price of activity>
-- =============================================
CREATE PROC [dbo].[SP_ActivityPrice]
(@ActivityId bigint,
@Price bigint
)
AS
BEGIN
	--update the price of activity
	Update TBL_EventActivity SET Price=@Price,isActive=1 WHERE Id=@ActivityId
	SELECT 'Price Add Successfully' AS Response
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AdminLogIn]    Script Date: 18-04-2024 06:58:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Darshan>
-- Create date: <03-04-2024>
-- Description:	<Admin Login validation>
-- =============================================
CREATE PROC [dbo].[SP_AdminLogIn]  -- 'darshan','darshan01@gmail.com','Darshan@123',9510484425
(@Name nvarchar(max),
@EmailId nvarchar(230),
@Password nvarchar(max))
AS
BEGIN
	-- Admin Login validation
	IF(EXISTS(SELECT 1 FROM TBL_admin WHERE Name=@Name AND EmailId=@EmailId AND Password=@Password))
	BEGIN
		SELECT 'Valid Admin' AS Response,Id From TBL_admin WHERE EmailId=@EmailId
	END
	ELSE
	BEGIN
		SELECT 'Invalid Admin' AS Response,0 as Id
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AdminRegister]    Script Date: 18-04-2024 06:58:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Darshan>
-- Create date: <03-04-2024>
-- Description:	<Registration for Admin>
-- =============================================
CREATE PROC [dbo].[SP_AdminRegister] -- 'darshan','darshan01@gmail.com','Darshan@123',9510484425
(@Name nvarchar(max),
@EmailId nvarchar(230),
@Password nvarchar(max),
@Mobile bigint)
AS
BEGIN
	--Registration for Admin
	IF(EXISTS(SELECT 1 FROM TBL_admin WHERE EmailId=@EmailId))
	BEGIN
		SELECT 'Admin Already Exist' AS Response
	END
	ELSE
	BEGIN
		INSERT INTO TBL_admin (Name,EmailId,Password,MobileNumber) VALUES (@Name,@EmailId,@Password,@Mobile)
		IF(EXISTS(SELECT 1 FROM TBL_admin WHERE EmailId=@EmailId))
		BEGIN
			SELECT 'Admin Register Successfully' AS Response
		END
		ELSE
		BEGIN
			SELECT 'Admin Not Register' AS Response
		END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AllEventwithActivity]    Script Date: 18-04-2024 06:58:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Darshan>
-- Create date: <04-04-2024>
-- Description:	<Join the table and return the tables with Events and activity>
-- =============================================
CREATE PROC [dbo].[SP_AllEventwithActivity] --4
(@EventId bigint)
AS
BEGIN
	-- Join the table and return the tables with Events and activity	
	SELECT e.Id,e.EventName,e.EventStartDate,e.EventEndDate,e.EventImage,a.EventActivityName,a.StartDate,a.EndDate,a.Price,'All published Events' AS Response 
	FROM TBL_Event e LEFT JOIN TBL_EventActivity a ON e.Id=a.Event_Id WHERE e.IsActive=1 AND e.Id=@EventId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_EventForAdmin]    Script Date: 18-04-2024 06:58:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Darshan>
-- Create date: <11-04-2024>
-- Description:	<elect the past Event and select the upcoming Event>
-- =============================================
CREATE PROC [dbo].[SP_EventForAdmin] --'upcoming'
(@flag nvarchar(10))
AS
BEGIN
	
	IF(@flag='past')
	BEGIN
		-- select the past Event
		SELECT TOP 11 EventName,EventStartDate,EventEndDate FROM TBL_Event WHERE IsActive=1 AND EventEndDate<=GETDATE()-1
	END
	IF(@flag='upcoming')
	BEGIN
		-- select the upcoming Event
		SELECT TOP 11 EventName,EventStartDate,EventEndDate FROM TBL_Event WHERE IsActive=1 AND EventEndDate>=GETDATE()-1 
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetActiveEvents]    Script Date: 18-04-2024 06:58:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Darshan>
-- Create date: <04-04-2024>
-- Description:	<select non publish events>
-- =============================================
CREATE PROC [dbo].[SP_GetActiveEvents] 
AS
BEGIN
	--select non publish events
	SELECT Id,EventName, 'All Non publish Event' AS Response FROM TBL_Event WHERE IsActive=0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetActivityOfEvent]    Script Date: 18-04-2024 06:58:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Darshan>
-- Create date: <04-04-2024>
-- Description:	<Select Activity of given events id>
-- =============================================
CREATE PROC [dbo].[SP_GetActivityOfEvent]
(@EventId bigint
)
AS
BEGIN
	--Select Activity of given events id
	SELECT Id,EventActivityName AS ActivityName,'All Activity of Event' AS Response FROM TBL_EventActivity WHERE IsActive=0 AND Event_Id=@EventId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAllEvent]    Script Date: 18-04-2024 06:58:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Darshan>
-- Create date: <04-04-2024>
-- Description:	<select all published events>
-- =============================================
CREATE PROC [dbo].[SP_GetAllEvent]
AS
BEGIN
	--select all published events
	SELECT EventName,EventStartDate,EventEndDate,EventImage FROM TBL_Event WHERE isActive=1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetEventate]    Script Date: 18-04-2024 06:58:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Darshan>
-- Create date: <03-04-2024>
-- Description:	<select start and end date of given event id>
-- =============================================
CREATE PROC [dbo].[SP_GetEventate]-- 1
(@EventId bigint)
AS
BEGIN
	--select start and end date of given event id
	SELECT CONVERT(nvarchar(30),EventStartDate, 120) as EventStartDate,CONVERT(nvarchar(30),EventEndDate, 120) as EventEndDate,'date'AS Response FROM TBL_Event WHERE Id=@EventId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertEvent]    Script Date: 18-04-2024 06:58:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Darshan>
-- Create date: <03-04-2024>
-- Description:	<insert all data of event into table>
-- =============================================
CREATE PROC [dbo].[SP_InsertEvent]  --'Holi','2024-05-06','2024-09-08',''
(@EventName nvarchar(max),
@StartDate date,
@EndDate date,
@Image text NULL)
AS
BEGIN
	--insert all data of event into table
	INSERT INTO TBL_Event (EventName,EventStartDate,EventEndDate,EventImage,AddDate,IsActive) VALUES (@EventName,@StartDate,@EndDate,@Image,GETDATE(),0)
	SELECT TOP 1 Id,'Event Added Successfully' AS Response FROM TBL_Event WHERE EventName=@EventName AND EventStartDate=@StartDate AND EventEndDate=@EndDate ORDER BY Id DESC 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertEventActivity]    Script Date: 18-04-2024 06:58:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Darshan>
-- Create date: <03-04-2024>
-- Description:	<insert all data of activity into table>
-- =============================================
CREATE PROC [dbo].[SP_InsertEventActivity]-- 'Holi','2024-05-06','2024-09-08',''
(@EventId bigint,
@ActivityName nvarchar(max),
@StartDate datetime,
@EndDate datetime)
AS
BEGIN
	--insert all data of activity into table
	INSERT INTO TBL_EventActivity (Event_Id,EventActivityName,StartDate,EndDate,AddDate,isActive) VALUES (@EventId,@ActivityName,@StartDate,@EndDate,GETDATE(),0)
	SELECT 'Activity Added Successfully' AS Response 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_PublishedEvent]    Script Date: 18-04-2024 06:58:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Darshan>
-- Create date: <04-04-2024>
-- Description:	<select all published event from the table>
-- =============================================
CREATE PROC [dbo].[SP_PublishedEvent] 
AS
BEGIN
	--select all published event from the table
	SELECT Id,EventName,CONVERT(nvarchar(30),EventStartDate, 105) as EventStartDate,CONVERT(nvarchar(30),EventEndDate, 105) as EventEndDate ,CONVERT(nvarchar(30),AddDate, 120) as AddDate,'All published Events' AS Response FROM TBL_Event WHERE  IsActive=1 AND EventEndDate>=GETDATE()-1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_PublishedEventCount]    Script Date: 18-04-2024 06:58:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Darshan>
-- Create date: <12-04-2024>
-- Description:	<count of all published event>
-- =============================================
CREATE PROC [dbo].[SP_PublishedEventCount]
AS
BEGIN
	-- count of all published event
	SELECT COUNT(Id) AS C FROM TBL_Event WHERE  IsActive=1 AND EventEndDate>=GETDATE()-1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_PublishedEventForPagging]    Script Date: 18-04-2024 06:58:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Darshan>
-- Create date: <12-04-2024>
-- Description:	<select event for the specific page and skip the previous page event>
-- =============================================
CREATE PROC [dbo].[SP_PublishedEventForPagging] --3,7
(@page bigint,
@EventPerPage bigint
)
AS
BEGIN
	--select event for the specific page and skip the previous page event
	SELECT Id,EventName,CONVERT(nvarchar(30),EventStartDate, 120) as EventStartDate,CONVERT(nvarchar(30),EventEndDate, 120) as EventEndDate,'All published Events' AS Response FROM TBL_Event WHERE IsActive=1 AND EventEndDate>=GETDATE()-1
	ORDER BY EventStartDate
	OFFSET ((@page-1)*@EventPerPage) ROWS FETCH NEXT (@EventPerPage) ROWS ONLY
END
GO
/****** Object:  StoredProcedure [dbo].[SP_PublishEvent]    Script Date: 18-04-2024 06:58:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Darshan>
-- Create date: <04-04-2024>
-- Description:	<publish the event>
-- =============================================
CREATE PROC [dbo].[SP_PublishEvent] 
(@EventId bigint)
AS
BEGIN
	--publish the event
	UPDATE TBL_Event SET IsActive=1 WHERE Id=@EventId
	SELECT 'Publish Successfully' AS Response
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UserLogIn]    Script Date: 18-04-2024 06:58:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Darshan>
-- Create date: <03-04-2024>
-- Description:	<validation for user login>
-- =============================================
CREATE PROC [dbo].[SP_UserLogIn] --  'darshan','darshan0@gmail.com','Darshan@123'
(@Name nvarchar(max),
@EmailId nvarchar(230),
@Password nvarchar(max))
AS
BEGIN
	-- validation for user login
	IF(EXISTS(SELECT 1 FROM TBL_User WHERE Name=@Name AND EmailId=@EmailId AND Password=@Password))
	BEGIN
		SELECT 'Valid User' AS Response,Id From TBL_User WHERE EmailId=@EmailId
	END
	ELSE
	BEGIN
		SELECT 'Invalid User' AS Response,0 as Id
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UserRegister]    Script Date: 18-04-2024 06:58:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Darshan>
-- Create date: <03-04-2024>
-- Description:	< User registration>
-- =============================================
CREATE PROC [dbo].[SP_UserRegister] -- 'darshan','darshan0@gmail.com','Darshan@123',9510484425
(@Name nvarchar(max),
@EmailId nvarchar(230),
@Password nvarchar(max),
@Mobile bigint)
AS
BEGIN
	-- User registration
	IF(EXISTS(SELECT 1 FROM TBL_User WHERE EmailId=@EmailId))
	BEGIN
		SELECT Id,'User Already Exist' AS Response FROM TBL_User WHERE EmailId=@EmailId
	END
	ELSE
	BEGIN
		INSERT INTO TBL_User (Name,EmailId,Password,MobileNumber) VALUES (@Name,@EmailId,@Password,@Mobile)
		IF(EXISTS(SELECT 1 FROM TBL_User WHERE EmailId=@EmailId))
		BEGIN
			SELECT Id,'User Register Successfully' AS Response FROM TBL_User WHERE EmailId=@EmailId
		END
		ELSE
		BEGIN
			SELECT 0 AS Id, 'User Not Register' AS Response 
		END
	END
END
GO
USE [master]
GO
ALTER DATABASE [Event_Management] SET  READ_WRITE 
GO
