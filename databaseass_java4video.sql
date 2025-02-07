USE [master]
GO
/****** Object:  Database [PolyOE2]    Script Date: 09/04/2023 3:40:03 PM ******/
CREATE DATABASE [PolyOE2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PolyOE2',
FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\PolyOE2.mdf' ,
SIZE = 8192KB ,
MAXSIZE = UNLIMITED,
FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PolyOE2_log', 
FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\PolyOE2_log.ldf' ,
SIZE = 8192KB , 
MAXSIZE = 2048GB , 
FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PolyOE2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PolyOE2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PolyOE2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PolyOE2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PolyOE2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PolyOE2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PolyOE2] SET ARITHABORT OFF 
GO
ALTER DATABASE [PolyOE2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PolyOE2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PolyOE2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PolyOE2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PolyOE2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PolyOE2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PolyOE2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PolyOE2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PolyOE2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PolyOE2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PolyOE2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PolyOE2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PolyOE2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PolyOE2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PolyOE2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PolyOE2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PolyOE2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PolyOE2] SET RECOVERY FULL 
GO
ALTER DATABASE [PolyOE2] SET  MULTI_USER 
GO
ALTER DATABASE [PolyOE2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PolyOE2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PolyOE2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PolyOE2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PolyOE2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PolyOE2] SET QUERY_STORE = OFF
GO
USE [PolyOE2]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 09/04/2023 3:40:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[VideoId] [char](11) NOT NULL,
	[UserId] [nvarchar](20) NOT NULL,
	[CmtDate] [date] NOT NULL,
	[CmtValue] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 09/04/2023 3:40:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[VideoId] [char](11) NOT NULL,
	[UserId] [nvarchar](20) NOT NULL,
	[LikeDate] [date] NOT NULL,
 CONSTRAINT [PK_Favorites] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 09/04/2023 3:40:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[groupp] [varbinary](255) NOT NULL,
	[likes] [bigint] NULL,
	[newest] [datetime2](7) NULL,
	[oldest] [datetime2](7) NULL,
	[Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[groupp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shares]    Script Date: 09/04/2023 3:40:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shares](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[VideoId] [char](11) NOT NULL,
	[UserId] [nvarchar](20) NOT NULL,
	[ShareDate] [date] NOT NULL,
 CONSTRAINT [PK_Shares] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 09/04/2023 3:40:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Admin] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Videos]    Script Date: 09/04/2023 3:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Videos](
	[Id] [char](11) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Poster] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Active] [bit] NOT NULL,
	[Views] [int] NOT NULL,
	[Category] [nvarchar](50) NULL,
 CONSTRAINT [PK_Videos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [VideoId], [UserId], [CmtDate], [CmtValue]) VALUES (1, N'vd001      ', N'NV001', CAST(N'2022-12-01' AS Date), N'Đúng tâm trạng mình luôn :((((')
INSERT [dbo].[Comments] ([Id], [VideoId], [UserId], [CmtDate], [CmtValue]) VALUES (2, N'vd001      ', N'NV002', CAST(N'2023-01-02' AS Date), N'Khóc luôn rồi :((')
INSERT [dbo].[Comments] ([Id], [VideoId], [UserId], [CmtDate], [CmtValue]) VALUES (3, N'vd001      ', N'NV003', CAST(N'2022-01-02' AS Date), N'Xin lỗi vì những lời hứa')
INSERT [dbo].[Comments] ([Id], [VideoId], [UserId], [CmtDate], [CmtValue]) VALUES (4, N'vd002      ', N'NV001', CAST(N'2022-02-02' AS Date), N'Giọng Quân AP vẫn đỉnh như vậy')
INSERT [dbo].[Comments] ([Id], [VideoId], [UserId], [CmtDate], [CmtValue]) VALUES (5, N'vd002      ', N'NV002', CAST(N'2023-01-02' AS Date), N'Quân AP đẹp trai quá')
INSERT [dbo].[Comments] ([Id], [VideoId], [UserId], [CmtDate], [CmtValue]) VALUES (6, N'vd002      ', N'NV003', CAST(N'2023-02-02' AS Date), N'Bông hoa đẹp nhất :))')
INSERT [dbo].[Comments] ([Id], [VideoId], [UserId], [CmtDate], [CmtValue]) VALUES (7, N'vd001      ', N'NV004', CAST(N'2023-04-03' AS Date), N'Xin lỗi em')
INSERT [dbo].[Comments] ([Id], [VideoId], [UserId], [CmtDate], [CmtValue]) VALUES (8, N'vd003      ', N'NV001', CAST(N'2023-04-04' AS Date), N'Hay quá')
INSERT [dbo].[Comments] ([Id], [VideoId], [UserId], [CmtDate], [CmtValue]) VALUES (9, N'vd004      ', N'NV001', CAST(N'2023-04-03' AS Date), N'Tuyệt vời quá')
INSERT [dbo].[Comments] ([Id], [VideoId], [UserId], [CmtDate], [CmtValue]) VALUES (10, N'vd016      ', N'NV001', CAST(N'2023-04-05' AS Date), N'Định Lệ Nhiệt Ba đẹp quá =)))))')
INSERT [dbo].[Comments] ([Id], [VideoId], [UserId], [CmtDate], [CmtValue]) VALUES (11, N'vd013      ', N'NV001', CAST(N'2023-04-09' AS Date), N'hay quá')
SET IDENTITY_INSERT [dbo].[Comments] OFF
SET IDENTITY_INSERT [dbo].[Favorites] ON 

