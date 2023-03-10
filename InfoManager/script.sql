USE [master]
GO
/****** Object:  Database [InfoManagement]    Script Date: 2/7/2023 7:58:00 PM ******/
CREATE DATABASE [InfoManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InfoManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\InfoManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'InfoManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\InfoManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [InfoManagement] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InfoManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InfoManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InfoManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InfoManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InfoManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InfoManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [InfoManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InfoManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InfoManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InfoManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InfoManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InfoManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InfoManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InfoManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InfoManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InfoManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [InfoManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InfoManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InfoManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InfoManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InfoManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InfoManagement] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [InfoManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InfoManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [InfoManagement] SET  MULTI_USER 
GO
ALTER DATABASE [InfoManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InfoManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InfoManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InfoManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [InfoManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [InfoManagement] SET QUERY_STORE = OFF
GO
USE [InfoManagement]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [InfoManagement]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2/7/2023 7:58:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 2/7/2023 7:58:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CountryId] [bigint] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 2/7/2023 7:58:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 2/7/2023 7:58:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CountryId] [bigint] NOT NULL,
	[Resume] [nvarchar](max) NOT NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
	[CityId] [bigint] NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberSkills]    Script Date: 2/7/2023 7:58:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberSkills](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NOT NULL,
	[SkillId] [bigint] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_MemberSkills] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skills]    Script Date: 2/7/2023 7:58:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skills](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Skills] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230207122324_initilization', N'6.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230207131456_skillActiveColumnUpdate', N'6.0.10')
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [CreatedDate], [ModifiedDate], [Active]) VALUES (1, N'Dhaka', 2, CAST(N'2021-09-01T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [CreatedDate], [ModifiedDate], [Active]) VALUES (3, N'Mymensingh', 2, CAST(N'2022-01-01T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Cities] ([Id], [Name], [CountryId], [CreatedDate], [ModifiedDate], [Active]) VALUES (4, N'Gazipur', 2, CAST(N'2022-09-09T00:00:00.0000000' AS DateTime2), NULL, 1)
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([Id], [Name], [CreatedDate], [ModifiedDate], [Active]) VALUES (2, N'Bangladesh', CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Countries] ([Id], [Name], [CreatedDate], [ModifiedDate], [Active]) VALUES (3, N'India', CAST(N'2021-01-01T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Countries] ([Id], [Name], [CreatedDate], [ModifiedDate], [Active]) VALUES (6, N'Nepal', CAST(N'2022-01-01T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Countries] ([Id], [Name], [CreatedDate], [ModifiedDate], [Active]) VALUES (7, N'Srilanka', CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Countries] ([Id], [Name], [CreatedDate], [ModifiedDate], [Active]) VALUES (8, N'USA', CAST(N'1920-01-02T00:00:00.0000000' AS DateTime2), NULL, 1)
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([Id], [Name], [CountryId], [Resume], [DateOfBirth], [CityId], [CreatedDate], [ModifiedDate], [Active]) VALUES (1, N'Masud', 2, N'''''', CAST(N'1994-09-09T00:00:00.0000000' AS DateTime2), 1, CAST(N'2023-02-06T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Members] ([Id], [Name], [CountryId], [Resume], [DateOfBirth], [CityId], [CreatedDate], [ModifiedDate], [Active]) VALUES (2, N'Harun', 2, N'''''', CAST(N'1994-09-01T00:00:00.0000000' AS DateTime2), 1, CAST(N'2023-02-06T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Members] ([Id], [Name], [CountryId], [Resume], [DateOfBirth], [CityId], [CreatedDate], [ModifiedDate], [Active]) VALUES (3, N'Rashed', 2, N'''''', CAST(N'1994-09-01T00:00:00.0000000' AS DateTime2), 1, CAST(N'2023-02-06T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Members] ([Id], [Name], [CountryId], [Resume], [DateOfBirth], [CityId], [CreatedDate], [ModifiedDate], [Active]) VALUES (5, N'Masud', 2, N'', CAST(N'1994-09-09T00:00:00.0000000' AS DateTime2), NULL, CAST(N'2023-02-07T18:46:11.0433713' AS DateTime2), NULL, 1)
SET IDENTITY_INSERT [dbo].[Members] OFF
GO
SET IDENTITY_INSERT [dbo].[Skills] ON 

INSERT [dbo].[Skills] ([Id], [Name], [CreatedDate], [ModifiedDate], [Active]) VALUES (2, N'C#', CAST(N'2022-10-09T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Skills] ([Id], [Name], [CreatedDate], [ModifiedDate], [Active]) VALUES (3, N'Java', CAST(N'2011-04-09T00:00:00.0000000' AS DateTime2), NULL, 1)
INSERT [dbo].[Skills] ([Id], [Name], [CreatedDate], [ModifiedDate], [Active]) VALUES (4, N'Python', CAST(N'2015-09-07T00:00:00.0000000' AS DateTime2), NULL, 1)
SET IDENTITY_INSERT [dbo].[Skills] OFF
GO
/****** Object:  Index [IX_Cities_CountryId]    Script Date: 2/7/2023 7:58:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_Cities_CountryId] ON [dbo].[Cities]
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Members_CityId]    Script Date: 2/7/2023 7:58:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_Members_CityId] ON [dbo].[Members]
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Members_CountryId]    Script Date: 2/7/2023 7:58:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_Members_CountryId] ON [dbo].[Members]
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MemberSkills_SkillId]    Script Date: 2/7/2023 7:58:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_MemberSkills_SkillId] ON [dbo].[MemberSkills]
(
	[SkillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cities] ADD  DEFAULT (CONVERT([bit],(1))) FOR [Active]
GO
ALTER TABLE [dbo].[Countries] ADD  DEFAULT (CONVERT([bit],(1))) FOR [Active]
GO
ALTER TABLE [dbo].[Members] ADD  DEFAULT (CONVERT([bit],(1))) FOR [Active]
GO
ALTER TABLE [dbo].[MemberSkills] ADD  DEFAULT (CONVERT([bit],(1))) FOR [Active]
GO
ALTER TABLE [dbo].[Skills] ADD  DEFAULT (CONVERT([bit],(1))) FOR [Active]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Countries_CountryId] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_Countries_CountryId]
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [FK_Members_Cities_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [FK_Members_Cities_CityId]
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [FK_Members_Countries_CountryId] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [FK_Members_Countries_CountryId]
GO
ALTER TABLE [dbo].[MemberSkills]  WITH CHECK ADD  CONSTRAINT [FK_MemberSkills_Members_SkillId] FOREIGN KEY([SkillId])
REFERENCES [dbo].[Members] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MemberSkills] CHECK CONSTRAINT [FK_MemberSkills_Members_SkillId]
GO
ALTER TABLE [dbo].[MemberSkills]  WITH CHECK ADD  CONSTRAINT [FK_MemberSkills_Skills_SkillId] FOREIGN KEY([SkillId])
REFERENCES [dbo].[Skills] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MemberSkills] CHECK CONSTRAINT [FK_MemberSkills_Skills_SkillId]
GO
USE [master]
GO
ALTER DATABASE [InfoManagement] SET  READ_WRITE 
GO
