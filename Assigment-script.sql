USE [master]
GO
/****** Object:  Database [PRJ_Project]    Script Date: 3/12/2022 8:51:54 PM ******/
CREATE DATABASE [PRJ_Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJ_Project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PRJ_Project.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PRJ_Project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PRJ_Project_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PRJ_Project] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ_Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ_Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ_Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ_Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ_Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ_Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ_Project] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PRJ_Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ_Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ_Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ_Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ_Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ_Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ_Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ_Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ_Project] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRJ_Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ_Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ_Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ_Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ_Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ_Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ_Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ_Project] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PRJ_Project] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ_Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ_Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ_Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ_Project] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PRJ_Project] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PRJ_Project]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 3/12/2022 8:51:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [varchar](4) NOT NULL,
	[categoryName] [nvarchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 3/12/2022 8:51:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [varchar](30) NOT NULL,
	[orderDate] [date] NOT NULL,
	[total] [float] NOT NULL,
	[userID] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 3/12/2022 8:51:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [varchar](30) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[orderID] [varchar](30) NOT NULL,
	[productID] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 3/12/2022 8:51:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [varchar](10) NOT NULL,
	[productName] [nvarchar](40) NOT NULL,
	[image] [nvarchar](200) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[categoryID] [varchar](4) NOT NULL,
	[importDate] [date] NOT NULL,
	[usingDate] [date] NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 3/12/2022 8:51:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [char](2) NOT NULL,
	[roleName] [nvarchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 3/12/2022 8:51:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [varchar](30) NOT NULL,
	[fullName] [nvarchar](40) NOT NULL,
	[password] [varchar](40) NULL,
	[roleID] [char](2) NOT NULL,
	[address] [nvarchar](60) NULL,
	[birthday] [date] NULL,
	[phone] [char](12) NULL,
	[gmail] [nvarchar](50) NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'CU', N'Cac loai cu')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'QUA', N'Cac loai qua')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'RAU', N'Cac loai rau')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (N'2022-03-12T17:46:43.282', CAST(N'2022-03-12' AS Date), 9.5, N'2022-03-12T17:45:51.187')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (N'2022-03-12T18:23:55.185', CAST(N'2022-03-12' AS Date), 29.5, N'SE161410')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (N'2022-03-12T18:34:11.473', CAST(N'2022-03-12' AS Date), 46.150001525878906, N'SE161410')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (N'2022-03-12T18:36:38.327', CAST(N'2022-03-12' AS Date), 26, N'SE161410')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (N'2022-03-12T18:39:19.360', CAST(N'2022-03-12' AS Date), 13, N'SE161410')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (N'2022-03-12T20:18:18.335', CAST(N'2022-03-12' AS Date), 75.300003051757812, N'SE161412')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (N'2022-03-12T20:36:05.347', CAST(N'2022-03-12' AS Date), 43.299999237060547, N'2022-03-12T20:36:05.321')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (N'2022-03-12T17:47:00.765', 9.5, 1, N'2022-03-12T17:46:43.282', N'R003')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (N'2022-03-12T18:23:55.196', 23.5, 1, N'2022-03-12T18:23:55.185', N'C001')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (N'2022-03-12T18:23:55.216', 1, 1, N'2022-03-12T18:23:55.185', N'Q002')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (N'2022-03-12T18:23:55.235', 5, 1, N'2022-03-12T18:23:55.185', N'R002')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (N'2022-03-12T18:34:11.484', 13.600000381469727, 2, N'2022-03-12T18:34:11.473', N'Q002')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (N'2022-03-12T18:34:11.504', 9.4499998092651367, 1, N'2022-03-12T18:34:11.473', N'Q001')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (N'2022-03-12T18:34:11.523', 9.5, 1, N'2022-03-12T18:34:11.473', N'R003')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (N'2022-03-12T18:36:38.336', 13, 2, N'2022-03-12T18:36:38.327', N'R001')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (N'2022-03-12T18:39:19.372', 13, 1, N'2022-03-12T18:39:19.360', N'R001')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (N'2022-03-12T20:18:18.346', 14.699999809265137, 1, N'2022-03-12T20:18:18.335', N'C002')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (N'2022-03-12T20:18:18.367', 23.5, 2, N'2022-03-12T20:18:18.335', N'C001')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (N'2022-03-12T20:18:18.386', 13.600000381469727, 1, N'2022-03-12T20:18:18.335', N'Q002')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (N'2022-03-12T20:36:05.358', 14.699999809265137, 1, N'2022-03-12T20:36:05.347', N'C002')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (N'2022-03-12T20:36:05.378', 13, 1, N'2022-03-12T20:36:05.347', N'R001')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (N'2022-03-12T20:36:05.398', 15.600000381469727, 1, N'2022-03-12T20:36:05.347', N'C003')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'C001', N'Ca rot', N'https://suckhoedoisong.qltns.mediacdn.vn/Images/nguyenkhanh/2020/09/07/ca_rot_vi_thuoc_chua_2.jpg', 23.5, 47, N'CU', CAST(N'2022-03-08' AS Date), CAST(N'2022-04-08' AS Date), 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'C002', N'Cu cai trang', N'https://vietponics.vn/wp-content/uploads/2020/06/C%E1%BB%A7-c%E1%BA%A3i.jpg', 14.699999809265137, 19, N'RAU', CAST(N'2022-03-12' AS Date), CAST(N'2022-06-01' AS Date), 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'C003', N'Cu khoai tay', N'https://hinh365.com/wp-content/uploads/2020/06/334-455-tam-anh-ve-cu-khoai-tay-bao-gom-hinh-anh-stock-vector-chat-luong-cao-tren-123rf-com-1.jpg', 15.600000381469727, 29, N'RAU', CAST(N'2022-03-12' AS Date), CAST(N'2022-05-07' AS Date), 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'Q001', N'Trai xoai', N'https://nutifood.com.vn/uploads/images/tac-dung-cua-xoai.jpg', 9.4499998092651367, 49, N'QUA', CAST(N'2022-03-09' AS Date), CAST(N'2022-04-18' AS Date), 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'Q002', N'Trai tao', N'https://photo2.tinhte.vn/data/attachment-files/2021/05/5471637_Cover.jpg', 13.600000381469727, 37, N'RAU', CAST(N'2022-03-12' AS Date), CAST(N'2022-03-31' AS Date), 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'R001', N'Rau muong', N'https://hikifood.com/wp-content/uploads/2020/05/5143-Rau-mu%E1%BB%91ng.jpg', 13, 46, N'RAU', CAST(N'2022-03-09' AS Date), CAST(N'2022-03-21' AS Date), 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'R002', N'Rau cai', N'https://bizweb.dktcdn.net/thumb/1024x1024/100/400/245/products/raucai458.jpg?v=1600676707537', 5, 49, N'RAU', CAST(N'2022-03-08' AS Date), CAST(N'2022-04-08' AS Date), 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'R003', N'Rau mung toi', N'https://csfood.vn/wp-content/uploads/2018/03/Rau-m%E1%BB%93ng-t%C6%A1i-VietRat.png', 9.5, 57, N'RAU', CAST(N'2022-03-11' AS Date), CAST(N'2022-05-04' AS Date), 1)
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'AD', N'admin')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'US', N'user')
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [gmail], [status]) VALUES (N'2022-03-12T17:45:51.187', N'anhvdse161410', N'', N'US', N'77duong7pba', CAST(N'1900-01-01' AS Date), N'0934181417  ', N'anhvdse161410@fpt.edu.vn', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [gmail], [status]) VALUES (N'2022-03-12T20:36:05.321', N'anhvdse161410', N'', N'US', N'tp Thu Duc', CAST(N'1900-01-01' AS Date), N'01234567890 ', N'anhvdse161410@fpt.edu.vn', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [gmail], [status]) VALUES (N'admin', N'Toi la admin', N'1', N'AD', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [gmail], [status]) VALUES (N'Hoadnt', N'Hoa Doan', N'1', N'US', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [gmail], [status]) VALUES (N'SE130363', N'Ngo Ha Tri Bao', N'1', N'AD', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [gmail], [status]) VALUES (N'SE140103', N'Phuoc Ha', N'1', N'US', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [gmail], [status]) VALUES (N'SE140119', N'Trai Nguyen', N'1', N'AD', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [gmail], [status]) VALUES (N'SE140130', N'Tam Tran', N'1', N'AD', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [gmail], [status]) VALUES (N'SE140201', N'PHAM HOANG TU', N'1', N'AD', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [gmail], [status]) VALUES (N'SE140969', N'Nguyen Gia Tin', N'123', N'US', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [gmail], [status]) VALUES (N'SE150443', N'LE MINH KHOA', N'1', N'US', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [gmail], [status]) VALUES (N'SE161410', N'Vu Duc Anh', N'1', N'US', N'77duong7pba', CAST(N'2002-01-29' AS Date), N'0934181417  ', N'AnhVDSE161410@fpt.edu.vn', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [gmail], [status]) VALUES (N'SE161412', N'Do Duy Anh', N'1', N'US', N'tp Thu Duc', CAST(N'2002-02-15' AS Date), N'01234567890 ', N'boostedxd6969@gmail.com', 1)
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([productID])
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
USE [master]
GO
ALTER DATABASE [PRJ_Project] SET  READ_WRITE 
GO
