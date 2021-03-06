USE [master]
GO
/****** Object:  Database [Agenda]    Script Date: 17/11/2016 19:02:20 ******/
CREATE DATABASE [Agenda]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Agenda', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Agenda.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Agenda_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Agenda_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Agenda] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Agenda].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Agenda] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Agenda] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Agenda] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Agenda] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Agenda] SET ARITHABORT OFF 
GO
ALTER DATABASE [Agenda] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Agenda] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Agenda] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Agenda] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Agenda] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Agenda] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Agenda] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Agenda] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Agenda] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Agenda] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Agenda] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Agenda] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Agenda] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Agenda] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Agenda] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Agenda] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Agenda] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Agenda] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Agenda] SET  MULTI_USER 
GO
ALTER DATABASE [Agenda] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Agenda] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Agenda] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Agenda] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Agenda] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Agenda]
GO
/****** Object:  Table [dbo].[Agenda]    Script Date: 17/11/2016 19:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Agenda](
	[Idagenda] [int] NOT NULL,
	[Idsede] [int] NOT NULL,
	[Evento_agenda] [varchar](200) NOT NULL,
	[Fecha_agenda] [datetime] NOT NULL,
	[Duracion_agenda] [int] NOT NULL,
	[Direccion_agenda] [varchar](100) NOT NULL,
 CONSTRAINT [PK__Agenda__259C8FB09C50EA39] PRIMARY KEY CLUSTERED 
(
	[Idagenda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CentroSena]    Script Date: 17/11/2016 19:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CentroSena](
	[Idcentro] [int] NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK__centross__ACFE7A0C9A7EF18C] PRIMARY KEY CLUSTERED 
(
	[Idcentro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SedeSena]    Script Date: 17/11/2016 19:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SedeSena](
	[Idsede] [int] NOT NULL,
	[Idcentro] [int] NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK__sedessen__5C4967FC38007D8A] PRIMARY KEY CLUSTERED 
(
	[Idsede] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 17/11/2016 19:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[Idusuario] [int] NOT NULL,
	[Idsede] [int] NOT NULL,
	[Idcentro] [int] NOT NULL,
	[Identificacion] [varchar](50) NOT NULL,
	[FechaNacimiento] [datetime] NOT NULL,
 CONSTRAINT [PK__usuarios__27B153632CF0DF94] PRIMARY KEY CLUSTERED 
(
	[Idusuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Agenda]  WITH CHECK ADD  CONSTRAINT [FK_Agenda_SedeSena] FOREIGN KEY([Idsede])
REFERENCES [dbo].[SedeSena] ([Idsede])
GO
ALTER TABLE [dbo].[Agenda] CHECK CONSTRAINT [FK_Agenda_SedeSena]
GO
ALTER TABLE [dbo].[SedeSena]  WITH CHECK ADD  CONSTRAINT [FK_SedeSena_CentroSena] FOREIGN KEY([Idcentro])
REFERENCES [dbo].[CentroSena] ([Idcentro])
GO
ALTER TABLE [dbo].[SedeSena] CHECK CONSTRAINT [FK_SedeSena_CentroSena]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_SedeSena] FOREIGN KEY([Idsede])
REFERENCES [dbo].[SedeSena] ([Idsede])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_SedeSena]
GO
/****** Object:  StoredProcedure [dbo].[DeleteAgenda]    Script Date: 17/11/2016 19:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAgenda]
(
	@Idagenda int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [dbo].[Agenda] WHERE ([Idagenda] = @Idagenda) 
GO
/****** Object:  StoredProcedure [dbo].[DeleteCentro]    Script Date: 17/11/2016 19:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCentro]
(
	@Idcentro int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [dbo].[CentroSena] 
WHERE [Idcentro] = @Idcentro
GO
/****** Object:  StoredProcedure [dbo].[DeleteSede]    Script Date: 17/11/2016 19:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteSede]
(
	@Idsede int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [dbo].[SedeSena] WHERE (([Idsede] = @Idsede))
GO
/****** Object:  StoredProcedure [dbo].[DeleteUsuario]    Script Date: 17/11/2016 19:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteUsuario]
(
	@Idusuario int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [dbo].[Usuario] WHERE ([Idusuario] = @Idusuario) 
GO
/****** Object:  StoredProcedure [dbo].[GetCentroByIdcentro]    Script Date: 17/11/2016 19:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCentroByIdcentro]
(
	@Idcentro int
)
AS
	SET NOCOUNT ON;
SELECT Idcentro, Descripcion 
FROM dbo.CentroSena
WHERE Idcentro = @Idcentro
GO
/****** Object:  StoredProcedure [dbo].[InsertAgenda]    Script Date: 17/11/2016 19:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertAgenda]
(
	@Idagenda int,
	@Idsede int,
	@Evento_agenda varchar(200),
	@Fecha_agenda datetime,
	@Duracion_agenda int,
	@Direccion_agenda varchar(100)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[Agenda] ([Idagenda], [Idsede], [Evento_agenda], [Fecha_agenda], [Duracion_agenda], [Direccion_agenda]) VALUES (@Idagenda, @Idsede, @Evento_agenda, @Fecha_agenda, @Duracion_agenda, @Direccion_agenda)
GO
/****** Object:  StoredProcedure [dbo].[InsertCentro]    Script Date: 17/11/2016 19:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCentro]
(
	@Idcentro int,
	@Descripcion varchar(100)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[CentroSena] 
([Idcentro], [Descripcion]) 
VALUES (@Idcentro, @Descripcion);
	

GO
/****** Object:  StoredProcedure [dbo].[InsertSede]    Script Date: 17/11/2016 19:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertSede]
(
	@Idsede int,
	@Idcentro int,
	@Descripcion varchar(100)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[SedeSena] ([Idsede], [Idcentro], [Descripcion]) VALUES (@Idsede, @Idcentro, @Descripcion)
GO
/****** Object:  StoredProcedure [dbo].[InsertUsuario]    Script Date: 17/11/2016 19:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertUsuario]
(
	@Idusuario int,
	@Idsede int,
	@Idcentro int,
	@Identificacion varchar(50),
	@FechaNacimiento datetime
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[Usuario] ([Idusuario], [Idsede], [Idcentro], [Identificacion], [FechaNacimiento]) VALUES (@Idusuario, @Idsede, @Idcentro, @Identificacion, @FechaNacimiento)
GO
/****** Object:  StoredProcedure [dbo].[SelectAgenda]    Script Date: 17/11/2016 19:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAgenda]
AS
	SET NOCOUNT ON;
SELECT Idagenda, Idsede, Evento_agenda, Fecha_agenda, Duracion_agenda, Direccion_agenda FROM dbo.Agenda
GO
/****** Object:  StoredProcedure [dbo].[SelectSede]    Script Date: 17/11/2016 19:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectSede]
AS
	SET NOCOUNT ON;
SELECT Idsede, Idcentro, Descripcion FROM dbo.SedeSena
GO
/****** Object:  StoredProcedure [dbo].[SelectUsuario]    Script Date: 17/11/2016 19:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectUsuario]
AS
	SET NOCOUNT ON;
SELECT Idusuario, Idsede, Idcentro, Identificacion, FechaNacimiento FROM dbo.Usuario
GO
/****** Object:  StoredProcedure [dbo].[UpdateAgenda]    Script Date: 17/11/2016 19:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateAgenda]
(
	@Idagenda int,
	@Idsede int,
	@Evento_agenda varchar(200),
	@Fecha_agenda datetime,
	@Duracion_agenda int,
	@Direccion_agenda varchar(100)
)
AS
	SET NOCOUNT OFF;
UPDATE [dbo].[Agenda] SET [Idagenda] = @Idagenda, [Idsede] = @Idsede, [Evento_agenda] = @Evento_agenda, [Fecha_agenda] = @Fecha_agenda, [Duracion_agenda] = @Duracion_agenda, [Direccion_agenda] = @Direccion_agenda WHERE ([Idagenda] = @Idagenda)
GO
/****** Object:  StoredProcedure [dbo].[UpdateCentro]    Script Date: 17/11/2016 19:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCentro]
(
	@Idcentro int,
	@Descripcion varchar(100)
)
AS
	SET NOCOUNT OFF;
UPDATE [dbo].[CentroSena] 
SET [Idcentro] = @Idcentro, 
[Descripcion] = @Descripcion 
WHERE [Idcentro] = @Idcentro
GO
/****** Object:  StoredProcedure [dbo].[UpdateSede]    Script Date: 17/11/2016 19:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateSede]
(
	@Idsede int,
	@Idcentro int,
	@Descripcion varchar(100)
)
AS
	SET NOCOUNT OFF;
UPDATE [dbo].[SedeSena] SET [Idsede] = @Idsede, [Idcentro] = @Idcentro, [Descripcion] = @Descripcion WHERE ([Idsede] = @Idsede)
GO
/****** Object:  StoredProcedure [dbo].[UpdateUsuario]    Script Date: 17/11/2016 19:02:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUsuario]
(
	@Idusuario int,
	@Idsede int,
	@Idcentro int,
	@Identificacion varchar(50),
	@FechaNacimiento datetime
)
AS
	SET NOCOUNT OFF;
UPDATE [dbo].[Usuario] SET [Idusuario] = @Idusuario, [Idsede] = @Idsede, [Idcentro] = @Idcentro, [Identificacion] = @Identificacion, [FechaNacimiento] = @FechaNacimiento WHERE ([Idusuario] = @Idusuario)
GO
USE [master]
GO
ALTER DATABASE [Agenda] SET  READ_WRITE 
GO
