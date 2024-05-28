USE [master]
GO
/****** Object:  Database [das_peliculas]    Script Date: 25/5/2024 17:52:45 ******/
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
/****** Object:  Table [dbo].[Directores]    Script Date: 25/5/2024 17:52:47 ******/
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
/****** Object:  Table [dbo].[Generos]    Script Date: 25/5/2024 17:52:47 ******/
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
/****** Object:  Table [dbo].[Peliculas]    Script Date: 25/5/2024 17:52:47 ******/
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
/****** Object:  Table [dbo].[Puntuaciones]    Script Date: 25/5/2024 17:52:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puntuaciones](
	[id_pelicula] [int] NOT NULL,
	[puntuacion] [decimal](3, 1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rate_per_user]    Script Date: 25/5/2024 17:52:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rate_per_user](
	[id_usuario] [nvarchar](50) NOT NULL,
	[id_pelicula] [int] NOT NULL,
	[calificacion] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rates]    Script Date: 25/5/2024 17:52:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rates](
	[id_pelicula] [int] NULL,
	[titulo] [varchar](255) NULL,
	[promedio_calificacion] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 25/5/2024 17:52:47 ******/
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
