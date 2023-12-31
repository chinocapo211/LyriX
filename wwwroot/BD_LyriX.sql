USE [master]
GO
/****** Object:  Database [BD_LyriX]    Script Date: 28/11/2023 10:33:48 ******/
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
/****** Object:  User [alumno]    Script Date: 28/11/2023 10:33:48 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Albumes]    Script Date: 28/11/2023 10:33:48 ******/
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
/****** Object:  Table [dbo].[Artistas]    Script Date: 28/11/2023 10:33:48 ******/
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
/****** Object:  Table [dbo].[Canciones]    Script Date: 28/11/2023 10:33:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Canciones](
	[IdCancion] [int] NOT NULL,
	[NombreCancion] [varchar](500) NOT NULL,
	[Audio] [varchar](1000) NOT NULL,
	[FotoCancion] [varchar](500) NOT NULL,
	[IdArtista] [int] NOT NULL,
	[IdAlbum] [int] NULL,
 CONSTRAINT [PK_Canciones] PRIMARY KEY CLUSTERED 
(
	[IdCancion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 28/11/2023 10:33:48 ******/
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
INSERT [dbo].[Albumes] ([IdAlbum], [NombreAlbum], [FotoAlbum], [IdArtista]) VALUES (1, N'RadioDe2Pac', N'img\FotoAlbum\HipHop.png', 7)
INSERT [dbo].[Albumes] ([IdAlbum], [NombreAlbum], [FotoAlbum], [IdArtista]) VALUES (2, N'RadioDeBadBunny', N'img\FotoAlbum\Reggaeton.jpeg', 4)
INSERT [dbo].[Albumes] ([IdAlbum], [NombreAlbum], [FotoAlbum], [IdArtista]) VALUES (3, N'RadioDeLedZeppelin', N'img\FotoAlbum\Rock.jpg', 11)
INSERT [dbo].[Albumes] ([IdAlbum], [NombreAlbum], [FotoAlbum], [IdArtista]) VALUES (4, N'RadioDeDuki', N'img\FotoAlbum\Trap.jfif', 24)
GO
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (1, N'Tyga', N'Michael Ray Nguyen-Stevenson, más conocido como Tyga, es un rapero estadounidense. Es dueño de la compañía Last Kings. Su nombre artístico proviene del acrónimo Thank You God Always', N'img\FotosArtistas\Tyga_Img.jpg', N'img\FotosArtistas\Tyga_Desc.jfif', N'@tyga', N'@tyga')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (2, N'Drake', N'Aubrey Drake Graham, conocido simplemente como Drake, es un rapero, cantante, compositor, productor discográfico y actor canadiense. Una figura influyente en la música popular contemporánea, Drake ha sido acreditado por popularizar el canto y la sensibilidad del R&B en el hip hop.', N'img\FotosArtistas\Drake_Img.jfif', N'img\FotosArtistas\Drake_Desc.jpg', N'@Drake', N'@Drake')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (3, N'Cardi B', N'Belcalis Marlenis Almánzar, más conocida por su nombre artístico Cardi B, es una cantante, rapera, compositora, actriz y empresaria estadounidense.', N'img\FotosArtistas\CardiB_Img.jpg', N'img\FotosArtistas\CardiB_Desc.jpg', N'@Cardib', N'@Cardib')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (4, N'Bad Bunny', N'Benito Antonio Martínez Ocasio, ? conocido artísticamente como Bad Bunny o El Conejo Malo, ? es un cantante, compositor, productor musical, luchador profesional y actor puertorriqueño.??', N'img\FotosArtistas\BadBunny_Img.jpg', N'img\FotosArtistas\BadBunny_Desc.jpg', N'@badBunny', N'@badBunny')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (5, N'Jay - Z', N'Shawn Corey Carter, más conocido por su nombre artístico Jay-Z, es un rapero, productor, empresario y, ocasionalmente actor estadounidense. Es uno de los artistas de hip-hop más exitosos económicamente en Estados Unidos y mundialmente, y posee un patrimonio neto de más de US$1400 millones en 2021.', N'img\FotosArtistas\JayZ_Img.jpg', N'img\FotosArtistas\JayZ_Desc.jpg', N'@Jay', N'@Jay')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (6, N'DJ Khaled', N'Khaled Mohamed Khaled ? es un productor discográfico, personalidad de radio, DJ y ejecutivo discográfico estadounidense descendiente de palestinos. Fue miembro del grupo de hip hop Terror Squad', N'img\FotosArtistas\DjKhaled_Img.jpg', N'img\FotosArtistas\DjKhaled_Desc.jpg', N'@DJKhaled', N'@DJKhaled')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (7, N'2Pac', N'(Tupac Amaru Shakur; Nueva York, 1971 -1996) Rapero estadounidense, probablemente el más influyente de la historia del género. Asesinado en plena juventud en circunstancias aún no esclarecidas, su prematura muerte truncó una carrera ascendente y contribuyó a elevarlo a la categoría de leyenda del rap.
', N'img\FotosArtistas\2Pac_Img.jpg', N'img\FotosArtistas\2Pac_Desc.jpg', N'@2Pac', N'@2Pac')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (8, N'Biggie', N'Christopher George Latore Wallace, más conocido por su nombre artístico The Notorious B.I.G., Biggie Smalls o simplemente Biggie, fue un rapero y productor estadounidense.?? Es considerado como uno de los raperos más importantes de todos los tiempos, y de los más influyentes de la historia del rap.?', N'img\FotosArtistas\Biggie_Img.jpg', N'img\FotosArtistas\Biggie_Desc.jpeg', N'@Biggie', N'@Biggie')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (9, N'The Rolling Stones', N'The Rolling Stones, más conocido en el mundo hispanohablante como los Rolling Stones, ? es un grupo británico de rock originario de Londres.', N'img\FotosArtistas\RollingStones_Img.jpg', N'img\FotosArtistas\RollingStones_Desc.jfif', N'@RollingStones', N'@RollingStones')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (10, N'Aretha Franklin', N'Aretha Louise Franklin ??? fue una cantante estadounidense de soul, R&B y góspel. Apodada «Lady Soul» o «Queen of soul», fue la máxima representante de dicho género. De acuerdo con la revista Rolling Stone es la cantante más grande de toda la historia, y la mayor exponente de la música en general.', N'img\FotosArtistas\Aretha_Img.jpg', N'img\FotosArtistas\Aretha_Desc.jpeg', N'@Aretha', N'@Aretha')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (11, N'Led Zeppelin', N'Led Zeppelin fue un grupo británico de rock fundado en Londres en 1968 por el guitarrista Jimmy Page, quien había pertenecido a The Yardbirds. La banda estuvo integrada por Jimmy Page en la guitarra, John Paul Jones como bajista y tecladista, el vocalista Robert Plant y John Bonham en la batería.', N'img\FotosArtistas\LedZeppelin_Img.jpg', N'img\FotosArtistas\LedZeppelin_Desc.jfif', N'@Led', N'@Led')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (12, N'Bod Dylan', N'Bob Dylan, ? registrado al nacer como Robert Allen Zimmerman, es un músico, compositor, cantante y poeta estadounidense, ampliamente considerado como una de las figuras más prolíficas e influyentes en la música popular del siglo XX y de comienzos del siglo XXI.??? En 2016 recibió el Premio Nobel de Literatura.', N'img\FotosArtistas\BobDylan_Img.jpg', N'img\FotosArtistas\BobDylan_Desc.jpg', N'@Bob', N'@Bob')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (13, N'Bruce Springsteen', N'Bruce Frederick Joseph Springsteen ? es un cantante, guitarrista y compositor estadounidense. Apodado a menudo the Boss —en español: «el Jefe»—, Springsteen es ampliamente conocido por su trabajo con el grupo E Street Band', N'img\FotosArtistas\Bruce_Img.jpg', N'img\FotosArtistas\Bruce_Desc.jpg', N'@Bruce', N'@Bruce')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (14, N'The Eagles ', N'Eagles es una banda estadounidense de country rock y hard rock formada en Los Ángeles, California, EE. UU., en 1971. La banda se separó en 1980, volviéndose a juntar en 1994, tocando hasta 2016, tras la muerte de uno de los fundadores y vocalista, Glenn Frey.?', N'img\FotosArtistas\TheEagles_Img.jpg', N'img\FotosArtistas\TheEagles_Desc.jpg', N'@TheEagles', N'@TheEagles')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (15, N'The Doors', N'The Doors fue una banda del Rock psicodélico estadounidense, formada en Los Ángeles, California en julio de 1965 y disuelta en 1973. Aunque la carrera de The Doors terminó en 1973 por la muerte de Jim Morrison, su popularidad ha persistido.?', N'img\FotosArtistas\TheDoors_Img.jfif', N'img\FotosArtistas\TheDoors_Desc.jpg', N'@TheDoors', N'@TheDoors')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (16, N'The Beach Boys', N'The Beach Boys es una banda de rock formada en la ciudad estadounidense de Hawthorne, Los Ángeles en el año 1961. Distinguidos por sus armonías vocales, son uno de los grupos más influyentes de la era del rock and roll.', N'img\FotosArtistas\BeachBoys_Img.png', N'img\FotosArtistas\BeachBoys_Desc.jpg', N'@BeachBoys', N'@BeachBoys')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (17, N'The Beatles', N'The Beatles, más conocido en el mundo hispano como los Beatles, fue un grupo de rock británico formado en Liverpool durante los años 1960. Desde 1962 hasta su separación en 1970 estuvo integrado por John Lennon, Paul McCartney, George Harrison y Ringo Starr.', N'img\FotosArtistas\TheBeatles_Img.jpg', N'img\FotosArtistas\TheBeatles_Desc.jpg', N'@TheBeatles', N'@TheBeatles')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (18, N'John Lennon', N'John Winston Lennon fue un artista, músico, cantautor, actor, activista, compositor, productor, escritor y pacifista británico, conocido por ser el líder y fundador de la banda de rock The Beatles y considerado uno de los artistas más influyentes del siglo XX.', N'img\FotosArtistas\Lennon_Img.jpg', N'img\FotosArtistas\Lennon_Desc.jfif', N'@JohnLennon', N'@JohnLennon')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (19, N'Khea', N'Ivo Alfredo Thomas Serue, conocido artísticamente como Khea, es un rapero, cantante y compositor argentino.', N'img\FotosArtistas\Khea_Img.jpg', N'img\FotosArtistas\Khea_Desc.png', N'@Khea', N'@Khea')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (20, N'Travis Scott', N'Jacques Berman Webster II, ? conocido artísticamente como Travis Scott, es un rapero, compositor y productor musical estadounidense.', N'img\FotosArtistas\TravisScott_Img.jpg', N'img\FotosArtistas\TravisScott_Desc.jpg', N'@Travis', N'@Travis')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (21, N'Playboi Carti', N'Jordan Terrell Carter, conocido por su nombre artístico Playboi Carti, es un rapero, cantante, compositor y productor estadounidense. Actualmente firma con el sello OPIUM.?', N'img\FotosArtistas\Carti_Img.jpg', N'img\FotosArtistas\Carti_Desc.jpg', N'@Carti', N'@Carti')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (22, N'Bhavi', N'Bhavi es un cantante de trap nacido como Indra Bhalavan en Bélgica, el 22 de octubre de 1997, y radicado en Argentina. En 2017 comenzó a grabar y al poco tiempo se conectó con Mueva Records, la productora con la cual trabaja.', N'img\FotosArtistas\Bhavi_Img.jpg', N'img\FotosArtistas\Bhavi_Desc.jpg', N'@Bhavi', N'@Bhavi')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (23, N'YSY A', N'Alejo Nahuel Acosta, conocido artísticamente como YSY A, ? es un rapero, productor, freestyler, y diseñador argentino.?Alejo Acosta se hizo conocido en 2013 cuando formó la competencia de rap El Quinto Escalón con apenas 13 años, junto al músico y presentador Muphasa MC.', N'img\FotosArtistas\Ysy_Img.jpg', N'img\FotosArtistas\Ysy_Desc.jpg', N'@YSY', N'@YSY')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (24, N'Duki', N'Mauro Ezequiel Lombardo Quiroga, conocido artísticamente como Duki, es un rapero y compositor argentino.?', N'img\FotosArtistas\Duki_Img.png', N'img\FotosArtistas\Duki_Desc.jpg', N'@Duki', N'@Duki')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (25, N'Lil Uzi Vert', N'Symere Woods, conocido en el mundo artístico como Lil Uzi Vert, es un rapero, cantante y compositor. Nació el 31 de julio de 1994 en Filadelfia, Pennsylvania, Estados Unidos. Lil Uzi obtuvo reconocimiento tras el lanzamiento del mixtape comercial “Luv Is Rage” (2015), que llevó a un contrato de grabación con Atlantic Records, a quien firmó bajo el apoyo de DJ Drama con el sello Generation Now.
', N'img\FotosArtistas\Uzi_Img.png', N'img\FotosArtistas\Uzi_Desc.jpg', N'@Uzi', N'@Uzi')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (26, N'Karol G', N'Carolina Giraldo Navarro, conocida artísticamente como Karol G, es una cantante, compositora y productora? Colombiana.', N'img\FotosArtistas\Karol_Img.jfif', N'img\FotosArtistas\Karol_Desc.jpg', N'@Karol', N'@Karol')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (27, N'Rauw Alejandro', N'Raúl Alejandro Ocasio Ruiz, conocido artísticamente como Rauw Alejandro, es un cantante, compositor, productor discográfico y bailarín puertorriqueño. Pertenece a la «nueva generación» de músicos urbanos puertorriqueños.?', N'img\FotosArtistas\Rauw_Img.jpg', N'img\FotosArtistas\Rauw_Desc.jpg', N'@Rauw', N'@Rauw')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (28, N'Myke Towers', N'Michael Anthony Torres Monge, conocido por su nombre artístico Myke Towers, es un cantante y compositor puertorriqueño.', N'img\FotosArtistas\Myke_Img.jpg', N'img\FotosArtistas\Myke_Desc.jfif', N'@Myke', N'@Myke')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (29, N'Jay Balvin', N'José Álvaro Osorio Balvin, mejor conocido como J Balvin, es un cantante y productor colombiano, reconocido como uno de los artistas latinos más vendidos del mundo, con ventas de treinta y cinco millones de álbumes y sencillos a nivel mundial.???', N'img\FotosArtistas\Jay_Img.jpg', N'img\FotosArtistas\Jay_Desc.jpeg', N'@JayBalvin', N'@JayBalvin')
GO
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (1, N'Apeshit', N'audio\rap\Beyonce & JAY-Z - Apeshit (Lyrics) ft. The Carters.mp3', N'img\FotoCancion\Apeshit.jpg', 5, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (2, N'Big Poppa (2007 Remaster)', N'audio\rap\Big Poppa (2007 Remaster).mp3', N'img\FotoCancion\Big Poppa (Remaster 2007).jpg', 8, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (3, N'California Love (Original Version)', N'audio\rap\California Love (Original Version).mp3', N'img\FotoCancion\California Love.jfif', 7, 1)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (4, N'Be Careful [Official Audio]', N'audio\rap\Cardi B - Be Careful [Official Audio].mp3', N'img\FotoCancion\Be Careful.png', 3, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (5, N'I Like It [Official Audio]', N'audio\rap\Cardi B Bad Bunny & J Balvin - I Like It [Official Audio].mp3', N'img\FotoCancion\Cardi_B-I_Like_It.png', 3, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (6, N'Hit ´Em Up ', N'audio\rap\Hit ''Em Up.mp3', N'img\FotoCancion\Hit Em Up.jpg', 7, 1)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (7, N'In My Feelings', N'audio\rap\In My Feelings.mp3', N'img\FotoCancion\In My Feelings.jpg', 2, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (8, N'No Brainer', N'audio\rap\no-brainer.mp3', N'img\FotoCancion\No Brainer.jpg', 6, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (9, N'Taste', N'audio\rap\Taste.mp3', N'img\FotoCancion\Taste.jfif', 1, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (10, N'Born-To-Run', N'audio\rock\born-to-run.mp3', N'img\FotoCancion\born-to-run.jpg', 13, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (11, N'Good-Vibrations', N'audio\rock\good-vibrations.mp3', N'img\FotoCancion\Good_Vibrations_single.jpg', 16, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (12, N'Hotel California', N'audio\rock\hotel-california.mp3', N'img\FotoCancion\Hotelcalifornia.jpg', 14, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (13, N'Imagine', N'audio\rock\imagine.mp3', N'img\FotoCancion\Imagine.jfif', 18, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (14, N'Light My Fire', N'audio\rock\light-my-fire.mp3', N'img\FotoCancion\Light My Fire.jpg', 15, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (15, N'Like A Rolling Stone', N'audio\rock\like-a-rolling-stone.mp3', N'img\FotoCancion\Like A Rolling Stone.jpg', 12, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (16, N'Respect', N'audio\rock\respect.mp3', N'img\FotoCancion\Respect.jfif', 10, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (17, N'Satisfaction', N'audio\rock\satisfaction.mp3', N'img\FotoCancion\Satisfaction.jfif', 9, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (18, N'Stairway To Heaven', N'audio\rock\stairway-to-heaven.mp3', N'img\FotoCancion\Stairway To Heaven.jpg', 11, 3)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (19, N'20 Mins', N'audio\trap\20-min.mp3', N'img\FotoCancion\20 mins.jfif', 25, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (20, N'A Por Todo', N'audio\trap\a-por-todo.mp3', N'img\FotoCancion\A por todo.png', 23, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (21, N'Givenchy', N'audio\trap\givenchy.mp3', N'img\FotoCancion\Givenchy.jfif', 24, 4)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (22, N'Harakiri', N'audio\trap\harakiri.mp3', N'img\FotoCancion\Harakiri.jfif', 24, 4)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (23, N'Jimmy Cooks', N'audio\trap\jimmy-cooks.mp3', N'img\FotoCancion\Jimmy Cooks.png', 2, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (24, N'La Mirada', N'audio\trap\la-mirada.mp3', N'img\FotoCancion\La mirada.png', 22, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (25, N'Loca', N'audio\trap\loca.mp3', N'img\FotoCancion\Loca.jfif', 19, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (26, N'Magnolia', N'audio\trap\magnolia.mp3', N'img\FotoCancion\Magnolia.jpg', 21, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (27, N'Pintao', N'audio\trap\pintao.mp3', N'img\FotoCancion\Pintao.jfif', 23, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (28, N'Sicko Mode', N'audio\trap\sicko-mode.mp3', N'img\FotoCancion\Sicko Mode.jpg', 20, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (29, N'Volvi', N'audio\reggaeton\Aventura Bad Bunny - Volví (Video Oficial).mp3', N'img\FotoCancion\Volvi.jpg', 4, 2)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (30, N'Yonaguni', N'audio\reggaeton\Bad Bunny - Yonaguni (Video Oficial).mp3', N'img\FotoCancion\Yonaguni.jpg', 4, 2)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (31, N'Dakiti', N'audio\reggaeton\BAD BUNNY x JHAY CORTEZ - DÁKITI (Video Oficial).mp3', N'img\FotoCancion\Dakiti.jpg', 4, 2)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (32, N'Que mas pues', N'audio\reggaeton\J. Balvin Maria Becerra - Qué Más Pues (Official Video).mp3', N'img\FotoCancion\Que mas pues.jfif', 29, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (33, N'Bichota', N'audio\reggaeton\KAROL G - BICHOTA.mp3', N'img\FotoCancion\Bichota.jfif', 26, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (34, N'La Nota', N'audio\reggaeton\La Nota - MTZ Manuel Turizo x Rauw Alejandro x Myke Towers Video Oficial.mp3', N'img\FotoCancion\La Nota.jfif', 28, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (35, N'Bandido', N'audio\reggaeton\Myke Towers x @JuhnTV - BANDIDO (Video Oficial).mp3', N'img\FotoCancion\Bandido.jfif', 28, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (36, N'Todo De Ti', N'audio\reggaeton\Rauw Alejandro - Todo de Ti (Video Oficial).mp3', N'img\FotoCancion\Todo De Ti.jfif', 27, NULL)
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
/****** Object:  StoredProcedure [dbo].[sp_CrearUsuario]    Script Date: 28/11/2023 10:33:48 ******/
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
