USE [master]
GO
/****** Object:  Database [BooksDB]    Script Date: 05-06-2024 17:46:51 ******/
CREATE DATABASE [BooksDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BooksDB', FILENAME = N'C:\Users\fernando.gomez\BooksDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BooksDB_log', FILENAME = N'C:\Users\fernando.gomez\BooksDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BooksDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BooksDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BooksDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BooksDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BooksDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BooksDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BooksDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BooksDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BooksDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BooksDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BooksDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BooksDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BooksDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BooksDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BooksDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BooksDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BooksDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BooksDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BooksDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BooksDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BooksDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BooksDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BooksDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [BooksDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BooksDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BooksDB] SET  MULTI_USER 
GO
ALTER DATABASE [BooksDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BooksDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BooksDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BooksDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BooksDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BooksDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BooksDB] SET QUERY_STORE = OFF
GO
USE [BooksDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 05-06-2024 17:46:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 05-06-2024 17:46:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BooksId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](max) NOT NULL,
	[Genre] [nvarchar](max) NOT NULL,
	[PublishDate] [date] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[BooksId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logins]    Script Date: 05-06-2024 17:46:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logins](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](max) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Logins] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Response]    Script Date: 05-06-2024 17:46:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Response](
	[codigo] [nvarchar](max) NOT NULL,
	[mensaje] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteBook]    Script Date: 05-06-2024 17:46:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Fernando Gomez>
-- Create date: <05-06-2024>
-- Description:	<SP para eliminar un libro>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteBook]
	@IDBook int
AS
BEGIN
	BEGIN TRY

		DELETE FROM Books
		WHERE BooksId = @IDBook

		select '0' as codigo, 'CORRECTO' as mensaje;
	END TRY
	BEGIN CATCH
		select '1' as codigo, 'INCORRECTO' as mensaje;
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllBooks]    Script Date: 05-06-2024 17:46:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Fernando Gomez>
-- Create date: <05-06-2024>
-- Description:	<SP para buscar todos los libros>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetAllBooks]
AS
BEGIN
	SELECT * FROM Books
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetBookById]    Script Date: 05-06-2024 17:46:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Fernando Gomez>
-- Create date: <05-06-2024>
-- Description:	<SP para buscar un libro por el ID>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetBookById]
	@IDBook int
AS
BEGIN
	SELECT * FROM Books
	WHERE BooksId = @IDBook
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertBook]    Script Date: 05-06-2024 17:46:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Fernando Gomez>
-- Create date: <05-06-2024>
-- Description:	<SP para poder ingresar un libro>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertBook]
	@Title varchar(100),
	@Author varchar(100),
	@Genre varchar (100),
	@PublisDate date
AS
BEGIN
	BEGIN TRY
	INSERT INTO [dbo].[Books]
			   ([Title]
			   ,[Author]
			   ,[Genre]
			   ,[PublishDate])
		 VALUES
			   (@Title
			   ,@Author
			   ,@Genre
			   ,@PublisDate)

		select '0' as codigo, 'CORRECTO' as mensaje;
	END TRY
	BEGIN CATCH
		select '1' as codigo, 'INCORRECTO' as mensaje;
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateBooks]    Script Date: 05-06-2024 17:46:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Fernando Gomez>
-- Create date: <05-06-2024>
-- Description:	<SP para actualizar la información del libro>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateBooks]
	@IDBook int,
	@Title varchar(100),
	@Author varchar(100),
	@Genre varchar (100),
	@PublisDate date
AS
BEGIN
	BEGIN TRY

			UPDATE Books
	SET Title = @Title, Author = @Author, Genre = @Genre, PublishDate = @PublisDate
	WHERE BooksId = @IDBook;

		select '0' as codigo, 'CORRECTO' as mensaje;
	END TRY
	BEGIN CATCH
		select '1' as codigo, 'INCORRECTO' as mensaje;
	END CATCH
END
GO
USE [master]
GO
ALTER DATABASE [BooksDB] SET  READ_WRITE 
GO
