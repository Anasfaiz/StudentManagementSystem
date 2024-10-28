USE [master]
GO
/****** Object:  Database [Student_man]    Script Date: 28-10-2024 22:00:05 ******/
CREATE DATABASE [Student_management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Student_man', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Student_man.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Student_man_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Student_man_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Student_man] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Student_man].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Student_man] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Student_man] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Student_man] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Student_man] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Student_man] SET ARITHABORT OFF 
GO
ALTER DATABASE [Student_man] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Student_man] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Student_man] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Student_man] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Student_man] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Student_man] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Student_man] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Student_man] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Student_man] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Student_man] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Student_man] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Student_man] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Student_man] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Student_man] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Student_man] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Student_man] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Student_man] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Student_man] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Student_man] SET  MULTI_USER 
GO
ALTER DATABASE [Student_man] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Student_man] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Student_man] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Student_man] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Student_man] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Student_man] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Student_man] SET QUERY_STORE = ON
GO
ALTER DATABASE [Student_man] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Student_man]
GO
/****** Object:  Table [dbo].[Batch]    Script Date: 28-10-2024 22:00:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batch](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Batch] [varchar](50) NULL,
	[Year] [varchar](50) NULL,
 CONSTRAINT [PK_Batch] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 28-10-2024 22:00:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Course] [varchar](50) NULL,
	[Duration] [int] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 28-10-2024 22:00:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Course_id] [int] NULL,
	[Batch_id] [int] NULL,
	[Mobile no.] [int] NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 28-10-2024 22:00:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Batch] FOREIGN KEY([Batch_id])
REFERENCES [dbo].[Batch] ([id])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_Batch]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Course] FOREIGN KEY([Course_id])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_Course]
GO
USE [master]
GO
ALTER DATABASE [Student_man] SET  READ_WRITE 
GO