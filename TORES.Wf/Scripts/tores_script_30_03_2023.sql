USE [master]
GO
/****** Object:  Database [ToresDB]    Script Date: 30.03.2023 14:25:59 ******/
CREATE DATABASE [ToresDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ToresDB', FILENAME = N'C:\Users\ferit\ToresDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ToresDB_log', FILENAME = N'C:\Users\ferit\ToresDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ToresDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ToresDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ToresDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ToresDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ToresDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ToresDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ToresDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ToresDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ToresDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ToresDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ToresDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ToresDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ToresDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ToresDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ToresDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ToresDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ToresDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ToresDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ToresDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ToresDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ToresDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ToresDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ToresDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ToresDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ToresDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ToresDB] SET  MULTI_USER 
GO
ALTER DATABASE [ToresDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ToresDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ToresDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ToresDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ToresDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ToresDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ToresDB] SET QUERY_STORE = OFF
GO
USE [ToresDB]
GO
/****** Object:  Table [dbo].[datLog]    Script Date: 30.03.2023 14:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[LoginDT] [date] NULL,
	[LogoutDT] [date] NULL,
	[ErrorDT] [date] NULL,
	[LogNotes] [nvarchar](50) NULL,
 CONSTRAINT [PK_datLog] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datReservation]    Script Date: 30.03.2023 14:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datReservation](
	[ResReqID] [int] IDENTITY(1,1) NOT NULL,
	[ResRoomID] [tinyint] NOT NULL,
	[ResMeetingDT] [date] NOT NULL,
	[ResStartDT] [int] NOT NULL,
	[ResEndDT] [int] NOT NULL,
	[ResUserID] [int] NOT NULL,
	[ResDesc] [nvarchar](max) NULL,
	[ResStatus] [bit] NOT NULL,
 CONSTRAINT [PK_datReservation] PRIMARY KEY CLUSTERED 
(
	[ResReqID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datRoom]    Script Date: 30.03.2023 14:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datRoom](
	[RoomID] [tinyint] IDENTITY(1,1) NOT NULL,
	[RoomName] [nvarchar](50) NOT NULL,
	[RoomCapacity] [tinyint] NOT NULL,
	[RoomStatus] [char](1) NOT NULL,
	[RoomNote] [nvarchar](100) NULL,
	[Projection] [bit] NOT NULL,
	[IBoard] [bit] NOT NULL,
	[Internet] [bit] NOT NULL,
	[IpTV] [bit] NOT NULL,
	[VOIP] [bit] NOT NULL,
	[AirConditioning] [bit] NOT NULL,
 CONSTRAINT [PK_datRoom] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datUser]    Script Date: 30.03.2023 14:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datUser](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](20) NULL,
	[UserPass] [nvarchar](20) NULL,
	[FName] [nvarchar](20) NULL,
	[LName] [nvarchar](20) NULL,
	[DeptID] [tinyint] NULL,
	[TypeID] [tinyint] NULL,
	[EMail] [nvarchar](50) NULL,
 CONSTRAINT [PK_datUser] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jnkRoomSpec]    Script Date: 30.03.2023 14:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jnkRoomSpec](
	[RoomSpecID] [smallint] IDENTITY(1,1) NOT NULL,
	[RoomID] [tinyint] NOT NULL,
	[SpecID] [tinyint] NOT NULL,
 CONSTRAINT [PK_jnkRoomSpec] PRIMARY KEY CLUSTERED 
(
	[RoomSpecID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prmDepartment]    Script Date: 30.03.2023 14:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prmDepartment](
	[DeptID] [tinyint] IDENTITY(1,1) NOT NULL,
	[DeptName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_prmDepartment] PRIMARY KEY CLUSTERED 
(
	[DeptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prmSpec]    Script Date: 30.03.2023 14:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prmSpec](
	[SpecID] [tinyint] IDENTITY(1,1) NOT NULL,
	[SpecDesc] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_prmSpec] PRIMARY KEY CLUSTERED 
(
	[SpecID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[datLog] ON 

INSERT [dbo].[datLog] ([LogID], [UserID], [LoginDT], [LogoutDT], [ErrorDT], [LogNotes]) VALUES (9, 5, CAST(N'2023-03-30' AS Date), CAST(N'2023-03-30' AS Date), NULL, N'Login Message:Lourie2012 successfully login')
INSERT [dbo].[datLog] ([LogID], [UserID], [LoginDT], [LogoutDT], [ErrorDT], [LogNotes]) VALUES (10, NULL, NULL, NULL, CAST(N'2023-03-30' AS Date), N'Error Message:Admin Unauthorized login error')
INSERT [dbo].[datLog] ([LogID], [UserID], [LoginDT], [LogoutDT], [ErrorDT], [LogNotes]) VALUES (11, 9, CAST(N'2023-03-30' AS Date), CAST(N'2023-03-30' AS Date), NULL, N'Login Message:Houghton1959 successfully login')
INSERT [dbo].[datLog] ([LogID], [UserID], [LoginDT], [LogoutDT], [ErrorDT], [LogNotes]) VALUES (12, 9, CAST(N'2023-03-30' AS Date), CAST(N'2023-03-30' AS Date), NULL, N'Login Message:Houghton1959 successfully login')
INSERT [dbo].[datLog] ([LogID], [UserID], [LoginDT], [LogoutDT], [ErrorDT], [LogNotes]) VALUES (13, 9, CAST(N'2023-03-30' AS Date), CAST(N'2023-03-30' AS Date), NULL, N'Login Message:Houghton1959 successfully login')
INSERT [dbo].[datLog] ([LogID], [UserID], [LoginDT], [LogoutDT], [ErrorDT], [LogNotes]) VALUES (14, 9, CAST(N'2023-03-30' AS Date), CAST(N'2023-03-30' AS Date), NULL, N'Login Message:Houghton1959 successfully login')
INSERT [dbo].[datLog] ([LogID], [UserID], [LoginDT], [LogoutDT], [ErrorDT], [LogNotes]) VALUES (15, 6, CAST(N'2023-03-30' AS Date), CAST(N'2023-03-30' AS Date), NULL, N'Login Message:Roy1964 successfully login')
INSERT [dbo].[datLog] ([LogID], [UserID], [LoginDT], [LogoutDT], [ErrorDT], [LogNotes]) VALUES (16, 6, CAST(N'2023-03-30' AS Date), CAST(N'2023-03-30' AS Date), NULL, N'Login Message:Roy1964 successfully login')
INSERT [dbo].[datLog] ([LogID], [UserID], [LoginDT], [LogoutDT], [ErrorDT], [LogNotes]) VALUES (17, 6, CAST(N'2023-03-30' AS Date), CAST(N'2023-03-30' AS Date), NULL, N'Login Message:Roy1964 successfully login')
INSERT [dbo].[datLog] ([LogID], [UserID], [LoginDT], [LogoutDT], [ErrorDT], [LogNotes]) VALUES (18, NULL, NULL, NULL, CAST(N'2023-03-30' AS Date), N'Error Message:asdas Unauthorized login error')
SET IDENTITY_INSERT [dbo].[datLog] OFF
GO
SET IDENTITY_INSERT [dbo].[datReservation] ON 

INSERT [dbo].[datReservation] ([ResReqID], [ResRoomID], [ResMeetingDT], [ResStartDT], [ResEndDT], [ResUserID], [ResDesc], [ResStatus]) VALUES (2, 1, CAST(N'2023-03-30' AS Date), 9, 11, 3, N'', 1)
INSERT [dbo].[datReservation] ([ResReqID], [ResRoomID], [ResMeetingDT], [ResStartDT], [ResEndDT], [ResUserID], [ResDesc], [ResStatus]) VALUES (4, 1, CAST(N'2023-03-30' AS Date), 9, 10, 4, N'', 1)
INSERT [dbo].[datReservation] ([ResReqID], [ResRoomID], [ResMeetingDT], [ResStartDT], [ResEndDT], [ResUserID], [ResDesc], [ResStatus]) VALUES (5, 1, CAST(N'2023-03-30' AS Date), 13, 14, 4, N'', 1)
INSERT [dbo].[datReservation] ([ResReqID], [ResRoomID], [ResMeetingDT], [ResStartDT], [ResEndDT], [ResUserID], [ResDesc], [ResStatus]) VALUES (6, 7, CAST(N'2023-03-30' AS Date), 9, 11, 11, N'İnsan Kaynakları Departmanı İş Görüşme Toplantısı', 1)
INSERT [dbo].[datReservation] ([ResReqID], [ResRoomID], [ResMeetingDT], [ResStartDT], [ResEndDT], [ResUserID], [ResDesc], [ResStatus]) VALUES (7, 5, CAST(N'2023-04-30' AS Date), 9, 12, 11, N'Aylık Üretim Planlama Toplantısı', 1)
INSERT [dbo].[datReservation] ([ResReqID], [ResRoomID], [ResMeetingDT], [ResStartDT], [ResEndDT], [ResUserID], [ResDesc], [ResStatus]) VALUES (8, 5, CAST(N'2023-03-31' AS Date), 9, 13, 11, N'Aylık Satın Alma Departmanı Toplantısı', 0)
INSERT [dbo].[datReservation] ([ResReqID], [ResRoomID], [ResMeetingDT], [ResStartDT], [ResEndDT], [ResUserID], [ResDesc], [ResStatus]) VALUES (9, 4, CAST(N'2023-03-30' AS Date), 18, 18, 1, N'', 1)
INSERT [dbo].[datReservation] ([ResReqID], [ResRoomID], [ResMeetingDT], [ResStartDT], [ResEndDT], [ResUserID], [ResDesc], [ResStatus]) VALUES (10, 1, CAST(N'2023-03-30' AS Date), 15, 12, 1, N'', 0)
INSERT [dbo].[datReservation] ([ResReqID], [ResRoomID], [ResMeetingDT], [ResStartDT], [ResEndDT], [ResUserID], [ResDesc], [ResStatus]) VALUES (11, 8, CAST(N'2023-03-31' AS Date), 11, 9, 7, N'', 0)
INSERT [dbo].[datReservation] ([ResReqID], [ResRoomID], [ResMeetingDT], [ResStartDT], [ResEndDT], [ResUserID], [ResDesc], [ResStatus]) VALUES (13, 3, CAST(N'2023-03-31' AS Date), 9, 10, 1, N'', 0)
INSERT [dbo].[datReservation] ([ResReqID], [ResRoomID], [ResMeetingDT], [ResStartDT], [ResEndDT], [ResUserID], [ResDesc], [ResStatus]) VALUES (16, 3, CAST(N'2023-03-09' AS Date), 10, 11, 9, N'', 0)
INSERT [dbo].[datReservation] ([ResReqID], [ResRoomID], [ResMeetingDT], [ResStartDT], [ResEndDT], [ResUserID], [ResDesc], [ResStatus]) VALUES (18, 2, CAST(N'2023-03-31' AS Date), 9, 11, 9, N'', 0)
SET IDENTITY_INSERT [dbo].[datReservation] OFF
GO
SET IDENTITY_INSERT [dbo].[datRoom] ON 

INSERT [dbo].[datRoom] ([RoomID], [RoomName], [RoomCapacity], [RoomStatus], [RoomNote], [Projection], [IBoard], [Internet], [IpTV], [VOIP], [AirConditioning]) VALUES (1, N'Ephesus', 25, N'1', NULL, 0, 1, 1, 1, 1, 1)
INSERT [dbo].[datRoom] ([RoomID], [RoomName], [RoomCapacity], [RoomStatus], [RoomNote], [Projection], [IBoard], [Internet], [IpTV], [VOIP], [AirConditioning]) VALUES (2, N'Phokaia', 7, N'1', NULL, 1, 0, 1, 1, 0, 1)
INSERT [dbo].[datRoom] ([RoomID], [RoomName], [RoomCapacity], [RoomStatus], [RoomNote], [Projection], [IBoard], [Internet], [IpTV], [VOIP], [AirConditioning]) VALUES (3, N'Milet', 4, N'1', NULL, 1, 0, 0, 0, 0, 1)
INSERT [dbo].[datRoom] ([RoomID], [RoomName], [RoomCapacity], [RoomStatus], [RoomNote], [Projection], [IBoard], [Internet], [IpTV], [VOIP], [AirConditioning]) VALUES (4, N'Aspendos', 6, N'1', NULL, 1, 0, 0, 0, 0, 1)
INSERT [dbo].[datRoom] ([RoomID], [RoomName], [RoomCapacity], [RoomStatus], [RoomNote], [Projection], [IBoard], [Internet], [IpTV], [VOIP], [AirConditioning]) VALUES (5, N'Theos', 30, N'1', NULL, 0, 1, 1, 0, 0, 1)
INSERT [dbo].[datRoom] ([RoomID], [RoomName], [RoomCapacity], [RoomStatus], [RoomNote], [Projection], [IBoard], [Internet], [IpTV], [VOIP], [AirConditioning]) VALUES (6, N'Aizanoi', 13, N'1', NULL, 0, 0, 0, 0, 1, 1)
INSERT [dbo].[datRoom] ([RoomID], [RoomName], [RoomCapacity], [RoomStatus], [RoomNote], [Projection], [IBoard], [Internet], [IpTV], [VOIP], [AirConditioning]) VALUES (7, N'Anavarza', 11, N'1', NULL, 1, 1, 1, 0, 0, 1)
INSERT [dbo].[datRoom] ([RoomID], [RoomName], [RoomCapacity], [RoomStatus], [RoomNote], [Projection], [IBoard], [Internet], [IpTV], [VOIP], [AirConditioning]) VALUES (8, N'Zeugma', 22, N'1', NULL, 1, 0, 1, 0, 1, 1)
INSERT [dbo].[datRoom] ([RoomID], [RoomName], [RoomCapacity], [RoomStatus], [RoomNote], [Projection], [IBoard], [Internet], [IpTV], [VOIP], [AirConditioning]) VALUES (9, N'Knidos', 12, N'1', NULL, 0, 1, 1, 0, 1, 1)
INSERT [dbo].[datRoom] ([RoomID], [RoomName], [RoomCapacity], [RoomStatus], [RoomNote], [Projection], [IBoard], [Internet], [IpTV], [VOIP], [AirConditioning]) VALUES (10, N'Apollon', 21, N'1', NULL, 1, 0, 0, 0, 1, 1)
SET IDENTITY_INSERT [dbo].[datRoom] OFF
GO
SET IDENTITY_INSERT [dbo].[datUser] ON 

INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [FName], [LName], [DeptID], [TypeID], [EMail]) VALUES (1, N'Admin', N'Q1w2e3', N'Admin', N'Admin', 3, 1, N'umit.karacivi@outlook.com')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [FName], [LName], [DeptID], [TypeID], [EMail]) VALUES (2, N'Montoya1959', N'Q5rty2', N'Lindsey', N'Fife', 2, 2, N'Morehead@example.com')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [FName], [LName], [DeptID], [TypeID], [EMail]) VALUES (3, N'Geneva1', N'4Y45r', N'Deedra', N'Severson', 3, 2, N'qpzre411@example.com')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [FName], [LName], [DeptID], [TypeID], [EMail]) VALUES (4, N'Burney723', N'GIY', N'Rayford', N'Turney', 4, 2, N'Bray162@example.com')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [FName], [LName], [DeptID], [TypeID], [EMail]) VALUES (5, N'Lourie2012', N'359', N'Sonny', N'Mattox', 5, 2, N'Sidney_Agnew3@nowhere.com')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [FName], [LName], [DeptID], [TypeID], [EMail]) VALUES (6, N'Roy1964', N'6Q', N'Hope', N'Seward', 1, 2, N'xmhz1900@nowhere.com')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [FName], [LName], [DeptID], [TypeID], [EMail]) VALUES (7, N'Lozano4', N'35GT', N'Chandra', N'Turpin', 2, 3, N'Monroe.Rinehart@nowhere.com')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [FName], [LName], [DeptID], [TypeID], [EMail]) VALUES (8, N'Ada452', N'5QE', N'Charolette', N'Kelsey', 3, 3, N'Gutierrez73@example.com')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [FName], [LName], [DeptID], [TypeID], [EMail]) VALUES (9, N'Houghton1959', N'Tb6tr', N'Kim', N'Mattson', 4, 3, N'FelipaAbernathy@nowhere.com')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [FName], [LName], [DeptID], [TypeID], [EMail]) VALUES (10, N'Rashida68', N'46O3Z', N'Randolph', N'Overby', 5, 3, N'Adler@example.com')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [FName], [LName], [DeptID], [TypeID], [EMail]) VALUES (11, N'Lin249', N'0C33T2', N'Jonah', N'Rushing', 1, 3, N'uadm55@example.com')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [FName], [LName], [DeptID], [TypeID], [EMail]) VALUES (12, N'Chen1996', N'8U68', N'Adah', N'Cosgrove', 2, 3, N'Caldwell@example.com')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [FName], [LName], [DeptID], [TypeID], [EMail]) VALUES (13, N'Gaynell2007', N'E3B', N'Bernard', N'Bohn', 3, 3, N'NathanielC_Christman823@example.com')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [FName], [LName], [DeptID], [TypeID], [EMail]) VALUES (14, N'Claudio283', N'8', N'Antonia', N'Kelso', 4, 3, N'Valdez@example.com')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [FName], [LName], [DeptID], [TypeID], [EMail]) VALUES (15, N'Burt958', N'BG', N'Jean', N'Mauldin', 5, 3, N'Rich.F_Hutchins@example.com')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [FName], [LName], [DeptID], [TypeID], [EMail]) VALUES (16, N'Jaclyn2003', N'8N81C16K62Z95', N'Vincenzo', N'Overstreet', 1, 3, N'phkfhcmu_jjjdjuvrms@example.com')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [FName], [LName], [DeptID], [TypeID], [EMail]) VALUES (17, N'Hand737', N'O49CP', N'Isaac', N'Russ', 2, 3, N'AdalineW.Radford8@example.com')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [FName], [LName], [DeptID], [TypeID], [EMail]) VALUES (18, N'Keven2012', N'54BR20', N'Terry', N'Coles', 3, 3, N'SmalleyS@nowhere.com')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [FName], [LName], [DeptID], [TypeID], [EMail]) VALUES (19, N'Annett426', N'0', N'Gerry', N'Sewell', 4, 3, N'gxsgr25@example.com')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [FName], [LName], [DeptID], [TypeID], [EMail]) VALUES (20, N'Dean2007', N'OQG6', N'Bernardina', N'Tuttle', 5, 3, N'ikzv7@nowhere.com')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [FName], [LName], [DeptID], [TypeID], [EMail]) VALUES (21, N'Yetta71', N'76G', N'Kent', N'Sexton', 1, 3, N'AmosBliss189@example.com')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [FName], [LName], [DeptID], [TypeID], [EMail]) VALUES (22, N'Hawks2017', N'W4O6', N'Adolph', N'Tyler', 2, 3, N'jajk3595@example.com')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [FName], [LName], [DeptID], [TypeID], [EMail]) VALUES (23, N'Rosamaria1981', N'9RXWTZ85', N'Leif', N'Boisvert', 3, 3, N'sdyfq9887@nowhere.com')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [FName], [LName], [DeptID], [TypeID], [EMail]) VALUES (24, N'Lashay396', N'1S', N'Adan', N'Kemp', 4, 3, N'Newsome21@example.com')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [FName], [LName], [DeptID], [TypeID], [EMail]) VALUES (25, N'Abraham9', N'P9', N'Kathey', N'Maupin', 5, 3, N'Hoover@example.com')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [FName], [LName], [DeptID], [TypeID], [EMail]) VALUES (26, N'Bao2026', N'4', N'Felisa', N'Coley', 1, 3, N'Russell@nowhere.com')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [FName], [LName], [DeptID], [TypeID], [EMail]) VALUES (27, N'Matos772', N'8', N'Rachele', N'Kemper', 2, 3, N'DorcasLadner5@example.com')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [FName], [LName], [DeptID], [TypeID], [EMail]) VALUES (28, N'Garland1952', N'5B9', N'Adaline', N'Overton', 3, 3, N'OlgaFerry@example.com')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [FName], [LName], [DeptID], [TypeID], [EMail]) VALUES (29, N'Aurelio68', N'0', N'Maynard', N'Figueroa', 4, 3, N'pqfmmt48@example.com')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [FName], [LName], [DeptID], [TypeID], [EMail]) VALUES (30, N'Acevedo58', N'230M20', N'Dwain', N'Costa', 5, 3, N'OdellG752@example.com')
SET IDENTITY_INSERT [dbo].[datUser] OFF
GO
SET IDENTITY_INSERT [dbo].[prmDepartment] ON 

INSERT [dbo].[prmDepartment] ([DeptID], [DeptName]) VALUES (1, N'HR')
INSERT [dbo].[prmDepartment] ([DeptID], [DeptName]) VALUES (2, N'Production')
INSERT [dbo].[prmDepartment] ([DeptID], [DeptName]) VALUES (3, N'IT')
INSERT [dbo].[prmDepartment] ([DeptID], [DeptName]) VALUES (4, N'Design')
INSERT [dbo].[prmDepartment] ([DeptID], [DeptName]) VALUES (5, N'R&D')
SET IDENTITY_INSERT [dbo].[prmDepartment] OFF
GO
SET IDENTITY_INSERT [dbo].[prmSpec] ON 

INSERT [dbo].[prmSpec] ([SpecID], [SpecDesc]) VALUES (1, N'Projeksiyon')
INSERT [dbo].[prmSpec] ([SpecID], [SpecDesc]) VALUES (2, N'I-Board')
INSERT [dbo].[prmSpec] ([SpecID], [SpecDesc]) VALUES (3, N'Internet')
INSERT [dbo].[prmSpec] ([SpecID], [SpecDesc]) VALUES (4, N'IP-TV')
INSERT [dbo].[prmSpec] ([SpecID], [SpecDesc]) VALUES (5, N'VOIP')
SET IDENTITY_INSERT [dbo].[prmSpec] OFF
GO
ALTER TABLE [dbo].[datLog]  WITH CHECK ADD  CONSTRAINT [FK_datLog_datUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[datUser] ([UserID])
GO
ALTER TABLE [dbo].[datLog] CHECK CONSTRAINT [FK_datLog_datUser]
GO
ALTER TABLE [dbo].[datReservation]  WITH CHECK ADD  CONSTRAINT [FK_datReservation_datRoom] FOREIGN KEY([ResRoomID])
REFERENCES [dbo].[datRoom] ([RoomID])
GO
ALTER TABLE [dbo].[datReservation] CHECK CONSTRAINT [FK_datReservation_datRoom]
GO
ALTER TABLE [dbo].[datReservation]  WITH CHECK ADD  CONSTRAINT [FK_datReservation_datUser] FOREIGN KEY([ResUserID])
REFERENCES [dbo].[datUser] ([UserID])
GO
ALTER TABLE [dbo].[datReservation] CHECK CONSTRAINT [FK_datReservation_datUser]
GO
ALTER TABLE [dbo].[datUser]  WITH CHECK ADD  CONSTRAINT [FK_datUser_prmDepartment] FOREIGN KEY([DeptID])
REFERENCES [dbo].[prmDepartment] ([DeptID])
GO
ALTER TABLE [dbo].[datUser] CHECK CONSTRAINT [FK_datUser_prmDepartment]
GO
ALTER TABLE [dbo].[jnkRoomSpec]  WITH CHECK ADD  CONSTRAINT [FK_jnkRoomSpec_datRoom] FOREIGN KEY([RoomID])
REFERENCES [dbo].[datRoom] ([RoomID])
GO
ALTER TABLE [dbo].[jnkRoomSpec] CHECK CONSTRAINT [FK_jnkRoomSpec_datRoom]
GO
ALTER TABLE [dbo].[jnkRoomSpec]  WITH CHECK ADD  CONSTRAINT [FK_jnkRoomSpec_prmSpec] FOREIGN KEY([SpecID])
REFERENCES [dbo].[prmSpec] ([SpecID])
GO
ALTER TABLE [dbo].[jnkRoomSpec] CHECK CONSTRAINT [FK_jnkRoomSpec_prmSpec]
GO
USE [master]
GO
ALTER DATABASE [ToresDB] SET  READ_WRITE 
GO
