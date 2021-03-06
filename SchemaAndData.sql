USE [master]
GO
/****** Object:  Database [Bitirme]    Script Date: 24.05.2022 01:12:38 ******/
CREATE DATABASE [Bitirme]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bitirme', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Bitirme.mdf' , SIZE = 16384KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Bitirme_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Bitirme_log.ldf' , SIZE = 10240KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Bitirme] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bitirme].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bitirme] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bitirme] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bitirme] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bitirme] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bitirme] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bitirme] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bitirme] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bitirme] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bitirme] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bitirme] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bitirme] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bitirme] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bitirme] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bitirme] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bitirme] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bitirme] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bitirme] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bitirme] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bitirme] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bitirme] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bitirme] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bitirme] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bitirme] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Bitirme] SET  MULTI_USER 
GO
ALTER DATABASE [Bitirme] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bitirme] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bitirme] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bitirme] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Bitirme]
GO
/****** Object:  Table [dbo].[BirimMaliyet]    Script Date: 24.05.2022 01:12:38 ******/
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
/****** Object:  Table [dbo].[DagıtımOlcu]    Script Date: 24.05.2022 01:12:38 ******/
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
/****** Object:  Table [dbo].[DagitimOlcuFaaliyetiliski]    Script Date: 24.05.2022 01:12:38 ******/
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
/****** Object:  Table [dbo].[Faaliyet]    Script Date: 24.05.2022 01:12:38 ******/
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
/****** Object:  Table [dbo].[Gider]    Script Date: 24.05.2022 01:12:38 ******/
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
/****** Object:  Table [dbo].[KaynakMaliyetEtken]    Script Date: 24.05.2022 01:12:38 ******/
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
/****** Object:  Table [dbo].[Maliyet]    Script Date: 24.05.2022 01:12:38 ******/
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
/****** Object:  Table [dbo].[MaliyetEndirektUretim]    Script Date: 24.05.2022 01:12:38 ******/
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
/****** Object:  Table [dbo].[MaliyetUrun]    Script Date: 24.05.2022 01:12:38 ******/
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
/****** Object:  Table [dbo].[TblBirimMaliyetTutar]    Script Date: 24.05.2022 01:12:38 ******/
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
/****** Object:  Table [dbo].[TblToplamMaliyet]    Script Date: 24.05.2022 01:12:38 ******/
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
/****** Object:  Table [dbo].[TutarUrunFaaliyet]    Script Date: 24.05.2022 01:12:38 ******/
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
/****** Object:  Table [dbo].[Urun]    Script Date: 24.05.2022 01:12:38 ******/
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
/****** Object:  View [dbo].[OranUrunDagitim]    Script Date: 24.05.2022 01:12:38 ******/
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
/****** Object:  View [dbo].[Oran]    Script Date: 24.05.2022 01:12:38 ******/
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
/****** Object:  View [dbo].[GenelTutar]    Script Date: 24.05.2022 01:12:38 ******/
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
/****** Object:  View [dbo].[ToplamFaaliyetTutar]    Script Date: 24.05.2022 01:12:38 ******/
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
/****** Object:  View [dbo].[UrunFaaliyetTutar]    Script Date: 24.05.2022 01:12:38 ******/
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
/****** Object:  View [dbo].[EndirektUretimMaliyeti]    Script Date: 24.05.2022 01:12:38 ******/
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
/****** Object:  View [dbo].[ToplamMaliyet]    Script Date: 24.05.2022 01:12:38 ******/
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
/****** Object:  View [dbo].[BirimMaliyetTutar]    Script Date: 24.05.2022 01:12:38 ******/
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