INSERT [dbo].[Favorites] ([Id], [VideoId], [UserId], [LikeDate]) VALUES (2, N'vd001      ', N'nv002', CAST(N'2023-03-10' AS Date))
INSERT [dbo].[Favorites] ([Id], [VideoId], [UserId], [LikeDate]) VALUES (4, N'vd002      ', N'nv003', CAST(N'2023-03-01' AS Date))
INSERT [dbo].[Favorites] ([Id], [VideoId], [UserId], [LikeDate]) VALUES (5, N'vd002      ', N'nv004', CAST(N'2023-03-11' AS Date))
INSERT [dbo].[Favorites] ([Id], [VideoId], [UserId], [LikeDate]) VALUES (45, N'vd014      ', N'NV001', CAST(N'2023-04-03' AS Date))
INSERT [dbo].[Favorites] ([Id], [VideoId], [UserId], [LikeDate]) VALUES (48, N'vd020      ', N'NV002', CAST(N'2023-04-03' AS Date))
INSERT [dbo].[Favorites] ([Id], [VideoId], [UserId], [LikeDate]) VALUES (50, N'vd020      ', N'NV003', CAST(N'2023-04-04' AS Date))
INSERT [dbo].[Favorites] ([Id], [VideoId], [UserId], [LikeDate]) VALUES (51, N'vd016      ', N'NV001', CAST(N'2023-04-09' AS Date))
INSERT [dbo].[Favorites] ([Id], [VideoId], [UserId], [LikeDate]) VALUES (53, N'vd013      ', N'NV001', CAST(N'2023-04-09' AS Date))
SET IDENTITY_INSERT [dbo].[Favorites] OFF
SET IDENTITY_INSERT [dbo].[Shares] ON 

