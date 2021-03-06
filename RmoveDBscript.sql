USE [master]
GO
/****** Object:  Database [Rightmove]    Script Date: 28/01/2019 11:06:06 ******/
CREATE DATABASE [Rightmove]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Rightmove', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Rightmove.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Rightmove_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Rightmove_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Rightmove] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Rightmove].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Rightmove] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Rightmove] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Rightmove] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Rightmove] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Rightmove] SET ARITHABORT OFF 
GO
ALTER DATABASE [Rightmove] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Rightmove] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Rightmove] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Rightmove] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Rightmove] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Rightmove] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Rightmove] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Rightmove] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Rightmove] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Rightmove] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Rightmove] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Rightmove] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Rightmove] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Rightmove] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Rightmove] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Rightmove] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Rightmove] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Rightmove] SET RECOVERY FULL 
GO
ALTER DATABASE [Rightmove] SET  MULTI_USER 
GO
ALTER DATABASE [Rightmove] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Rightmove] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Rightmove] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Rightmove] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Rightmove] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Rightmove', N'ON'
GO
ALTER DATABASE [Rightmove] SET QUERY_STORE = OFF
GO
USE [Rightmove]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Rightmove]
GO
/****** Object:  Schema [Lettings]    Script Date: 28/01/2019 11:06:06 ******/
CREATE SCHEMA [Lettings]
GO
/****** Object:  Schema [Property]    Script Date: 28/01/2019 11:06:06 ******/
CREATE SCHEMA [Property]
GO
/****** Object:  Schema [Sales]    Script Date: 28/01/2019 11:06:06 ******/
CREATE SCHEMA [Sales]
GO
/****** Object:  Table [dbo].[StudentPropertiesToLet]    Script Date: 28/01/2019 11:06:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentPropertiesToLet](
	[PropertyId] [int] NOT NULL,
	[HasBurglarAlarm] [bit] NULL,
	[HasWashingMachine] [bit] NULL,
	[HasDishwasher] [bit] NULL,
	[IsWaterBillInc] [bit] NULL,
	[IsGasBillInc] [bit] NULL,
	[IsElectricityBillInc] [bit] NULL,
	[IsTVLicenceInc] [bit] NULL,
	[IsSatCableTVBillInc] [bit] NULL,
	[IsInternetBillInc] [bit] NULL,
 CONSTRAINT [PK_StudentPropertiesToLet] PRIMARY KEY CLUSTERED 
(
	[PropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Lettings].[PropertiesToLet]    Script Date: 28/01/2019 11:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lettings].[PropertiesToLet](
	[PropertyId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[IsStudentProperty] [bit] NOT NULL,
	[IsHouseFlatShare] [bit] NOT NULL,
	[DateAvailable] [datetime] NULL,
	[ContractMonths] [tinyint] NULL,
	[MinimumTerm] [tinyint] NULL,
	[LettingTypeId] [int] NULL,
	[Deposit] [decimal](7, 2) NULL,
	[AdminFee] [varchar](4000) NULL,
	[Rent] [decimal](7, 2) NULL,
	[RentFrequencyId] [int] NULL,
	[FurnishedTypeId] [int] NULL,
	[ArePetsAllowed] [bit] NULL,
	[AreSmokersConsidered] [bit] NULL,
	[AreHousingBenefitConsidered] [bit] NULL,
	[AreSharersConsidered] [bit] NULL,
	[IsAllBillsInc] [bit] NULL,
	[IsOilBillInc] [bit] NULL,
	[IsCouncilTaxInc] [bit] NULL,
 CONSTRAINT [PK_PropertyLettingInstructions] PRIMARY KEY CLUSTERED 
(
	[PropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Lettings].[PropertyLettingFurnishedTypes]    Script Date: 28/01/2019 11:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lettings].[PropertyLettingFurnishedTypes](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PropertyLettingFurnishedTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Lettings].[PropertyLettingTypes]    Script Date: 28/01/2019 11:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lettings].[PropertyLettingTypes](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PropertyLettingTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Lettings].[PropertyToLetRentFrequencies]    Script Date: 28/01/2019 11:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lettings].[PropertyToLetRentFrequencies](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PropertyToLetRentFrequencies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Lettings].[PropertyToLetStatus]    Script Date: 28/01/2019 11:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Lettings].[PropertyToLetStatus](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PropertyToLetStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Property].[DimensionUnitTypes]    Script Date: 28/01/2019 11:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Property].[DimensionUnitTypes](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_DimensionUnitTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Property].[GoogleStreetViewDetails]    Script Date: 28/01/2019 11:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Property].[GoogleStreetViewDetails](
	[Id] [int] NOT NULL,
	[PovLatitude] [nchar](10) NULL,
	[PovLongitude] [nchar](10) NULL,
	[PovPitch] [nchar](10) NULL,
	[PovHeading] [nchar](10) NULL,
	[PovZoom] [nchar](10) NULL,
 CONSTRAINT [PK_GoogleStreetViewDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Property].[Properties]    Script Date: 28/01/2019 11:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Property].[Properties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PropertyTypeId] [int] NOT NULL,
	[IsNewHome] [bit] NOT NULL,
	[AddrHouseNameNumber] [varchar](255) NOT NULL,
	[Addr2] [varchar](255) NULL,
	[Addr3] [varchar](255) NULL,
	[Addr4] [varchar](255) NULL,
	[AddrTown] [varchar](255) NOT NULL,
	[AddrPostcode1stPart] [varchar](5) NOT NULL,
	[AddrPostcode2ndPart] [varchar](5) NOT NULL,
	[DisplayAddress] [varchar](255) NOT NULL,
	[Latitude] [smallint] NULL,
	[Longitude] [smallint] NULL,
	[SummaryDescr] [varchar](1000) NULL,
	[FullDescr] [varchar](3200) NULL,
	[Bedrooms] [tinyint] NULL,
	[Bathrooms] [tinyint] NULL,
	[ReceptionRooms] [tinyint] NULL,
	[ParkingOptionId] [int] NULL,
	[OutsideSpaceId] [int] NULL,
	[YearBuilt] [smallint] NULL,
	[NoOfFloors] [tinyint] NULL,
	[EntranceFloorId] [int] NULL,
	[ConditionId] [int] NULL,
 CONSTRAINT [PK_Properties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Property].[PropertyAccessibilityMeasures]    Script Date: 28/01/2019 11:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Property].[PropertyAccessibilityMeasures](
	[PropertyId] [int] NOT NULL,
	[PropertyAccessibilityMeasureTypeId] [int] NOT NULL,
 CONSTRAINT [PK_PropertyAccessibilityMeasures] PRIMARY KEY CLUSTERED 
(
	[PropertyId] ASC,
	[PropertyAccessibilityMeasureTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Property].[PropertyAccessibilityMeasureTypes]    Script Date: 28/01/2019 11:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Property].[PropertyAccessibilityMeasureTypes](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PropertyAccessibilityMeasureTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Property].[PropertyConditionTypes]    Script Date: 28/01/2019 11:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Property].[PropertyConditionTypes](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PropertyConditionTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Property].[PropertyEntranceFloors]    Script Date: 28/01/2019 11:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Property].[PropertyEntranceFloors](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PropertyEntranceFloors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Property].[PropertyFeatures]    Script Date: 28/01/2019 11:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Property].[PropertyFeatures](
	[PropertyId] [int] NOT NULL,
	[FeatureNo] [tinyint] NOT NULL,
	[Details] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PropertyFeatures] PRIMARY KEY CLUSTERED 
(
	[PropertyId] ASC,
	[FeatureNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Property].[PropertyHeatingFeatures]    Script Date: 28/01/2019 11:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Property].[PropertyHeatingFeatures](
	[PropertyId] [int] NOT NULL,
	[PropertyHeatingFeatureTypeId] [int] NOT NULL,
 CONSTRAINT [PK_PropertyHeatingFeatures] PRIMARY KEY CLUSTERED 
(
	[PropertyId] ASC,
	[PropertyHeatingFeatureTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Property].[PropertyHeatingFeatureTypes]    Script Date: 28/01/2019 11:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Property].[PropertyHeatingFeatureTypes](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PropertyHeatingFeatureTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Property].[PropertyMediaTypes]    Script Date: 28/01/2019 11:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Property].[PropertyMediaTypes](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PropertyMediaTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Property].[PropertyMediaUrls]    Script Date: 28/01/2019 11:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Property].[PropertyMediaUrls](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PropertyId] [int] NOT NULL,
	[SortOrder] [tinyint] NULL,
	[MediaTypeId] [int] NOT NULL,
	[Caption] [varchar](50) NULL,
 CONSTRAINT [PK_PropertyMediaUrls] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Property].[PropertyOutsideSpaceTypes]    Script Date: 28/01/2019 11:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Property].[PropertyOutsideSpaceTypes](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PropertyOutsideSpaceTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Property].[PropertyParkingOptions]    Script Date: 28/01/2019 11:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Property].[PropertyParkingOptions](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PropertyParkingOptions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Property].[PropertyTypes]    Script Date: 28/01/2019 11:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Property].[PropertyTypes](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PropertyTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Property].[RoomPhotoUrls]    Script Date: 28/01/2019 11:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Property].[RoomPhotoUrls](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomId] [int] NOT NULL,
	[SortOrder] [tinyint] NOT NULL,
 CONSTRAINT [PK_RoomPhotoUrls] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_RoomPhotoUrls] UNIQUE NONCLUSTERED 
(
	[RoomId] ASC,
	[SortOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Property].[Rooms]    Script Date: 28/01/2019 11:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Property].[Rooms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PropertyId] [int] NOT NULL,
	[SortOrder] [tinyint] NOT NULL,
	[Name] [varchar](120) NULL,
	[Descr] [varchar](1000) NULL,
	[Length] [decimal](6, 2) NULL,
	[Width] [decimal](6, 2) NULL,
	[DimensionUnitTypeId] [int] NULL,
	[DimensionsText] [varchar](120) NULL,
 CONSTRAINT [PK_Rooms_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_Rooms] UNIQUE NONCLUSTERED 
(
	[PropertyId] ASC,
	[SortOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sales].[PropertiesForSale]    Script Date: 28/01/2019 11:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[PropertiesForSale](
	[PropertyId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Price] [decimal](9, 2) NOT NULL,
	[PriceQualifierId] [int] NULL,
	[TenureTypeId] [int] NULL,
	[IsToBeAuctioned] [bit] NULL,
	[TenureUnexpiredYears] [tinyint] NULL,
 CONSTRAINT [PK_PropertySaleInstructions] PRIMARY KEY CLUSTERED 
(
	[PropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sales].[PropertyForSalePriceQualifiers]    Script Date: 28/01/2019 11:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[PropertyForSalePriceQualifiers](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PropertyForSalePriceQualifiers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sales].[PropertyForSaleStatus]    Script Date: 28/01/2019 11:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[PropertyForSaleStatus](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PropertyForSaleStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Sales].[PropertyForSaleTenureTypes]    Script Date: 28/01/2019 11:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sales].[PropertyForSaleTenureTypes](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PropertyForSaleTenureTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentPropertiesToLet]  WITH CHECK ADD  CONSTRAINT [FK_StudentPropertiesToLet_PropertiesToLet] FOREIGN KEY([PropertyId])
REFERENCES [Lettings].[PropertiesToLet] ([PropertyId])
GO
ALTER TABLE [dbo].[StudentPropertiesToLet] CHECK CONSTRAINT [FK_StudentPropertiesToLet_PropertiesToLet]
GO
ALTER TABLE [Lettings].[PropertiesToLet]  WITH CHECK ADD  CONSTRAINT [FK_PropertiesToLet_Properties] FOREIGN KEY([PropertyId])
REFERENCES [Property].[Properties] ([Id])
GO
ALTER TABLE [Lettings].[PropertiesToLet] CHECK CONSTRAINT [FK_PropertiesToLet_Properties]
GO
ALTER TABLE [Lettings].[PropertiesToLet]  WITH CHECK ADD  CONSTRAINT [FK_PropertiesToLet_PropertyLettingFurnishedTypes] FOREIGN KEY([FurnishedTypeId])
REFERENCES [Lettings].[PropertyLettingFurnishedTypes] ([Id])
GO
ALTER TABLE [Lettings].[PropertiesToLet] CHECK CONSTRAINT [FK_PropertiesToLet_PropertyLettingFurnishedTypes]
GO
ALTER TABLE [Lettings].[PropertiesToLet]  WITH CHECK ADD  CONSTRAINT [FK_PropertiesToLet_PropertyLettingTypes] FOREIGN KEY([LettingTypeId])
REFERENCES [Lettings].[PropertyLettingTypes] ([Id])
GO
ALTER TABLE [Lettings].[PropertiesToLet] CHECK CONSTRAINT [FK_PropertiesToLet_PropertyLettingTypes]
GO
ALTER TABLE [Lettings].[PropertiesToLet]  WITH CHECK ADD  CONSTRAINT [FK_PropertiesToLet_PropertyToLetRentFrequencies] FOREIGN KEY([RentFrequencyId])
REFERENCES [Lettings].[PropertyToLetRentFrequencies] ([Id])
GO
ALTER TABLE [Lettings].[PropertiesToLet] CHECK CONSTRAINT [FK_PropertiesToLet_PropertyToLetRentFrequencies]
GO
ALTER TABLE [Lettings].[PropertiesToLet]  WITH CHECK ADD  CONSTRAINT [FK_PropertiesToLet_PropertyToLetStatus] FOREIGN KEY([Status])
REFERENCES [Lettings].[PropertyToLetStatus] ([Id])
GO
ALTER TABLE [Lettings].[PropertiesToLet] CHECK CONSTRAINT [FK_PropertiesToLet_PropertyToLetStatus]
GO
ALTER TABLE [Property].[GoogleStreetViewDetails]  WITH CHECK ADD  CONSTRAINT [FK_GoogleStreetViewDetails_Properties] FOREIGN KEY([Id])
REFERENCES [Property].[Properties] ([Id])
GO
ALTER TABLE [Property].[GoogleStreetViewDetails] CHECK CONSTRAINT [FK_GoogleStreetViewDetails_Properties]
GO
ALTER TABLE [Property].[Properties]  WITH CHECK ADD  CONSTRAINT [FK_Properties_PropertyConditionTypes] FOREIGN KEY([ConditionId])
REFERENCES [Property].[PropertyConditionTypes] ([Id])
GO
ALTER TABLE [Property].[Properties] CHECK CONSTRAINT [FK_Properties_PropertyConditionTypes]
GO
ALTER TABLE [Property].[Properties]  WITH CHECK ADD  CONSTRAINT [FK_Properties_PropertyEntranceFloors] FOREIGN KEY([EntranceFloorId])
REFERENCES [Property].[PropertyEntranceFloors] ([Id])
GO
ALTER TABLE [Property].[Properties] CHECK CONSTRAINT [FK_Properties_PropertyEntranceFloors]
GO
ALTER TABLE [Property].[Properties]  WITH CHECK ADD  CONSTRAINT [FK_Properties_PropertyOutsideSpaceTypes] FOREIGN KEY([OutsideSpaceId])
REFERENCES [Property].[PropertyOutsideSpaceTypes] ([Id])
GO
ALTER TABLE [Property].[Properties] CHECK CONSTRAINT [FK_Properties_PropertyOutsideSpaceTypes]
GO
ALTER TABLE [Property].[Properties]  WITH CHECK ADD  CONSTRAINT [FK_Properties_PropertyParkingOptions] FOREIGN KEY([ParkingOptionId])
REFERENCES [Property].[PropertyParkingOptions] ([Id])
GO
ALTER TABLE [Property].[Properties] CHECK CONSTRAINT [FK_Properties_PropertyParkingOptions]
GO
ALTER TABLE [Property].[Properties]  WITH CHECK ADD  CONSTRAINT [FK_Properties_PropertyTypes] FOREIGN KEY([PropertyTypeId])
REFERENCES [Property].[PropertyTypes] ([Id])
GO
ALTER TABLE [Property].[Properties] CHECK CONSTRAINT [FK_Properties_PropertyTypes]
GO
ALTER TABLE [Property].[PropertyAccessibilityMeasures]  WITH CHECK ADD  CONSTRAINT [FK_PropertyAccessibilityMeasures_Properties] FOREIGN KEY([PropertyId])
REFERENCES [Property].[Properties] ([Id])
GO
ALTER TABLE [Property].[PropertyAccessibilityMeasures] CHECK CONSTRAINT [FK_PropertyAccessibilityMeasures_Properties]
GO
ALTER TABLE [Property].[PropertyAccessibilityMeasures]  WITH CHECK ADD  CONSTRAINT [FK_PropertyAccessibilityMeasures_PropertyAccessibilityMeasureTypes] FOREIGN KEY([PropertyAccessibilityMeasureTypeId])
REFERENCES [Property].[PropertyAccessibilityMeasureTypes] ([Id])
GO
ALTER TABLE [Property].[PropertyAccessibilityMeasures] CHECK CONSTRAINT [FK_PropertyAccessibilityMeasures_PropertyAccessibilityMeasureTypes]
GO
ALTER TABLE [Property].[PropertyFeatures]  WITH CHECK ADD  CONSTRAINT [FK_PropertyFeatures_Properties] FOREIGN KEY([PropertyId])
REFERENCES [Property].[Properties] ([Id])
GO
ALTER TABLE [Property].[PropertyFeatures] CHECK CONSTRAINT [FK_PropertyFeatures_Properties]
GO
ALTER TABLE [Property].[PropertyHeatingFeatures]  WITH CHECK ADD  CONSTRAINT [FK_PropertyHeatingFeatures_Properties] FOREIGN KEY([PropertyId])
REFERENCES [Property].[Properties] ([Id])
GO
ALTER TABLE [Property].[PropertyHeatingFeatures] CHECK CONSTRAINT [FK_PropertyHeatingFeatures_Properties]
GO
ALTER TABLE [Property].[PropertyHeatingFeatures]  WITH CHECK ADD  CONSTRAINT [FK_PropertyHeatingFeatures_PropertyHeatingFeatureTypes] FOREIGN KEY([PropertyHeatingFeatureTypeId])
REFERENCES [Property].[PropertyHeatingFeatureTypes] ([Id])
GO
ALTER TABLE [Property].[PropertyHeatingFeatures] CHECK CONSTRAINT [FK_PropertyHeatingFeatures_PropertyHeatingFeatureTypes]
GO
ALTER TABLE [Property].[PropertyMediaUrls]  WITH CHECK ADD  CONSTRAINT [FK_PropertyMediaUrls_Properties] FOREIGN KEY([PropertyId])
REFERENCES [Property].[Properties] ([Id])
GO
ALTER TABLE [Property].[PropertyMediaUrls] CHECK CONSTRAINT [FK_PropertyMediaUrls_Properties]
GO
ALTER TABLE [Property].[PropertyMediaUrls]  WITH CHECK ADD  CONSTRAINT [FK_PropertyMediaUrls_PropertyMediaTypes] FOREIGN KEY([MediaTypeId])
REFERENCES [Property].[PropertyMediaTypes] ([Id])
GO
ALTER TABLE [Property].[PropertyMediaUrls] CHECK CONSTRAINT [FK_PropertyMediaUrls_PropertyMediaTypes]
GO
ALTER TABLE [Property].[RoomPhotoUrls]  WITH CHECK ADD  CONSTRAINT [FK_RoomPhotoUrls_Rooms] FOREIGN KEY([RoomId])
REFERENCES [Property].[Rooms] ([Id])
GO
ALTER TABLE [Property].[RoomPhotoUrls] CHECK CONSTRAINT [FK_RoomPhotoUrls_Rooms]
GO
ALTER TABLE [Property].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_DimensionUnitTypes] FOREIGN KEY([DimensionUnitTypeId])
REFERENCES [Property].[DimensionUnitTypes] ([Id])
GO
ALTER TABLE [Property].[Rooms] CHECK CONSTRAINT [FK_Rooms_DimensionUnitTypes]
GO
ALTER TABLE [Property].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_Properties] FOREIGN KEY([PropertyId])
REFERENCES [Property].[Properties] ([Id])
GO
ALTER TABLE [Property].[Rooms] CHECK CONSTRAINT [FK_Rooms_Properties]
GO
ALTER TABLE [Sales].[PropertiesForSale]  WITH CHECK ADD  CONSTRAINT [FK_PropertiesForSale_Properties] FOREIGN KEY([PropertyId])
REFERENCES [Property].[Properties] ([Id])
GO
ALTER TABLE [Sales].[PropertiesForSale] CHECK CONSTRAINT [FK_PropertiesForSale_Properties]
GO
ALTER TABLE [Sales].[PropertiesForSale]  WITH CHECK ADD  CONSTRAINT [FK_PropertiesForSale_PropertyForSalePriceQualifiers] FOREIGN KEY([PriceQualifierId])
REFERENCES [Sales].[PropertyForSalePriceQualifiers] ([Id])
GO
ALTER TABLE [Sales].[PropertiesForSale] CHECK CONSTRAINT [FK_PropertiesForSale_PropertyForSalePriceQualifiers]
GO
ALTER TABLE [Sales].[PropertiesForSale]  WITH CHECK ADD  CONSTRAINT [FK_PropertiesForSale_PropertyForSaleStatus] FOREIGN KEY([Status])
REFERENCES [Sales].[PropertyForSaleStatus] ([Id])
GO
ALTER TABLE [Sales].[PropertiesForSale] CHECK CONSTRAINT [FK_PropertiesForSale_PropertyForSaleStatus]
GO
ALTER TABLE [Sales].[PropertiesForSale]  WITH CHECK ADD  CONSTRAINT [FK_PropertiesForSale_PropertyForSaleTenureTypes] FOREIGN KEY([TenureTypeId])
REFERENCES [Sales].[PropertyForSaleTenureTypes] ([Id])
GO
ALTER TABLE [Sales].[PropertiesForSale] CHECK CONSTRAINT [FK_PropertiesForSale_PropertyForSaleTenureTypes]
GO
USE [master]
GO
ALTER DATABASE [Rightmove] SET  READ_WRITE 
GO
