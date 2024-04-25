USE [master]
GO
/****** Object:  Database [CRUD]    Script Date: 4/25/2024 9:13:07 AM ******/
CREATE DATABASE [CRUD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CRUD', FILENAME = N'D:\Coding\SQL\MSSQL16.SQLEXPRESS\MSSQL\DATA\CRUD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CRUD_log', FILENAME = N'D:\Coding\SQL\MSSQL16.SQLEXPRESS\MSSQL\DATA\CRUD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CRUD] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CRUD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CRUD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CRUD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CRUD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CRUD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CRUD] SET ARITHABORT OFF 
GO
ALTER DATABASE [CRUD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CRUD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CRUD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CRUD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CRUD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CRUD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CRUD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CRUD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CRUD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CRUD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CRUD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CRUD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CRUD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CRUD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CRUD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CRUD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CRUD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CRUD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CRUD] SET  MULTI_USER 
GO
ALTER DATABASE [CRUD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CRUD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CRUD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CRUD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CRUD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CRUD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CRUD] SET QUERY_STORE = ON
GO
ALTER DATABASE [CRUD] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CRUD]
GO
/****** Object:  Table [dbo].[Login_Crud]    Script Date: 4/25/2024 9:13:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login_Crud](
	[id_User] [int] NULL,
	[NamaUser] [varchar](50) NULL,
	[Password] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Siswa]    Script Date: 4/25/2024 9:13:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siswa](
	[NIS] [int] NULL,
	[Nama] [varchar](50) NULL,
	[Kelas] [varchar](50) NULL,
	[Jurusan] [varchar](50) NULL,
	[Tempat_Lahir] [varchar](50) NULL,
	[Tanggal_Lahir] [date] NULL,
	[Jenis_Kelamin] [varchar](50) NULL,
	[Alamat] [varchar](50) NULL,
	[Foto] [image] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [CRUD] SET  READ_WRITE 
GO
