USE [master]
GO
/****** Object:  Database [BD_LyriX]    Script Date: 21/11/2023 10:39:53 ******/
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
/****** Object:  User [alumno]    Script Date: 21/11/2023 10:39:53 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Albumes]    Script Date: 21/11/2023 10:39:53 ******/
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
/****** Object:  Table [dbo].[Artistas]    Script Date: 21/11/2023 10:39:53 ******/
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
/****** Object:  Table [dbo].[Canciones]    Script Date: 21/11/2023 10:39:53 ******/
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
/****** Object:  Table [dbo].[Usuarios]    Script Date: 21/11/2023 10:39:53 ******/
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
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (5, N'Jay - Z', N'Shawn Corey Carter, más conocido por su nombre artístico Jay-Z, es un rapero, productor, empresario y, ocasionalmente actor estadounidense. Es uno de los artistas de hip-hop más exitosos económicamente en Estados Unidos y mundialmente, y posee un patrimonio neto de más de US$1400 millones en 2021.', N'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/Jay-Z_2%2C_2011.jpg/800px-Jay-Z_2%2C_2011.jpg', N'https://ca-times.brightspotcdn.com/dims4/default/f6cfdae/2147483647/strip/true/crop/2500x1661+0+0/resize/1200x797!/quality/75/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fb2%2F98%2F8f479a374ef7b96b7fd4abd67f1a%2Fjay-z-fragrance-lawsuit-42912.jpg', N'@Jay', N'@Jay')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (6, N'DJ Khaled', N'Khaled Mohamed Khaled ? es un productor discográfico, personalidad de radio, DJ y ejecutivo discográfico estadounidense descendiente de palestinos. Fue miembro del grupo de hip hop Terror Squad', N'https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/DJ_KHALED_Press_exclusive_-1_%28cropped%29.jpg/1200px-DJ_KHALED_Press_exclusive_-1_%28cropped%29.jpg', N'https://m.media-amazon.com/images/M/MV5BMTYyODQ4NDE2MV5BMl5BanBnXkFtZTgwNTQxNDMwODE@._V1_.jpg', N'@DJKhaled', N'@DJKhaled')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (7, N'2Pac', N'(Tupac Amaru Shakur; Nueva York, 1971 -1996) Rapero estadounidense, probablemente el más influyente de la historia del género. Asesinado en plena juventud en circunstancias aún no esclarecidas, su prematura muerte truncó una carrera ascendente y contribuyó a elevarlo a la categoría de leyenda del rap.
', N'https://m.media-amazon.com/images/I/51hI0yXTEgS._AC_UF894,1000_QL80_.jpg', N'https://i.pinimg.com/736x/20/fd/c1/20fdc1451bc3464ddeb8f7836b771721.jpg', N'@2Pac', N'@2Pac')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (8, N'Biggie', N'Christopher George Latore Wallace, más conocido por su nombre artístico The Notorious B.I.G., Biggie Smalls o simplemente Biggie, fue un rapero y productor estadounidense.?? Es considerado como uno de los raperos más importantes de todos los tiempos, y de los más influyentes de la historia del rap.?', N'https://hips.hearstapps.com/hmg-prod/images/biggie_smalls_photo_by_clarence_davis_new_york_daily_news_archive_getty_97348258.jpg', N'https://i.scdn.co/image/1b4858fbd24046a81cace5ee18d19c868262b91f', N'@Biggie', N'@Biggie')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (9, N'The Rolling Stones', N'The Rolling Stones, más conocido en el mundo hispanohablante como los Rolling Stones, ? es un grupo británico de rock originario de Londres.', N'https://upload.wikimedia.org/wikipedia/commons/1/10/The_Rolling_Stones_Summerfest_in_Milwaukee_-_2015.jpg', N'https://brandemia.org/contenido/subidas/2012/07/the-rolling-stones-logo.webp', N'@RollingStones', N'@RollingStones')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (10, N'Aretha Franklin', N'Aretha Louise Franklin ??? fue una cantante estadounidense de soul, R&B y góspel. Apodada «Lady Soul» o «Queen of soul», fue la máxima representante de dicho género. De acuerdo con la revista Rolling Stone es la cantante más grande de toda la historia, y la mayor exponente de la música en general.', N'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Aretha_Franklin_1968.jpg/800px-Aretha_Franklin_1968.jpg', N'https://historia.nationalgeographic.com.es/medio/2022/03/18/aretha-franklin-en-el-ano-1960_6d2689e5_550x641.jpeg', N'@Aretha', N'@Aretha')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (11, N'Led Zeppelin', N'Led Zeppelin fue un grupo británico de rock fundado en Londres en 1968 por el guitarrista Jimmy Page, quien había pertenecido a The Yardbirds. La banda estuvo integrada por Jimmy Page en la guitarra, John Paul Jones como bajista y tecladista, el vocalista Robert Plant y John Bonham en la batería.', N'https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Ledzeppelin_revistapelo.jpg/800px-Ledzeppelin_revistapelo.jpg', N'https://cloudfront-us-east-1.images.arcpublishing.com/infobae/LYOQAZABKFAI7O42TOLGCGF56Q.jpg', N'@Led', N'@Led')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (12, N'Bod Dylan', N'Bob Dylan, ? registrado al nacer como Robert Allen Zimmerman, es un músico, compositor, cantante y poeta estadounidense, ampliamente considerado como una de las figuras más prolíficas e influyentes en la música popular del siglo XX y de comienzos del siglo XXI.??? En 2016 recibió el Premio Nobel de Literatura.', N'https://rialta.org/wp-content/uploads/2021/02/Bob-Dylan.jpg', N'https://www.planv.com.ec/sites/default/files/bob-dylan-1.jpg', N'@Bob', N'@Bob')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (13, N'Bruce Springsteen', N'Bruce Frederick Joseph Springsteen ? es un cantante, guitarrista y compositor estadounidense. Apodado a menudo the Boss —en español: «el Jefe»—, Springsteen es ampliamente conocido por su trabajo con el grupo E Street Band', N'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Bruce_Springsteen_-_Roskilde_Festival_2012.jpg/800px-Bruce_Springsteen_-_Roskilde_Festival_2012.jpg', N'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Bundesarchiv_Bild_183-1988-0719-38%2C_Bruce_Springsteen%2C_Konzert_in_der_DDR.jpg/170px-Bundesarchiv_Bild_183-1988-0719-38%2C_Bruce_Springsteen%2C_Konzert_in_der_DDR.jpg', N'@Bruce', N'@Bruce')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (14, N'The Eagles ', N'Eagles es una banda estadounidense de country rock y hard rock formada en Los Ángeles, California, EE. UU., en 1971. La banda se separó en 1980, volviéndose a juntar en 1994, tocando hasta 2016, tras la muerte de uno de los fundadores y vocalista, Glenn Frey.?', N'https://ichef.bbci.co.uk/news/640/amz/worldservice/live/assets/images/2016/01/19/160119033413_el_ltimo_homenaje_programado_para_the_eagles_tuvo_que_suspenderse_por_la_salud_de_frey_624x351_getty_nocredit.jpg', N'https://cdn.britannica.com/50/198850-050-46C563B5/Eagles-Bernie-Leadon-Don-Henley-Glenn-Frey.jpg', N'@TheEagles', N'@TheEagles')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (15, N'The Doors', N'The Doors fue una banda del Rock psicodélico estadounidense, formada en Los Ángeles, California en julio de 1965 y disuelta en 1973. Aunque la carrera de The Doors terminó en 1973 por la muerte de Jim Morrison, su popularidad ha persistido.?', N'https://upload.wikimedia.org/wikipedia/commons/6/60/Doors_electra_publicity_photo.JPG', N'https://upload.wikimedia.org/wikipedia/en/thumb/9/98/TheDoorsTheDoorsalbumcover.jpg/220px-TheDoorsTheDoorsalbumcover.jpg', N'@TheDoors', N'@TheDoors')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (16, N'The Beach Boys', N'The Beach Boys es una banda de rock formada en la ciudad estadounidense de Hawthorne, Los Ángeles en el año 1961. Distinguidos por sus armonías vocales, son uno de los grupos más influyentes de la era del rock and roll.', N'https://upload.wikimedia.org/wikipedia/commons/a/a8/The_Beach_Boys_%281965%29.png', N'https://people.com/thmb/C0WS3WboJYJDnwl05GbWzEe6dQ0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(999x359:1001x361)/beach-boys-1-ac85df6fc01644bfb2be6890c20671d5.jpg', N'@BeachBoys', N'@BeachBoys')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (17, N'The Beatles', N'The Beatles, más conocido en el mundo hispano como los Beatles, fue un grupo de rock británico formado en Liverpool durante los años 1960. Desde 1962 hasta su separación en 1970 estuvo integrado por John Lennon, Paul McCartney, George Harrison y Ringo Starr.', N'https://s.france24.com/media/display/6b13077e-e07b-11e9-b12e-005056a98db9/w:1280/p:16x9/portada_beatles_0.jpg', N'https://images.ecestaticos.com/Sg_d9538XQEAGmq5Orj91yVw0Fc=/0x0:2272x1534/1200x900/filters:fill(white):format(jpg)/f.elconfidencial.com%2Foriginal%2F896%2F234%2Fb36%2F896234b36d21d820344d58812ec3cb72.jpg', N'@TheBeatles', N'@TheBeatles')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (18, N'John Lennon', N'John Winston Lennon fue un artista, músico, cantautor, actor, activista, compositor, productor, escritor y pacifista británico, conocido por ser el líder y fundador de la banda de rock The Beatles y considerado uno de los artistas más influyentes del siglo XX.', N'https://upload.wikimedia.org/wikipedia/commons/8/85/John_Lennon_1969_%28cropped%29.jpg', N'https://album.mediaset.es/eimg/10000/2021/07/28/clipping_40n7Tq_ded9.jpg?w=1200', N'@JohnLennon', N'@JohnLennon')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (19, N'Khea', N'Ivo Alfredo Thomas Serue, conocido artísticamente como Khea, es un rapero, cantante y compositor argentino.', N'https://es.rollingstone.com/wp-content/uploads/2023/07/El-renacimiento-de-KHEA.jpg', N'https://bolivarense.com/wp-content/uploads/2020/02/khea.png', N'@Khea', N'@Khea')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (20, N'Travis Scott', N'Jacques Berman Webster II, ? conocido artísticamente como Travis Scott, es un rapero, compositor y productor musical estadounidense.', N'https://upload.wikimedia.org/wikipedia/commons/1/14/Travis_Scott_-_Openair_Frauenfeld_2019_08.jpg', N'https://media.revistagq.com/photos/616981dc219207ace1a59cb7/16:9/w_2560%2Cc_limit/GettyImages-1340159187.jpg', N'@Travis', N'@Travis')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (21, N'Playboi Carti', N'Jordan Terrell Carter, conocido por su nombre artístico Playboi Carti, es un rapero, cantante, compositor y productor estadounidense. Actualmente firma con el sello OPIUM.?', N'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Playboi_Carti_%28cropped%29.jpg/800px-Playboi_Carti_%28cropped%29.jpg', N'https://www.lanacion.com.ar/resizer/v2/mientras-prepara-una-reedicion-de-su-ultimo-disco-IO4NXAAHMNCXTDQVIDEAH23IV4.jpg?auth=a2fee154f4aac9e6c14232cdc85b4adab664ed630a2f171d184bc4ef198b3a31&width=420&height=280&quality=70&smart=true', N'@Carti', N'@Carti')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (22, N'Bhavi', N'Bhavi es un cantante de trap nacido como Indra Bhalavan en Bélgica, el 22 de octubre de 1997, y radicado en Argentina. En 2017 comenzó a grabar y al poco tiempo se conectó con Mueva Records, la productora con la cual trabaja.', N'https://fotos.perfil.com/2022/06/21/trim/900/900/bhavi-1374259.jpg', N'https://www.tiempoar.com.ar/wp-content/uploads/2022/06/WEB-FOTO-20220616-Bhavi-767x511.jpg', N'@Bhavi', N'@Bhavi')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (23, N'YSY A', N'Alejo Nahuel Acosta, conocido artísticamente como YSY A, ? es un rapero, productor, freestyler, y diseñador argentino.?Alejo Acosta se hizo conocido en 2013 cuando formó la competencia de rap El Quinto Escalón con apenas 13 años, junto al músico y presentador Muphasa MC.', N'https://cdns-images.dzcdn.net/images/artist/f3f39a56afeeb780a495f4aa2b8062d6/500x500.jpg', N'https://sixurbana.com/download/multimedia.grande.9d0308fbd43efd91.7973792d612d61676f746f2d747265732d6665636861735f5f5f5f635a4b6d525f6772616e64652e77656270.webp', N'@YSY', N'@YSY')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (24, N'Duki', N'Mauro Ezequiel Lombardo Quiroga, conocido artísticamente como Duki, es un rapero y compositor argentino.?', N'https://statics.eleconomista.com.ar/2023/06/6495ace000a07.jpg', N'https://es.rollingstone.com/wp-content/uploads/2023/06/01-APERTURA-WEB-LOLLAPALOOZA-2023-DIA-3-FotoGuido-Adler-2-3.jpg', N'@Duki', N'@Duki')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (25, N'Lil Uzi Vert', N'Symere Woods, conocido en el mundo artístico como Lil Uzi Vert, es un rapero, cantante y compositor. Nació el 31 de julio de 1994 en Filadelfia, Pennsylvania, Estados Unidos. Lil Uzi obtuvo reconocimiento tras el lanzamiento del mixtape comercial “Luv Is Rage” (2015), que llevó a un contrato de grabación con Atlantic Records, a quien firmó bajo el apoyo de DJ Drama con el sello Generation Now.
', N'https://upload.wikimedia.org/wikipedia/commons/4/44/Lil_Uzi_Vert_%282018%29.png', N'https://www.mondosonoro.com/wp-content/uploads/2019/02/Lil-Uzi-Vert-Spike-Jordan.jpg', N'@Uzi', N'@Uzi')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (26, N'Karol G', N'Carolina Giraldo Navarro, conocida artísticamente como Karol G, es una cantante, compositora y productora? Colombiana.', N'https://upload.wikimedia.org/wikipedia/commons/b/bd/Karol_G_for_PUBG_Mobile_01.jpg', N'https://www.pasionfutbol.com/__export/1681478790672/sites/pasionfutbol/img/2023/04/14/karolg.jpg_2062789929.jpg', N'@Karol', N'@Karol')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (27, N'Rauw Alejandro', N'Raúl Alejandro Ocasio Ruiz, conocido artísticamente como Rauw Alejandro, es un cantante, compositor, productor discográfico y bailarín puertorriqueño. Pertenece a la «nueva generación» de músicos urbanos puertorriqueños.?', N'https://yt3.googleusercontent.com/NbQf78JaC8DOzol0Kpm6PIhAXAwCywTQbsGVU12SN-jjQFWmUH9lk2Q305kPCZmOg-EjIf6Al-o=s900-c-k-c0x00ffffff-no-rj', N'https://media.gq.com.mx/photos/63a310423105d93f46dc2bf6/4:3/w_2664,h_1998,c_limit/Rauw%20Alejandro%20durante%20Grammys.jpg', N'@Rauw', N'@Rauw')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (28, N'Myke Towers', N'Michael Anthony Torres Monge, conocido por su nombre artístico Myke Towers, es un cantante y compositor puertorriqueño.', N'https://es.rollingstone.com/wp-content/uploads/2023/08/PR-Myke-Towers.jpg', N'https://i.scdn.co/image/ab6761610000e5eb20e3ebcfcc2fecf17387e873', N'@Myke', N'@Myke')
INSERT [dbo].[Artistas] ([IdArtista], [Nombre], [Descripcion], [FotoArtista], [FotoDescrpcion], [Instagram], [Twitter]) VALUES (29, N'Jay Balvin', N'José Álvaro Osorio Balvin, mejor conocido como J Balvin, es un cantante y productor colombiano, reconocido como uno de los artistas latinos más vendidos del mundo, con ventas de treinta y cinco millones de álbumes y sencillos a nivel mundial.???', N'https://yt3.googleusercontent.com/fvB6uAUND3RPAuus_7gmFkGIwbV_DaSwfRhO_9ChUlZzRQHkx0uwYtuKjeCE5EtbwqcAdqMW5g=s900-c-k-c0x00ffffff-no-rj', N'https://estaticos-cdn.prensaiberica.es/clip/df5ef5bd-72af-4ba2-a38b-7f7e108bddf7_alta-libre-aspect-ratio_default_0.jpg', N'@JayBalvin', N'@JayBalvin')
GO
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (1, N'Apeshit', N'audio\rap\Beyonce & JAY-Z - Apeshit (Lyrics) ft. The Carters.mp3', N'img\FotoCancion\Apeshit.jpg', 5, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (2, N'Big Poppa (2007 Remaster)', N'audio\rap\Big Poppa (2007 Remaster).mp3', N'img\FotoCancion\Big Poppa (Remaster 2007).jpg', 8, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (3, N'California Love (Original Version)', N'audio\rap\California Love (Original Version).mp3', N'img\FotoCancion\California Love.jfif', 7, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (4, N'Be Careful [Official Audio]', N'audio\rap\Cardi B - Be Careful [Official Audio].mp3', N'img\FotoCancion\Be Careful.png', 3, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (5, N'I Like It [Official Audio]', N'audio\rap\Cardi B Bad Bunny & J Balvin - I Like It [Official Audio].mp3', N'img\FotoCancion\Cardi_B-I_Like_It.png', 3, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (6, N'Hit ´Em Up ', N'audio\rap\Hit ''Em Up.mp3', N'img\FotoCancion\Hit Em Up.jpg', 7, NULL)
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
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (18, N'Stairway To Heaven', N'audio\rock\stairway-to-heaven.mp3', N'img\FotoCancion\Stairway To Heaven.jpg', 11, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (19, N'20 Mins', N'audio\trap\20-min.mp3', N'img\FotoCancion\20 mins.jfif', 25, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (20, N'A Por Todo', N'audio\trap\a-por-todo.mp3', N'img\FotoCancion\A por todo.png', 23, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (21, N'Givenchy', N'audio\trap\givenchy.mp3', N'img\FotoCancion\Givenchy.jfif', 24, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (22, N'Harakiri', N'audio\trap\harakiri.mp3', N'img\FotoCancion\Harakiri.jfif', 24, NULL)
INSERT [dbo].[Canciones] ([IdCancion], [NombreCancion], [Audio], [FotoCancion], [IdArtista], [IdAlbum]) VALUES (23, N'Jimmy Cooks', N'audio\trap\jimmy-cooks.mp3', N'img\FotoCancion\Jimmy Cooks.png', 2, NULL)
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
/****** Object:  StoredProcedure [dbo].[sp_CrearUsuario]    Script Date: 21/11/2023 10:39:53 ******/
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
