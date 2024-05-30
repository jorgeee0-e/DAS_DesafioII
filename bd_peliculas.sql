USE [master]
GO
/****** Object:  Database [das_peliculas]    Script Date: 29/5/2024 23:56:39 ******/
CREATE DATABASE [das_peliculas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'das_peliculas', FILENAME = N'D:\SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\das_peliculas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'das_peliculas_log', FILENAME = N'D:\SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\das_peliculas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [das_peliculas] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [das_peliculas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [das_peliculas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [das_peliculas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [das_peliculas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [das_peliculas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [das_peliculas] SET ARITHABORT OFF 
GO
ALTER DATABASE [das_peliculas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [das_peliculas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [das_peliculas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [das_peliculas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [das_peliculas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [das_peliculas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [das_peliculas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [das_peliculas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [das_peliculas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [das_peliculas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [das_peliculas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [das_peliculas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [das_peliculas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [das_peliculas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [das_peliculas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [das_peliculas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [das_peliculas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [das_peliculas] SET RECOVERY FULL 
GO
ALTER DATABASE [das_peliculas] SET  MULTI_USER 
GO
ALTER DATABASE [das_peliculas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [das_peliculas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [das_peliculas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [das_peliculas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [das_peliculas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [das_peliculas] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'das_peliculas', N'ON'
GO
ALTER DATABASE [das_peliculas] SET QUERY_STORE = ON
GO
ALTER DATABASE [das_peliculas] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [das_peliculas]
GO
/****** Object:  Table [dbo].[Directores]    Script Date: 29/5/2024 23:56:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Directores](
	[id_director] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_director] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Generos]    Script Date: 29/5/2024 23:56:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Generos](
	[id_genero] [int] IDENTITY(1,1) NOT NULL,
	[genero] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_genero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Peliculas]    Script Date: 29/5/2024 23:56:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Peliculas](
	[id_pelicula] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](255) NOT NULL,
	[sinopsis] [text] NOT NULL,
	[poster_url] [varchar](255) NOT NULL,
	[id_director] [int] NOT NULL,
	[id_genero] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Puntuaciones]    Script Date: 29/5/2024 23:56:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puntuaciones](
	[id_pelicula] [int] NOT NULL,
	[puntuacion] [decimal](3, 1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rate_per_user]    Script Date: 29/5/2024 23:56:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rate_per_user](
	[id_usuario] [nvarchar](50) NOT NULL,
	[id_pelicula] [int] NOT NULL,
	[calificacion] [float] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rates]    Script Date: 29/5/2024 23:56:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rates](
	[id_pelicula] [int] NULL,
	[titulo] [varchar](255) NULL,
	[promedio_calificacion] [float] NULL,
	[id_calificacion] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_rates] PRIMARY KEY CLUSTERED 
(
	[id_calificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 29/5/2024 23:56:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id_user] [nvarchar](50) NOT NULL,
	[nombre] [nvarchar](max) NULL,
	[apellido] [nvarchar](max) NULL,
	[correo] [nvarchar](max) NULL,
	[password] [nvarchar](max) NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Directores] ON 

INSERT [dbo].[Directores] ([id_director], [nombre]) VALUES (1, N'Frank Darabont')
INSERT [dbo].[Directores] ([id_director], [nombre]) VALUES (2, N'Francis Ford Coppola')
INSERT [dbo].[Directores] ([id_director], [nombre]) VALUES (3, N'Christopher Nolan')
INSERT [dbo].[Directores] ([id_director], [nombre]) VALUES (4, N'Quentin Tarantino')
INSERT [dbo].[Directores] ([id_director], [nombre]) VALUES (5, N'Steven Spielberg')
INSERT [dbo].[Directores] ([id_director], [nombre]) VALUES (6, N'Peter Jackson')
INSERT [dbo].[Directores] ([id_director], [nombre]) VALUES (7, N'David Fincher')
INSERT [dbo].[Directores] ([id_director], [nombre]) VALUES (8, N'Robert Zemeckis')
INSERT [dbo].[Directores] ([id_director], [nombre]) VALUES (9, N'Lana Wachowski')
INSERT [dbo].[Directores] ([id_director], [nombre]) VALUES (10, N'Lilly Wachowski')
INSERT [dbo].[Directores] ([id_director], [nombre]) VALUES (11, N'Martin Scorsese')
INSERT [dbo].[Directores] ([id_director], [nombre]) VALUES (12, N'Jonathan Demme')
INSERT [dbo].[Directores] ([id_director], [nombre]) VALUES (13, N'Bryan Singer')
SET IDENTITY_INSERT [dbo].[Directores] OFF
GO
SET IDENTITY_INSERT [dbo].[Generos] ON 

INSERT [dbo].[Generos] ([id_genero], [genero]) VALUES (1, N'Drama')
INSERT [dbo].[Generos] ([id_genero], [genero]) VALUES (2, N'Crimen')
INSERT [dbo].[Generos] ([id_genero], [genero]) VALUES (3, N'Acción')
INSERT [dbo].[Generos] ([id_genero], [genero]) VALUES (4, N'Biografía')
INSERT [dbo].[Generos] ([id_genero], [genero]) VALUES (5, N'Historia')
INSERT [dbo].[Generos] ([id_genero], [genero]) VALUES (6, N'Aventura')
INSERT [dbo].[Generos] ([id_genero], [genero]) VALUES (7, N'Fantasía')
INSERT [dbo].[Generos] ([id_genero], [genero]) VALUES (8, N'Romance')
INSERT [dbo].[Generos] ([id_genero], [genero]) VALUES (9, N'Sci-Fi')
INSERT [dbo].[Generos] ([id_genero], [genero]) VALUES (10, N'Misterio')
INSERT [dbo].[Generos] ([id_genero], [genero]) VALUES (11, N'Horror')
SET IDENTITY_INSERT [dbo].[Generos] OFF
GO
SET IDENTITY_INSERT [dbo].[Peliculas] ON 

INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [sinopsis], [poster_url], [id_director], [id_genero]) VALUES (1, N'The Shawshank Redemption', N'Dos hombres encarcelados crean un vínculo durante varios años, encontrando consuelo y eventual redención a través de actos de decencia común.', N'https://m.media-amazon.com/images/I/51WYsbIa7TS._AC_UF1000,1000_QL80_.jpg', 1, 1)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [sinopsis], [poster_url], [id_director], [id_genero]) VALUES (2, N'The Godfather', N'El envejecido patriarca de una dinastía criminal organizada en la Nueva York de la posguerra transfiere el control de su clandestino imperio a su hijo menor reacio.', N'https://i.ebayimg.com/images/g/CA8AAOSweOhh50om/s-l1600.jpg', 2, 2)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [sinopsis], [poster_url], [id_director], [id_genero]) VALUES (3, N'The Dark Knight', N'Cuando la amenaza conocida como el Joker emerge de su misterioso pasado, desata un caos y desorden en la gente de Gotham. El Caballero Oscuro debe aceptar uno de los mayores desafíos psicológicos y físicos de su capacidad para luchar contra la injusticia.', N'https://originalvintagemovieposters.com/wp-content/uploads/2020/03/Dark-Knight-70822-scaled.jpg', 3, 3)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [sinopsis], [poster_url], [id_director], [id_genero]) VALUES (4, N'Pulp Fiction', N'Las vidas de dos matones de la mafia, un boxeador, una esposa de gánster y una pareja de bandidos se entrelazan en cuatro historias de violencia y redención.', N'https://globestudiogallery.com/wp-content/uploads/2021/06/pulp-fiction-scaled.jpg', 4, 2)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [sinopsis], [poster_url], [id_director], [id_genero]) VALUES (5, N'La Lista de Schindler', N'En Polonia ocupada por los nazis durante la Segunda Guerra Mundial, Oskar Schindler se preocupa cada vez más por su fuerza de trabajo judía después de presenciar su persecución por parte de los nazis.', N'https://image.tmdb.org/t/p/original/nwbMHtz8CtyGTzhjs1bLCLaiHSB.jpg', 5, 4)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [sinopsis], [poster_url], [id_director], [id_genero]) VALUES (6, N'The Lord of the Rings: The Return of the King', N'Gandalf y Aragorn lideran el Mundo de los Hombres contra el ejército de Sauron para distraer su atención de Frodo y Sam mientras se acercan al Monte del Destino con el Anillo Único.', N'https://filmartgallery.com/cdn/shop/products/The-Lord-of-the-Rings-The-Return-of-the-King-Vintage-Movie-Poster-Original-1-Sheet-27x41_5000x.jpg?v=1665735682', 6, 6)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [sinopsis], [poster_url], [id_director], [id_genero]) VALUES (7, N'Fight Club', N'Un oficinista con insomnio y un fabricante de jabón sin escrúpulos forman un club de lucha clandestino que se convierte en algo mucho más grande.', N'https://artofthemovies.co.uk/cdn/shop/products/Fight_Club_Advance-637353_796f96fe-9b8e-4489-af4d-b2e0d3890a71.jpg?v=1653919060', 7, 1)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [sinopsis], [poster_url], [id_director], [id_genero]) VALUES (8, N'Forrest Gump', N'Las presidencias de Kennedy y Johnson, los eventos de Vietnam, Watergate y otros eventos históricos se desarrollan desde la perspectiva de un hombre de Alabama con un CI bajo, cuya única intención es reunirse con su amada infancia.', N'https://www.aestheticwalldecor.com/cdn/shop/files/tom-hanks-is-forrest-gump-classic-movie-poster-aesthetic-wall-decor.jpg?v=1692555168', 8, 8)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [sinopsis], [poster_url], [id_director], [id_genero]) VALUES (9, N'Inception', N'Un ladrón que roba secretos corporativos a través del uso de la tecnología de sueños compartidos recibe la tarea inversa de plantar una idea en la mente de un C.E.O.', N'https://filmartgallery.com/cdn/shop/files/Inception-Vintage-Movie-Poster-Original-1-Sheet-27x41_5000x.jpg?v=1691730160', 3, 9)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [sinopsis], [poster_url], [id_director], [id_genero]) VALUES (10, N'The Matrix', N'Un hacker aprende de misteriosos rebeldes sobre la verdadera naturaleza de su realidad y su papel en la guerra contra sus controladores.', N'https://www.canvasprintsaustralia.net.au/wp-content/uploads/2022/02/the-matrix_2843f90b-scaled.jpg', 9, 9)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [sinopsis], [poster_url], [id_director], [id_genero]) VALUES (11, N'Goodfellas', N'La historia de Henry Hill y su vida en la mafia, que abarca su relación con su esposa Karen Hill y sus socios en la organización criminal italoamericana.', N'https://www.tallengestore.com/cdn/shop/products/Goodfellas_-_Martin_Scorcese_Collection_-_Tallenge_Hollywood_Cult_Classics_Movie_Poster_bbe9a6e4-a871-464b-b466-5d3293b79bc7.jpg?v=1570155954', 10, 2)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [sinopsis], [poster_url], [id_director], [id_genero]) VALUES (12, N'The Silence of the Lambs', N'Un joven cadete del FBI debe recibir la ayuda de un asesino caníbal encarcelado y manipulador para ayudar a atrapar a otro asesino en serie, un loco que desuella a sus víctimas.', N'https://s3.amazonaws.com/criterion-production/films/46014912ca0c20592c472f5bbe33e4f8/L9AQ95Y7z2vOIUf1ntwvpZsZx3kp8B_original.jpg', 11, 11)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [sinopsis], [poster_url], [id_director], [id_genero]) VALUES (13, N'Se7en', N'Dos detectives, un novato y un veterano, cazan a un asesino en serie que usa los siete pecados capitales como sus motivos.', N'https://image.tmdb.org/t/p/original/8yHuuCyL9sWWGbqTYLG3bStjFts.jpg', 7, 10)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [sinopsis], [poster_url], [id_director], [id_genero]) VALUES (14, N'Interstellar', N'Un equipo de exploradores viaja a través de un agujero de gusano en el espacio en un intento por asegurar el futuro de la humanidad.', N'https://www.originalfilmart.com/cdn/shop/products/interstellar_2014_advance_original_film_art_682852f2-23f6-46de-a1db-4029d5b6f0b4_5000x.jpg?v=1574284010', 3, 9)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [sinopsis], [poster_url], [id_director], [id_genero]) VALUES (15, N'The Usual Suspects', N'Un policía interroga a cinco delincuentes en línea sobre un atraco planeado, que deriva en la historia de un villano invisible conocido como Keyser Söze.', N'https://www.originalfilmart.com/cdn/shop/products/usual_suspects_1995_original_film_art_ef9998dc-62be-47c0-92c5-d58632b646a4_5000x.jpg?v=1582620183', 12, 10)
SET IDENTITY_INSERT [dbo].[Peliculas] OFF
GO
INSERT [dbo].[Puntuaciones] ([id_pelicula], [puntuacion]) VALUES (1, CAST(9.3 AS Decimal(3, 1)))
INSERT [dbo].[Puntuaciones] ([id_pelicula], [puntuacion]) VALUES (2, CAST(9.2 AS Decimal(3, 1)))
INSERT [dbo].[Puntuaciones] ([id_pelicula], [puntuacion]) VALUES (3, CAST(9.0 AS Decimal(3, 1)))
INSERT [dbo].[Puntuaciones] ([id_pelicula], [puntuacion]) VALUES (4, CAST(8.9 AS Decimal(3, 1)))
INSERT [dbo].[Puntuaciones] ([id_pelicula], [puntuacion]) VALUES (5, CAST(9.0 AS Decimal(3, 1)))
INSERT [dbo].[Puntuaciones] ([id_pelicula], [puntuacion]) VALUES (6, CAST(9.0 AS Decimal(3, 1)))
INSERT [dbo].[Puntuaciones] ([id_pelicula], [puntuacion]) VALUES (7, CAST(8.8 AS Decimal(3, 1)))
INSERT [dbo].[Puntuaciones] ([id_pelicula], [puntuacion]) VALUES (8, CAST(8.8 AS Decimal(3, 1)))
INSERT [dbo].[Puntuaciones] ([id_pelicula], [puntuacion]) VALUES (9, CAST(8.8 AS Decimal(3, 1)))
INSERT [dbo].[Puntuaciones] ([id_pelicula], [puntuacion]) VALUES (10, CAST(8.7 AS Decimal(3, 1)))
INSERT [dbo].[Puntuaciones] ([id_pelicula], [puntuacion]) VALUES (11, CAST(8.7 AS Decimal(3, 1)))
INSERT [dbo].[Puntuaciones] ([id_pelicula], [puntuacion]) VALUES (12, CAST(8.6 AS Decimal(3, 1)))
INSERT [dbo].[Puntuaciones] ([id_pelicula], [puntuacion]) VALUES (13, CAST(8.6 AS Decimal(3, 1)))
INSERT [dbo].[Puntuaciones] ([id_pelicula], [puntuacion]) VALUES (14, CAST(8.6 AS Decimal(3, 1)))
INSERT [dbo].[Puntuaciones] ([id_pelicula], [puntuacion]) VALUES (15, CAST(8.5 AS Decimal(3, 1)))
GO
SET IDENTITY_INSERT [dbo].[rate_per_user] ON 

INSERT [dbo].[rate_per_user] ([id_usuario], [id_pelicula], [calificacion], [Id]) VALUES (N'userjp', 1, 9.5, 1)
INSERT [dbo].[rate_per_user] ([id_usuario], [id_pelicula], [calificacion], [Id]) VALUES (N'userjp', 1, 9.5, 2)
INSERT [dbo].[rate_per_user] ([id_usuario], [id_pelicula], [calificacion], [Id]) VALUES (N'usermg', 2, 9, 3)
INSERT [dbo].[rate_per_user] ([id_usuario], [id_pelicula], [calificacion], [Id]) VALUES (N'usermg', 3, 10, 4)
INSERT [dbo].[rate_per_user] ([id_usuario], [id_pelicula], [calificacion], [Id]) VALUES (N'useral', 3, 2.1, 5)
INSERT [dbo].[rate_per_user] ([id_usuario], [id_pelicula], [calificacion], [Id]) VALUES (N'userlr', 3, 8.5, 6)
INSERT [dbo].[rate_per_user] ([id_usuario], [id_pelicula], [calificacion], [Id]) VALUES (N'useral', 4, 9.8, 7)
INSERT [dbo].[rate_per_user] ([id_usuario], [id_pelicula], [calificacion], [Id]) VALUES (N'userch', 5, 9.7, 8)
INSERT [dbo].[rate_per_user] ([id_usuario], [id_pelicula], [calificacion], [Id]) VALUES (N'userjp', 6, 9.4, 9)
INSERT [dbo].[rate_per_user] ([id_usuario], [id_pelicula], [calificacion], [Id]) VALUES (N'usermg', 7, 8.9, 10)
INSERT [dbo].[rate_per_user] ([id_usuario], [id_pelicula], [calificacion], [Id]) VALUES (N'userlr', 8, 9.2, 11)
INSERT [dbo].[rate_per_user] ([id_usuario], [id_pelicula], [calificacion], [Id]) VALUES (N'useral', 9, 9.3, 12)
INSERT [dbo].[rate_per_user] ([id_usuario], [id_pelicula], [calificacion], [Id]) VALUES (N'userch', 10, 9.6, 13)
INSERT [dbo].[rate_per_user] ([id_usuario], [id_pelicula], [calificacion], [Id]) VALUES (N'userjp', 11, 9, 14)
INSERT [dbo].[rate_per_user] ([id_usuario], [id_pelicula], [calificacion], [Id]) VALUES (N'usermg', 12, 8.8, 15)
INSERT [dbo].[rate_per_user] ([id_usuario], [id_pelicula], [calificacion], [Id]) VALUES (N'userlr', 13, 9.1, 16)
INSERT [dbo].[rate_per_user] ([id_usuario], [id_pelicula], [calificacion], [Id]) VALUES (N'useral', 14, 9.5, 17)
INSERT [dbo].[rate_per_user] ([id_usuario], [id_pelicula], [calificacion], [Id]) VALUES (N'userch', 15, 9, 18)
INSERT [dbo].[rate_per_user] ([id_usuario], [id_pelicula], [calificacion], [Id]) VALUES (N'usermg', 4, 9, 19)
INSERT [dbo].[rate_per_user] ([id_usuario], [id_pelicula], [calificacion], [Id]) VALUES (N'userjp', 3, 10, 20)
INSERT [dbo].[rate_per_user] ([id_usuario], [id_pelicula], [calificacion], [Id]) VALUES (N'userlr', 3, 10, 21)
SET IDENTITY_INSERT [dbo].[rate_per_user] OFF
GO
SET IDENTITY_INSERT [dbo].[rates] ON 

INSERT [dbo].[rates] ([id_pelicula], [titulo], [promedio_calificacion], [id_calificacion]) VALUES (1, N'The Shawshank Redemption', 9.5, 1)
INSERT [dbo].[rates] ([id_pelicula], [titulo], [promedio_calificacion], [id_calificacion]) VALUES (2, N'The Godfather', 9, 2)
INSERT [dbo].[rates] ([id_pelicula], [titulo], [promedio_calificacion], [id_calificacion]) VALUES (3, N'The Dark Knight', 8.120000000000001, 3)
INSERT [dbo].[rates] ([id_pelicula], [titulo], [promedio_calificacion], [id_calificacion]) VALUES (4, N'Pulp Fiction', 9.4, 4)
INSERT [dbo].[rates] ([id_pelicula], [titulo], [promedio_calificacion], [id_calificacion]) VALUES (5, N'Schindler''s List', 9.7, 5)
INSERT [dbo].[rates] ([id_pelicula], [titulo], [promedio_calificacion], [id_calificacion]) VALUES (6, N'The Lord of the Rings: The Return of the King', 9.4, 6)
INSERT [dbo].[rates] ([id_pelicula], [titulo], [promedio_calificacion], [id_calificacion]) VALUES (7, N'Fight Club', 8.9, 7)
INSERT [dbo].[rates] ([id_pelicula], [titulo], [promedio_calificacion], [id_calificacion]) VALUES (8, N'Forrest Gump', 9.2, 8)
INSERT [dbo].[rates] ([id_pelicula], [titulo], [promedio_calificacion], [id_calificacion]) VALUES (9, N'Inception', 9.3, 9)
INSERT [dbo].[rates] ([id_pelicula], [titulo], [promedio_calificacion], [id_calificacion]) VALUES (10, N'The Matrix', 9.6, 10)
INSERT [dbo].[rates] ([id_pelicula], [titulo], [promedio_calificacion], [id_calificacion]) VALUES (11, N'Goodfellas', 9, 11)
INSERT [dbo].[rates] ([id_pelicula], [titulo], [promedio_calificacion], [id_calificacion]) VALUES (12, N'The Silence of the Lambs', 8.8, 12)
INSERT [dbo].[rates] ([id_pelicula], [titulo], [promedio_calificacion], [id_calificacion]) VALUES (13, N'Se7en', 9.1, 13)
INSERT [dbo].[rates] ([id_pelicula], [titulo], [promedio_calificacion], [id_calificacion]) VALUES (14, N'Interstellar', 9.5, 14)
INSERT [dbo].[rates] ([id_pelicula], [titulo], [promedio_calificacion], [id_calificacion]) VALUES (15, N'The Usual Suspects', 9, 15)
SET IDENTITY_INSERT [dbo].[rates] OFF
GO
INSERT [dbo].[usuarios] ([id_user], [nombre], [apellido], [correo], [password]) VALUES (N'useral', N'Ana', N'Lopez', N'ana.lopez@example.com', N'password321')
INSERT [dbo].[usuarios] ([id_user], [nombre], [apellido], [correo], [password]) VALUES (N'userch', N'Carlos', N'Hernandez', N'carlos.hernandez@example.com', N'password654')
INSERT [dbo].[usuarios] ([id_user], [nombre], [apellido], [correo], [password]) VALUES (N'userjp', N'Juan', N'Perez', N'juan.perez@example.com', N'password123')
INSERT [dbo].[usuarios] ([id_user], [nombre], [apellido], [correo], [password]) VALUES (N'userlr', N'Luis', N'Rodriguez', N'luis.rodriguez@example.com', N'mysecret789')
INSERT [dbo].[usuarios] ([id_user], [nombre], [apellido], [correo], [password]) VALUES (N'usermg', N'Maria', N'Gonzalez', N'maria.gonzalez@example.com', N'securepass456')
GO
ALTER TABLE [dbo].[Peliculas]  WITH CHECK ADD FOREIGN KEY([id_director])
REFERENCES [dbo].[Directores] ([id_director])
GO
ALTER TABLE [dbo].[Peliculas]  WITH CHECK ADD FOREIGN KEY([id_genero])
REFERENCES [dbo].[Generos] ([id_genero])
GO
ALTER TABLE [dbo].[Puntuaciones]  WITH CHECK ADD FOREIGN KEY([id_pelicula])
REFERENCES [dbo].[Peliculas] ([id_pelicula])
GO
ALTER TABLE [dbo].[rate_per_user]  WITH CHECK ADD  CONSTRAINT [FK_rate_per_user_peliculas] FOREIGN KEY([id_pelicula])
REFERENCES [dbo].[Peliculas] ([id_pelicula])
GO
ALTER TABLE [dbo].[rate_per_user] CHECK CONSTRAINT [FK_rate_per_user_peliculas]
GO
ALTER TABLE [dbo].[rate_per_user]  WITH CHECK ADD  CONSTRAINT [FK_rate_per_user_usuarios] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([id_user])
GO
ALTER TABLE [dbo].[rate_per_user] CHECK CONSTRAINT [FK_rate_per_user_usuarios]
GO
ALTER TABLE [dbo].[rates]  WITH CHECK ADD  CONSTRAINT [FK_rate_peliculas] FOREIGN KEY([id_pelicula])
REFERENCES [dbo].[Peliculas] ([id_pelicula])
GO
ALTER TABLE [dbo].[rates] CHECK CONSTRAINT [FK_rate_peliculas]
GO
ALTER TABLE [dbo].[Puntuaciones]  WITH CHECK ADD  CONSTRAINT [chk_puntuacion] CHECK  (([puntuacion]>=(0.0) AND [puntuacion]<=(10.0)))
GO
ALTER TABLE [dbo].[Puntuaciones] CHECK CONSTRAINT [chk_puntuacion]
GO
USE [master]
GO
ALTER DATABASE [das_peliculas] SET  READ_WRITE 
GO
