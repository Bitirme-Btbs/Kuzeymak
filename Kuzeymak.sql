USE [master]
GO
/****** Object:  Database [KuzeyMak]    Script Date: 9.06.2022 17:46:27 ******/
CREATE DATABASE [KuzeyMak]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KuzeyMak', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\KuzeyMak.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'KuzeyMak_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\KuzeyMak_log.ldf' , SIZE = 3072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [KuzeyMak] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KuzeyMak].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KuzeyMak] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KuzeyMak] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KuzeyMak] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KuzeyMak] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KuzeyMak] SET ARITHABORT OFF 
GO
ALTER DATABASE [KuzeyMak] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KuzeyMak] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KuzeyMak] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KuzeyMak] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KuzeyMak] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KuzeyMak] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KuzeyMak] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KuzeyMak] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KuzeyMak] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KuzeyMak] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KuzeyMak] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KuzeyMak] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KuzeyMak] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KuzeyMak] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KuzeyMak] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KuzeyMak] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KuzeyMak] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KuzeyMak] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KuzeyMak] SET  MULTI_USER 
GO
ALTER DATABASE [KuzeyMak] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KuzeyMak] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KuzeyMak] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KuzeyMak] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [KuzeyMak]
GO
/****** Object:  Table [dbo].[BirimMaliyet]    Script Date: 9.06.2022 17:46:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BirimMaliyet](
	[BM_Id] [int] IDENTITY(1,1) NOT NULL,
	[Urun_ID] [int] NULL,
	[Dimmg] [decimal](18, 2) NULL,
	[Dig] [decimal](18, 2) NULL,
	[BirimDagitimOlcu] [int] NULL,
 CONSTRAINT [PK_BirimMaliyet] PRIMARY KEY CLUSTERED 
(
	[BM_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DagıtımOlcu]    Script Date: 9.06.2022 17:46:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DagıtımOlcu](
	[DagıtımOlcu_Id] [int] IDENTITY(1,1) NOT NULL,
	[DagıtımOlcu_Ad] [varchar](max) NULL,
 CONSTRAINT [PK_DagıtımOlcu] PRIMARY KEY CLUSTERED 
(
	[DagıtımOlcu_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DagitimOlcuFaaliyetiliski]    Script Date: 9.06.2022 17:46:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DagitimOlcuFaaliyetiliski](
	[Df_Id] [int] IDENTITY(1,1) NOT NULL,
	[DagitimOlcuId] [int] NULL,
	[FaaliyetId] [int] NULL,
 CONSTRAINT [PK_DagitimOlcuFaaliyetiliski] PRIMARY KEY CLUSTERED 
(
	[Df_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faaliyet]    Script Date: 9.06.2022 17:46:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faaliyet](
	[FaaliyetId] [int] IDENTITY(1,1) NOT NULL,
	[FaaliyetAd] [nvarchar](90) NULL,
 CONSTRAINT [PK_Faaliyet] PRIMARY KEY CLUSTERED 
(
	[FaaliyetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gider]    Script Date: 9.06.2022 17:46:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gider](
	[GiderId] [int] IDENTITY(1,1) NOT NULL,
	[HesapKodu] [varchar](90) NULL,
	[HesapAd] [varchar](90) NULL,
	[Tutar] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Gider] PRIMARY KEY CLUSTERED 
(
	[GiderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KaynakMaliyetEtken]    Script Date: 9.06.2022 17:46:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KaynakMaliyetEtken](
	[KMEId] [int] IDENTITY(1,1) NOT NULL,
	[KMEAd] [varchar](90) NULL,
 CONSTRAINT [PK_KaynakMaliyetEtken] PRIMARY KEY CLUSTERED 
(
	[KMEId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Maliyet]    Script Date: 9.06.2022 17:46:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maliyet](
	[MaliyetId] [int] IDENTITY(1,1) NOT NULL,
	[GiderId] [int] NULL,
	[FaaliyetId] [int] NULL,
	[KMEId] [int] NULL,
	[Onay] [bit] NULL,
	[Adet] [int] NULL,
 CONSTRAINT [PK_Maliyet] PRIMARY KEY CLUSTERED 
(
	[MaliyetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaliyetEndirektUretim]    Script Date: 9.06.2022 17:46:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaliyetEndirektUretim](
	[EUM_Id] [int] IDENTITY(1,1) NOT NULL,
	[Urun_Id] [int] NULL,
	[Toplam] [decimal](18, 2) NULL,
 CONSTRAINT [PK_MaliyetEndirektUretim] PRIMARY KEY CLUSTERED 
(
	[EUM_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaliyetUrun]    Script Date: 9.06.2022 17:46:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaliyetUrun](
	[MaliyetUrunId] [int] IDENTITY(1,1) NOT NULL,
	[UrunId] [int] NULL,
	[DagitimOlcuId] [int] NULL,
	[UrunDagitimAdet] [decimal](18, 3) NULL,
 CONSTRAINT [PK_MaliyetUrun] PRIMARY KEY CLUSTERED 
(
	[MaliyetUrunId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblBirimMaliyetTutar]    Script Date: 9.06.2022 17:46:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblBirimMaliyetTutar](
	[BMT_ID] [int] IDENTITY(1,1) NOT NULL,
	[Urunler] [nvarchar](max) NULL,
	[EndirekUM] [decimal](18, 2) NULL,
	[Dimmg] [decimal](18, 2) NULL,
	[Dig] [decimal](18, 2) NULL,
	[ToplamMaliyet] [decimal](18, 2) NULL,
	[BirimMaliyet] [decimal](18, 2) NULL,
 CONSTRAINT [PK_TblBirimMaliyetTutar] PRIMARY KEY CLUSTERED 
(
	[BMT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblToplamMaliyet]    Script Date: 9.06.2022 17:46:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblToplamMaliyet](
	[TMaliyet_ID] [int] IDENTITY(1,1) NOT NULL,
	[UrunAdi] [nvarchar](max) NULL,
	[EndirektToplami] [decimal](18, 2) NULL,
	[Dimmg] [decimal](18, 2) NULL,
	[Dig] [decimal](18, 2) NULL,
	[ToplamMaliyeti] [decimal](18, 2) NULL,
 CONSTRAINT [PK_TblToplamMaliyet] PRIMARY KEY CLUSTERED 
(
	[TMaliyet_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TutarUrunFaaliyet]    Script Date: 9.06.2022 17:46:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TutarUrunFaaliyet](
	[TUF_ID] [int] IDENTITY(1,1) NOT NULL,
	[Urun] [nvarchar](max) NULL,
	[Faaliyet] [nvarchar](max) NULL,
	[TutarTUF] [decimal](18, 5) NULL,
 CONSTRAINT [PK_TutarUrunFaaliyet] PRIMARY KEY CLUSTERED 
(
	[TUF_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urun]    Script Date: 9.06.2022 17:46:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urun](
	[UrunId] [int] IDENTITY(1,1) NOT NULL,
	[UrunAd] [varchar](max) NULL,
 CONSTRAINT [PK_Urun] PRIMARY KEY CLUSTERED 
(
	[UrunId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[Oran]    Script Date: 9.06.2022 17:46:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Oran]
AS
SELECT        m.MaliyetId, CAST(m.Adet AS decimal(18, 2)) / t.ToplamAdet AS Oran
FROM            dbo.Maliyet AS m INNER JOIN
                             (SELECT        SUM(Adet) AS ToplamAdet, GiderId
                               FROM            dbo.Maliyet
                               GROUP BY GiderId) AS t ON m.GiderId = t.GiderId INNER JOIN
                         dbo.Maliyet AS Maliyet_1 ON m.MaliyetId = Maliyet_1.MaliyetId
GO
/****** Object:  View [dbo].[GenelTutar]    Script Date: 9.06.2022 17:46:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GenelTutar]
AS
SELECT        dbo.Oran.MaliyetId, dbo.Oran.Oran, dbo.Maliyet.MaliyetId AS Expr1, dbo.Maliyet.GiderId, dbo.Faaliyet.FaaliyetAd, dbo.Maliyet.FaaliyetId, dbo.Maliyet.KMEId, dbo.KaynakMaliyetEtken.KMEAd, dbo.Maliyet.Onay, 
                         dbo.Maliyet.Adet, dbo.Gider.GiderId AS Expr2, dbo.Gider.HesapKodu, dbo.Gider.HesapAd, dbo.Gider.Tutar, dbo.Gider.Tutar * dbo.Oran.Oran AS Geneltutar
FROM            dbo.Oran INNER JOIN
                         dbo.Maliyet ON dbo.Oran.MaliyetId = dbo.Maliyet.MaliyetId INNER JOIN
                         dbo.Gider ON dbo.Maliyet.GiderId = dbo.Gider.GiderId INNER JOIN
                         dbo.Faaliyet ON dbo.Maliyet.FaaliyetId = dbo.Faaliyet.FaaliyetId INNER JOIN
                         dbo.KaynakMaliyetEtken ON dbo.Maliyet.KMEId = dbo.KaynakMaliyetEtken.KMEId
GO
/****** Object:  View [dbo].[ToplamFaaliyetTutar]    Script Date: 9.06.2022 17:46:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ToplamFaaliyetTutar]
AS
SELECT        g.FaaliyetId, t.toplam, g.FaaliyetAd
FROM            dbo.Faaliyet AS g INNER JOIN
                             (SELECT        SUM(Geneltutar) AS toplam, FaaliyetId
                               FROM            dbo.GenelTutar
                               GROUP BY FaaliyetId) AS t ON g.FaaliyetId = t.FaaliyetId
GO
/****** Object:  View [dbo].[OranUrunDagitim]    Script Date: 9.06.2022 17:46:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[OranUrunDagitim]
AS
SELECT        mu.MaliyetUrunId, mu.UrunDagitimAdet / t.total AS oran, mu.DagitimOlcuId, mu.UrunId, dbo.Urun.UrunAd
FROM            dbo.MaliyetUrun AS mu INNER JOIN
                             (SELECT        SUM(UrunDagitimAdet) AS total, DagitimOlcuId
                               FROM            dbo.MaliyetUrun
                               GROUP BY DagitimOlcuId) AS t ON mu.DagitimOlcuId = t.DagitimOlcuId INNER JOIN
                         dbo.Urun ON mu.UrunId = dbo.Urun.UrunId
GO
/****** Object:  View [dbo].[UrunFaaliyetTutar]    Script Date: 9.06.2022 17:46:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UrunFaaliyetTutar]
AS
SELECT        dbo.OranUrunDagitim.UrunAd, dbo.ToplamFaaliyetTutar.FaaliyetAd,dbo.ToplamFaaliyetTutar.FaaliyetId, dbo.ToplamFaaliyetTutar.toplam * dbo.OranUrunDagitim.oran AS tutar, ROW_NUMBER() OVER (ORDER BY dbo.OranUrunDagitim.UrunAd) AS Number
FROM            dbo.DagitimOlcuFaaliyetiliski INNER JOIN
                         dbo.ToplamFaaliyetTutar ON dbo.DagitimOlcuFaaliyetiliski.FaaliyetId = dbo.ToplamFaaliyetTutar.FaaliyetId INNER JOIN
                         dbo.OranUrunDagitim ON dbo.DagitimOlcuFaaliyetiliski.DagitimOlcuId = dbo.OranUrunDagitim.DagitimOlcuId
GO
/****** Object:  View [dbo].[EndirektUretimMaliyeti]    Script Date: 9.06.2022 17:46:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[EndirektUretimMaliyeti]
AS
SELECT        dbo.Urun.UrunId, SUM(dbo.UrunFaaliyetTutar.tutar) AS Toplam
FROM            dbo.UrunFaaliyetTutar INNER JOIN
                         dbo.Urun ON dbo.UrunFaaliyetTutar.UrunAd = dbo.Urun.UrunAd
GROUP BY dbo.Urun.UrunId
GO
/****** Object:  View [dbo].[ToplamMaliyet]    Script Date: 9.06.2022 17:46:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ToplamMaliyet]
AS
SELECT        dbo.Urun.UrunId, dbo.Urun.UrunAd, dbo.MaliyetEndirektUretim.Toplam AS EndirektToplam, dbo.BirimMaliyet.Dimmg, dbo.BirimMaliyet.Dig, 
                         dbo.MaliyetEndirektUretim.Toplam + dbo.BirimMaliyet.Dimmg + dbo.BirimMaliyet.Dig AS ToplamMaliyet, dbo.BirimMaliyet.BirimDagitimOlcu, dbo.BirimMaliyet.Urun_ID
FROM            dbo.BirimMaliyet INNER JOIN
                         dbo.MaliyetEndirektUretim ON dbo.MaliyetEndirektUretim.Urun_Id = dbo.BirimMaliyet.Urun_ID INNER JOIN
                         dbo.Urun ON dbo.Urun.UrunId = dbo.BirimMaliyet.Urun_ID
GO
/****** Object:  View [dbo].[BirimMaliyetTutar]    Script Date: 9.06.2022 17:46:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BirimMaliyetTutar]
AS
SELECT        dbo.ToplamMaliyet.UrunId, dbo.ToplamMaliyet.UrunAd, dbo.ToplamMaliyet.EndirektToplam, dbo.ToplamMaliyet.Dimmg, dbo.ToplamMaliyet.Dig, dbo.ToplamMaliyet.ToplamMaliyet, dbo.ToplamMaliyet.BirimDagitimOlcu, 
                         dbo.MaliyetUrun.MaliyetUrunId, dbo.MaliyetUrun.UrunId AS Expr1, dbo.MaliyetUrun.DagitimOlcuId, dbo.MaliyetUrun.UrunDagitimAdet, 
                         dbo.ToplamMaliyet.ToplamMaliyet / dbo.MaliyetUrun.UrunDagitimAdet AS BirimMaliyet
FROM            dbo.ToplamMaliyet INNER JOIN
                         dbo.MaliyetUrun ON dbo.ToplamMaliyet.UrunId = dbo.MaliyetUrun.UrunId AND dbo.ToplamMaliyet.BirimDagitimOlcu = dbo.MaliyetUrun.DagitimOlcuId
GO
SET IDENTITY_INSERT [dbo].[BirimMaliyet] ON 

INSERT [dbo].[BirimMaliyet] ([BM_Id], [Urun_ID], [Dimmg], [Dig], [BirimDagitimOlcu]) VALUES (4, 2, CAST(24024517.04 AS Decimal(18, 2)), CAST(277183.76 AS Decimal(18, 2)), 5)
INSERT [dbo].[BirimMaliyet] ([BM_Id], [Urun_ID], [Dimmg], [Dig], [BirimDagitimOlcu]) VALUES (5, 3, CAST(63035364.61 AS Decimal(18, 2)), CAST(435389.62 AS Decimal(18, 2)), 5)
INSERT [dbo].[BirimMaliyet] ([BM_Id], [Urun_ID], [Dimmg], [Dig], [BirimDagitimOlcu]) VALUES (6, 4, CAST(9640346.34 AS Decimal(18, 2)), CAST(137029.80 AS Decimal(18, 2)), 5)
INSERT [dbo].[BirimMaliyet] ([BM_Id], [Urun_ID], [Dimmg], [Dig], [BirimDagitimOlcu]) VALUES (7, 5, CAST(15354991.31 AS Decimal(18, 2)), CAST(15354991.31 AS Decimal(18, 2)), 5)
INSERT [dbo].[BirimMaliyet] ([BM_Id], [Urun_ID], [Dimmg], [Dig], [BirimDagitimOlcu]) VALUES (8, 6, CAST(7069995.76 AS Decimal(18, 2)), CAST(38544.49 AS Decimal(18, 2)), 5)
INSERT [dbo].[BirimMaliyet] ([BM_Id], [Urun_ID], [Dimmg], [Dig], [BirimDagitimOlcu]) VALUES (9, 7, CAST(357979.16 AS Decimal(18, 2)), CAST(3158.03 AS Decimal(18, 2)), 5)
SET IDENTITY_INSERT [dbo].[BirimMaliyet] OFF
SET IDENTITY_INSERT [dbo].[DagıtımOlcu] ON 

INSERT [dbo].[DagıtımOlcu] ([DagıtımOlcu_Id], [DagıtımOlcu_Ad]) VALUES (2, N'Sipariş sayısı')
INSERT [dbo].[DagıtımOlcu] ([DagıtımOlcu_Id], [DagıtımOlcu_Ad]) VALUES (3, N'İlk Madde Palet sayısı')
INSERT [dbo].[DagıtımOlcu] ([DagıtımOlcu_Id], [DagıtımOlcu_Ad]) VALUES (4, N' Desen Sayısı')
INSERT [dbo].[DagıtımOlcu] ([DagıtımOlcu_Id], [DagıtımOlcu_Ad]) VALUES (5, N'Metrekare')
INSERT [dbo].[DagıtımOlcu] ([DagıtımOlcu_Id], [DagıtımOlcu_Ad]) VALUES (6, N'Ambalajlama sayısı')
INSERT [dbo].[DagıtımOlcu] ([DagıtımOlcu_Id], [DagıtımOlcu_Ad]) VALUES (7, N'Sevkiyat sayısı')
INSERT [dbo].[DagıtımOlcu] ([DagıtımOlcu_Id], [DagıtımOlcu_Ad]) VALUES (8, N'Mamül Palet')
SET IDENTITY_INSERT [dbo].[DagıtımOlcu] OFF
SET IDENTITY_INSERT [dbo].[DagitimOlcuFaaliyetiliski] ON 

INSERT [dbo].[DagitimOlcuFaaliyetiliski] ([Df_Id], [DagitimOlcuId], [FaaliyetId]) VALUES (2, 2, 3)
INSERT [dbo].[DagitimOlcuFaaliyetiliski] ([Df_Id], [DagitimOlcuId], [FaaliyetId]) VALUES (3, 3, 4)
INSERT [dbo].[DagitimOlcuFaaliyetiliski] ([Df_Id], [DagitimOlcuId], [FaaliyetId]) VALUES (4, 4, 5)
INSERT [dbo].[DagitimOlcuFaaliyetiliski] ([Df_Id], [DagitimOlcuId], [FaaliyetId]) VALUES (5, 5, 6)
INSERT [dbo].[DagitimOlcuFaaliyetiliski] ([Df_Id], [DagitimOlcuId], [FaaliyetId]) VALUES (6, 5, 7)
INSERT [dbo].[DagitimOlcuFaaliyetiliski] ([Df_Id], [DagitimOlcuId], [FaaliyetId]) VALUES (7, 5, 8)
INSERT [dbo].[DagitimOlcuFaaliyetiliski] ([Df_Id], [DagitimOlcuId], [FaaliyetId]) VALUES (8, 5, 9)
INSERT [dbo].[DagitimOlcuFaaliyetiliski] ([Df_Id], [DagitimOlcuId], [FaaliyetId]) VALUES (9, 6, 10)
INSERT [dbo].[DagitimOlcuFaaliyetiliski] ([Df_Id], [DagitimOlcuId], [FaaliyetId]) VALUES (10, 8, 11)
INSERT [dbo].[DagitimOlcuFaaliyetiliski] ([Df_Id], [DagitimOlcuId], [FaaliyetId]) VALUES (11, 7, 12)
SET IDENTITY_INSERT [dbo].[DagitimOlcuFaaliyetiliski] OFF
SET IDENTITY_INSERT [dbo].[Faaliyet] ON 

INSERT [dbo].[Faaliyet] ([FaaliyetId], [FaaliyetAd]) VALUES (3, N'Sipariş')
INSERT [dbo].[Faaliyet] ([FaaliyetId], [FaaliyetAd]) VALUES (4, N'İlk Madde Depolama')
INSERT [dbo].[Faaliyet] ([FaaliyetId], [FaaliyetAd]) VALUES (5, N'Desen Çizim')
INSERT [dbo].[Faaliyet] ([FaaliyetId], [FaaliyetAd]) VALUES (6, N'Dokuma')
INSERT [dbo].[Faaliyet] ([FaaliyetId], [FaaliyetAd]) VALUES (7, N'Kalite Kontrol')
INSERT [dbo].[Faaliyet] ([FaaliyetId], [FaaliyetAd]) VALUES (8, N'Apreleme')
INSERT [dbo].[Faaliyet] ([FaaliyetId], [FaaliyetAd]) VALUES (9, N'Kesim ve Overlok')
INSERT [dbo].[Faaliyet] ([FaaliyetId], [FaaliyetAd]) VALUES (10, N'Ambalajlama')
INSERT [dbo].[Faaliyet] ([FaaliyetId], [FaaliyetAd]) VALUES (11, N'Depolama')
INSERT [dbo].[Faaliyet] ([FaaliyetId], [FaaliyetAd]) VALUES (12, N'Sevkiyat')
SET IDENTITY_INSERT [dbo].[Faaliyet] OFF
SET IDENTITY_INSERT [dbo].[Gider] ON 

INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (2, N'710.00.001', N'Polipropilen iplik', CAST(63838185.23 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (3, N'710.00.002', N'Jüt iplik', CAST(16355231.90 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (4, N'710.00.003', N'Polyester', CAST(7487028.04 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (5, N'710.00.004', N'Çözgülük İplik', CAST(9779566.67 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (6, N'710.00.005', N'Tutkal', CAST(18651843.49 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (7, N'710.00.006', N'Akrilik', CAST(63286.44 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (8, N'720.00.001', N'İşçi Ücret Giderleri', CAST(783850.45 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (9, N'720.00.002', N'SGK Primi İşveren Payı', CAST(145266.22 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (10, N'720.00.003', N'İşsizlik Primi İşveren Payı', CAST(14526.62 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (11, N'720.00.004', N'Kıdem Ve İhbar Tazminatı Giderleri', CAST(32291.61 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (12, N'730.00.001', N'İşçi Ücret Giderleri(730)', CAST(1903449.60 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (13, N'730.00.002', N'SGK Primi İşveren Payı(730)', CAST(380689.92 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (14, N'730.00.003', N'İşsizlik Primi İşveren Payı(730)', CAST(38068.99 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (15, N'730.00.004', N'Kıdem Ve İhbar Tazminatı Giderleri(730)', CAST(82552.21 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (16, N'730.01.001', N'Bina Amortisman Giderleri', CAST(206786.86 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (17, N'730.01.003', N'Apre Bölümü Amortisman Giderleri', CAST(302633.18 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (18, N'730.01.004', N'Dokuma Tezgâhı Amortisman Giderleri', CAST(7225010.63 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (19, N'730.01.005', N'İş Makineleri Amortisman Giderleri', CAST(94852.80 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (20, N'730.01.006', N'İplik Nakliye ve Sigorta Giderleri', CAST(641280.76 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (21, N'730.01.007', N'Finansal Kiralama Giderleri', CAST(414514.93 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (22, N'730.01.008', N'Halı Makina Yedek Parça Bakım ve Onarım Giderleri', CAST(1014061.58 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (23, N'730.01.009', N'Ambalajlama Giderleri', CAST(891170.90 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (24, N'730.01.010', N'Dokuma Tezgâhı Sigorta Giderleri', CAST(62121.39 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (25, N'730.01.011', N'Apre Makina Yedek Parça Bakım ve Onarım Giderleri', CAST(13875.23 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (26, N'730.01.012', N'Muhtelif Giderler', CAST(1091055.89 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (27, N'730.01.013', N'Ulaşım Giderleri', CAST(868372.43 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (28, N'730.01.014', N'Yemek Giderleri', CAST(279850.00 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (29, N'730.01.015', N'Su Gideri', CAST(75084.47 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (30, N'730.01.016', N'Doğalgaz Gideri', CAST(965971.23 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (31, N'730.01.017', N'Elektrik Gideri', CAST(5742791.67 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (32, N'730.01.018', N'İşçi Servis Giderleri', CAST(25107.60 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (33, N'730.01.019', N'İthalat Giderleri', CAST(2666771.70 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (34, N'730.01.020', N'Sigorta Giderleri', CAST(132360.25 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Gider] OFF
SET IDENTITY_INSERT [dbo].[KaynakMaliyetEtken] ON 

INSERT [dbo].[KaynakMaliyetEtken] ([KMEId], [KMEAd]) VALUES (2, N'Personel Sayısı')
INSERT [dbo].[KaynakMaliyetEtken] ([KMEId], [KMEAd]) VALUES (3, N'Kullanılan Alan')
INSERT [dbo].[KaynakMaliyetEtken] ([KMEId], [KMEAd]) VALUES (4, N'Direkt')
INSERT [dbo].[KaynakMaliyetEtken] ([KMEId], [KMEAd]) VALUES (5, N'Belirlenen Oranlar')
INSERT [dbo].[KaynakMaliyetEtken] ([KMEId], [KMEAd]) VALUES (6, N'İş makinesi sayısı')
INSERT [dbo].[KaynakMaliyetEtken] ([KMEId], [KMEAd]) VALUES (7, N'Belirlenen Tutar')
SET IDENTITY_INSERT [dbo].[KaynakMaliyetEtken] OFF
SET IDENTITY_INSERT [dbo].[Maliyet] ON 

INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (4, 12, 3, 2, 1, 2)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (5, 13, 3, 2, 1, 2)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (6, 14, 3, 2, 1, 2)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (7, 15, 3, 2, 1, 2)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (8, 12, 4, 2, 1, 4)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (9, 13, 4, 2, 1, 4)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (10, 14, 4, 2, 1, 4)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (11, 15, 4, 2, 1, 4)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (12, 12, 5, 2, 1, 5)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (13, 13, 5, 2, 1, 5)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (14, 14, 5, 2, 1, 5)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (15, 15, 5, 2, 1, 5)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (16, 12, 6, 2, 1, 6)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (17, 13, 6, 2, 1, 6)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (18, 14, 6, 2, 1, 6)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (19, 15, 6, 2, 1, 6)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (20, 12, 7, 2, 1, 8)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (21, 13, 7, 2, 1, 8)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (22, 14, 7, 2, 1, 8)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (23, 15, 7, 2, 1, 8)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (24, 12, 8, 2, 1, 7)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (25, 13, 8, 2, 1, 7)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (26, 14, 8, 2, 1, 7)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (27, 15, 8, 2, 1, 7)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (28, 12, 9, 2, 1, 12)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (29, 13, 9, 2, 1, 12)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (30, 14, 9, 2, 1, 12)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (31, 15, 9, 2, 1, 12)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (32, 12, 10, 2, 1, 8)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (33, 13, 10, 2, 1, 8)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (34, 14, 10, 2, 1, 8)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (35, 15, 10, 2, 1, 8)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (36, 12, 11, 2, 1, 4)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (37, 13, 11, 2, 1, 4)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (38, 14, 11, 2, 1, 4)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (39, 15, 11, 2, 1, 4)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (40, 12, 12, 2, 1, 6)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (41, 13, 12, 2, 1, 6)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (42, 14, 12, 2, 1, 6)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (43, 15, 12, 2, 1, 6)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (44, 16, 3, 3, 1, 50)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (45, 16, 4, 3, 1, 4800)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (46, 16, 5, 3, 1, 150)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (47, 16, 6, 3, 1, 1200)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (48, 16, 7, 3, 1, 250)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (49, 16, 8, 3, 1, 750)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (50, 16, 9, 3, 1, 1000)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (51, 16, 10, 3, 1, 300)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (52, 16, 11, 3, 1, 6000)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (53, 16, 12, 3, 1, 500)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (57, 17, 8, 4, 1, 1)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (58, 18, 6, 4, 1, 1)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (59, 26, 6, 5, 1, 80)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (60, 26, 3, 5, 1, 4)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (61, 26, 4, 5, 1, 2)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (62, 26, 5, 5, 1, 2)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (63, 26, 7, 5, 1, 2)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (64, 26, 8, 5, 1, 2)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (65, 26, 9, 5, 1, 2)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (66, 26, 10, 5, 1, 2)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (67, 26, 11, 5, 1, 2)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (68, 26, 12, 5, 1, 2)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (69, 19, 4, 6, 1, 3)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (70, 19, 11, 6, 1, 2)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (71, 19, 12, 6, 1, 4)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (72, 20, 4, 4, 1, 1)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (73, 21, 6, 7, 1, 1)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (74, 22, 6, 7, 1, 1)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (75, 23, 10, 4, 1, 1)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (76, 24, 6, 4, 1, 1)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (77, 25, 8, 4, 1, 1)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (78, 27, 3, 2, 1, 2)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (79, 27, 4, 2, 1, 4)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (80, 27, 5, 2, 1, 5)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (81, 27, 6, 2, 1, 18)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (82, 27, 7, 2, 1, 8)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (83, 27, 8, 2, 1, 7)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (84, 27, 9, 2, 1, 12)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (85, 27, 10, 2, 1, 8)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (86, 27, 11, 2, 1, 4)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (87, 27, 12, 2, 1, 6)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (88, 28, 3, 2, 1, 2)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (89, 28, 4, 2, 1, 4)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (90, 28, 5, 2, 1, 5)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (91, 28, 6, 2, 1, 18)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (92, 28, 7, 2, 1, 8)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (93, 28, 8, 2, 1, 7)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (94, 28, 9, 2, 1, 12)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (95, 28, 10, 2, 1, 8)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (96, 28, 11, 2, 1, 4)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (97, 28, 12, 2, 1, 6)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (98, 29, 3, 3, 1, 50)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (99, 29, 4, 3, 1, 4800)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (100, 29, 5, 3, 1, 150)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (101, 29, 6, 3, 1, 1200)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (102, 29, 7, 3, 1, 250)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (103, 29, 8, 3, 1, 750)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (104, 29, 9, 3, 1, 1000)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (105, 29, 10, 3, 1, 300)
GO
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (106, 29, 11, 3, 1, 6000)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (107, 29, 12, 3, 1, 500)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (108, 30, 3, 3, 1, 50)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (109, 30, 4, 3, 1, 4800)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (110, 30, 5, 3, 1, 150)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (111, 30, 6, 3, 1, 1200)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (112, 30, 7, 3, 1, 250)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (113, 30, 8, 3, 1, 750)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (114, 30, 9, 3, 1, 1000)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (115, 30, 10, 3, 1, 300)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (116, 30, 11, 3, 1, 6000)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (117, 30, 12, 3, 1, 500)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (118, 32, 3, 2, 1, 2)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (119, 32, 4, 2, 1, 4)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (120, 32, 5, 2, 1, 5)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (121, 32, 6, 2, 1, 18)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (122, 32, 7, 2, 1, 8)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (123, 32, 8, 2, 1, 7)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (124, 32, 9, 2, 1, 12)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (125, 32, 10, 2, 1, 8)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (126, 32, 11, 2, 1, 4)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (127, 32, 12, 2, 1, 6)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (128, 34, 11, 4, 1, 1)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (129, 31, 3, 5, 1, 10)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (130, 31, 4, 5, 1, 340)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (131, 31, 5, 5, 1, 50)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (132, 31, 6, 5, 1, 8500)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (133, 31, 7, 5, 1, 100)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (134, 31, 8, 5, 1, 400)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (135, 31, 9, 5, 1, 200)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (136, 31, 10, 5, 1, 200)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (137, 31, 11, 5, 1, 100)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (138, 31, 12, 5, 1, 100)
SET IDENTITY_INSERT [dbo].[Maliyet] OFF
SET IDENTITY_INSERT [dbo].[MaliyetEndirektUretim] ON 

INSERT [dbo].[MaliyetEndirektUretim] ([EUM_Id], [Urun_Id], [Toplam]) VALUES (1, 3, CAST(10569348.25 AS Decimal(18, 2)))
INSERT [dbo].[MaliyetEndirektUretim] ([EUM_Id], [Urun_Id], [Toplam]) VALUES (2, 6, CAST(996817.75 AS Decimal(18, 2)))
INSERT [dbo].[MaliyetEndirektUretim] ([EUM_Id], [Urun_Id], [Toplam]) VALUES (3, 7, CAST(147192.44 AS Decimal(18, 2)))
INSERT [dbo].[MaliyetEndirektUretim] ([EUM_Id], [Urun_Id], [Toplam]) VALUES (4, 4, CAST(2024302.25 AS Decimal(18, 2)))
INSERT [dbo].[MaliyetEndirektUretim] ([EUM_Id], [Urun_Id], [Toplam]) VALUES (5, 5, CAST(2209975.87 AS Decimal(18, 2)))
INSERT [dbo].[MaliyetEndirektUretim] ([EUM_Id], [Urun_Id], [Toplam]) VALUES (6, 2, CAST(6504025.96 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[MaliyetEndirektUretim] OFF
SET IDENTITY_INSERT [dbo].[MaliyetUrun] ON 

INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (2, 2, 2, CAST(570.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (3, 2, 4, CAST(180.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (4, 2, 5, CAST(793530.850 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (5, 2, 7, CAST(790.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (6, 2, 6, CAST(174690.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (7, 2, 8, CAST(476.100 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (8, 2, 3, CAST(545.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (9, 3, 2, CAST(745.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (10, 3, 4, CAST(220.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (11, 3, 5, CAST(1246447.830 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (12, 3, 7, CAST(862.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (13, 3, 6, CAST(274397.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (14, 3, 8, CAST(1059.500 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (15, 3, 3, CAST(1396.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (16, 4, 2, CAST(324.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (17, 4, 4, CAST(80.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (18, 4, 5, CAST(230908.390 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (19, 4, 7, CAST(506.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (20, 4, 6, CAST(50833.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (21, 4, 8, CAST(200.100 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (22, 4, 3, CAST(219.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (23, 5, 2, CAST(160.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (24, 5, 4, CAST(210.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (25, 5, 5, CAST(242279.290 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (26, 5, 7, CAST(365.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (27, 5, 6, CAST(53336.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (28, 5, 8, CAST(286.700 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (29, 5, 3, CAST(307.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (30, 6, 2, CAST(130.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (31, 6, 4, CAST(75.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (32, 6, 5, CAST(110346.440 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (33, 6, 7, CAST(264.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (34, 6, 6, CAST(24292.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (35, 6, 8, CAST(108.500 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (36, 6, 3, CAST(118.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (37, 7, 2, CAST(90.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (38, 7, 4, CAST(100.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (39, 7, 5, CAST(9040.920 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (40, 7, 7, CAST(176.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (41, 7, 6, CAST(1190.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (42, 7, 8, CAST(7.800 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (43, 7, 3, CAST(9.000 AS Decimal(18, 3)))
SET IDENTITY_INSERT [dbo].[MaliyetUrun] OFF
SET IDENTITY_INSERT [dbo].[TblBirimMaliyetTutar] ON 

INSERT [dbo].[TblBirimMaliyetTutar] ([BMT_ID], [Urunler], [EndirekUM], [Dimmg], [Dig], [ToplamMaliyet], [BirimMaliyet]) VALUES (1, N'HEAT SET ', CAST(10569348.25 AS Decimal(18, 2)), CAST(63035364.61 AS Decimal(18, 2)), CAST(435389.62 AS Decimal(18, 2)), CAST(74040102.48 AS Decimal(18, 2)), CAST(59.40 AS Decimal(18, 2)))
INSERT [dbo].[TblBirimMaliyetTutar] ([BMT_ID], [Urunler], [EndirekUM], [Dimmg], [Dig], [ToplamMaliyet], [BirimMaliyet]) VALUES (2, N'FİRUZE', CAST(996817.75 AS Decimal(18, 2)), CAST(7069995.76 AS Decimal(18, 2)), CAST(38544.49 AS Decimal(18, 2)), CAST(8105358.00 AS Decimal(18, 2)), CAST(73.45 AS Decimal(18, 2)))
INSERT [dbo].[TblBirimMaliyetTutar] ([BMT_ID], [Urunler], [EndirekUM], [Dimmg], [Dig], [ToplamMaliyet], [BirimMaliyet]) VALUES (3, N'PP MAKİNE HALISI', CAST(147192.44 AS Decimal(18, 2)), CAST(357979.16 AS Decimal(18, 2)), CAST(3158.03 AS Decimal(18, 2)), CAST(508329.63 AS Decimal(18, 2)), CAST(56.23 AS Decimal(18, 2)))
INSERT [dbo].[TblBirimMaliyetTutar] ([BMT_ID], [Urunler], [EndirekUM], [Dimmg], [Dig], [ToplamMaliyet], [BirimMaliyet]) VALUES (4, N'OYMALI', CAST(2024302.25 AS Decimal(18, 2)), CAST(9640346.34 AS Decimal(18, 2)), CAST(137029.80 AS Decimal(18, 2)), CAST(11801678.39 AS Decimal(18, 2)), CAST(51.11 AS Decimal(18, 2)))
INSERT [dbo].[TblBirimMaliyetTutar] ([BMT_ID], [Urunler], [EndirekUM], [Dimmg], [Dig], [ToplamMaliyet], [BirimMaliyet]) VALUES (5, N'SHAGGY', CAST(2209975.87 AS Decimal(18, 2)), CAST(15354991.31 AS Decimal(18, 2)), CAST(15354991.31 AS Decimal(18, 2)), CAST(32919958.49 AS Decimal(18, 2)), CAST(135.88 AS Decimal(18, 2)))
INSERT [dbo].[TblBirimMaliyetTutar] ([BMT_ID], [Urunler], [EndirekUM], [Dimmg], [Dig], [ToplamMaliyet], [BirimMaliyet]) VALUES (6, N'BCF', CAST(6504025.96 AS Decimal(18, 2)), CAST(24024517.04 AS Decimal(18, 2)), CAST(277183.76 AS Decimal(18, 2)), CAST(30805726.76 AS Decimal(18, 2)), CAST(38.82 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[TblBirimMaliyetTutar] OFF
SET IDENTITY_INSERT [dbo].[TblToplamMaliyet] ON 

INSERT [dbo].[TblToplamMaliyet] ([TMaliyet_ID], [UrunAdi], [EndirektToplami], [Dimmg], [Dig], [ToplamMaliyeti]) VALUES (1, N'BCF', CAST(6504025.96 AS Decimal(18, 2)), CAST(24024517.04 AS Decimal(18, 2)), CAST(277183.76 AS Decimal(18, 2)), CAST(30805726.76 AS Decimal(18, 2)))
INSERT [dbo].[TblToplamMaliyet] ([TMaliyet_ID], [UrunAdi], [EndirektToplami], [Dimmg], [Dig], [ToplamMaliyeti]) VALUES (2, N'HEAT SET ', CAST(10569348.25 AS Decimal(18, 2)), CAST(63035364.61 AS Decimal(18, 2)), CAST(435389.62 AS Decimal(18, 2)), CAST(74040102.48 AS Decimal(18, 2)))
INSERT [dbo].[TblToplamMaliyet] ([TMaliyet_ID], [UrunAdi], [EndirektToplami], [Dimmg], [Dig], [ToplamMaliyeti]) VALUES (3, N'OYMALI', CAST(2024302.25 AS Decimal(18, 2)), CAST(9640346.34 AS Decimal(18, 2)), CAST(137029.80 AS Decimal(18, 2)), CAST(11801678.39 AS Decimal(18, 2)))
INSERT [dbo].[TblToplamMaliyet] ([TMaliyet_ID], [UrunAdi], [EndirektToplami], [Dimmg], [Dig], [ToplamMaliyeti]) VALUES (4, N'SHAGGY', CAST(2209975.87 AS Decimal(18, 2)), CAST(15354991.31 AS Decimal(18, 2)), CAST(15354991.31 AS Decimal(18, 2)), CAST(32919958.49 AS Decimal(18, 2)))
INSERT [dbo].[TblToplamMaliyet] ([TMaliyet_ID], [UrunAdi], [EndirektToplami], [Dimmg], [Dig], [ToplamMaliyeti]) VALUES (5, N'FİRUZE', CAST(996817.75 AS Decimal(18, 2)), CAST(7069995.76 AS Decimal(18, 2)), CAST(38544.49 AS Decimal(18, 2)), CAST(8105358.00 AS Decimal(18, 2)))
INSERT [dbo].[TblToplamMaliyet] ([TMaliyet_ID], [UrunAdi], [EndirektToplami], [Dimmg], [Dig], [ToplamMaliyeti]) VALUES (6, N'PP MAKİNE HALISI', CAST(147192.44 AS Decimal(18, 2)), CAST(357979.16 AS Decimal(18, 2)), CAST(3158.03 AS Decimal(18, 2)), CAST(508329.63 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[TblToplamMaliyet] OFF
SET IDENTITY_INSERT [dbo].[TutarUrunFaaliyet] ON 

INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (1, N'BCF', N'Sipariş', CAST(45969.56873 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (2, N'BCF', N'Desen Çizim', CAST(69965.86973 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (3, N'BCF', N'Dokuma', CAST(4547939.79242 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (4, N'BCF', N'Kalite Kontrol', CAST(161923.59297 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (5, N'BCF', N'Apreleme', CAST(305327.33202 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (6, N'BCF', N'Kesim ve Overlok', CAST(263924.25560 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (7, N'BCF', N'Sevkiyat', CAST(130872.37401 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (8, N'BCF', N'Ambalajlama', CAST(449733.94669 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (9, N'BCF', N'Depolama', CAST(211568.93962 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (10, N'BCF', N'İlk Madde Depolama', CAST(316800.28751 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (11, N'HEAT SET ', N'Sipariş', CAST(60083.03282 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (12, N'HEAT SET ', N'Desen Çizim', CAST(85513.84078 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (13, N'HEAT SET ', N'Dokuma', CAST(7143729.42808 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (14, N'HEAT SET ', N'Kalite Kontrol', CAST(254343.37063 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (15, N'HEAT SET ', N'Apreleme', CAST(479596.46489 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (16, N'HEAT SET ', N'Kesim ve Overlok', CAST(414562.10012 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (17, N'HEAT SET ', N'Sevkiyat', CAST(142799.98278 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (18, N'HEAT SET ', N'Ambalajlama', CAST(706426.50278 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (19, N'HEAT SET ', N'Depolama', CAST(470819.76796 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (20, N'HEAT SET ', N'İlk Madde Depolama', CAST(811473.76396 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (21, N'OYMALI', N'Sipariş', CAST(26130.07065 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (22, N'OYMALI', N'Desen Çizim', CAST(31095.94210 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (23, N'OYMALI', N'Dokuma', CAST(1323398.39754 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (24, N'OYMALI', N'Kalite Kontrol', CAST(47117.91124 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (25, N'OYMALI', N'Apreleme', CAST(88846.75707 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (26, N'OYMALI', N'Kesim ve Overlok', CAST(76798.93598 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (27, N'OYMALI', N'Sevkiyat', CAST(83824.58386 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (28, N'OYMALI', N'Ambalajlama', CAST(130867.97019 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (29, N'OYMALI', N'Depolama', CAST(88920.27897 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (30, N'OYMALI', N'İlk Madde Depolama', CAST(127301.39993 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (31, N'SHAGGY', N'Sipariş', CAST(12903.73859 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (32, N'SHAGGY', N'Desen Çizim', CAST(81626.84801 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (33, N'SHAGGY', N'Dokuma', CAST(1388568.09899 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (34, N'SHAGGY', N'Kalite Kontrol', CAST(49438.19530 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (35, N'SHAGGY', N'Apreleme', CAST(93221.94496 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (36, N'SHAGGY', N'Kesim ve Overlok', CAST(80580.83849 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (37, N'SHAGGY', N'Sevkiyat', CAST(60466.35002 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (38, N'SHAGGY', N'Ambalajlama', CAST(137311.86548 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (39, N'SHAGGY', N'Depolama', CAST(127403.51815 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (40, N'SHAGGY', N'İlk Madde Depolama', CAST(178454.47388 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (41, N'FİRUZE', N'Sipariş', CAST(10484.28761 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (42, N'FİRUZE', N'Desen Çizim', CAST(29152.44572 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (43, N'FİRUZE', N'Dokuma', CAST(632425.27424 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (44, N'FİRUZE', N'Kalite Kontrol', CAST(22516.69489 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (45, N'FİRUZE', N'Apreleme', CAST(42458.06464 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (46, N'FİRUZE', N'Kesim ve Overlok', CAST(36700.65510 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (47, N'FİRUZE', N'Sevkiyat', CAST(43734.56549 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (48, N'FİRUZE', N'Ambalajlama', CAST(62538.99498 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (49, N'FİRUZE', N'Depolama', CAST(48215.14377 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (50, N'FİRUZE', N'İlk Madde Depolama', CAST(68591.62188 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (51, N'PP MAKİNE HALISI', N'Sipariş', CAST(7258.35296 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (52, N'PP MAKİNE HALISI', N'Desen Çizim', CAST(38869.92763 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (53, N'PP MAKİNE HALISI', N'Dokuma', CAST(51815.95628 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (54, N'PP MAKİNE HALISI', N'Kalite Kontrol', CAST(1844.84100 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (55, N'PP MAKİNE HALISI', N'Apreleme', CAST(3478.68011 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (56, N'PP MAKİNE HALISI', N'Kesim ve Overlok', CAST(3006.96322 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (57, N'PP MAKİNE HALISI', N'Sevkiyat', CAST(29156.37699 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (58, N'PP MAKİNE HALISI', N'Ambalajlama', CAST(3063.61782 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (59, N'PP MAKİNE HALISI', N'Depolama', CAST(3466.15780 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (60, N'PP MAKİNE HALISI', N'İlk Madde Depolama', CAST(5231.56438 AS Decimal(18, 5)))
SET IDENTITY_INSERT [dbo].[TutarUrunFaaliyet] OFF
SET IDENTITY_INSERT [dbo].[Urun] ON 

INSERT [dbo].[Urun] ([UrunId], [UrunAd]) VALUES (2, N'BCF')
INSERT [dbo].[Urun] ([UrunId], [UrunAd]) VALUES (3, N'HEAT SET ')
INSERT [dbo].[Urun] ([UrunId], [UrunAd]) VALUES (4, N'OYMALI')
INSERT [dbo].[Urun] ([UrunId], [UrunAd]) VALUES (5, N'SHAGGY')
INSERT [dbo].[Urun] ([UrunId], [UrunAd]) VALUES (6, N'FİRUZE')
INSERT [dbo].[Urun] ([UrunId], [UrunAd]) VALUES (7, N'PP MAKİNE HALISI')
SET IDENTITY_INSERT [dbo].[Urun] OFF
ALTER TABLE [dbo].[BirimMaliyet]  WITH CHECK ADD  CONSTRAINT [FK_BirimMaliyet_DagıtımOlcu] FOREIGN KEY([BirimDagitimOlcu])
REFERENCES [dbo].[DagıtımOlcu] ([DagıtımOlcu_Id])
GO
ALTER TABLE [dbo].[BirimMaliyet] CHECK CONSTRAINT [FK_BirimMaliyet_DagıtımOlcu]
GO
ALTER TABLE [dbo].[BirimMaliyet]  WITH CHECK ADD  CONSTRAINT [FK_BirimMaliyet_Urun] FOREIGN KEY([Urun_ID])
REFERENCES [dbo].[Urun] ([UrunId])
GO
ALTER TABLE [dbo].[BirimMaliyet] CHECK CONSTRAINT [FK_BirimMaliyet_Urun]
GO
ALTER TABLE [dbo].[DagitimOlcuFaaliyetiliski]  WITH CHECK ADD  CONSTRAINT [FK_DagitimOlcuFaaliyetiliski_DagıtımOlcu] FOREIGN KEY([DagitimOlcuId])
REFERENCES [dbo].[DagıtımOlcu] ([DagıtımOlcu_Id])
GO
ALTER TABLE [dbo].[DagitimOlcuFaaliyetiliski] CHECK CONSTRAINT [FK_DagitimOlcuFaaliyetiliski_DagıtımOlcu]
GO
ALTER TABLE [dbo].[DagitimOlcuFaaliyetiliski]  WITH CHECK ADD  CONSTRAINT [FK_DagitimOlcuFaaliyetiliski_Faaliyet] FOREIGN KEY([FaaliyetId])
REFERENCES [dbo].[Faaliyet] ([FaaliyetId])
GO
ALTER TABLE [dbo].[DagitimOlcuFaaliyetiliski] CHECK CONSTRAINT [FK_DagitimOlcuFaaliyetiliski_Faaliyet]
GO
ALTER TABLE [dbo].[Maliyet]  WITH CHECK ADD  CONSTRAINT [FK_Maliyet_Faaliyet] FOREIGN KEY([FaaliyetId])
REFERENCES [dbo].[Faaliyet] ([FaaliyetId])
GO
ALTER TABLE [dbo].[Maliyet] CHECK CONSTRAINT [FK_Maliyet_Faaliyet]
GO
ALTER TABLE [dbo].[Maliyet]  WITH CHECK ADD  CONSTRAINT [FK_Maliyet_Gider] FOREIGN KEY([GiderId])
REFERENCES [dbo].[Gider] ([GiderId])
GO
ALTER TABLE [dbo].[Maliyet] CHECK CONSTRAINT [FK_Maliyet_Gider]
GO
ALTER TABLE [dbo].[Maliyet]  WITH CHECK ADD  CONSTRAINT [FK_Maliyet_KaynakMaliyetEtken] FOREIGN KEY([KMEId])
REFERENCES [dbo].[KaynakMaliyetEtken] ([KMEId])
GO
ALTER TABLE [dbo].[Maliyet] CHECK CONSTRAINT [FK_Maliyet_KaynakMaliyetEtken]
GO
ALTER TABLE [dbo].[MaliyetUrun]  WITH CHECK ADD  CONSTRAINT [FK_MaliyetUrun_DagıtımOlcu] FOREIGN KEY([DagitimOlcuId])
REFERENCES [dbo].[DagıtımOlcu] ([DagıtımOlcu_Id])
GO
ALTER TABLE [dbo].[MaliyetUrun] CHECK CONSTRAINT [FK_MaliyetUrun_DagıtımOlcu]
GO
ALTER TABLE [dbo].[MaliyetUrun]  WITH CHECK ADD  CONSTRAINT [FK_MaliyetUrun_Urun] FOREIGN KEY([UrunId])
REFERENCES [dbo].[Urun] ([UrunId])
GO
ALTER TABLE [dbo].[MaliyetUrun] CHECK CONSTRAINT [FK_MaliyetUrun_Urun]
GO
/****** Object:  StoredProcedure [dbo].[BirimMaliyetSP]    Script Date: 9.06.2022 17:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[BirimMaliyetSP]
as
SET FMTONLY OFF
TRUNCATE TABLE TblBirimMaliyetTutar
Insert into TblBirimMaliyetTutar(Urunler,EndirekUM,Dimmg,Dig,ToplamMaliyet,BirimMaliyet)
Select UrunAd,EndirektToplam,Dimmg,Dig,ToplamMaliyet,BirimMaliyet from BirimMaliyetTutar
select * from TblBirimMaliyetTutar
GO
/****** Object:  StoredProcedure [dbo].[Endirekt]    Script Date: 9.06.2022 17:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Endirekt]
As
SET FMTONLY OFF
TRUNCATE TABLE MaliyetEndirektUretim
Insert into MaliyetEndirektUretim(Urun_Id,Toplam)
select UrunId,Toplam from EndirektUretimMaliyeti

Select * from MaliyetEndirektUretim
GO
/****** Object:  StoredProcedure [dbo].[ProductPrice]    Script Date: 9.06.2022 17:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[ProductPrice]
As
SET FMTONLY OFF
TRUNCATE TABLE TutarUrunFaaliyet
Insert Into TutarUrunFaaliyet(Urun,Faaliyet,TutarTUF)
Select UrunAd,FaaliyetAd,tutar from UrunFaaliyetTutar
Select * from TutarUrunFaaliyet
GO
/****** Object:  StoredProcedure [dbo].[sp_ProductRefresh]    Script Date: 9.06.2022 17:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_ProductRefresh]
As
SET FMTONLY OFF
DELETE FROM TutarUrunFaaliyet
Insert Into TutarUrunFaaliyet(Urun,Faaliyet,TutarTUF)
Select UrunAd,FaaliyetAd,tutar from UrunFaaliyetTutar
Select * from TutarUrunFaaliyet
GO
/****** Object:  StoredProcedure [dbo].[SP_Tutar]    Script Date: 9.06.2022 17:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
Create PROCEDURE [dbo].[SP_Tutar]
AS
SET FMTONLY OFF
DECLARE @cols AS NVARCHAR(MAX)
   DECLARE @query  AS NVARCHAR(MAX)
BEGIN
SET @cols = STUFF((SELECT distinct ',' + QUOTENAME(c.[FaaliyetAd])
            FROM [Faaliyet] c
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)')
        ,1,1,'')

set @query= ' SELECT         *
FROM  (SELECT Expr2,dbo.Gider.HesapKodu+ '' ''+ dbo.Gider.HesapAd as hesapadı,
 dbo.KaynakMaliyetEtken.KMEAd, dbo.GenelTutar.geneltutar as onay,
 dbo.Faaliyet.FaaliyetAd
 FROM dbo.GenelTutar
 INNER JOIN dbo.KaynakMaliyetEtken ON dbo.KaynakMaliyetEtken.KMEId = dbo.GenelTutar.KMEId
 INNER JOIN dbo.Gider ON dbo.GenelTutar.GiderId = dbo.Gider.GiderId
 INNER JOIN dbo.Faaliyet ON dbo.Faaliyet.FaaliyetId = dbo.GenelTutar.FaaliyetId) maaliyet_faaliyet
 PIVOT (sum(onay) FOR FaaliyetAd IN
 (' + @cols + ')) pivotee '

execute(@query)

END
GO
/****** Object:  StoredProcedure [dbo].[SPBirimMaliyetTutar]    Script Date: 9.06.2022 17:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SPBirimMaliyetTutar]
as
SET FMTONLY OFF
TRUNCATE TABLE TblBirimMaliyetTutar
Insert into TblBirimMaliyetTutar(Urunler,EndirekUM,Dimmg,Dig,ToplamMaliyet,BirimMaliyet)
Select UrunAd,EndirektToplam,Dimmg,Dig,ToplamMaliyet,BirimMaliyet from BirimMaliyetTutar
select * from TblBirimMaliyetTutar
GO
/****** Object:  StoredProcedure [dbo].[SPToplamMaliyet]    Script Date: 9.06.2022 17:46:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SPToplamMaliyet]
as
SET FMTONLY OFF
TRUNCATE TABLE TblToplamMaliyet
insert into TblToplamMaliyet(UrunAdi,EndirektToplami,Dimmg,Dig,ToplamMaliyeti)
Select UrunAd,EndirektToplam,Dimmg,Dig,ToplamMaliyet from ToplamMaliyet

Select * from TblToplamMaliyet
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[10] 2[4] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "MaliyetUrun"
            Begin Extent = 
               Top = 6
               Left = 260
               Bottom = 136
               Right = 442
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ToplamMaliyet"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 222
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BirimMaliyetTutar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BirimMaliyetTutar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[2] 2[33] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "UrunFaaliyetTutar"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Urun"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 102
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'EndirektUretimMaliyeti'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'EndirektUretimMaliyeti'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[22] 4[7] 2[38] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Oran"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 102
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Maliyet"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Gider"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Faaliyet"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 102
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "KaynakMaliyetEtken"
            Begin Extent = 
               Top = 6
               Left = 870
               Bottom = 102
               Right = 1040
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 15
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Wid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GenelTutar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'th = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GenelTutar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GenelTutar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "m"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Maliyet_1"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 102
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Oran'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Oran'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[25] 4[10] 2[31] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "mu"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 6
               Left = 258
               Bottom = 102
               Right = 428
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Urun"
            Begin Extent = 
               Top = 6
               Left = 466
               Bottom = 102
               Right = 636
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OranUrunDagitim'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OranUrunDagitim'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "g"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 102
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ToplamFaaliyetTutar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ToplamFaaliyetTutar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BirimMaliyet"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "MaliyetEndirektUretim"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Urun"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 102
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ToplamMaliyet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ToplamMaliyet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[23] 4[4] 2[42] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UrunFaaliyetTutar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UrunFaaliyetTutar'
GO
USE [master]
GO
ALTER DATABASE [KuzeyMak] SET  READ_WRITE 
GO