INSERT [dbo].[Shares] ([Id], [VideoId], [UserId], [ShareDate]) VALUES (3, N'vd014      ', N'NV001', CAST(N'2023-04-04' AS Date))
SET IDENTITY_INSERT [dbo].[Shares] OFF
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Admin]) VALUES (N'NV001', N'123', N'Nguyễn Sơn', N'sonntps26480@fpt.edu.vn', 1)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Admin]) VALUES (N'NV002', N'123', N'Hải Yến', N'hyyen16@fpt.edu.vn', 1)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Admin]) VALUES (N'NV003', N'321', N'Vinh gà', N'vinhga@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Admin]) VALUES (N'NV004', N'321', N'Nhật Khánh', N'khanhbeo@fpt.edu.vn', 0)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Admin]) VALUES (N'NV005', N'123', N'Trần Mậu Phi', N'phi@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Admin]) VALUES (N'NV006', N'123', N'Vương Ngọc Thanh Loan', N'loan@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Admin]) VALUES (N'NV007', N'123', N'Nguyễn Thanh Vũ', N'vu@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Admin]) VALUES (N'NV008', N'123', N'Phạm Đồng Đại', N'dai@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Admin]) VALUES (N'NV009', N'321', N'Trần Thị Ánh Tuyết', N'tuyet@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Admin]) VALUES (N'NV010', N'123', N'Nguyễn Trần Thành An', N'an@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Admin]) VALUES (N'NV011', N'123', N'Nguyễn Nhật Trường', N'truong@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Admin]) VALUES (N'NV012', N'123', N'Nguyễn Hoài Phương', N'phuong@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Admin]) VALUES (N'NV013', N'123', N'Huỳnh Đại Thuận', N'thuan@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Admin]) VALUES (N'NV014', N'321', N'Lê Minh Cường', N'cuong@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Admin]) VALUES (N'NV015', N'123', N'Võ Duy Khoa', N'khoa@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Admin]) VALUES (N'NV016', N'123', N'vo minh vuong', N'vominhvuong15112003@gmail.com', 1)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Admin]) VALUES (N'NV017', N'1234', N'Vương', N'vuongvmps24279@fpt.edu.vn', 1)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Admin]) VALUES (N'NV018', N'1234', N'Vương', N'vuongvmps24279@fpt.edu.vn', 1)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Admin]) VALUES (N'NV019', N'123', NULL, N'vominhvuong15112003@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Admin]) VALUES (N'NV021', N'123', N'vo minh vuong', N'vominhvuong15112003@gmail.com', 1)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Admin]) VALUES (N'NV022', N'123', N'vo minh vuong', N'vominhvuong15112003@gmail.com', 0)
INSERT [dbo].[Users] ([Id], [Password], [Fullname], [Email], [Admin]) VALUES (N'NV023', N'123', N'Anh Tú', N'leanhtu222353@gmail.com', 1)
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Description], [Active], [Views], [Category]) VALUES (N'vd001      ', N'W/n - 3107 3 ( Official Video ) ft. Nâu, Duongg, Titie', N'kfw7MYah2n0', N'Sáng tác & Music Producer : W/n 
Rap : Nâu
Executive Supervisor: Hai Dang
Partnership Manager : Tam Meo
Social network advisor : Tu Anh
Art Director: Vo Van Hieu
Stylist: Nguyen Quoc Ky
Hair Stylist: Nguyen Quoc Ky
Wardrobe: ZUNE.ZX', 1, 101, N'music')
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Description], [Active], [Views], [Category]) VALUES (N'vd002      ', N'QUÂN A.P - BÔNG HOA ĐẸP NHẤT [OFFICIAL LYRICS VIDEO]', N'e2Xx7WcvEns', N'BÔNG HOA ĐẸP NHẤT 

Singer: Quân A.P
Composer: Vũ Hà Anh – Phan Viết Tính – Nguyễn Văn Trung', 1, 100, N'music')
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Description], [Active], [Views], [Category]) VALUES (N'vd003      ', N'Ánh Sao Và Bầu Trời - T.R.I x Cá | [Official Audio]', N'9vaLkYElidg', N'Performer: T.R.I
Music Producer: T.R.I 
Composer: Cá (B3212)
Video by Van Duc ', 1, 100, N'music')
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Description], [Active], [Views], [Category]) VALUES (N'vd004      ', N'hieuthuhai - ngủ một mình (tình rất tình) ft. negav (prod. by kewtiie)', N'1OJQdxT6WHE', N'Produced by DargonExecutive producer: Ai NguyenDirector: Ho Viet QuanDOP: Ho Viet QuanCam OP: Cong MinFocus Puller: Thai Minh TamProducer: Viet AnhEditor & Colorist: kingduckinthelakeSet design: uinRunner: Dong Nguyen, RoLighting & Equipment: HD Equipment', 1, 106, N'music')
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Description], [Active], [Views], [Category]) VALUES (N'vd005      ', N'Lửng Lơ | MASEW x BRAY ft. RedT x Ý Tiên | MV OFFICIAL', N'HehotFZ8BGo', N'Một sản phẩm thực hiện bởi Great Entertainment
Project manager: Phan Viet Tinh - Nguyen Son Quyen
Chief Marketing Official: Phan Viet Tinh
Cast: Trang Dai, Thuy Linh, Cam Ngan, Quynh Anh, Truong Ngoc.
Director : Quan Giay
Assistant Director: Quoc Dat
Producer: Thao Phuong
Assistant Producer: Hoang Thanh - Vu Nguyen
Art Director: Thao Phuong
Editor - VFX: Quan Giay
BTS: Pham Le Ba Huynh 
Special thanks Babyface & Ms Thu Liz, Minh Bao, Minh Xu', 1, 101, N'music')
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Description], [Active], [Views], [Category]) VALUES (N'vd006      ', N'MONO - Waiting For You (Album 22 - Track No.10)', N'CHw1b_1LVBA', N'* Nghệ sĩ biểu diễn : MONO, Onionn 
* Author : Nguyễn Việt Hoàng 
* Composer : Nguyễn Ngọc Hoàng Anh, Nguyễn Việt Hoàng 
* Arranger : Onionn
* Producer : Onionn', 1, 100, N'music')
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Description], [Active], [Views], [Category]) VALUES (N'vd007      ', N'HIEUTHUHAI - Vệ Tinh ft. Hoàng Tôn (prod. by Kewtiie) | OFFICIAL MV', N'TTwlhJzXHo4', N'Artist: HIEUTHUHAI & HOÀNG TÔN
Music Composer: HIEUTHUHAI & HOÀNG TÔN
Music Producer: KEWTIIE
Mix & Master: KEWTIIE, HOÀNG TÔN, HPRO', 1, 100, N'music')
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Description], [Active], [Views], [Category]) VALUES (N'vd008      ', N'An Thần (ft. Thắng) | Low G | Rap Nhà Làm', N'J7eYhM6wXPo', N'Produced by Thắng & Chí Trung
Mix n'' Mastered by Thắng & Chí Trung
Video by Low G
Camera by KZ ', 1, 100, N'music')
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Description], [Active], [Views], [Category]) VALUES (N'vd009      ', N'NƠI NÀY CÓ ANH | OFFICIAL MUSIC VIDEO | SƠN TÙNG M-TP', N'FN7ALfpGxiI', N'Được thực hiện bởi / Video made by
Sáng tác / Composer: Sơn Tùng M-TP
Phối khí / Arranger: Khắc Hưng
Master: Long Halo
Sản xuất / Produced by Dreams Productions
Đạo diễn / Director: Gin Tran
Đạo diễn hình ảnh / D.O.P: Lub Nguyen
Giám đốc nghệ thuật / Art Director: Thien Thanh
Thiết kế đồ hoạ / Graphic Designer: Meimei Hoang
Điều hành sản xuất / Executive Producer: M&M HOUSE', 1, 100, N'music')
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Description], [Active], [Views], [Category]) VALUES (N'vd010      ', N'BLACKPINK - ‘Pink Venom’ M/V', N'gQlMMD8auMs', N'More about BLACKPINK @
http://www.blackpinkofficial.com/
http://www.facebook.com/BLACKPINKOFFI...
  

 / blackpinkofficial  
https://www.instagram.com/BLACKPINKOF...
https://twitter.com/BLACKPINK', 1, 100, N'music')
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Description], [Active], [Views], [Category]) VALUES (N'vd011      ', N'VAN SON 😊 Hài Kịch | TRẦN MINH KHỐ CHUỐI Vân Sơn - Bảo Liêm', N'XTEHX-5rjpo', N'©VAN SON ENTERTAINMENT, INC. ALL RIGHTS RESERVED ⚠ DO NOT RE-UPLOAD
➤Tất Cả video, Album trên Vân Sơn YouTube Channel, đã được Trung Tâm Vân Sơn đăng ký bản quyền YouTube. Rất mong các bạn, không sao chép HOẶC re-upload dưới mọi hình thức.', 1, 101, N'comedy')
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Description], [Active], [Views], [Category]) VALUES (N'vd012      ', N'VAN SON 😊 Hài kịch | 2 LÁ THƯ | Vân Sơn - Bảo Liêm - Quang Minh - Hồng Đào', N'VUDZ2LAyFGc', N'©VAN SON ENTERTAINMENT, INC. ALL RIGHTS RESERVED ⚠ DO NOT RE-UPLOAD
➤Tất Cả video, Album trên Vân Sơn YouTube Channel, đã được Trung Tâm Vân Sơn đăng ký bản quyền YouTube Channel. Rất mong các bạn, không sao chép HOẶC re-upload dưới mọi hình thức.', 1, 104, N'comedy')
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Description], [Active], [Views], [Category]) VALUES (N'vd013      ', N'VAN SON 😊 San Jose | Hài Kịch HAI ĐẤT 3 RUỘNG | Vân Sơn - Bảo Liêm - Giáng Ngọc', N'LsLJCb0jQqI', N'©VAN SON ENTERTAINMENT, INC. ALL RIGHTS RESERVED ⚠ DO NOT RE-UPLOAD
➤Tất Cả video, Album trên Vân Sơn YouTube Channel, đã được Trung Tâm Vân Sơn đăng ký bản quyền YouTube. Rất mong các bạn, không sao chép HOẶC re-upload dưới mọi hình thức.', 1, 102, N'comedy')
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Description], [Active], [Views], [Category]) VALUES (N'vd014      ', N'VAN SON 😊 Ca Nhạc Hài | HẮC BẠCH CÔNG TỬ | Vân Sơn - Hoài Linh - Hồng Đào - Úp Mập - Bé Mập', N'Q03GEFCi-cM', N'©VAN SON ENTERTAINMENT, INC. ALL RIGHTS RESERVED ⚠ DO NOT RE-UPLOAD
➤Tất Cả video, Album trên Vân Sơn YouTube Channel, đã được Trung Tâm Vân Sơn đăng ký bản quyền YouTube. Rất mong các bạn, không sao chép HOẶC re-upload dưới mọi hình thức.', 1, 100, N'comedy')
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Description], [Active], [Views], [Category]) VALUES (N'vd015      ', N'VAN SON 😊 Hài Kinh Điển | SƠN TINH THUỶ TINH | Vân Sơn - Bảo Liêm - Văn Chung', N'7Ez2_bxvExk', N'©VAN SON ENTERTAINMENT, INC. ALL RIGHTS RESERVED ⚠ DO NOT RE-UPLOAD
➤Tất Cả video, Album trên Vân Sơn YouTube Channel, đã được Trung Tâm Vân Sơn đăng ký bản quyền YouTube. Rất mong các bạn, không sao chép HOẶC re-upload dưới mọi hình thức.', 0, 100, N'comedy')
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Description], [Active], [Views], [Category]) VALUES (N'vd016      ', N'Phim Lẻ Hay 2023 | KHÔNG ĐỐI THỦ | Phim Hành Động Võ Thuật Cỗ Trang Mới Nhất | Full HD | Phim 567', N'asr5mXryAZU', N'Tên Phim: MÃNH HỔ HẠ SƠN', 1, 100, N'movies')
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Description], [Active], [Views], [Category]) VALUES (N'vd017      ', N'MÃNH TƯỚNG VỀ LÀNG | Phim Mới 2023 | Phim Võ Thuật Cổ Trang Đặc Sắc Hay Nhất 2023 | 4K HD | Clip Hay', N'uMVRgpL_pzQ', N'🔥 Tên phim : Mãnh Hổ Hạ Sơn  🔥
🔥 Diễn viên : Lưu Dận Đình, Oyanagi Machiro, Dương Vũ Tranh, Keiichi Yamasaki,..
🔥 Nội Dung : Trong thời kỳ kháng chiến, Tiết Quý thề rằng phải báo thù cho người sư phụ đã bị người Nhật giết hại, sau khi nhận được tin hung thủ - Kawasaki được phái đến thành Long Môn, Tiết Quý rèn dao, một mình truy sát Kawasaki, dưới sự giúp đỡ của thợ rèn Lưu Đức Cao, cũng là người đứng đầu quân đoàn chống Nhật, Tiết Quý đã trả thù thành công.🔥', 1, 100, N'movies')
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Description], [Active], [Views], [Category]) VALUES (N'vd018      ', N'PHIM HÀNH ĐỘNG VÕ THUẬT KINH ĐIỂN | CHIẾN LANG - PHẦN CUỐI | Phim Hành Động Võ Thuật Hay Nhất', N'hDuttHj9WWw', N'❖ Nội Dung Phim CHIẾN LANG - PHẦN CUỐI :

Phim Chiến Lang Phần Cuối là bộ phim hành động, võ thuật chiếu rạp của điện ảnh Trung Quốc. Phim do Ngô Kinh đạo diễn và có sự tham gia của cặp diễn viên đỉnh cao Scott Adkins – Ngô Kinh.

Vương Lãnh Phong (Ngô Kinh), một người lính sẵn sàng xông pha trận mạc. Nhưng sau lần cãi lời chỉ huy và bắn chết một phần tử khủng bố, anh bị khai trừ khỏi quân đội. Kẻ bị đánh chết vốn là em trai của tên trùm ma túy Mẫn Đăng. Để trả thù, hắn kết hợp với tên lính đánh thuê Lão Miêu (Scott Adkins) để sát hại Lãnh Phong và những người đồng đội của anh.
', 1, 1000, N'movies')
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Description], [Active], [Views], [Category]) VALUES (N'vd019      ', N'PHIM HÀNH ĐỘNG CHIẾU RẠP 2020 | NGƯỜI VẬN CHUYỂN - Phần Cuối | Phim Hành Động Mỹ 2020', N's7lY5w51a8c', N'Phần phim mới của series Người vận chuyển có tên gọi The Transporter: Refueled, đây sẽ là tập phim tập trung vào việc khởi động lại dự án đình đám này do “lính mới” Ed Skrein đảm nhận vai chính. Europacorp, nhà sản xuất của loạt phim hành động nổi tiếng Taken và Lucy, hứa hẹn sẽ đem đến cho khán giả một sức sống mới, một cái nhìn mới về Người Vận Chuyển. Chuyện phim vẫn xoay quanh nhân vật Frank Martin, “người vận chuyển” nổi tiếng nhất trong giới kinh doanh và tội phạm với kĩ năng lái xe siêu hạng. Frank Martin có thể vận chuyển bất cứ món hàng nào đến mọi địa điểm được chỉ định, chỉ cần được trả công tương xứng. Nguyên tắc làm việc của anh là không phá vỡ hợp đồng, không hỏi tên và không mở kiện hàng. Nhưng dĩ nhiên trong những cuộc hành trình đầy rẫy những nguy hiểm và những điều bất ngờ ập đến, những nguyên tắc kia đã bị phá vỡ. Bí mật bên trong những kiện hàng, những cuộc truy sát và đụng độ giữa Frank Martin và các tên tội phạm cộm cáng luôn đưa đến những cuộc rượt đuổi ngoạn mục, nghẹt thở.....', 1, 1000, N'movies')
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Description], [Active], [Views], [Category]) VALUES (N'vd020      ', N'Phim Bom Tấn Hàn Quốc Chiếu Rạp - Mật Danh Iris | Lee Byung Hun, Kim Tae Hee, Top Big Bang', N'3uFpxJu-lbA', N'• Thể loại: Phim Hàn, Tâm Lý, Tình Cảm, Viễn Tưởng...
• Đạo diễn: Kim Kyu Tae, Yang Yun Ho
• Diễn viễn: Kim So Yeon, Kim Seung Woo, Lee Byung Hun, Kim Tae Hee  ', 1, 500, N'movies')
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Description], [Active], [Views], [Category]) VALUES (N'vd021      ', N'[VIETSUB] Tay Bắn Tỉa: Báo Thù | Sniper Vengeance | Phim Lẻ YOUKU', N'7ZlX6H1CerE', N'Nữ xạ thủ tài ba Anna buộc phải nhận nhiệm vụ ám sát, trong quá trình thi hành án dần thức tỉnh thành một chiến sĩ công lý tốt bụng và đầy lòng yêu thương, liên quân đặc vụ Artai đã đứng lên bênh vực công lý khi đối mặt với sự đàn áp người dân của trùm ma túy. Cả hai đã hợp tác để ngăn chặn việc thông qua luật hợp pháp hóa việc trồng và buôn bán ma túy ở Libiwala, đồng thời phát động trận chiến sinh tử với trùm ma túy phản diện Roger, cuối cùng đập tan âm mưu của kẻ ác, bảo vệ người dân khỏi ma túy, và cứu nước.
Thể loại:  Hành động /Thảm họa / Kinh dị / Phiêu lưu', 1, 500, N'movies')
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Description], [Active], [Views], [Category]) VALUES (N'vd022      ', N'[VIETSUB] Vua Bắn Tỉa: Ám Sát - The King of Snipers | Phim Lẻ YOUKU', N'K8mZVqAQofs', N'Nữ xạ thủ tài ba Anna buộc phải nhận nhiệm vụ ám sát, trong quá trình thi hành án dần thức tỉnh thành một chiến sĩ công lý tốt bụng và đầy lòng yêu thương, liên quân đặc vụ Artai đã đứng lên bênh vực công lý khi đối mặt với sự đàn áp người dân của trùm ma túy. Cả hai đã hợp tác để ngăn chặn việc thông qua luật hợp pháp hóa việc trồng và buôn bán ma túy ở Libiwala, đồng thời phát động trận chiến sinh tử với trùm ma túy phản diện Roger, cuối cùng đập tan âm mưu của kẻ ác, bảo vệ người dân khỏi ma túy, và cứu nước.
Thể loại:  Hành động /Thảm họa / Kinh dị / Phiêu lưu', 1, 500, N'movies')
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Description], [Active], [Views], [Category]) VALUES (N'vd023      ', N'[VIETSUB] Cuộc Giải Cứu Của Tiểu Đội Cáo Đen - Black Fox: Ultimate Rescue | Phim Lẻ YOUKU', N'DIeQidmCM84', N'Năm 1945, chuyên gia quân sự Liên Xô , mang thông tin quan trọng đến Trung Quốc, đã bị quân đội Nhật Bản cướp trên đường đi. Đội cứu hộ do Quốc dân đảng dẫn đầu đã thất bại thảm hại. Cùng lúc đó,  của Đội quân số 8 được lệnh gia nhập đội quân tinh nhuệ của Black Fox, và sau nhiều khó khăn và nguy hiểm, đã được giải cứu thành công.
★Thể loại: Hành động / Kinh dị / Bí ẩn', 1, 800, N'movies')
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Description], [Active], [Views], [Category]) VALUES (N'vd024      ', N'Siêu Phẩm Hành Động Kháng Nhật Mới Nhất 2020 | XẠ THỦ - ĐỘI ĐỘT KÍCH HỒNG ƯNG | Thuyết Minh', N'efFUtxO60FI', N'✤ Đạo diễn: Lý Kiện Khôi
✤ Diễn viên: Từ Hải Vi, Hà Quân
✤ XẠ THỦ - ĐỘI ĐỘT KÍCH HỒNG ƯNG kể về thời kỳ kháng chiến, khi bát lộ quân chuẩn bị triển khai tác chiến quy mô lớn để kháng Nhật, nhân viên tình báo ẩn nấp trong quân Nhật gửi đến điện báo bí mật báo tin quân Nhật định sử dụng vũ khí sinh hóa trên chiến trường. Quân trưởng Lý Thiên Hựu cử đội đột kích Hồng Ưng đến tiếp ứng nhân viên tình báo, mang tư liệu về vũ khí sinh hóa về để dễ dàng ứng phó. Không ngờ điện báo của nhân viên tình báo bị quân nhật phát giác, lập tức ra lệnh di dời đội quân thí nghiệm, đồng thời cử tiểu đội 35 người chuẩn bị tiêu diệt đội đột kích Hồng Ưng.', 1, 800, N'movies')
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Description], [Active], [Views], [Category]) VALUES (N'vd025      ', N'[Thuyết Minh] TRÁNG SĨ XUẤT KÍCH | Phim Chiến Tranh Kháng Nhật Cực Hay | Phim Lẻ Mới Nhất 2020', N'phgY-ovAaDc', N'✤ Đạo diễn: Dương Hổ
✤ Diễn viên: Triệu Nghị, Lưu Giám, Bạch Vũ
✤ TRÁNG SĨ XUẤT KÍCH kể về câu chuyện anh dũng hi sinh vì nước nhà của 82 vị anh hùng của Tân tứ quân. Tháng 3 năm 1943, 82 dũng sĩ của Tân tứ quân vì yểm hộ cho quân chủ lực và đảng bộ an toàn di chuyển, họ đã ngoan cường chống lại hơn mười lần tấn công của quân Nhật.', 1, 700, N'movies')
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Description], [Active], [Views], [Category]) VALUES (N'vd026      ', N'Phim Lẻ bởi Thành Long 2022: XUYÊN KHÔNG TIỂU TỬ (Thuyết Minh) | Phim Hành Động Võ Thuật Đỉnh Cao', N'wDawU0fBD5o', N'Diễn Viên: Hồ Ca, Bạch Băng, Trần Tử Hàm, Nhậm Tuyền, Kim Sa, Trương Manh...
Nhà Sản Xuất: Thành Long
Quốc Gia: Trung Quốc
Thể Loại: Phim Thần Thoại - Viễn Tưởng, Phim Cổ Trang Xuyên Không, Phim Kiếm Hiệp, Phim Hoa Ngữ, Phim Xuyên Không, Phim Cung Đấu, Phim Hành Động Võ Thuật, Tiên Hiệp
Ngôn ngữ: Lồng Tiếng
Chất lượng: HD 1080p', 1, 200, N'movies')
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Description], [Active], [Views], [Category]) VALUES (N'vd027      ', N'PHIM HÀNH ĐỘNG CHIẾU RẠP 2020 | SỨC MẠNH CỦA RỒNG - Phần Cuối | Phim Hành Động Võ Thuật Hay Nhất', N'uRwPB-_O9cE', N'Phim Sức Mạnh Của Rồng nhận lệnh Peter Đại Đế, nhà du hành người Anh Jonathan Green lại một lần nữa lên đường với yêu cầu lần này là vẽ lại bản đồ vùng Viễn Đông Nga. Trên chuyến hành trình dài của mình, những cuộc phiêu lưu kỳ thú sẽ dẫn đường cho anh đến với đất nước Trung Hoa và bất ngờ đối mặt với vô vàn những khám phá ngoạn mục, những sinh vật kỳ quái, những nàng công chúa, phải đối đầu sinh tử với những bật thầy võ thuật và thậm chí là vua của tất cả loài Rồng, Long Vương. Đâu mới là nguy hiểm đáng sợ nhất? Liệu sức mạnh nào sẽ chiếm thế thương phong, sự trung thành với khao khát được tìm ra sự thật của một nhà khoa học hay các ma thuật đen tối đang thống trị những vùng đất phương Đông?', 1, 300, N'movies')
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Description], [Active], [Views], [Category]) VALUES (N'vd028      ', N'Review Phim Big Mouth (2022) Bản Full | Tóm Tắt Phim Big Mouth | Lee Jong Suk và Yoona', N'egwCJMkFmHU', N'Phim:  Big Mouth (2022)
Bộ phim Big Mouth kể về câu chuyện về một anh chàng luật sư kém tài và không may bị cuốn vào một vụ án giết người. Để sống sót và bảo vệ gia đình mình, anh bắt buộc phải đào sâu khám phá âm mưu lớn của tầng lớp thượng lưu.', 1, 400, N'movies')
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Description], [Active], [Views], [Category]) VALUES (N'vd029      ', N'Review Phim Bị cáo Bản Full - Tóm Tắt Phim Innocent Defend 2017 | Ji Sung', N'7LJHsz8Ldno', N'
nội dung phim: Phim Bị Cáo bắt đầu khi Park Jung-Woo, một công tố viên tại Văn phòng công tố viên quận Seoul Central, tỉnh dậy và thấy mình đang ở bị nhốt ở đồn cảnh sát. Anh bị mất trí nhớ tạm thời. Park Jung-Woo bị vu cáo và bị kết án tử hình. Anh phải đấu tranh để chứng minh mình vô tội.', 1, 300, N'movies')
INSERT [dbo].[Videos] ([Id], [Title], [Poster], [Description], [Active], [Views], [Category]) VALUES (N'vd030      ', N'Review Phim: Tội Ác Vô Hình | Blind | Bản Full | Tập 1-16 | Taecyeon | Ha Seok Jin | Jung Eun Ji', N'T2nNe915ebk', N'Tội ác vô hình là câu chuyện kể về cuộc đời Ryu Sung Joon - một thanh tra đầy nhiệt huyết và quyết tâm truy bắt những kẻ xấu. Jo Eun Ki - một nhân viên xã hội với trái tim ấm áp, luôn tin vào công lý. Và Ryu Sung Hoon - anh trai của Sung Joon, là một vị thẩm phán đầy tài năng, luôn đưa ra những phán xét công bằng.

Tuy nhiên, cuộc đời thật trớ trêu khi cả ba vô tình dính vào một vụ án giết người hàng loạt mà nạn nhân chính là các thành viên của bồi thẩm đoàn, họ đã cùng nhau tìm ra chân tướng sự thật, bắt kẻ thủ ác chịu trách nhiệm trước pháp luật, đồng thời giải mã những bí ẩn đằng sau vụ án này.
Các cảnh trong video hoàn toàn được thực hiện trên phim ảnh, hiệu ứng, hóa trang và bởi những diễn viên chuyên nghiệp, an toàn đến người xem.

A Phim Review - Nơi kể lại những bộ phim, đánh giá, nêu quan điểm cả nhân về các bộ phim mình đã xem.
Chúng mình cập nhật các bộ phim hay, chiếu rạp với đầy đủ các chủ đề, thể loại, quốc gia.', 1, 1500, N'movies')
SET ANSI_PADDING ON
GO
/****** Object:  Index [UKgf9divd5g3854c9ol2cmknokg]    Script Date: 09/04/2023 3:40:05 PM ******/
ALTER TABLE [dbo].[Favorites] ADD  CONSTRAINT [UKgf9divd5g3854c9ol2cmknokg] UNIQUE NONCLUSTERED 
(
	[VideoId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Favorite__6B9D9EAF4C5800DE]    Script Date: 09/04/2023 3:40:05 PM ******/
ALTER TABLE [dbo].[Favorites] ADD UNIQUE NONCLUSTERED 
(
	[VideoId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Favorite__6B9D9EAF627EB5B8]    Script Date: 09/04/2023 3:40:05 PM ******/
ALTER TABLE [dbo].[Favorites] ADD UNIQUE NONCLUSTERED 
(
	[VideoId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Videos] FOREIGN KEY([VideoId])
REFERENCES [dbo].[Videos] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Videos]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FKd43ytphbfe6w8hcix8bbtf9ae] FOREIGN KEY([VideoId])
REFERENCES [dbo].[Videos] ([Id])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FKd43ytphbfe6w8hcix8bbtf9ae]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FKehf8ud1crmnkemdytnemniddp] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FKehf8ud1crmnkemdytnemniddp]
GO
ALTER TABLE [dbo].[Shares]  WITH CHECK ADD  CONSTRAINT [FK_Shares_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Shares] CHECK CONSTRAINT [FK_Shares_Users]
GO
ALTER TABLE [dbo].[Shares]  WITH CHECK ADD  CONSTRAINT [FK_Shares_Videos] FOREIGN KEY([VideoId])
REFERENCES [dbo].[Videos] ([Id])
GO
ALTER TABLE [dbo].[Shares] CHECK CONSTRAINT [FK_Shares_Videos]
GO
/****** Object:  StoredProcedure [dbo].[spFavoriteByYear]    Script Date: 09/04/2023 3:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spFavoriteByYear](@year int)
as
begin 
	select
		v.Title as 'groupp',
		count(f.Id) as 'likes',
		max(f.LikeDate) as 'newest',
		min(f.LikeDate) as 'oldest'
	from Favorites f inner join Videos v
	on f.VideoId = v.Id
	where YEAR(f.LikeDate) = @year
	group by v.Title
end
GO
USE [master]
GO
ALTER DATABASE [PolyOE2] SET  READ_WRITE 
GO
