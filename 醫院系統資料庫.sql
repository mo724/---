USE [master]
GO
/****** Object:  Database [醫院]    Script Date: 2020/1/6 上午 03:12:02 ******/
CREATE DATABASE [醫院]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'醫院', FILENAME = N'D:\microsoft sql server\MSSQL14.MSSQLSERVER\MSSQL\DATA\醫院.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'醫院_log', FILENAME = N'D:\microsoft sql server\MSSQL14.MSSQLSERVER\MSSQL\DATA\醫院_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [醫院] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [醫院].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [醫院] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [醫院] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [醫院] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [醫院] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [醫院] SET ARITHABORT OFF 
GO
ALTER DATABASE [醫院] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [醫院] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [醫院] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [醫院] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [醫院] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [醫院] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [醫院] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [醫院] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [醫院] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [醫院] SET  DISABLE_BROKER 
GO
ALTER DATABASE [醫院] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [醫院] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [醫院] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [醫院] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [醫院] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [醫院] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [醫院] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [醫院] SET RECOVERY FULL 
GO
ALTER DATABASE [醫院] SET  MULTI_USER 
GO
ALTER DATABASE [醫院] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [醫院] SET DB_CHAINING OFF 
GO
ALTER DATABASE [醫院] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [醫院] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [醫院] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'醫院', N'ON'
GO
ALTER DATABASE [醫院] SET QUERY_STORE = OFF
GO
USE [醫院]
GO
/****** Object:  Table [dbo].[Basicinfomation]    Script Date: 2020/1/6 上午 03:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Basicinfomation](
	[Basicinfomation_ID] [varchar](50) NOT NULL,
	[idnumber] [varchar](50) NOT NULL,
	[gender] [varchar](50) NOT NULL,
	[birthday] [varchar](50) NOT NULL,
	[blood type] [varchar](50) NULL,
	[phone] [varchar](50) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[family] [varchar](50) NOT NULL,
 CONSTRAINT [Basicinfomation_pk] PRIMARY KEY CLUSTERED 
(
	[Basicinfomation_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bodymonitoring]    Script Date: 2020/1/6 上午 03:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bodymonitoring](
	[time] [varchar](30) NOT NULL,
	[Patient_ID] [varchar](30) NOT NULL,
	[height] [varchar](30) NOT NULL,
	[weight] [varchar](30) NOT NULL,
	[bloodpressure] [varchar](30) NOT NULL,
	[heartbeat] [varchar](30) NOT NULL,
 CONSTRAINT [Bodymonitoring_pk] PRIMARY KEY CLUSTERED 
(
	[time] ASC,
	[Patient_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Division]    Script Date: 2020/1/6 上午 03:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Division](
	[Division_ID] [varchar](30) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[floor] [varchar](30) NOT NULL,
 CONSTRAINT [Division_pk] PRIMARY KEY CLUSTERED 
(
	[Division_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 2020/1/6 上午 03:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[Doctor_ID] [varchar](30) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[room] [varchar](30) NOT NULL,
	[Division_ID] [varchar](30) NOT NULL,
	[Nurse_ID] [varchar](30) NULL,
	[Basicinfomation_ID] [varchar](50) NULL,
 CONSTRAINT [Doctor_pk] PRIMARY KEY CLUSTERED 
(
	[Doctor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medical_record]    Script Date: 2020/1/6 上午 03:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medical_record](
	[MedicalRecord_No] [varchar](30) NOT NULL,
	[date] [varchar](30) NULL,
	[diagnosis] [varchar](30) NULL,
	[hospital] [varchar](30) NULL,
	[pharmacy] [varchar](30) NULL,
	[Patient_ID] [varchar](30) NULL,
	[Doctor_ID] [varchar](30) NULL,
	[Pharmacist_ID] [varchar](30) NULL,
	[Medicine_ID] [varchar](120) NULL,
 CONSTRAINT [Medical_record_pk] PRIMARY KEY CLUSTERED 
(
	[MedicalRecord_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicine]    Script Date: 2020/1/6 上午 03:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicine](
	[藥品ID] [varchar](120) NOT NULL,
	[中文藥名] [varchar](120) NOT NULL,
	[藥品名稱] [varchar](120) NOT NULL,
	[藥品劑量] [varchar](120) NOT NULL,
	[用藥指示] [varchar](200) NULL,
 CONSTRAINT [Medicine_pk] PRIMARY KEY CLUSTERED 
(
	[藥品ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nurse]    Script Date: 2020/1/6 上午 03:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nurse](
	[Nurse_ID] [varchar](30) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[room] [varchar](30) NOT NULL,
	[Basicinfomation_ID] [varchar](50) NOT NULL,
	[Division_ID] [varchar](30) NOT NULL,
 CONSTRAINT [Nurse_pk] PRIMARY KEY CLUSTERED 
(
	[Nurse_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 2020/1/6 上午 03:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[Patient_ID] [varchar](30) NOT NULL,
	[name] [varchar](30) NULL,
	[room] [varchar](30) NULL,
	[Division_ID] [varchar](30) NULL,
	[Doctor_ID] [varchar](30) NULL,
	[Nurse_ID] [varchar](30) NULL,
	[Basicinfomation_ID] [varchar](50) NULL,
	[MedicalRecord_No] [varchar](30) NULL,
 CONSTRAINT [Patient_pk] PRIMARY KEY CLUSTERED 
(
	[Patient_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientFamily]    Script Date: 2020/1/6 上午 03:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientFamily](
	[name] [varchar](30) NOT NULL,
	[Patient_ID] [varchar](30) NOT NULL,
	[phone] [varchar](30) NOT NULL,
	[relationship] [varchar](30) NOT NULL,
 CONSTRAINT [PatientFamily_pk] PRIMARY KEY CLUSTERED 
(
	[name] ASC,
	[Patient_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pharmacist]    Script Date: 2020/1/6 上午 03:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pharmacist](
	[Pharmacist_ID] [varchar](30) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[pharmacy] [varchar](30) NOT NULL,
	[Basicinfomation_ID] [varchar](50) NOT NULL,
 CONSTRAINT [Pharmacist_pk] PRIMARY KEY CLUSTERED 
(
	[Pharmacist_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bodymonitoring]  WITH CHECK ADD  CONSTRAINT [Patient_Bodymonitoring_fk] FOREIGN KEY([Patient_ID])
REFERENCES [dbo].[Patient] ([Patient_ID])
GO
ALTER TABLE [dbo].[Bodymonitoring] CHECK CONSTRAINT [Patient_Bodymonitoring_fk]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [Basicinfomation_Doctor_fk] FOREIGN KEY([Basicinfomation_ID])
REFERENCES [dbo].[Basicinfomation] ([Basicinfomation_ID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [Basicinfomation_Doctor_fk]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [Division_Doctor_fk] FOREIGN KEY([Division_ID])
REFERENCES [dbo].[Division] ([Division_ID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [Division_Doctor_fk]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [Nurse_Doctor_fk] FOREIGN KEY([Nurse_ID])
REFERENCES [dbo].[Nurse] ([Nurse_ID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [Nurse_Doctor_fk]
GO
ALTER TABLE [dbo].[Medical_record]  WITH CHECK ADD  CONSTRAINT [Doctor_Medical_record_fk] FOREIGN KEY([Doctor_ID])
REFERENCES [dbo].[Doctor] ([Doctor_ID])
GO
ALTER TABLE [dbo].[Medical_record] CHECK CONSTRAINT [Doctor_Medical_record_fk]
GO
ALTER TABLE [dbo].[Medical_record]  WITH CHECK ADD  CONSTRAINT [Medicine_Medical_record_fk] FOREIGN KEY([Medicine_ID])
REFERENCES [dbo].[Medicine] ([藥品ID])
GO
ALTER TABLE [dbo].[Medical_record] CHECK CONSTRAINT [Medicine_Medical_record_fk]
GO
ALTER TABLE [dbo].[Medical_record]  WITH CHECK ADD  CONSTRAINT [Patient_Medical_record_fk] FOREIGN KEY([Patient_ID])
REFERENCES [dbo].[Patient] ([Patient_ID])
GO
ALTER TABLE [dbo].[Medical_record] CHECK CONSTRAINT [Patient_Medical_record_fk]
GO
ALTER TABLE [dbo].[Medical_record]  WITH CHECK ADD  CONSTRAINT [Pharmacist_Medical_record_fk] FOREIGN KEY([Pharmacist_ID])
REFERENCES [dbo].[Pharmacist] ([Pharmacist_ID])
GO
ALTER TABLE [dbo].[Medical_record] CHECK CONSTRAINT [Pharmacist_Medical_record_fk]
GO
ALTER TABLE [dbo].[Nurse]  WITH CHECK ADD  CONSTRAINT [Basicinfomation_Nurse_fk] FOREIGN KEY([Basicinfomation_ID])
REFERENCES [dbo].[Basicinfomation] ([Basicinfomation_ID])
GO
ALTER TABLE [dbo].[Nurse] CHECK CONSTRAINT [Basicinfomation_Nurse_fk]
GO
ALTER TABLE [dbo].[Nurse]  WITH CHECK ADD  CONSTRAINT [Division_Nurse_fk] FOREIGN KEY([Division_ID])
REFERENCES [dbo].[Division] ([Division_ID])
GO
ALTER TABLE [dbo].[Nurse] CHECK CONSTRAINT [Division_Nurse_fk]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [Basicinfomation_Patient_fk] FOREIGN KEY([Basicinfomation_ID])
REFERENCES [dbo].[Basicinfomation] ([Basicinfomation_ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [Basicinfomation_Patient_fk]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [Division_Patient_fk] FOREIGN KEY([Division_ID])
REFERENCES [dbo].[Division] ([Division_ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [Division_Patient_fk]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [Doctor_Patient_fk] FOREIGN KEY([Doctor_ID])
REFERENCES [dbo].[Doctor] ([Doctor_ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [Doctor_Patient_fk]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Patient] FOREIGN KEY([Patient_ID])
REFERENCES [dbo].[Patient] ([Patient_ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Patient]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [Medical_record_Patient_fk] FOREIGN KEY([MedicalRecord_No])
REFERENCES [dbo].[Medical_record] ([MedicalRecord_No])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [Medical_record_Patient_fk]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [Nurse_Patient_fk] FOREIGN KEY([Nurse_ID])
REFERENCES [dbo].[Nurse] ([Nurse_ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [Nurse_Patient_fk]
GO
ALTER TABLE [dbo].[PatientFamily]  WITH CHECK ADD  CONSTRAINT [Patient_Patientfamily_fk] FOREIGN KEY([Patient_ID])
REFERENCES [dbo].[Patient] ([Patient_ID])
GO
ALTER TABLE [dbo].[PatientFamily] CHECK CONSTRAINT [Patient_Patientfamily_fk]
GO
ALTER TABLE [dbo].[Pharmacist]  WITH CHECK ADD  CONSTRAINT [Basicinfomation_Pharmacist_fk] FOREIGN KEY([Basicinfomation_ID])
REFERENCES [dbo].[Basicinfomation] ([Basicinfomation_ID])
GO
ALTER TABLE [dbo].[Pharmacist] CHECK CONSTRAINT [Basicinfomation_Pharmacist_fk]
GO
USE [master]
GO
ALTER DATABASE [醫院] SET  READ_WRITE 
GO
