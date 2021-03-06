USE [master]
GO
/****** Object:  Database [RépertoireTéléphoniqueDB]    Script Date: 08/04/2018 23:04:33 ******/
CREATE DATABASE [RépertoireTéléphoniqueDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RépertoireTéléphoniqueDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\RépertoireTéléphoniqueDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RépertoireTéléphoniqueDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\RépertoireTéléphoniqueDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RépertoireTéléphoniqueDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET RECOVERY FULL 
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET  MULTI_USER 
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'RépertoireTéléphoniqueDB', N'ON'
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET QUERY_STORE = OFF
GO
USE [RépertoireTéléphoniqueDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
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
USE [RépertoireTéléphoniqueDB]
GO
/****** Object:  Table [dbo].[RepertoireTelephonique]    Script Date: 08/04/2018 23:04:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepertoireTelephonique](
	[REP_ID] [int] IDENTITY(1,1) NOT NULL,
	[REP_Prenom] [varchar](50) NULL,
	[REP_Nom] [varchar](50) NULL,
	[REP_Contact] [varchar](50) NULL,
	[REP_Email] [varchar](50) NULL,
	[REP_Adresse] [varchar](250) NULL,
 CONSTRAINT [PK_RepertoireTelephonique] PRIMARY KEY CLUSTERED 
(
	[REP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RepertoireTelephonique] ON 
GO
INSERT [dbo].[RepertoireTelephonique] ([REP_ID], [REP_Prenom], [REP_Nom], [REP_Contact], [REP_Email], [REP_Adresse]) VALUES (1, N'Steve0316', N'Austin', N'9368585', N'steve123@gmail.com', N'address goes herer')
GO
INSERT [dbo].[RepertoireTelephonique] ([REP_ID], [REP_Prenom], [REP_Nom], [REP_Contact], [REP_Email], [REP_Adresse]) VALUES (2, N'John', N'Morrison', N'5432424', N'j.morrison@gmail.com', N'address 124')
GO
SET IDENTITY_INSERT [dbo].[RepertoireTelephonique] OFF
GO
/****** Object:  StoredProcedure [dbo].[ContactAddOrEdit]    Script Date: 08/04/2018 23:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ContactAddOrEdit]
    @REP_ID INT,
    @REP_Prenom VARCHAR(50),
    @REP_Nom VARCHAR(50),
    @REP_Contact VARCHAR(50),
    @REP_Email VARCHAR(50),
    @REP_Adresse VARCHAR(250)
AS
IF @REP_ID = 0
BEGIN
    INSERT INTO RepertoireTelephonique
    (
        REP_Prenom,
        REP_Nom,
        REP_Contact,
        REP_Email,
        REP_Adresse
    )
    VALUES
    (@REP_Prenom, @REP_Nom, @REP_Contact, @REP_Email, @REP_Adresse);
END;
ELSE
BEGIN
    UPDATE RepertoireTelephonique
    SET REP_Prenom = @REP_Prenom,
        REP_Nom = @REP_Nom,
        REP_Contact = @REP_Contact,
        REP_Email = @REP_Email,
        REP_Adresse = @REP_Adresse
    WHERE REP_ID = @REP_ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[ContactsDeleteByID]    Script Date: 08/04/2018 23:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ContactsDeleteByID] @REP_ID INT
AS
DELETE FROM RepertoireTelephonique
WHERE REP_ID = @REP_ID
GO
/****** Object:  StoredProcedure [dbo].[RechercheContactsParValeur]    Script Date: 08/04/2018 23:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[RechercheContactsParValeur] @SearchValue VARCHAR(50)
AS
SELECT *
FROM RepertoireTelephonique
WHERE REP_Prenom LIKE '%' + @SearchValue + '%'
      OR REP_Nom LIKE '%' + @SearchValue + '%';
GO
/****** Object:  StoredProcedure [dbo].[SelectAllContacts]    Script Date: 08/04/2018 23:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectAllContacts]
AS
	SELECT *
	FROM RepertoireTelephonique
GO
/****** Object:  StoredProcedure [dbo].[SelectContactsByID]    Script Date: 08/04/2018 23:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectContactsByID] @REP_ID INT
AS
SELECT *
FROM RepertoireTelephonique
WHERE REP_ID = @REP_ID;
GO
USE [master]
GO
ALTER DATABASE [RépertoireTéléphoniqueDB] SET  READ_WRITE 
GO