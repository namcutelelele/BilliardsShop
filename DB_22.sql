USE [master]
GO
/****** Object:  Database [PRN231_PROJECT_2]    Script Date: 7/22/2024 11:27:23 PM ******/
CREATE DATABASE [PRN231_PROJECT_2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRN231_PROJECT_2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.TAI\MSSQL\DATA\PRN231_PROJECT_2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRN231_PROJECT_2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.TAI\MSSQL\DATA\PRN231_PROJECT_2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRN231_PROJECT_2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRN231_PROJECT_2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRN231_PROJECT_2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRN231_PROJECT_2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRN231_PROJECT_2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRN231_PROJECT_2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRN231_PROJECT_2] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRN231_PROJECT_2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRN231_PROJECT_2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRN231_PROJECT_2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRN231_PROJECT_2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRN231_PROJECT_2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRN231_PROJECT_2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRN231_PROJECT_2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRN231_PROJECT_2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRN231_PROJECT_2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRN231_PROJECT_2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRN231_PROJECT_2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRN231_PROJECT_2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRN231_PROJECT_2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRN231_PROJECT_2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRN231_PROJECT_2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRN231_PROJECT_2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRN231_PROJECT_2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRN231_PROJECT_2] SET RECOVERY FULL 
GO
ALTER DATABASE [PRN231_PROJECT_2] SET  MULTI_USER 
GO
ALTER DATABASE [PRN231_PROJECT_2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRN231_PROJECT_2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRN231_PROJECT_2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRN231_PROJECT_2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRN231_PROJECT_2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRN231_PROJECT_2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRN231_PROJECT_2', N'ON'
GO
ALTER DATABASE [PRN231_PROJECT_2] SET QUERY_STORE = OFF
GO
USE [PRN231_PROJECT_2]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 7/22/2024 11:27:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/22/2024 11:27:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/22/2024 11:27:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Total] [float] NOT NULL,
	[ShippingAddress] [nvarchar](255) NOT NULL,
	[Note] [nvarchar](255) NOT NULL,
	[Status] [int] NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/22/2024 11:27:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/22/2024 11:27:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[UnitsInStock] [int] NOT NULL,
	[IsAvailable] [bit] NULL,
	[BrandId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 7/22/2024 11:27:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetail](
	[ProductId] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Price] [float] NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[ShortDescription] [nvarchar](255) NOT NULL,
	[Weight] [float] NOT NULL,
	[EraserSize] [float] NOT NULL,
	[ButtLength] [float] NOT NULL,
	[ShaftLength] [float] NOT NULL,
	[Grip] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 7/22/2024 11:27:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Source] [nvarchar](255) NOT NULL,
	[IsMainImage] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/22/2024 11:27:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Role] [int] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([Id], [Name]) VALUES (1, N'Peri')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (2, N'MIT')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (3, N'Predator')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (4, N'Rhino')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (5, N'Fury')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (6, N'Mezz')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (7, N'Cuetec')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (8, N'Jflowes')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (9, N'Dragon')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (10, N'Mapple')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (11, N'3Seconds')
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Break Cue')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Pool Cue')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Jump Cue')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (4, N'Snooker Cue')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (5, N'Carom Cue')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (6, N'Accessories')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (2, 2, 10, 1, 8)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (3, 2, 100, 1, 4)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (4, 2, 15, 1, 4)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (5, 2, 15, 1, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (6, 2, 15, 1, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (7, 2, 11, 1, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (8, 2, 10, 1, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (9, 2, 2, 1, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (10, 2, 11, 1, 5)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (11, 2, 10, 1, 5)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (12, 2, 5, 1, 5)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (13, 2, 2, 1, 3)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (14, 2, 1, 1, 3)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (15, 2, 1, 1, 3)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (16, 2, 4, 1, 2)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (17, 2, 5, 1, 2)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (18, 2, 4, 1, 2)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (19, 2, 5, 1, 2)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (20, 2, 5, 1, 6)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (21, 2, 5, 1, 6)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (22, 2, 5, 1, 6)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (23, 2, 5, 1, 6)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (24, 6, 12, 1, 10)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (25, 6, 12, 1, 10)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (26, 6, 12, 1, 7)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (27, 6, 12, 1, 7)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (28, 6, 12, 1, 3)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (29, 6, 12, 1, 3)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (30, 6, 20, 1, 7)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (31, 6, 20, 1, 11)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (32, 1, 10, 1, 4)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (33, 1, 10, 1, 10)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (34, 3, 10, 1, 10)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (35, 1, 10, 1, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (36, 1, 10, 1, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (37, 1, 10, 1, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (38, 3, 10, 1, 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [UnitsInStock], [IsAvailable], [BrandId]) VALUES (39, 3, 10, 1, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (2, N'Jflowers Jf90-10R', 44000000, N'Sản phẩm này được thiết kế đặc biệt để phù hợp cho các buổi thi đấu quan trọng, với các tính năng được tối ưu hóa để mang lại hiệu suất tối đa. Với chất lượng và độ bền vượt trội, sản phẩm này sẽ là người bạn đồng hành đáng tin cậy trong mọi trận đấu.', N'Chất lượng và hiệu suất vượt trội, thiết kế cho thi đấu.', 540, 12.5, 29, 29, N'Trơn')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (3, N'RHINO ECLIPSE SERIES - RED ', 5990000, N'Sản phẩm này nổi bật với thiết kế tinh xảo và chất lượng vượt trội. Mỗi chi tiết của sản phẩm được chăm chút tỉ mỉ, từ chất liệu đến công nghệ sản xuất, mang lại sự hài lòng cho người sử dụng và thể hiện đẳng cấp của sản phẩm.', N'Thiết kế tinh xảo và chất lượng vượt trội, chăm chút đến từng chi tiết.', 530, 12.4, 29, 29, N'Da Bò')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (4, N'RHINO NEBULA - BLUE', 4990000, N'Sản phẩm này nổi bật với thiết kế tinh xảo và chất lượng vượt trội. Mỗi chi tiết của sản phẩm được chăm chút tỉ mỉ, từ chất liệu đến công nghệ sản xuất, mang lại sự hài lòng cho người sử dụng và thể hiện đẳng cấp của sản phẩm.', N'Thiết kế tinh xảo và chất lượng vượt trội, chăm chút đến từng chi tiết.', 530, 12.4, 29, 29, N'Da Bò')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (5, N'Peri ST-01', 5800000, N'Sản phẩm này nổi bật với độ bền cao và thiết kế tối ưu. Được sản xuất từ các chất liệu cao cấp, sản phẩm không chỉ mang lại sự bền bỉ mà còn đảm bảo hiệu suất ổn định trong thời gian dài sử dụng.', N'Độ bền cao và thiết kế tối ưu, chất liệu cao cấp.', 524, 12.5, 29, 29, N'Da Bò')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (6, N'Peri ST-02', 6100000, N'Sản phẩm này được thiết kế đặc biệt để phù hợp cho các buổi thi đấu quan trọng, với các tính năng được tối ưu hóa để mang lại hiệu suất tối đa. Với chất lượng và độ bền vượt trội, sản phẩm này sẽ là người bạn đồng hành đáng tin cậy trong mọi trận đấu.', N'Chất lượng và hiệu suất vượt trội, thiết kế cho thi đấu.', 524, 12.5, 29, 29, N'Da Bò')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (7, N'Peri Earl P-TE02', 20000000, N'Sản phẩm này nổi bật với thiết kế tinh xảo và chất lượng vượt trội. Mỗi chi tiết của sản phẩm được chăm chút tỉ mỉ, từ chất liệu đến công nghệ sản xuất, mang lại sự hài lòng cho người sử dụng và thể hiện đẳng cấp của sản phẩm.', N'Thiết kế tinh xảo và chất lượng vượt trội, chăm chút đến từng chi tiết.', 524, 12.5, 29, 29, N'Bakelite đen')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (8, N'Peri Baron P-D08', 7000000, N'Sản phẩm này kết hợp thiết kế hiện đại với chất lượng cao, mang lại sự hài lòng tối đa cho người sử dụng. Với các tính năng tiên tiến và chất liệu bền bỉ, sản phẩm này là lựa chọn lý tưởng cho những ai yêu thích sự đổi mới và đẳng cấp.', N'Design hiện đại và chất lượng cao, lựa chọn lý tưởng cho sự đổi mới.', 524, 12.5, 29, 29, N'Da')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (9, N'Peri Infinity PX-03', 95000000, N'Sản phẩm này mang đến sự đẳng cấp và nổi bật với nhiều tính năng nổi bật. Được thiết kế để đáp ứng các yêu cầu khắt khe nhất, sản phẩm này không chỉ thu hút với vẻ ngoài sang trọng mà còn với hiệu suất vượt trội.', N'Đẳng cấp và nổi bật, với nhiều tính năng nổi bật.', 524, 12.5, 29, 29, N'Da Kì Đà')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (10, N'FURY CA 1', 4350000, N'Sản phẩm này cung cấp giá cả hợp lý cùng với thiết kế đẹp mắt. Dù có giá phải chăng, sản phẩm vẫn mang lại hiệu suất tốt và chất lượng đáng tin cậy, là sự lựa chọn lý tưởng cho những ai muốn sở hữu sản phẩm chất lượng mà không phải chi quá nhiều.', N'Giá cả hợp lý với thiết kế đẹp mắt, hiệu suất tốt và chất lượng đáng tin cậy.', 530, 13, 29, 29, N'Da')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (11, N'FURY AWP 1', 2790000, N'Sản phẩm này nổi bật với độ bền cao và thiết kế tối ưu. Được sản xuất từ các chất liệu cao cấp, sản phẩm không chỉ mang lại sự bền bỉ mà còn đảm bảo hiệu suất ổn định trong thời gian dài sử dụng.', N'Độ bền cao và thiết kế tối ưu, chất liệu cao cấp.', 530, 13, 29, 29, N'Da')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (12, N'Fury CW 2023', 3500000, N'Sản phẩm này nổi bật với độ bền cao và thiết kế tối ưu. Được sản xuất từ các chất liệu cao cấp, sản phẩm không chỉ mang lại sự bền bỉ mà còn đảm bảo hiệu suất ổn định trong thời gian dài sử dụng.', N'Độ bền cao và thiết kế tối ưu, chất liệu cao cấp.', 530, 13, 29, 29, N'Da')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (13, N'Predator Limited Edition Scorpion 2', 127000000, N'Sản phẩm này nổi bật với độ bền cao và thiết kế tối ưu. Được sản xuất từ các chất liệu cao cấp, sản phẩm không chỉ mang lại sự bền bỉ mà còn đảm bảo hiệu suất ổn định trong thời gian dài sử dụng.', N'Độ bền cao và thiết kế tối ưu, chất liệu cao cấp.', 524, 12.4, 29, 29, N'Trơn')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (14, N'Predator SP2 REVO Adventura', 30300000, N'Sản phẩm này là sự lựa chọn hoàn hảo cho những ai yêu thích sự cao cấp và thiết kế độc quyền. Được chế tạo từ các vật liệu tốt nhất và với công nghệ tiên tiến, sản phẩm này mang lại hiệu suất tối ưu và vẻ ngoài ấn tượng.', N'Độc quyền và cao cấp, hiệu suất tối ưu với thiết kế ấn tượng.', 524, 11.9, 29, 29, N'Extended Leather Luxe™
 Wrap')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (15, N'Predator 30th Anniversary Limited Edition P3 Racer Gold', 35000000, N'Phiên bản kỷ niệm 30 năm này kết hợp thiết kế sang trọng với chất liệu cao cấp. Được tạo ra để kỷ niệm một cột mốc quan trọng, sản phẩm này không chỉ thu hút với vẻ ngoài đẹp mắt mà còn mang đến chất lượng và hiệu suất vượt trội.', N'Kỷ niệm 30 năm với thiết kế sang trọng và chất liệu cao cấp.', 524, 11.9, 29, 29, N'Leather Luxe™ Wrap')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (16, N'Mit MC2-006', 10000000, N'Sản phẩm này nổi bật với thiết kế bền bỉ và sang trọng, phù hợp cho những người yêu thích sự kết hợp giữa chất lượng và đẳng cấp. Với các tính năng hiện đại và chất liệu cao cấp, sản phẩm này mang lại sự hài lòng tối đa cho người sử dụng.', N'Bền bỉ và sang trọng, kết hợp giữa chất lượng và đẳng cấp.', 530, 12.8, 29, 29, N'Da')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (17, N'Mit MP7-S04', 15000000, N'Sản phẩm này cung cấp chất lượng cao với thiết kế hiện đại, là lựa chọn lý tưởng cho những ai yêu thích sự đổi mới và tiện nghi. Với các tính năng tiên tiến và chất liệu tốt, sản phẩm này đáp ứng nhu cầu cao nhất của người sử dụng.', N'Chất lượng cao và thiết kế hiện đại, đáp ứng nhu cầu cao nhất.', 530, 12.8, 29, 29, N'Da')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (18, N'Mit MP3-004', 17000000, N'Sản phẩm này mang lại sự đẳng cấp với thiết kế tối ưu, phù hợp cho những người tìm kiếm sự khác biệt. Với các tính năng nổi bật và chất liệu cao cấp, sản phẩm không chỉ thu hút với vẻ ngoài mà còn với hiệu suất vượt trội.', N'Đẳng cấp và tối ưu, với thiết kế nổi bật và hiệu suất vượt trội.', 530, 12.8, 29, 29, N'Da')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (19, N'Mit MC7-602', 10000000, N'Sản phẩm này nổi bật với chất lượng cao và thiết kế bền bỉ, là sự lựa chọn hoàn hảo cho những ai cần một sản phẩm đáng tin cậy và lâu dài. Với chất liệu tốt và công nghệ tiên tiến, sản phẩm này đảm bảo hiệu suất tối ưu trong mọi điều kiện sử dụng.', N'Chất lượng cao và thiết kế bền bỉ, đáng tin cậy và lâu dài.', 530, 12.8, 29, 29, N'Da')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (20, N'Mezz ACE-2180', 12000000, N'Sản phẩm này kết hợp thiết kế sang trọng với chất liệu tốt, mang đến một lựa chọn đáng giá cho những ai yêu thích sự tinh tế và đẳng cấp. Được chế tạo với công nghệ tiên tiến và vật liệu cao cấp, sản phẩm này chắc chắn sẽ làm hài lòng người sử dụng.', N'Sang trọng và chất liệu tốt, lựa chọn đáng giá với công nghệ tiên tiến.', 538, 12.5, 29, 29, N'Da Bò')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (21, N'Mezz AVT-WOJ2', 15000000, N'Sản phẩm này nổi bật với chất lượng cao và thiết kế tinh tế, là sự lựa chọn lý tưởng cho những ai tìm kiếm sự hoàn hảo. Với các tính năng nổi bật và chất liệu tốt, sản phẩm không chỉ đáp ứng nhu cầu cao mà còn mang lại sự hài lòng tuyệt đối.', N'Chất lượng cao và thiết kế tinh tế, sự lựa chọn lý tưởng cho sự hoàn hảo.', 538, 12.5, 29, 29, N'Da Bò')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (22, N'Mezz CP-21MD', 17000000, N'Sản phẩm này kết hợp thiết kế tinh xảo với chất liệu tốt, mang lại sự hoàn hảo cho người sử dụng. Được chế tạo với sự chăm chút tỉ mỉ, sản phẩm này không chỉ đẹp mắt mà còn bền bỉ và đáng tin cậy.', N'Tinh xảo và chất liệu tốt, với sự chăm chút tỉ mỉ và bền bỉ.', 538, 12.5, 29, 29, N'Da Bò')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (23, N'Mezz EC9-B', 19000000, N'Sản phẩm này mang lại sự đẳng cấp với chất lượng tuyệt vời, là sự lựa chọn hoàn hảo cho những ai tìm kiếm sự khác biệt và nổi bật. Với thiết kế ấn tượng và tính năng tiên tiến, sản phẩm không chỉ thu hút mà còn mang lại hiệu suất tốt nhất.', N'Đẳng cấp và chất lượng tuyệt vời, lựa chọn hoàn hảo cho sự khác biệt.', 538, 12.5, 29, 29, N'Da Bò')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (24, N'BAO ĐỰNG GẬY 2x4 MAPLE LEAF', 2300000, N'MAPLE LEAF BILLIARD CUE CARRYING CASE ( Size 2x4 ) Thông số kĩ thuật : Trọng lượng: 600gr Chất liệu : Vỏ bao - Canvas, Bên trong bao : Felt Kích thước : 32.5 x 5 x 4 inches Ngăn chứa : 2 chuôi 3 ngọn Hình dáng : Box', N'Độ bền cao và thiết kế tối ưu, chất liệu cao cấp.', 600, 0, 0, 0, N'Canavas')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (25, N'BAO ĐỰNG GẬY 2x3 MAPLE LEAF', 1800000, N'Bao đựng gậy này nổi bật với thiết kế hiện đại và chất liệu tốt, cung cấp sự bảo vệ tối ưu cho gậy của bạn. Với các tính năng tiên tiến và sự chăm chút trong từng chi tiết, sản phẩm này mang lại sự hài lòng tối đa cho người sử dụng.', N'Design hiện đại và chất liệu tốt, bảo vệ tối ưu và sự chăm chút.', 500, 0, 0, 0, N'Canavas')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (26, N'Bao cơ Cuetec ProLine - 4x8 Navy', 8700000, N'Bao cơ này được chế tạo với chất liệu bền bỉ và thiết kế cao cấp, là lựa chọn tuyệt vời cho những ai cần sự bảo vệ chắc chắn và đáng tin cậy. Với các tính năng tiện ích và thiết kế sang trọng, sản phẩm này mang lại sự bảo vệ hoàn hảo và phong cách.', N'Chất liệu bền bỉ và thiết kế cao cấp, bảo vệ chắc chắn và phong cách.', 1300, 0, 0, 0, N'Canavas')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (27, N'Bao cơ Cuetec ProLine - 2x4 Ghost', 7880000, N'Bao cơ này nổi bật với sức chứa lớn và chất liệu tốt, mang lại sự tiện lợi và hiệu quả tối ưu. Được thiết kế để đáp ứng nhu cầu của người sử dụng, sản phẩm này không chỉ cung cấp không gian lưu trữ rộng rãi mà còn đảm bảo độ bền và chất lượng.', N'Sức chứa lớn và chất liệu tốt, cung cấp không gian lưu trữ rộng rãi.', 1500, 0, 0, 0, N'Canavas')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (28, N'Bao cơ Predator Roadline Grey Soft Pool Cue Case - 3x6', 5650000, N'Bao cơ này kết hợp thiết kế sang trọng với chất liệu cao cấp, tạo nên một sản phẩm không chỉ đẹp mắt mà còn bền bỉ. Với các tính năng tiên tiến và sự chăm chút tỉ mỉ, sản phẩm này mang lại sự hài lòng tối đa cho người sử dụng.', N'Sang trọng và cao cấp, với chất liệu tốt và thiết kế tỉ mỉ.', 1680, 0, 0, 0, N'Vinyl')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (29, N'Bao cơ Predator Roadline Grey Pool Cue Hard Case - 2 Butts x 4 Shafts', 5250000, N'Bao cơ này nổi bật với thiết kế độc đáo và nhiều ngăn lưu trữ, mang lại sự tiện lợi và hiệu quả tối ưu. Với các tính năng thông minh và chất liệu tốt, sản phẩm này là sự lựa chọn lý tưởng cho những ai cần sự bảo vệ và tổ chức tốt nhất.', N'Design độc đáo với nhiều ngăn lưu trữ, tiện lợi và hiệu quả.', 1360, 0, 0, 0, N'Synthetic')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (30, N'Găng Cuetec', 650000, N'Găng tay Axis có độ bền, bề mặt ma sát cực thấp kết hợp với lưới thoáng khí được gia cố bằng đường khâu đôi để mang đến cho người chơi những cú đánh mượt mà và ổn định hơn.', N'Độ bền cao và thiết kế tối ưu, chất liệu cao cấp.', 0, 0, 0, 0, N'Chất liệu vải bề mặt có độ ma sát cực thấp')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (31, N'Găng tay 3 Seconds', 750000, N'Găng tay này kết hợp chất lượng tốt với thiết kế tiện dụng, mang lại sự thoải mái và hiệu quả trong suốt thời gian sử dụng. Với các tính năng nổi bật và chất liệu bền bỉ, sản phẩm này đáp ứng nhu cầu cao nhất của người sử dụng.', N'Chất lượng tốt và thiết kế tiện dụng, thoải mái và hiệu quả.', 0, 0, 0, 0, N'Vải mè')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (32, N'Cơ phá Rhino KOMET Gold', 5490000, N'Cơ phá này sở hữu thiết kế đột phá và chất liệu tốt, mang lại hiệu suất tối ưu và sự đáng tin cậy. Được chế tạo với sự chăm sóc tỉ mỉ và công nghệ tiên tiến, sản phẩm này là sự lựa chọn lý tưởng cho những ai yêu thích sự đổi mới và chất lượng.', N'Design đột phá và chất liệu tốt, hiệu suất tối ưu và đáng tin cậy.', 600, 13, 29, 30, N'Vân Nổi')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (33, N'Phá AVID Surge Break Cue Gray Stain', 9700000, N'Cơ phá này nổi bật với chất lượng cao và thiết kế đẹp mắt, mang lại hiệu suất vượt trội trong mọi tình huống. Với các tính năng tiên tiến và chất liệu tốt, sản phẩm này không chỉ thu hút với vẻ ngoài mà còn với hiệu suất tối ưu.', N'Chất lượng cao và thiết kế đẹp mắt, hiệu suất vượt trội.', 538, 13, 29, 29, N'Trơn')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (34, N'Nhảy AVID Surge Jump Cue Black/Gold', 7000000, N'Cơ nhảy này cung cấp thiết kế tối ưu và chất liệu bền, mang lại hiệu suất và sự thoải mái trong suốt thời gian sử dụng. Được chế tạo để đáp ứng nhu cầu cao nhất, sản phẩm này là sự lựa chọn lý tưởng cho những người yêu thích thể thao.', N'Design tối ưu và chất liệu bền, hiệu suất và thoải mái tối ưu.', 530, 13, 20, 29, N'Trơn')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (35, N'Peri PBH-BT2', 4200000, N'Cơ nhảy này nổi bật với thiết kế tiện lợi và chất liệu cao cấp, cung cấp sự bảo vệ và thoải mái tối ưu. Với các tính năng thông minh và chất lượng vượt trội, sản phẩm này là sự lựa chọn lý tưởng cho những người tìm kiếm sự hoàn hảo trong mọi tình huống.', N'Design tiện lợi và chất liệu cao cấp, bảo vệ và thoải mái tối ưu.', 540, 13, 29, 29, N'Da')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (36, N'Peri ORIENTAL', 20000000, N'Cơ nhảy này nổi bật với thiết kế tiện lợi và chất liệu cao cấp, cung cấp sự bảo vệ và thoải mái tối ưu. Với các tính năng thông minh và chất lượng vượt trội, sản phẩm này là sự lựa chọn lý tưởng cho những người tìm kiếm sự hoàn hảo trong mọi tình huống.', N'Design tiện lợi và chất liệu cao cấp, bảo vệ và thoải mái tối ưu.', 580, 13, 29, 29, N'Trơn')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (37, N'
