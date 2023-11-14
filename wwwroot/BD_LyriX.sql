USE [master]
GO
/****** Object:  Database [BD_LyriX]    Script Date: 14/11/2023 10:03:22 ******/
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
/****** Object:  User [alumno]    Script Date: 14/11/2023 10:03:22 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Albumes]    Script Date: 14/11/2023 10:03:22 ******/
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
/****** Object:  Table [dbo].[Artistas]    Script Date: 14/11/2023 10:03:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artistas](
	[IdArtista] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
	[FotoArtista] [varchar](2000) NOT NULL,
	[FotoDescrpcion] [varchar](2000) NOT NULL,
	[Instagram] [varchar](50) NULL,
	[Twitter] [varchar](50) NULL,
 CONSTRAINT [PK_Artistas] PRIMARY KEY CLUSTERED 
(
	[IdArtista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Canciones]    Script Date: 14/11/2023 10:03:22 ******/
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
/****** Object:  Table [dbo].[Usuarios]    Script Date: 14/11/2023 10:03:22 ******/
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
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (1, N'Tyga', N'Michael Ray Nguyen-Stevenson, más conocido como Tyga, es un rapero estadounidense. Es dueño de la compañía Last Kings. Su nombre artístico proviene del acrónimo Thank You God Always', N'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Tyga_-_Openair_Frauenfeld_2019_02.jpg/800px-Tyga_-_Openair_Frauenfeld_2019_02.jpg', N'https://img.buzzfeed.com/buzzfeed-static/complex/images/a0rppp8bocgbzwdpv8m6/tyga-getty-nicholas-hunt.jpg?output-format=jpg&output-quality=auto', N'@tyga', N'@tyga')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (2, N'Drake', N'Aubrey Drake Graham, conocido simplemente como Drake, es un rapero, cantante, compositor, productor discográfico y actor canadiense. Una figura influyente en la música popular contemporánea, Drake ha sido acreditado por popularizar el canto y la sensibilidad del R&B en el hip hop.', N'https://media.vogue.es/photos/5ec167fb62e90b6607c1716e/1:1/w_1332,h_1332,c_limit/002-Drake-vogue-130520-credit-Getty-Images.jpg', N'https://people.com/thmb/OW708r1rrDCdKf5M1ZmDxNA1Nhs=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(801x278:803x280)/drake-taking-break-from-music-100623-tout-3a6192c616a54158942ab8a652e9a13a.jpg', N'@Drake', N'@Drake')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (3, N'Cardi B', N'Belcalis Marlenis Almánzar, más conocida por su nombre artístico Cardi B, es una cantante, rapera, compositora, actriz y empresaria estadounidense.', N'https://d.newsweek.com/en/full/2014014/cardi-b.jpg?w=1600&h=1600&q=88&f=21cb8fa9b4ba227411e6eb21cdb0fad8', N'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2023-02/cardi-b-premios-ascap-2019-fe8656.jpg', N'@Cardib', N'@Cardib')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (4, N'Bad Bunny', N'Benito Antonio Martínez Ocasio, ? conocido artísticamente como Bad Bunny o El Conejo Malo, ? es un cantante, compositor, productor musical, luchador profesional y actor puertorriqueño.??', N'https://estaticos-cdn.elperiodico.com/clip/ab473244-92c8-4b86-ae51-770bfcde731d_alta-libre-aspect-ratio_default_0.jpg', N'https://hips.hearstapps.com/hmg-prod/images/bad-bunny-1672827485.jpg?crop=1xw:0.604248046875xh;center,top&resize=1200:*', N'@badBunny', N'@badBunny')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (5, N'J Balvin', N'José Álvaro Osorio Balvin, mejor conocido como J Balvin, es un cantante y productor colombiano, reconocido como uno de los artistas latinos más vendidos del mundo, con ventas de treinta y cinco millones de álbumes y sencillos a nivel mundial.', N'https://yt3.googleusercontent.com/fvB6uAUND3RPAuus_7gmFkGIwbV_DaSwfRhO_9ChUlZzRQHkx0uwYtuKjeCE5EtbwqcAdqMW5g=s900-c-k-c0x00ffffff-no-rj', N'https://yt3.googleusercontent.com/fvB6uAUND3RPAuus_7gmFkGIwbV_DaSwfRhO_9ChUlZzRQHkx0uwYtuKjeCE5EtbwqcAdqMW5g=s900-c-k-c0x00ffffff-no-rj', N'@Jbalvin', N'@Jbalvin')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (6, N'Jay - Z', N'Shawn Corey Carter, más conocido por su nombre artístico Jay-Z, es un rapero, productor, empresario y, ocasionalmente actor estadounidense. Es uno de los artistas de hip-hop más exitosos económicamente en Estados Unidos y mundialmente, y posee un patrimonio neto de más de US$1400 millones en 2021.', N'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/Jay-Z_2%2C_2011.jpg/800px-Jay-Z_2%2C_2011.jpg', N'https://ca-times.brightspotcdn.com/dims4/default/f6cfdae/2147483647/strip/true/crop/2500x1661+0+0/resize/1200x797!/quality/75/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fb2%2F98%2F8f479a374ef7b96b7fd4abd67f1a%2Fjay-z-fragrance-lawsuit-42912.jpg', N'@Jay', N'@Jay')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (7, N'Beyoncé', N'Beyoncé Giselle Knowles-Carter, ?? conocida simplemente como Beyoncé, es una cantautora, productora, actriz, directora, diseñadora y empresaria estadounidense.', N'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Beyonc%C3%A9_-_Tottenham_Hotspur_Stadium_-_1st_June_2023_%282_of_118%29_%2852946288505%29_%28slightly_cropped%29.jpg/1200px-Beyonc%C3%A9_-_Tottenham_Hotspur_Stadium_-_1st_June_2023_%282_of_118%29_%2852946288505%29_%28slightly_cropped%29.jpg', N'https://phantom-telva.unidadeditorial.es/97aba4e58dfd17afe48d0d48ff157951/resize/828/f/jpg/assets/multimedia/imagenes/2023/05/12/16838909742304.jpg', N'@Beyoncé', N'@Beyoncé')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (8, N'DJ Khaled', N'Khaled Mohamed Khaled ? es un productor discográfico, personalidad de radio, DJ y ejecutivo discográfico estadounidense descendiente de palestinos. Fue miembro del grupo de hip hop Terror Squad', N'https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/DJ_KHALED_Press_exclusive_-1_%28cropped%29.jpg/1200px-DJ_KHALED_Press_exclusive_-1_%28cropped%29.jpg', N'https://m.media-amazon.com/images/M/MV5BMTYyODQ4NDE2MV5BMl5BanBnXkFtZTgwNTQxNDMwODE@._V1_.jpg', N'@DJKhaled', N'@DJKhaled')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (9, N'Justin Bieber', N'Justin Drew Bieber, conocido popularmente y a nivel mundial como Justin Bieber, es un cantante canadiense establecido en Estados Unidos que con el paso de los años ha ganado fama y dinero por sus producciones discográficas y giras musicales por el mundo entero.', N'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Justin-Bieber.jpg/220px-Justin-Bieber.jpg', N'https://aws-modapedia.vogue.es/prod/designs/v1/assets/640x929/1089.jpg', N'@JustinBieber', N'@JustinBieber')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (10, N'Chance The Rapper', N'Chancelor Jonathan Bennett (Chicago, Illinois, 16 de abril de 1993), más conocido por su nombre artístico, Chance The Rapper, es un rapero, cantante, compositor estadounidense, y productor del barrio de West Chatham, Chicago, Illinois.', N'https://github.com/chinocapo211/LyriX/blob/main/wwwroot/img/rap/chance-the-rapper-desc.jpg?raw=true', N'https://ca-times.brightspotcdn.com/dims4/default/853b0ac/2147483647/strip/false/crop/1536x2048+0+0/resize/1115x1486!/quality/75/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fa4%2F63%2F4c2b200141e7ba021632a8f679af%2F1341979-et-chance-the-rapper-14.jpg', N'@Chance', N'@Chance')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (11, N'Quavo', N'Quavious Keyate Marshall (Athens, Georgia; 2 de abril de 1991), conocido profesionalmente como Quavo, es un rapero, cantante y compositor estadounidense. Es más bien conocido como miembro del grupo de hip-hop Migos. Quavo está relacionado con los otros dos miembros del grupo, siendo el primo de Offset y el tío de Takeoff.1?', N'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Quavo_%2851914439436%29_%28cropped%29.jpg/220px-Quavo_%2851914439436%29_%28cropped%29.jpg', N'https://media.pitchfork.com/photos/5c985149da19914f941eb410/4:3/w_524,h_393,c_limit/Quavo.jpg', N'@Quavo', N'@Quavo')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (12, N'2Pac', N'(Tupac Amaru Shakur; Nueva York, 1971 -1996) Rapero estadounidense, probablemente el más influyente de la historia del género. Asesinado en plena juventud en circunstancias aún no esclarecidas, su prematura muerte truncó una carrera ascendente y contribuyó a elevarlo a la categoría de leyenda del rap.
', N'https://m.media-amazon.com/images/I/51hI0yXTEgS._AC_UF894,1000_QL80_.jpg', N'https://i.pinimg.com/736x/20/fd/c1/20fdc1451bc3464ddeb8f7836b771721.jpg', N'@2Pac', N'@2Pac')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (13, N'Biggie', N'Christopher George Latore Wallace, más conocido por su nombre artístico The Notorious B.I.G., Biggie Smalls o simplemente Biggie, fue un rapero y productor estadounidense.?? Es considerado como uno de los raperos más importantes de todos los tiempos, y de los más influyentes de la historia del rap.?', N'https://hips.hearstapps.com/hmg-prod/images/biggie_smalls_photo_by_clarence_davis_new_york_daily_news_archive_getty_97348258.jpg', N'https://i.scdn.co/image/1b4858fbd24046a81cace5ee18d19c868262b91f', N'@Biggie', N'@Biggie')
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
/****** Object:  StoredProcedure [dbo].[sp_CrearUsuario]    Script Date: 14/11/2023 10:03:22 ******/
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
