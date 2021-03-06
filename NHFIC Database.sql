USE [master]
GO
CREATE DATABASE [NHFIC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NHFIC', FILENAME = N'C:\Users\WILLIAM\NHFIC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NHFIC_log', FILENAME = N'C:\Users\WILLIAM\NHFIC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [NHFIC] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NHFIC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NHFIC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NHFIC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NHFIC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NHFIC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NHFIC] SET ARITHABORT OFF 
GO
ALTER DATABASE [NHFIC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NHFIC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NHFIC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NHFIC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NHFIC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NHFIC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NHFIC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NHFIC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NHFIC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NHFIC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NHFIC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NHFIC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NHFIC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NHFIC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NHFIC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NHFIC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NHFIC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NHFIC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NHFIC] SET  MULTI_USER 
GO
ALTER DATABASE [NHFIC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NHFIC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NHFIC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NHFIC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NHFIC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NHFIC] SET QUERY_STORE = OFF
GO
USE [NHFIC]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [NHFIC]
GO
/****** Object:  Table [dbo].[BodyDataTypes]    Script Date: 29/03/2021 10:31:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BodyDataTypes](
	[id] [int] NOT NULL,
	[BodyType] [nchar](100) NOT NULL,
 CONSTRAINT [PK_BodyTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Channels]    Script Date: 29/03/2021 10:31:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Channels](
	[id] [int] NOT NULL,
	[Channel] [nchar](100) NOT NULL,
	[BodyTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Channels] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 29/03/2021 10:31:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[id] [int] NOT NULL,
	[CustomerId] [nchar](100) NOT NULL,
	[FirstName] [nchar](100) NOT NULL,
	[LastName] [nchar](100) NOT NULL,
	[Email] [nchar](100) NULL,
	[PreferredChanneld] [int] NOT NULL,
	[MessageTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FieldNames]    Script Date: 29/03/2021 10:31:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FieldNames](
	[id] [int] NOT NULL,
	[MessageTypeId] [int] NOT NULL,
	[FieldName] [nchar](100) NOT NULL,
 CONSTRAINT [PK_FieldNames] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessageTypes]    Script Date: 29/03/2021 10:31:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageTypes](
	[id] [int] NOT NULL,
	[MessageType] [nchar](100) NOT NULL,
 CONSTRAINT [PK_MessageTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vGetCustomerDetails]    Script Date: 29/03/2021 10:31:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vGetCustomerDetails]
AS
SELECT        c.id, c.CustomerId, c.FirstName, c.LastName, c.Email, c.PreferredChanneld, f.FieldName, t.MessageType, d.BodyType
FROM            dbo.FieldNames AS f INNER JOIN
                         dbo.MessageTypes AS t ON t.id = f.MessageTypeId INNER JOIN
                         dbo.Customers AS c ON c.MessageTypeId = f.MessageTypeId INNER JOIN
                         dbo.Channels AS ch ON ch.id = c.PreferredChanneld INNER JOIN
                         dbo.BodyDataTypes AS d ON d.id = ch.BodyTypeId
GO
ALTER TABLE [dbo].[Channels]  WITH CHECK ADD  CONSTRAINT [FK_Channels_BodyTypes] FOREIGN KEY([BodyTypeId])
REFERENCES [dbo].[BodyDataTypes] ([id])
GO
ALTER TABLE [dbo].[Channels] CHECK CONSTRAINT [FK_Channels_BodyTypes]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Channels] FOREIGN KEY([MessageTypeId])
REFERENCES [dbo].[Channels] ([id])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Channels]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_MessageTypes] FOREIGN KEY([id])
REFERENCES [dbo].[MessageTypes] ([id])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_MessageTypes]
GO
ALTER TABLE [dbo].[FieldNames]  WITH CHECK ADD  CONSTRAINT [FK_FieldNames_MessageTypes] FOREIGN KEY([MessageTypeId])
REFERENCES [dbo].[MessageTypes] ([id])
GO
ALTER TABLE [dbo].[FieldNames] CHECK CONSTRAINT [FK_FieldNames_MessageTypes]
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
         Begin Table = "f"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
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
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 642
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ch"
            Begin Extent = 
               Top = 6
               Left = 680
               Bottom = 119
               Right = 850
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 6
               Left = 888
               Bottom = 102
               Right = 1058
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetCustomerDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetCustomerDetails'
GO
USE [master]
GO
ALTER DATABASE [NHFIC] SET  READ_WRITE 
GO

USE [NHFIC]
GO

INSERT INTO BodyDataTypes (id, BodyType)
VALUES (1, 'CSV'), (2, 'JSON'),(3, 'XML')
GO

INSERT INTO Channels (id, Channel, BodyTypeId)
VALUES (1, 'SMS', 1), (2, 'Email', 1), (3, 'HTTP', 1), (4, 'FTP', 1)
GO

INSERT INTO MessageTypes (id, MessageType)
VALUES (1, 'UserDeleted'), (2, 'UserBlocked'), (3, 'NewUserRegistered')
GO

INSERT INTO FieldNames (id, MessageTypeId, FieldName)
VALUES (1, 3, 'UserId'), (2, 3, 'FirstName'), (3, 3, 'LastName'), (4, 3, 'Email'), (5, 1, 'UserId'), (6, 2, 'UserId')
GO

INSERT INTO Customers (id, CustomerId, FirstName, LastName, Email, PreferredChanneld, MessageTypeId)
VALUES (1, 1, 'will', 'triemstra', 'will@gmail.com', 1, 3), (2, 1, 'tom', 'messi', 'tom@gmail.com', 1, 2), (3, 1, 'nick', 'ronaldo', 'nick@gmail.com', 2, 1)
GO