Peri PBH-G02', 11800000, N'Sản phẩm này kết hợp thiết kế sang trọng với chất liệu tốt, mang đến một lựa chọn đáng giá cho những ai yêu thích sự tinh tế và đẳng cấp. Được chế tạo với công nghệ tiên tiến và vật liệu cao cấp, sản phẩm này chắc chắn sẽ làm hài lòng người sử dụng.', N'Tinh xảo và chất liệu tốt, với sự chăm chút tỉ mỉ và bền bỉ.', 580, 13, 29, 29, N'Trơn')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (38, N'Peri PWX-T1', 12000000, N'Sản phẩm này kết hợp thiết kế sang trọng với chất liệu tốt, mang đến một lựa chọn đáng giá cho những ai yêu thích sự tinh tế và đẳng cấp. Được chế tạo với công nghệ tiên tiến và vật liệu cao cấp, sản phẩm này chắc chắn sẽ làm hài lòng người sử dụng.', N'Tinh xảo và chất liệu tốt, với sự chăm chút tỉ mỉ và bền bỉ.', 530, 13, 29, 29, N'Trơn')
INSERT [dbo].[ProductDetail] ([ProductId], [Name], [Price], [Description], [ShortDescription], [Weight], [EraserSize], [ButtLength], [ShaftLength], [Grip]) VALUES (39, N'ECLAT 2018-S', 6500000, N'Sản phẩm này nổi bật với chất lượng cao và thiết kế tinh tế, là sự lựa chọn lý tưởng cho những ai tìm kiếm sự hoàn hảo. Với các tính năng nổi bật và chất liệu tốt, sản phẩm không chỉ đáp ứng nhu cầu cao mà còn mang lại sự hài lòng tuyệt đối.', N'Đẳng cấp và chất lượng tuyệt vời, lựa chọn hoàn hảo cho sự khác biệt.', 530, 13, 29, 29, N'Trơn')
GO
SET IDENTITY_INSERT [dbo].[ProductImage] ON 

INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (1, 27, N'~img/product-image/Accesstories/Bao cơ Cuetec ProLine - 2x4 Ghost.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (2, 27, N'~img/product-image/Accesstories/Bao cơ Cuetec ProLine - 2x4 Ghost_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (3, 27, N'~img/product-image/Accesstories/Bao cơ Cuetec ProLine - 2x4 Ghost_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (4, 27, N'~img/product-image/Accesstories/Bao cơ Cuetec ProLine - 2x4 Ghost_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (5, 26, N'~img/product-image/Accesstories/Bao cơ Cuetec ProLine - 4x8 Navy.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (6, 26, N'~img/product-image/Accesstories/Bao cơ Cuetec ProLine - 4x8 Navy_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (7, 26, N'~img/product-image/Accesstories/Bao cơ Cuetec ProLine - 4x8 Navy_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (8, 26, N'~img/product-image/Accesstories/Bao cơ Cuetec ProLine - 4x8 Navy_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (9, 29, N'~img/product-image/Accesstories/Bao cơ Predator Roadline Grey Pool Cue Hard Case - 2 Butts x 4 Shafts.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (10, 29, N'~img/product-image/Accesstories/Bao cơ Predator Roadline Grey Pool Cue Hard Case - 2 Butts x 4 Shafts_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (11, 29, N'~img/product-image/Accesstories/Bao cơ Predator Roadline Grey Pool Cue Hard Case - 2 Butts x 4 Shafts_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (12, 29, N'~img/product-image/Accesstories/Bao cơ Predator Roadline Grey Pool Cue Hard Case - 2 Butts x 4 Shafts_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (13, 28, N'~img/product-image/Accesstories/Bao cơ Predator Roadline Grey Soft Pool Cue Case - 3x6.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (14, 28, N'~img/product-image/Accesstories/Bao cơ Predator Roadline Grey Soft Pool Cue Case - 3x6_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (15, 28, N'~img/product-image/Accesstories/Bao cơ Predator Roadline Grey Soft Pool Cue Case - 3x6_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (16, 28, N'~img/product-image/Accesstories/Bao cơ Predator Roadline Grey Soft Pool Cue Case - 3x6_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (17, 24, N'~img/product-image/Accesstories/BAO ĐỰNG GẬY 2x4 MAPLE LEAF.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (18, 24, N'~img/product-image/Accesstories/BAO ĐỰNG GẬY 2x4 MAPLE LEAF_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (19, 31, N'~img/product-image/Accesstories/Găng 3Seconds.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (20, 31, N'~img/product-image/Accesstories/Găng 3Seconds_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (21, 30, N'~img/product-image/Accesstories/Găng tay Cuetec.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (22, 30, N'~img/product-image/Accesstories/Găng tay Cuetec_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (23, 32, N'~img/product-image/BrackCues/Cơ phá Rhino KOMET Gold.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (24, 32, N'~img/product-image/BrackCues/Cơ phá Rhino KOMET Gold_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (25, 32, N'~img/product-image/BrackCues/Cơ phá Rhino KOMET Gold_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (26, 32, N'~img/product-image/BrackCues/Cơ phá Rhino KOMET Gold_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (27, 36, N'~img/product-image/BrackCues/Peri ORIENTAL.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (28, 36, N'~img/product-image/BrackCues/Peri ORIENTAL_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (29, 36, N'~img/product-image/BrackCues/Peri ORIENTAL_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (30, 36, N'~img/product-image/BrackCues/Peri ORIENTAL_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (31, 35, N'~img/product-image/BrackCues/Peri PBH-BT2.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (32, 35, N'~img/product-image/BrackCues/Peri PBH-BT2_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (33, 35, N'~img/product-image/BrackCues/Peri PBH-BT2_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (34, 35, N'~img/product-image/BrackCues/Peri PBH-BT2_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (35, 37, N'~img/product-image/BrackCues/Peri PBH-G02.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (36, 37, N'~img/product-image/BrackCues/Peri PBH-G02_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (37, 37, N'~img/product-image/BrackCues/Peri PBH-G02_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (38, 37, N'~img/product-image/BrackCues/Peri PBH-G02_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (39, 33, N'~img/product-image/BrackCues/Phá AVID Surge Break Cue Gray Stain.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (40, 33, N'~img/product-image/BrackCues/Phá AVID Surge Break Cue Gray Stain_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (41, 33, N'~img/product-image/BrackCues/Phá AVID Surge Break Cue Gray Stain_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (42, 33, N'~img/product-image/BrackCues/Phá AVID Surge Break Cue Gray Stain_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (43, 39, N'~img/product-image/JumpCues/ECLAT 2018-S.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (44, 39, N'~img/product-image/JumpCues/ECLAT 2018-S_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (45, 39, N'~img/product-image/JumpCues/ECLAT 2018-S_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (46, 39, N'~img/product-image/JumpCues/ECLAT 2018-S_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (47, 34, N'~img/product-image/JumpCues/Nhảy AVID Surge Jump Cue Black.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (48, 34, N'~img/product-image/JumpCues/Nhảy AVID Surge Jump Cue Black_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (49, 34, N'~img/product-image/JumpCues/Nhảy AVID Surge Jump Cue Black_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (51, 38, N'~img/product-image/JumpCues/Peri PWX-T1.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (52, 38, N'~img/product-image/JumpCues/Peri PWX-T1_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (53, 38, N'~img/product-image/JumpCues/Peri PWX-T1_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (54, 11, N'~img/product-image/PoolCues/Fury AWP.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (55, 11, N'~img/product-image/PoolCues/Fury AWP_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (56, 11, N'~img/product-image/PoolCues/Fury AWP_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (57, 11, N'~img/product-image/PoolCues/Fury AWP_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (58, 10, N'~img/product-image/PoolCues/FURY CA 1.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (59, 10, N'~img/product-image/PoolCues/FURY CA 1_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (60, 10, N'~img/product-image/PoolCues/FURY CA 1_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (61, 10, N'~img/product-image/PoolCues/FURY CA 1_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (62, 12, N'~img/product-image/PoolCues/Fury CW 2023.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (63, 12, N'~img/product-image/PoolCues/Fury CW 2023_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (64, 2, N'~img/product-image/PoolCues/Jflowers Jf90-10R.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (65, 2, N'~img/product-image/PoolCues/Jflowers Jf90-10R_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (66, 2, N'~img/product-image/PoolCues/Jflowers Jf90-10R_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (67, 2, N'~img/product-image/PoolCues/Jflowers Jf90-10R_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (68, 20, N'~img/product-image/PoolCues/Mezz ACE-2180.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (69, 20, N'~img/product-image/PoolCues/Mezz ACE-2180_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (70, 20, N'~img/product-image/PoolCues/Mezz ACE-2180_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (71, 20, N'~img/product-image/PoolCues/Mezz ACE-2180_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (72, 21, N'~img/product-image/PoolCues/Mezz AVT-WOJ2.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (73, 21, N'~img/product-image/PoolCues/Mezz AVT-WOJ2_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (74, 21, N'~img/product-image/PoolCues/Mezz AVT-WOJ2_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (75, 21, N'~img/product-image/PoolCues/Mezz AVT-WOJ2_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (76, 22, N'~img/product-image/PoolCues/Mezz CP-21MD.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (77, 22, N'~img/product-image/PoolCues/Mezz CP-21MD_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (78, 22, N'~img/product-image/PoolCues/Mezz CP-21MD_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (79, 22, N'~img/product-image/PoolCues/Mezz CP-21MD_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (80, 23, N'~img/product-image/PoolCues/Mezz EC9-B.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (81, 23, N'~img/product-image/PoolCues/Mezz EC9-B_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (82, 23, N'~img/product-image/PoolCues/Mezz EC9-B_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (83, 16, N'~img/product-image/PoolCues/Mit MC2-006.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (84, 16, N'~img/product-image/PoolCues/Mit MC2-006_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (85, 16, N'~img/product-image/PoolCues/Mit MC2-006_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (86, 16, N'~img/product-image/PoolCues/Mit MC2-006_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (87, 19, N'~img/product-image/PoolCues/Mit MC7-602.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (88, 19, N'~img/product-image/PoolCues/Mit MC7-602_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (89, 19, N'~img/product-image/PoolCues/Mit MC7-602_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (90, 19, N'~img/product-image/PoolCues/Mit MC7-602_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (91, 18, N'~img/product-image/PoolCues/Mit MP3-004.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (92, 18, N'~img/product-image/PoolCues/Mit MP3-004_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (93, 18, N'~img/product-image/PoolCues/Mit MP3-004_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (94, 18, N'~img/product-image/PoolCues/Mit MP3-004_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (95, 17, N'~img/product-image/PoolCues/Mit MP7-S04.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (96, 17, N'~img/product-image/PoolCues/Mit MP7-S04_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (97, 17, N'~img/product-image/PoolCues/Mit MP7-S04_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (98, 17, N'~img/product-image/PoolCues/Mit MP7-S04_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (99, 8, N'~img/product-image/PoolCues/Peri Baron P-D08.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (100, 8, N'~img/product-image/PoolCues/Peri Baron P-D08_2.png', 0)
GO
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (101, 8, N'~img/product-image/PoolCues/Peri Baron P-D08_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (102, 8, N'~img/product-image/PoolCues/Peri Baron P-D08_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (103, 7, N'~img/product-image/PoolCues/Peri Earl P-TE02.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (104, 7, N'~img/product-image/PoolCues/Peri Earl P-TE02_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (105, 7, N'~img/product-image/PoolCues/Peri Earl P-TE02_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (106, 7, N'~img/product-image/PoolCues/Peri Earl P-TE02_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (107, 9, N'~img/product-image/PoolCues/Peri Infinity PX-03.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (108, 9, N'~img/product-image/PoolCues/Peri Infinity PX-03_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (109, 9, N'~img/product-image/PoolCues/Peri Infinity PX-03_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (110, 9, N'~img/product-image/PoolCues/Peri Infinity PX-03_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (111, 5, N'~img/product-image/PoolCues/Peri ST-01.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (112, 5, N'~img/product-image/PoolCues/Peri ST-01_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (113, 5, N'~img/product-image/PoolCues/Peri ST-01_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (114, 5, N'~img/product-image/PoolCues/Peri ST-01_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (115, 6, N'~img/product-image/PoolCues/Peri ST-02.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (116, 6, N'~img/product-image/PoolCues/Peri ST-02_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (117, 6, N'~img/product-image/PoolCues/Peri ST-02_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (118, 6, N'~img/product-image/PoolCues/Peri ST-02_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (119, 15, N'~img/product-image/PoolCues/Predator 30th Anniversary Limited Edition P3 Racer Gold.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (120, 15, N'~img/product-image/PoolCues/Predator 30th Anniversary Limited Edition P3 Racer Gold_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (121, 15, N'~img/product-image/PoolCues/Predator 30th Anniversary Limited Edition P3 Racer Gold_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (122, 15, N'~img/product-image/PoolCues/Predator 30th Anniversary Limited Edition P3 Racer Gold_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (123, 13, N'~img/product-image/PoolCues/Predator Limited Edition Scorpion 2.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (124, 13, N'~img/product-image/PoolCues/Predator Limited Edition Scorpion 2_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (125, 13, N'~img/product-image/PoolCues/Predator Limited Edition Scorpion 2_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (126, 13, N'~img/product-image/PoolCues/Predator Limited Edition Scorpion 2_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (127, 14, N'~img/product-image/PoolCues/Predator SP2 REVO Adventura 2.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (128, 14, N'~img/product-image/PoolCues/Predator SP2 REVO Adventura 2_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (129, 14, N'~img/product-image/PoolCues/Predator SP2 REVO Adventura 2_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (130, 14, N'~img/product-image/PoolCues/Predator SP2 REVO Adventura 2_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (131, 3, N'~img/product-image/PoolCues/RHINO ECLIPSE SERIES - RED.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (132, 3, N'~img/product-image/PoolCues/RHINO ECLIPSE SERIES - RED_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (133, 3, N'~img/product-image/PoolCues/RHINO ECLIPSE SERIES - RED_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (134, 3, N'~img/product-image/PoolCues/RHINO ECLIPSE SERIES - RED_4.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (135, 4, N'~img/product-image/PoolCues/RHINO NEBULA - BLUE.png', 1)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (136, 4, N'~img/product-image/PoolCues/RHINO NEBULA - BLUE_2.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (137, 4, N'~img/product-image/PoolCues/RHINO NEBULA - BLUE_3.png', 0)
INSERT [dbo].[ProductImage] ([Id], [ProductId], [Source], [IsMainImage]) VALUES (138, 4, N'~img/product-image/PoolCues/RHINO NEBULA - BLUE_4.png', 0)
SET IDENTITY_INSERT [dbo].[ProductImage] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [order_userid_foreign] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [order_userid_foreign]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [orderdetail_orderid_foreign] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [orderdetail_orderid_foreign]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [orderdetail_productid_foreign] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [orderdetail_productid_foreign]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [product_brandid_foreign] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [product_brandid_foreign]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [product_categoryid_foreign] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [product_categoryid_foreign]
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD  CONSTRAINT [productdetail_productid_foreign] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductDetail] CHECK CONSTRAINT [productdetail_productid_foreign]
GO
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD  CONSTRAINT [productimage_productid_foreign] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductImage] CHECK CONSTRAINT [productimage_productid_foreign]
GO
USE [master]
GO
ALTER DATABASE [PRN231_PROJECT_2] SET  READ_WRITE 
GO