INSERT [dbo].[BirimMaliyet] ([BM_Id], [Urun_ID], [Dimmg], [Dig], [BirimDagitimOlcu]) VALUES (1, 1, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[BirimMaliyet] ([BM_Id], [Urun_ID], [Dimmg], [Dig], [BirimDagitimOlcu]) VALUES (2, 2, CAST(34.00 AS Decimal(18, 2)), CAST(34.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[BirimMaliyet] ([BM_Id], [Urun_ID], [Dimmg], [Dig], [BirimDagitimOlcu]) VALUES (3, 6, CAST(43.00 AS Decimal(18, 2)), CAST(34.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[BirimMaliyet] ([BM_Id], [Urun_ID], [Dimmg], [Dig], [BirimDagitimOlcu]) VALUES (4, 3, CAST(78.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[BirimMaliyet] ([BM_Id], [Urun_ID], [Dimmg], [Dig], [BirimDagitimOlcu]) VALUES (5, 2, CAST(123.00 AS Decimal(18, 2)), CAST(123.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[BirimMaliyet] ([BM_Id], [Urun_ID], [Dimmg], [Dig], [BirimDagitimOlcu]) VALUES (6, 5, CAST(37.00 AS Decimal(18, 2)), CAST(37.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[BirimMaliyet] ([BM_Id], [Urun_ID], [Dimmg], [Dig], [BirimDagitimOlcu]) VALUES (7, 5, CAST(0.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[BirimMaliyet] ([BM_Id], [Urun_ID], [Dimmg], [Dig], [BirimDagitimOlcu]) VALUES (8, 6, CAST(423.00 AS Decimal(18, 2)), CAST(243.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[BirimMaliyet] ([BM_Id], [Urun_ID], [Dimmg], [Dig], [BirimDagitimOlcu]) VALUES (10, 5, CAST(123.00 AS Decimal(18, 2)), CAST(123.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[BirimMaliyet] ([BM_Id], [Urun_ID], [Dimmg], [Dig], [BirimDagitimOlcu]) VALUES (18, 6, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 5)
INSERT [dbo].[BirimMaliyet] ([BM_Id], [Urun_ID], [Dimmg], [Dig], [BirimDagitimOlcu]) VALUES (19, 1, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4)
SET IDENTITY_INSERT [dbo].[BirimMaliyet] OFF
SET IDENTITY_INSERT [dbo].[DagıtımOlcu] ON 

INSERT [dbo].[DagıtımOlcu] ([DagıtımOlcu_Id], [DagıtımOlcu_Ad]) VALUES (1, N'Sipariş Sayısı')
INSERT [dbo].[DagıtımOlcu] ([DagıtımOlcu_Id], [DagıtımOlcu_Ad]) VALUES (2, N'Desen Sayısı')
INSERT [dbo].[DagıtımOlcu] ([DagıtımOlcu_Id], [DagıtımOlcu_Ad]) VALUES (3, N'Metrekare')
INSERT [dbo].[DagıtımOlcu] ([DagıtımOlcu_Id], [DagıtımOlcu_Ad]) VALUES (4, N'Ambalajlama Sayısı')
INSERT [dbo].[DagıtımOlcu] ([DagıtımOlcu_Id], [DagıtımOlcu_Ad]) VALUES (5, N'Depolama Sayısı')
INSERT [dbo].[DagıtımOlcu] ([DagıtımOlcu_Id], [DagıtımOlcu_Ad]) VALUES (6, N'Sevkiyat Sayısı')
SET IDENTITY_INSERT [dbo].[DagıtımOlcu] OFF
SET IDENTITY_INSERT [dbo].[DagitimOlcuFaaliyetiliski] ON 

INSERT [dbo].[DagitimOlcuFaaliyetiliski] ([Df_Id], [DagitimOlcuId], [FaaliyetId]) VALUES (2, 2, 2)
INSERT [dbo].[DagitimOlcuFaaliyetiliski] ([Df_Id], [DagitimOlcuId], [FaaliyetId]) VALUES (3, 3, 3)
INSERT [dbo].[DagitimOlcuFaaliyetiliski] ([Df_Id], [DagitimOlcuId], [FaaliyetId]) VALUES (4, 3, 4)
INSERT [dbo].[DagitimOlcuFaaliyetiliski] ([Df_Id], [DagitimOlcuId], [FaaliyetId]) VALUES (5, 3, 5)
INSERT [dbo].[DagitimOlcuFaaliyetiliski] ([Df_Id], [DagitimOlcuId], [FaaliyetId]) VALUES (6, 3, 6)
INSERT [dbo].[DagitimOlcuFaaliyetiliski] ([Df_Id], [DagitimOlcuId], [FaaliyetId]) VALUES (9, 6, 9)
INSERT [dbo].[DagitimOlcuFaaliyetiliski] ([Df_Id], [DagitimOlcuId], [FaaliyetId]) VALUES (12, 1, 1)
INSERT [dbo].[DagitimOlcuFaaliyetiliski] ([Df_Id], [DagitimOlcuId], [FaaliyetId]) VALUES (16, 5, 8)
SET IDENTITY_INSERT [dbo].[DagitimOlcuFaaliyetiliski] OFF
SET IDENTITY_INSERT [dbo].[Faaliyet] ON 

INSERT [dbo].[Faaliyet] ([FaaliyetId], [FaaliyetAd]) VALUES (1, N'İlk Madde Depolama')
INSERT [dbo].[Faaliyet] ([FaaliyetId], [FaaliyetAd]) VALUES (2, N'Desen Çizim')
INSERT [dbo].[Faaliyet] ([FaaliyetId], [FaaliyetAd]) VALUES (3, N'Dokuma')
INSERT [dbo].[Faaliyet] ([FaaliyetId], [FaaliyetAd]) VALUES (4, N'Kalite Kontrol')
INSERT [dbo].[Faaliyet] ([FaaliyetId], [FaaliyetAd]) VALUES (5, N'Apreleme')
INSERT [dbo].[Faaliyet] ([FaaliyetId], [FaaliyetAd]) VALUES (6, N'Kesim ve Overlok')
INSERT [dbo].[Faaliyet] ([FaaliyetId], [FaaliyetAd]) VALUES (7, N'Ambalajlama')
INSERT [dbo].[Faaliyet] ([FaaliyetId], [FaaliyetAd]) VALUES (8, N'Depolama')
INSERT [dbo].[Faaliyet] ([FaaliyetId], [FaaliyetAd]) VALUES (9, N'Sevkiyat')
SET IDENTITY_INSERT [dbo].[Faaliyet] OFF
SET IDENTITY_INSERT [dbo].[Gider] ON 

INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (1, N'720.01.001', N'İşçi Ücret Giderleri', CAST(2404760.72 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (2, N'720.01.002', N'SGK Primi İşveren Payı', CAST(1198534.47 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (3, N'720.01.003', N'İşsizlik Primi İşveren Payı', CAST(118799.59 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (4, N'720.01.004', N'Kıdem Ve İhbar Tazminatı Giderleri', CAST(82552.21 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (5, N'730.01.001', N'İplik Makina Yed.Parça Bak.ve Ona. Gid.', CAST(430377.53 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (6, N'730.01.002', N'İplik Nakliye ve Sigorta Giderleri', CAST(525639.97 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (7, N'730.01.003', N'İplik Büküm İşçiliği', CAST(563507.66 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (8, N'730.01.004', N'İplik Ambalajlama Giderleri', CAST(293820.52 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (9, N'730.01.005', N'İplik Tesisi Amortisman Giderleri', CAST(2092579.09 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (10, N'730.01.006', N'Finansal Kiralama Giderleri', CAST(339766.34 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (11, N'730.01.007', N'İplik Boyama İşçiliği', CAST(6676.96 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (12, N'730.02.001', N'Halı Makina Yed.Parça Bak.ve Onarım Gid.', CAST(831198.02 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (13, N'730.02.002', N'Ambalajlama Giderleri', CAST(730467.95 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (14, N'730.02.003', N'Halı Tesisi Amortisman Giderleri', CAST(5922139.86 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (15, N'730.02.004', N'Dokuma Tezgahı Sigorta Giderleri', CAST(50919.17 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (16, N'730.03.001', N'Apre Makina Yed.Parça Bak.ve Onarım Gid.', CAST(11373.14 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (17, N'730.03.002', N'Halı Oyma İşçiliği', CAST(30372.83 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (18, N'730.03.003', N'Muhtelif Giderler', CAST(519531.37 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (19, N'730.03.004', N'Apre Bölümü Amortisman Giderleri', CAST(248059.98 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (20, N'730.04.002', N'Muhtelif Giderler', CAST(988002.29 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (21, N'730.04.003', N'Ulaşım Giderleri', CAST(711780.68 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (22, N'730.04.004', N'Yemek Giderleri', CAST(383762.08 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (23, N'730.04.005', N'Su Gideri', CAST(61544.65 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (24, N'730.04.006', N'Doğalgaz Gideri', CAST(791779.70 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (25, N'730.04.007', N'Elektrik Gideri', CAST(4707206.29 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (26, N'730.04.008', N'Bina Amortismanları', CAST(169497.43 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (27, N'730.04.009', N'Araç Amortismanları', CAST(351343.88 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (28, N'730.04.010', N'İşçi Servis Giderleri', CAST(20580.00 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (29, N'730.04.011', N'İthalat Giderleri', CAST(2185878.44 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (30, N'730.04.012', N'Sigorta Giderleri', CAST(108491.19 AS Decimal(18, 2)))
INSERT [dbo].[Gider] ([GiderId], [HesapKodu], [HesapAd], [Tutar]) VALUES (31, N'730.04.013', N'İplik Boyama Giderleri', CAST(22906.32 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Gider] OFF
SET IDENTITY_INSERT [dbo].[KaynakMaliyetEtken] ON 

INSERT [dbo].[KaynakMaliyetEtken] ([KMEId], [KMEAd]) VALUES (1, N'Personel Sayısı')
INSERT [dbo].[KaynakMaliyetEtken] ([KMEId], [KMEAd]) VALUES (2, N'Kullanılan Alan')
INSERT [dbo].[KaynakMaliyetEtken] ([KMEId], [KMEAd]) VALUES (3, N'Direkt')
INSERT [dbo].[KaynakMaliyetEtken] ([KMEId], [KMEAd]) VALUES (4, N'Belirlenen Oranlar')
INSERT [dbo].[KaynakMaliyetEtken] ([KMEId], [KMEAd]) VALUES (5, N'Belirlenen Tutar')
INSERT [dbo].[KaynakMaliyetEtken] ([KMEId], [KMEAd]) VALUES (6, N'İş Makinesi Sayısı')
SET IDENTITY_INSERT [dbo].[KaynakMaliyetEtken] OFF
SET IDENTITY_INSERT [dbo].[Maliyet] ON 

INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (3, 1, 1, 1, 1, 4)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (4, 1, 2, 1, 1, 5)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (5, 1, 3, 1, 1, 6)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (6, 1, 4, 1, 1, 8)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (7, 1, 5, 1, 1, 7)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (8, 1, 6, 1, 1, 12)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (9, 1, 7, 1, 1, 10)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (10, 1, 8, 1, 1, 4)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (11, 1, 9, 1, 1, 6)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (1003, 26, 1, 2, 1, 4850)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (1004, 26, 2, 2, 1, 150)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (1005, 26, 3, 2, 1, 1200)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (1006, 26, 4, 2, 1, 250)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (1007, 26, 5, 2, 1, 750)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (1008, 26, 6, 2, 1, 1000)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (1009, 26, 7, 2, 1, 300)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (1010, 26, 8, 2, 1, 6000)
INSERT [dbo].[Maliyet] ([MaliyetId], [GiderId], [FaaliyetId], [KMEId], [Onay], [Adet]) VALUES (1011, 26, 9, 2, 1, 500)
SET IDENTITY_INSERT [dbo].[Maliyet] OFF
SET IDENTITY_INSERT [dbo].[MaliyetEndirektUretim] ON 

INSERT [dbo].[MaliyetEndirektUretim] ([EUM_Id], [Urun_Id], [Toplam]) VALUES (1, 1, CAST(665753.63 AS Decimal(18, 2)))
INSERT [dbo].[MaliyetEndirektUretim] ([EUM_Id], [Urun_Id], [Toplam]) VALUES (2, 2, CAST(1027971.28 AS Decimal(18, 2)))
INSERT [dbo].[MaliyetEndirektUretim] ([EUM_Id], [Urun_Id], [Toplam]) VALUES (3, 3, CAST(250313.83 AS Decimal(18, 2)))
INSERT [dbo].[MaliyetEndirektUretim] ([EUM_Id], [Urun_Id], [Toplam]) VALUES (4, 4, CAST(266153.19 AS Decimal(18, 2)))
INSERT [dbo].[MaliyetEndirektUretim] ([EUM_Id], [Urun_Id], [Toplam]) VALUES (5, 5, CAST(328099.65 AS Decimal(18, 2)))
INSERT [dbo].[MaliyetEndirektUretim] ([EUM_Id], [Urun_Id], [Toplam]) VALUES (6, 6, CAST(34997.95 AS Decimal(18, 2)))
INSERT [dbo].[MaliyetEndirektUretim] ([EUM_Id], [Urun_Id], [Toplam]) VALUES (7, 18, CAST(968.63 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[MaliyetEndirektUretim] OFF
SET IDENTITY_INSERT [dbo].[MaliyetUrun] ON 

INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (1, 1, 1, CAST(49.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (2, 1, 2, CAST(36.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (3, 1, 3, CAST(793531.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (4, 1, 6, CAST(204.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (5, 1, 4, CAST(185157.198 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (6, 1, 5, CAST(11021.261 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (7, 2, 1, CAST(77.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (8, 2, 2, CAST(44.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (9, 2, 3, CAST(1246447.830 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (10, 2, 6, CAST(280.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (11, 2, 4, CAST(301224.892 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (12, 2, 5, CAST(17311.775 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (13, 3, 1, CAST(14.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (14, 3, 2, CAST(16.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (15, 3, 3, CAST(230908.392 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (16, 3, 4, CAST(83383.586 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (17, 3, 6, CAST(168.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (18, 3, 5, CAST(4276.081 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (19, 4, 1, CAST(15.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (20, 4, 2, CAST(42.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (21, 4, 3, CAST(242279.292 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (22, 4, 6, CAST(182.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (23, 4, 4, CAST(54512.840 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (24, 4, 5, CAST(3364.990 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (25, 5, 1, CAST(7.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (26, 5, 2, CAST(15.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (27, 5, 3, CAST(110346.438 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (28, 5, 6, CAST(124.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (29, 5, 4, CAST(25747.502 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (30, 5, 5, CAST(1532.589 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (31, 6, 1, CAST(4.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (32, 6, 2, CAST(20.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (33, 6, 3, CAST(9040.920 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (34, 6, 6, CAST(24.000 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (35, 6, 4, CAST(1808.184 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (36, 6, 5, CAST(125.568 AS Decimal(18, 3)))
INSERT [dbo].[MaliyetUrun] ([MaliyetUrunId], [UrunId], [DagitimOlcuId], [UrunDagitimAdet]) VALUES (38, 5, 1, CAST(3737.000 AS Decimal(18, 3)))
SET IDENTITY_INSERT [dbo].[MaliyetUrun] OFF
SET IDENTITY_INSERT [dbo].[TblBirimMaliyetTutar] ON 

INSERT [dbo].[TblBirimMaliyetTutar] ([BMT_ID], [Urunler], [EndirekUM], [Dimmg], [Dig], [ToplamMaliyet], [BirimMaliyet]) VALUES (1, N'BCF', CAST(665753.63 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(665755.63 AS Decimal(18, 2)), CAST(0.84 AS Decimal(18, 2)))
INSERT [dbo].[TblBirimMaliyetTutar] ([BMT_ID], [Urunler], [EndirekUM], [Dimmg], [Dig], [ToplamMaliyet], [BirimMaliyet]) VALUES (2, N'BCF', CAST(665753.63 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(665753.63 AS Decimal(18, 2)), CAST(3.60 AS Decimal(18, 2)))
INSERT [dbo].[TblBirimMaliyetTutar] ([BMT_ID], [Urunler], [EndirekUM], [Dimmg], [Dig], [ToplamMaliyet], [BirimMaliyet]) VALUES (3, N'HEAT SET', CAST(1027971.28 AS Decimal(18, 2)), CAST(34.00 AS Decimal(18, 2)), CAST(34.00 AS Decimal(18, 2)), CAST(1028039.28 AS Decimal(18, 2)), CAST(0.82 AS Decimal(18, 2)))
INSERT [dbo].[TblBirimMaliyetTutar] ([BMT_ID], [Urunler], [EndirekUM], [Dimmg], [Dig], [ToplamMaliyet], [BirimMaliyet]) VALUES (4, N'HEAT SET', CAST(1027971.28 AS Decimal(18, 2)), CAST(123.00 AS Decimal(18, 2)), CAST(123.00 AS Decimal(18, 2)), CAST(1028217.28 AS Decimal(18, 2)), CAST(0.82 AS Decimal(18, 2)))
INSERT [dbo].[TblBirimMaliyetTutar] ([BMT_ID], [Urunler], [EndirekUM], [Dimmg], [Dig], [ToplamMaliyet], [BirimMaliyet]) VALUES (5, N'OYMALI
', CAST(250313.83 AS Decimal(18, 2)), CAST(78.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(250403.83 AS Decimal(18, 2)), CAST(1.08 AS Decimal(18, 2)))
INSERT [dbo].[TblBirimMaliyetTutar] ([BMT_ID], [Urunler], [EndirekUM], [Dimmg], [Dig], [ToplamMaliyet], [BirimMaliyet]) VALUES (6, N'FİRUZE', CAST(328099.65 AS Decimal(18, 2)), CAST(37.00 AS Decimal(18, 2)), CAST(37.00 AS Decimal(18, 2)), CAST(328173.65 AS Decimal(18, 2)), CAST(2.97 AS Decimal(18, 2)))
INSERT [dbo].[TblBirimMaliyetTutar] ([BMT_ID], [Urunler], [EndirekUM], [Dimmg], [Dig], [ToplamMaliyet], [BirimMaliyet]) VALUES (7, N'FİRUZE', CAST(328099.65 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(328199.65 AS Decimal(18, 2)), CAST(2.97 AS Decimal(18, 2)))
INSERT [dbo].[TblBirimMaliyetTutar] ([BMT_ID], [Urunler], [EndirekUM], [Dimmg], [Dig], [ToplamMaliyet], [BirimMaliyet]) VALUES (8, N'FİRUZE', CAST(328099.65 AS Decimal(18, 2)), CAST(123.00 AS Decimal(18, 2)), CAST(123.00 AS Decimal(18, 2)), CAST(328345.65 AS Decimal(18, 2)), CAST(2.98 AS Decimal(18, 2)))
INSERT [dbo].[TblBirimMaliyetTutar] ([BMT_ID], [Urunler], [EndirekUM], [Dimmg], [Dig], [ToplamMaliyet], [BirimMaliyet]) VALUES (9, N'PP MAKİNE HALISI', CAST(34997.95 AS Decimal(18, 2)), CAST(43.00 AS Decimal(18, 2)), CAST(34.00 AS Decimal(18, 2)), CAST(35074.95 AS Decimal(18, 2)), CAST(3.88 AS Decimal(18, 2)))
INSERT [dbo].[TblBirimMaliyetTutar] ([BMT_ID], [Urunler], [EndirekUM], [Dimmg], [Dig], [ToplamMaliyet], [BirimMaliyet]) VALUES (10, N'PP MAKİNE HALISI', CAST(34997.95 AS Decimal(18, 2)), CAST(423.00 AS Decimal(18, 2)), CAST(243.00 AS Decimal(18, 2)), CAST(35663.95 AS Decimal(18, 2)), CAST(3.94 AS Decimal(18, 2)))
INSERT [dbo].[TblBirimMaliyetTutar] ([BMT_ID], [Urunler], [EndirekUM], [Dimmg], [Dig], [ToplamMaliyet], [BirimMaliyet]) VALUES (11, N'PP MAKİNE HALISI', CAST(34997.95 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(34999.95 AS Decimal(18, 2)), CAST(278.73 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[TblBirimMaliyetTutar] OFF
SET IDENTITY_INSERT [dbo].[TblToplamMaliyet] ON 

INSERT [dbo].[TblToplamMaliyet] ([TMaliyet_ID], [UrunAdi], [EndirektToplami], [Dimmg], [Dig], [ToplamMaliyeti]) VALUES (1, N'BCF', CAST(665753.63 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(665755.63 AS Decimal(18, 2)))
INSERT [dbo].[TblToplamMaliyet] ([TMaliyet_ID], [UrunAdi], [EndirektToplami], [Dimmg], [Dig], [ToplamMaliyeti]) VALUES (2, N'HEAT SET', CAST(1027971.28 AS Decimal(18, 2)), CAST(34.00 AS Decimal(18, 2)), CAST(34.00 AS Decimal(18, 2)), CAST(1028039.28 AS Decimal(18, 2)))
INSERT [dbo].[TblToplamMaliyet] ([TMaliyet_ID], [UrunAdi], [EndirektToplami], [Dimmg], [Dig], [ToplamMaliyeti]) VALUES (3, N'PP MAKİNE HALISI', CAST(34997.95 AS Decimal(18, 2)), CAST(43.00 AS Decimal(18, 2)), CAST(34.00 AS Decimal(18, 2)), CAST(35074.95 AS Decimal(18, 2)))
INSERT [dbo].[TblToplamMaliyet] ([TMaliyet_ID], [UrunAdi], [EndirektToplami], [Dimmg], [Dig], [ToplamMaliyeti]) VALUES (4, N'OYMALI
', CAST(250313.83 AS Decimal(18, 2)), CAST(78.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(250403.83 AS Decimal(18, 2)))
INSERT [dbo].[TblToplamMaliyet] ([TMaliyet_ID], [UrunAdi], [EndirektToplami], [Dimmg], [Dig], [ToplamMaliyeti]) VALUES (5, N'HEAT SET', CAST(1027971.28 AS Decimal(18, 2)), CAST(123.00 AS Decimal(18, 2)), CAST(123.00 AS Decimal(18, 2)), CAST(1028217.28 AS Decimal(18, 2)))
INSERT [dbo].[TblToplamMaliyet] ([TMaliyet_ID], [UrunAdi], [EndirektToplami], [Dimmg], [Dig], [ToplamMaliyeti]) VALUES (6, N'FİRUZE', CAST(328099.65 AS Decimal(18, 2)), CAST(37.00 AS Decimal(18, 2)), CAST(37.00 AS Decimal(18, 2)), CAST(328173.65 AS Decimal(18, 2)))
INSERT [dbo].[TblToplamMaliyet] ([TMaliyet_ID], [UrunAdi], [EndirektToplami], [Dimmg], [Dig], [ToplamMaliyeti]) VALUES (7, N'FİRUZE', CAST(328099.65 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(328199.65 AS Decimal(18, 2)))
INSERT [dbo].[TblToplamMaliyet] ([TMaliyet_ID], [UrunAdi], [EndirektToplami], [Dimmg], [Dig], [ToplamMaliyeti]) VALUES (8, N'PP MAKİNE HALISI', CAST(34997.95 AS Decimal(18, 2)), CAST(423.00 AS Decimal(18, 2)), CAST(243.00 AS Decimal(18, 2)), CAST(35663.95 AS Decimal(18, 2)))
INSERT [dbo].[TblToplamMaliyet] ([TMaliyet_ID], [UrunAdi], [EndirektToplami], [Dimmg], [Dig], [ToplamMaliyeti]) VALUES (9, N'FİRUZE', CAST(328099.65 AS Decimal(18, 2)), CAST(123.00 AS Decimal(18, 2)), CAST(123.00 AS Decimal(18, 2)), CAST(328345.65 AS Decimal(18, 2)))
INSERT [dbo].[TblToplamMaliyet] ([TMaliyet_ID], [UrunAdi], [EndirektToplami], [Dimmg], [Dig], [ToplamMaliyeti]) VALUES (10, N'BCF', CAST(665753.63 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(665755.63 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[TblToplamMaliyet] OFF
SET IDENTITY_INSERT [dbo].[TutarUrunFaaliyet] ON 

INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (1, N'BCF', N'İlk Madde Depolama', CAST(2635.80607 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (2, N'BCF', N'Desen Çizim', CAST(40708.56911 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (3, N'BCF', N'Dokuma', CAST(74235.77728 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (4, N'BCF', N'Kalite Kontrol', CAST(94382.78978 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (5, N'BCF', N'Apreleme', CAST(84394.43624 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (6, N'BCF', N'Kesim ve Overlok', CAST(143703.00254 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (7, N'BCF', N'Sevkiyat', CAST(49518.54737 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (8, N'BCF', N'Depolama', CAST(65293.25751 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (9, N'HEAT SET', N'İlk Madde Depolama', CAST(4141.98096 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (10, N'HEAT SET', N'Desen Çizim', CAST(49754.91780 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (11, N'HEAT SET', N'Dokuma', CAST(116606.69022 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (12, N'HEAT SET', N'Kalite Kontrol', CAST(148252.83891 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (13, N'HEAT SET', N'Apreleme', CAST(132563.51916 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (14, N'HEAT SET', N'Kesim ve Overlok', CAST(225723.12320 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (15, N'HEAT SET', N'Sevkiyat', CAST(67966.63364 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (16, N'HEAT SET', N'Depolama', CAST(102560.15015 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (17, N'OYMALI
', N'İlk Madde Depolama', CAST(753.08745 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (18, N'OYMALI
', N'Desen Çizim', CAST(18092.69738 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (19, N'OYMALI
', N'Dokuma', CAST(21601.75716 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (20, N'OYMALI
', N'Kalite Kontrol', CAST(27464.30602 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (21, N'OYMALI
', N'Apreleme', CAST(24557.81005 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (22, N'OYMALI
', N'Kesim ve Overlok', CAST(41815.92054 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (23, N'OYMALI
', N'Sevkiyat', CAST(40779.98018 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (24, N'OYMALI
', N'Depolama', CAST(25332.78704 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (25, N'SHAGGY
', N'İlk Madde Depolama', CAST(806.87941 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (26, N'SHAGGY
', N'Desen Çizim', CAST(47493.33062 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (27, N'SHAGGY
', N'Dokuma', CAST(22665.51850 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (28, N'SHAGGY
', N'Kalite Kontrol', CAST(28816.76391 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (29, N'SHAGGY
', N'Apreleme', CAST(25767.13986 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (30, N'SHAGGY
', N'Kesim ve Overlok', CAST(43875.11227 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (31, N'SHAGGY
', N'Sevkiyat', CAST(44178.31187 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (32, N'SHAGGY
', N'Depolama', CAST(19935.21055 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (33, N'FİRUZE', N'İlk Madde Depolama', CAST(376.54372 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (34, N'FİRUZE', N'Desen Çizim', CAST(16961.90379 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (35, N'FİRUZE', N'Dokuma', CAST(10323.04169 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (36, N'FİRUZE', N'Kalite Kontrol', CAST(13124.63491 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (37, N'FİRUZE', N'Apreleme', CAST(11735.67942 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (38, N'FİRUZE', N'Kesim ve Overlok', CAST(19982.98045 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (39, N'FİRUZE', N'Sevkiyat', CAST(30099.50918 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (40, N'FİRUZE', N'Depolama', CAST(9079.51715 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (41, N'PP MAKİNE HALISI', N'İlk Madde Depolama', CAST(215.16784 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (42, N'PP MAKİNE HALISI', N'Desen Çizim', CAST(22615.87173 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (43, N'PP MAKİNE HALISI', N'Dokuma', CAST(845.78892 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (44, N'PP MAKİNE HALISI', N'Kalite Kontrol', CAST(1075.32945 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (45, N'PP MAKİNE HALISI', N'Apreleme', CAST(961.52935 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (46, N'PP MAKİNE HALISI', N'Kesim ve Overlok', CAST(1637.24839 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (47, N'PP MAKİNE HALISI', N'Sevkiyat', CAST(5825.71146 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (48, N'PP MAKİNE HALISI', N'Depolama', CAST(743.90251 AS Decimal(18, 5)))
INSERT [dbo].[TutarUrunFaaliyet] ([TUF_ID], [Urun], [Faaliyet], [TutarTUF]) VALUES (49, N'FİRUZE', N'İlk Madde Depolama', CAST(201020.55649 AS Decimal(18, 5)))
SET IDENTITY_INSERT [dbo].[TutarUrunFaaliyet] OFF
SET IDENTITY_INSERT [dbo].[Urun] ON 

INSERT [dbo].[Urun] ([UrunId], [UrunAd]) VALUES (1, N'BCF')
INSERT [dbo].[Urun] ([UrunId], [UrunAd]) VALUES (2, N'HEAT SET')
INSERT [dbo].[Urun] ([UrunId], [UrunAd]) VALUES (3, N'OYMALI
')
INSERT [dbo].[Urun] ([UrunId], [UrunAd]) VALUES (4, N'SHAGGY
')
INSERT [dbo].[Urun] ([UrunId], [UrunAd]) VALUES (5, N'FİRUZE')
INSERT [dbo].[Urun] ([UrunId], [UrunAd]) VALUES (6, N'PP MAKİNE HALISI')
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
/****** Object:  StoredProcedure [dbo].[BirimMaliyetSP]    Script Date: 24.05.2022 01:12:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[BirimMaliyetSP]
as
SET FMTONLY OFF
TRUNCATE TABLE TblBirimMaliyetTutar
Insert into TblBirimMaliyetTutar(Urunler,EndirekUM,Dimmg,Dig,ToplamMaliyet,BirimMaliyet)
Select UrunAd,EndirektToplam,Dimmg,Dig,ToplamMaliyet,BirimMaliyet from BirimMaliyetTutar
select * from TblBirimMaliyetTutar
GO
/****** Object:  StoredProcedure [dbo].[Endirekt]    Script Date: 24.05.2022 01:12:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Endirekt]
As
SET FMTONLY OFF
TRUNCATE TABLE MaliyetEndirektUretim
Insert into MaliyetEndirektUretim(Urun_Id,Toplam)
select UrunId,Toplam from EndirektUretimMaliyeti

Select * from MaliyetEndirektUretim
GO
/****** Object:  StoredProcedure [dbo].[ProductPrice]    Script Date: 24.05.2022 01:12:38 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ProductRefresh]    Script Date: 24.05.2022 01:12:38 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Tutar]    Script Date: 24.05.2022 01:12:38 ******/
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
/****** Object:  StoredProcedure [dbo].[SPBirimMaliyetTutar]    Script Date: 24.05.2022 01:12:38 ******/
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
/****** Object:  StoredProcedure [dbo].[SPToplamMaliyet]    Script Date: 24.05.2022 01:12:38 ******/
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
ALTER DATABASE [Bitirme] SET  READ_WRITE 
GO
