USE [master]
GO
/****** Object:  Database [BD_LyriX]    Script Date: 7/11/2023 10:46:56 ******/
CREATE DATABASE [BD_LyriX]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_LyriX', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BD_LyriX.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD_LyriX_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BD_LyriX_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BD_LyriX] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_LyriX].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_LyriX] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_LyriX] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_LyriX] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_LyriX] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_LyriX] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_LyriX] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BD_LyriX] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_LyriX] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_LyriX] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_LyriX] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_LyriX] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_LyriX] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_LyriX] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_LyriX] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_LyriX] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BD_LyriX] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_LyriX] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_LyriX] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_LyriX] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_LyriX] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_LyriX] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_LyriX] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_LyriX] SET RECOVERY FULL 
GO
ALTER DATABASE [BD_LyriX] SET  MULTI_USER 
GO
ALTER DATABASE [BD_LyriX] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_LyriX] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_LyriX] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_LyriX] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BD_LyriX] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BD_LyriX', N'ON'
GO
ALTER DATABASE [BD_LyriX] SET QUERY_STORE = OFF
GO
USE [BD_LyriX]
GO
/****** Object:  User [alumno]    Script Date: 7/11/2023 10:46:56 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Albumes]    Script Date: 7/11/2023 10:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Albumes](
	[IdAlbum] [int] NOT NULL,
	[NombreAlbum] [varchar](50) NOT NULL,
	[FotoAlbum] [varchar](50) NOT NULL,
	[IdArtista] [int] NOT NULL,
 CONSTRAINT [PK_Albumes] PRIMARY KEY CLUSTERED 
(
	[IdAlbum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Artistas]    Script Date: 7/11/2023 10:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artistas](
	[IdArtista] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[FotoArtista] [varchar](50) NOT NULL,
	[FotoDescrpcion] [varchar](50) NOT NULL,
	[Instagram] [varchar](50) NOT NULL,
	[Twitter] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Artistas] PRIMARY KEY CLUSTERED 
(
	[IdArtista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Canciones]    Script Date: 7/11/2023 10:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Canciones](
	[IdCancion] [int] NOT NULL,
	[NombreCancion] [varchar](50) NOT NULL,
	[Audio] [varchar](50) NOT NULL,
	[FotoCancion] [varchar](50) NOT NULL,
	[IdArtista] [int] NOT NULL,
	[IdAlbum] [int] NOT NULL,
 CONSTRAINT [PK_Canciones] PRIMARY KEY CLUSTERED 
(
	[IdCancion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 7/11/2023 10:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [varchar](50) NOT NULL,
	[Contrasenia] [varchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Mail] [varchar](50) NOT NULL,
	[FotoUsuario] [varchar](50) NULL,
	[Descripcion] [varchar](50) NULL,
	[Instagram] [varchar](50) NULL,
	[Twitter] [varchar](50) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([IdUsuario], [NombreUsuario], [Contrasenia], [FechaNacimiento], [Mail], [FotoUsuario], [Descripcion], [Instagram], [Twitter]) VALUES (1, N'chino', N'contra', CAST(N'2007-03-12' AS Date), N'felipeblaustein@gmail.com', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Albumes]  WITH CHECK ADD  CONSTRAINT [FK_Albumes_Artistas] FOREIGN KEY([IdArtista])
REFERENCES [dbo].[Artistas] ([IdArtista])
GO
ALTER TABLE [dbo].[Albumes] CHECK CONSTRAINT [FK_Albumes_Artistas]
GO
ALTER TABLE [dbo].[Canciones]  WITH CHECK ADD  CONSTRAINT [FK_Canciones_Albumes] FOREIGN KEY([IdAlbum])
REFERENCES [dbo].[Albumes] ([IdAlbum])
GO
ALTER TABLE [dbo].[Canciones] CHECK CONSTRAINT [FK_Canciones_Albumes]
GO
ALTER TABLE [dbo].[Canciones]  WITH CHECK ADD  CONSTRAINT [FK_Canciones_Artistas] FOREIGN KEY([IdArtista])
REFERENCES [dbo].[Artistas] ([IdArtista])
GO
ALTER TABLE [dbo].[Canciones] CHECK CONSTRAINT [FK_Canciones_Artistas]
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearUsuario]    Script Date: 7/11/2023 10:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CrearUsuario]
@Usuario varchar(50), @Email varchar(50), @FechaNacimiento Date, @Contra varchar(50)
AS
BEGIN
INSERT INTO Usuarios(NombreUsuario, Mail, FechaNacimiento, Contrasenia) VALUES(@Usuario, @Email, @FechaNacimiento, @Contra)
END
GO
USE [master]
GO
ALTER DATABASE [BD_LyriX] SET  READ_WRITE 
GO
