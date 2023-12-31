USE [DBGYM]
GO
/****** Object:  Table [dbo].[TCarrito]    Script Date: 11/12/2023 06:19:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TCarrito](
	[ConCarrito] [bigint] IDENTITY(1,1) NOT NULL,
	[ConUsuario] [bigint] NOT NULL,
	[ConProducto] [bigint] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[FechaCarrito] [datetime] NOT NULL,
 CONSTRAINT [PK_TCarrito] PRIMARY KEY CLUSTERED 
(
	[ConCarrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TComentario]    Script Date: 11/12/2023 06:19:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TComentario](
	[ConComentario] [bigint] IDENTITY(1,1) NOT NULL,
	[ConUsuario] [bigint] NOT NULL,
	[Nombre] [varchar](250) NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
	[Correo] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TComentario] PRIMARY KEY CLUSTERED 
(
	[ConComentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TDetalle]    Script Date: 11/12/2023 06:19:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TDetalle](
	[ConDetalle] [bigint] IDENTITY(1,1) NOT NULL,
	[ConMaestro] [bigint] NOT NULL,
	[ConProducto] [bigint] NOT NULL,
	[PrecioPagado] [decimal](18, 2) NOT NULL,
	[CantidadPagado] [int] NOT NULL,
	[ImpuestoPagado] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_TDetalle] PRIMARY KEY CLUSTERED 
(
	[ConDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TMaestro]    Script Date: 11/12/2023 06:19:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TMaestro](
	[ConMaestro] [bigint] IDENTITY(1,1) NOT NULL,
	[ConUsuario] [bigint] NOT NULL,
	[FechaCompra] [datetime] NOT NULL,
	[TotalCompra] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_TMaestro] PRIMARY KEY CLUSTERED 
(
	[ConMaestro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TProducto]    Script Date: 11/12/2023 06:19:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TProducto](
	[ConProducto] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](250) NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[Imagen] [varchar](250) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_TProducto] PRIMARY KEY CLUSTERED 
(
	[ConProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TProvincia]    Script Date: 11/12/2023 06:19:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TProvincia](
	[ConProvincia] [bigint] NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TProvincia] PRIMARY KEY CLUSTERED 
(
	[ConProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRol]    Script Date: 11/12/2023 06:19:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRol](
	[ConRol] [bigint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](30) NOT NULL,
 CONSTRAINT [PK_TRol] PRIMARY KEY CLUSTERED 
(
	[ConRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TUsuario]    Script Date: 11/12/2023 06:19:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TUsuario](
	[ConUsuario] [bigint] IDENTITY(1,1) NOT NULL,
	[Identificacion] [varchar](25) NOT NULL,
	[Nombre] [varchar](250) NOT NULL,
	[Correo] [varchar](100) NOT NULL,
	[Contrasenna] [varchar](25) NOT NULL,
	[Estado] [bit] NOT NULL,
	[ConProvincia] [bigint] NOT NULL,
	[ConRol] [bigint] NOT NULL,
 CONSTRAINT [PK_TUsuario] PRIMARY KEY CLUSTERED 
(
	[ConUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TComentario] ON 

INSERT [dbo].[TComentario] ([ConComentario], [ConUsuario], [Nombre], [Descripcion], [Correo]) VALUES (3, 3, N'Kenneth Godinez Chaves', N'Me gusta el sitio', N'kenneth1311@hotmail.es')
INSERT [dbo].[TComentario] ([ConComentario], [ConUsuario], [Nombre], [Descripcion], [Correo]) VALUES (4, 4, N'SusanYasmynChaves', N'Exelente servicio', N'SusanChaves@11hotmail.com')
INSERT [dbo].[TComentario] ([ConComentario], [ConUsuario], [Nombre], [Descripcion], [Correo]) VALUES (5, 5, N'Daniel Gomez Chaves', N'Amables con los clientes', N'Danielgomez@hotmail.com')
INSERT [dbo].[TComentario] ([ConComentario], [ConUsuario], [Nombre], [Descripcion], [Correo]) VALUES (6, 6, N'Hector Contreras Palacios', N'Muy recomendados', N'Hectorpalacios@hotmail.com')
INSERT [dbo].[TComentario] ([ConComentario], [ConUsuario], [Nombre], [Descripcion], [Correo]) VALUES (7, 7, N'Valeria Valerio Ordoñes', N'Falta mas Mejoria', N'Valeria13@hotmail.com')
INSERT [dbo].[TComentario] ([ConComentario], [ConUsuario], [Nombre], [Descripcion], [Correo]) VALUES (8, 8, N'Eduardo Reyes Espinoza', N'Buen trato', N'EduardoReyes13@hotmail.com')
SET IDENTITY_INSERT [dbo].[TComentario] OFF
GO
SET IDENTITY_INSERT [dbo].[TDetalle] ON 

INSERT [dbo].[TDetalle] ([ConDetalle], [ConMaestro], [ConProducto], [PrecioPagado], [CantidadPagado], [ImpuestoPagado]) VALUES (11, 13, 18, CAST(200000.00 AS Decimal(18, 2)), 2, CAST(26000.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([ConDetalle], [ConMaestro], [ConProducto], [PrecioPagado], [CantidadPagado], [ImpuestoPagado]) VALUES (12, 14, 18, CAST(200000.00 AS Decimal(18, 2)), 6, CAST(26000.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([ConDetalle], [ConMaestro], [ConProducto], [PrecioPagado], [CantidadPagado], [ImpuestoPagado]) VALUES (13, 15, 17, CAST(100000.00 AS Decimal(18, 2)), 4, CAST(13000.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([ConDetalle], [ConMaestro], [ConProducto], [PrecioPagado], [CantidadPagado], [ImpuestoPagado]) VALUES (14, 15, 18, CAST(200000.00 AS Decimal(18, 2)), 7, CAST(26000.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([ConDetalle], [ConMaestro], [ConProducto], [PrecioPagado], [CantidadPagado], [ImpuestoPagado]) VALUES (15, 16, 17, CAST(100000.00 AS Decimal(18, 2)), 1, CAST(13000.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([ConDetalle], [ConMaestro], [ConProducto], [PrecioPagado], [CantidadPagado], [ImpuestoPagado]) VALUES (16, 17, 17, CAST(100000.00 AS Decimal(18, 2)), 1, CAST(13000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[TDetalle] OFF
GO
SET IDENTITY_INSERT [dbo].[TMaestro] ON 

INSERT [dbo].[TMaestro] ([ConMaestro], [ConUsuario], [FechaCompra], [TotalCompra]) VALUES (13, 6, CAST(N'2023-12-05T18:14:47.140' AS DateTime), CAST(452000.00 AS Decimal(18, 2)))
INSERT [dbo].[TMaestro] ([ConMaestro], [ConUsuario], [FechaCompra], [TotalCompra]) VALUES (14, 6, CAST(N'2023-12-05T18:24:36.530' AS DateTime), CAST(1356000.00 AS Decimal(18, 2)))
INSERT [dbo].[TMaestro] ([ConMaestro], [ConUsuario], [FechaCompra], [TotalCompra]) VALUES (15, 4, CAST(N'2023-12-05T18:56:48.470' AS DateTime), CAST(2034000.00 AS Decimal(18, 2)))
INSERT [dbo].[TMaestro] ([ConMaestro], [ConUsuario], [FechaCompra], [TotalCompra]) VALUES (16, 4, CAST(N'2023-12-05T19:02:18.570' AS DateTime), CAST(113000.00 AS Decimal(18, 2)))
INSERT [dbo].[TMaestro] ([ConMaestro], [ConUsuario], [FechaCompra], [TotalCompra]) VALUES (17, 4, CAST(N'2023-12-05T19:19:35.763' AS DateTime), CAST(113000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[TMaestro] OFF
GO
SET IDENTITY_INSERT [dbo].[TProducto] ON 

INSERT [dbo].[TProducto] ([ConProducto], [Nombre], [Descripcion], [Cantidad], [Precio], [Imagen], [Estado]) VALUES (17, N'short', N'Short de portivo para hombre', 1, CAST(3000.00 AS Decimal(18, 2)), N'/Template/img/short.jpg', 1)
INSERT [dbo].[TProducto] ([ConProducto], [Nombre], [Descripcion], [Cantidad], [Precio], [Imagen], [Estado]) VALUES (18, N'Kit Entrenamiento 1', N'Kit de entrenamiento cardio', 1, CAST(10000.00 AS Decimal(18, 2)), N'/Template/img/packentre.jpg', 1)
INSERT [dbo].[TProducto] ([ConProducto], [Nombre], [Descripcion], [Cantidad], [Precio], [Imagen], [Estado]) VALUES (19, N'Kit Entrenamiento 2', N'Kit de entrenamiento p-e', 1, CAST(15000.00 AS Decimal(18, 2)), N'/Template/img/apckentre2.jpg', 1)
INSERT [dbo].[TProducto] ([ConProducto], [Nombre], [Descripcion], [Cantidad], [Precio], [Imagen], [Estado]) VALUES (20, N'Playera deportiva', N'Playera deportiva para hombre', 2, CAST(5000.00 AS Decimal(18, 2)), N'/Template/img/playera.jpg', 1)
INSERT [dbo].[TProducto] ([ConProducto], [Nombre], [Descripcion], [Cantidad], [Precio], [Imagen], [Estado]) VALUES (21, N'rueda abdominal', N'Rueda abdominal gris con negro', 3, CAST(10000.00 AS Decimal(18, 2)), N'/Template/img/rueda.jpg', 1)
SET IDENTITY_INSERT [dbo].[TProducto] OFF
GO
INSERT [dbo].[TProvincia] ([ConProvincia], [Descripcion]) VALUES (1, N'San Jose')
INSERT [dbo].[TProvincia] ([ConProvincia], [Descripcion]) VALUES (2, N'Alajuela')
INSERT [dbo].[TProvincia] ([ConProvincia], [Descripcion]) VALUES (3, N'Cartago')
INSERT [dbo].[TProvincia] ([ConProvincia], [Descripcion]) VALUES (4, N'Heredia')
INSERT [dbo].[TProvincia] ([ConProvincia], [Descripcion]) VALUES (5, N'Puntarenas')
INSERT [dbo].[TProvincia] ([ConProvincia], [Descripcion]) VALUES (6, N'Guanacaste')
INSERT [dbo].[TProvincia] ([ConProvincia], [Descripcion]) VALUES (7, N'Limón')
INSERT [dbo].[TProvincia] ([ConProvincia], [Descripcion]) VALUES (8, N'Seleccione')
GO
SET IDENTITY_INSERT [dbo].[TRol] ON 

INSERT [dbo].[TRol] ([ConRol], [Descripcion]) VALUES (1, N'Administrador')
INSERT [dbo].[TRol] ([ConRol], [Descripcion]) VALUES (2, N'Usuario')
SET IDENTITY_INSERT [dbo].[TRol] OFF
GO
SET IDENTITY_INSERT [dbo].[TUsuario] ON 

INSERT [dbo].[TUsuario] ([ConUsuario], [Identificacion], [Nombre], [Correo], [Contrasenna], [Estado], [ConProvincia], [ConRol]) VALUES (3, N'118270622', N'Kenneth Godinez Chaves', N'kenneth1311@hotmail.es', N'202122', 1, 4, 1)
INSERT [dbo].[TUsuario] ([ConUsuario], [Identificacion], [Nombre], [Correo], [Contrasenna], [Estado], [ConProvincia], [ConRol]) VALUES (4, N'112010257', N'SusanYasmynChaves', N'SusanChaves@11hotmail.com', N'102040', 1, 4, 2)
INSERT [dbo].[TUsuario] ([ConUsuario], [Identificacion], [Nombre], [Correo], [Contrasenna], [Estado], [ConProvincia], [ConRol]) VALUES (5, N'118860740', N'Daniel Gomez Chaves', N'Danielgomez@hotmail.com', N'802030', 1, 1, 2)
INSERT [dbo].[TUsuario] ([ConUsuario], [Identificacion], [Nombre], [Correo], [Contrasenna], [Estado], [ConProvincia], [ConRol]) VALUES (6, N'118820054', N'Hector Contreras Palacios', N'Hectorpalacios@hotmail.com', N'105060', 1, 4, 1)
INSERT [dbo].[TUsuario] ([ConUsuario], [Identificacion], [Nombre], [Correo], [Contrasenna], [Estado], [ConProvincia], [ConRol]) VALUES (7, N'118860850', N'Valeria Valerio Ordoñes', N'Valeria13@hotmail.com', N'903045', 1, 1, 2)
INSERT [dbo].[TUsuario] ([ConUsuario], [Identificacion], [Nombre], [Correo], [Contrasenna], [Estado], [ConProvincia], [ConRol]) VALUES (8, N'118820896', N'Eduardo Reyes Espinoza', N'EduardoReyes@hotmail.com', N'708562', 1, 4, 2)
INSERT [dbo].[TUsuario] ([ConUsuario], [Identificacion], [Nombre], [Correo], [Contrasenna], [Estado], [ConProvincia], [ConRol]) VALUES (9, N'sample string 2', N'sample string 3', N'sample string 4', N'sample string 5', 1, 8, 2)
INSERT [dbo].[TUsuario] ([ConUsuario], [Identificacion], [Nombre], [Correo], [Contrasenna], [Estado], [ConProvincia], [ConRol]) VALUES (10, N'111111111', N'Jan Perez Silva', N'aaronhl1313@gmail.com', N'cosa', 1, 4, 1)
SET IDENTITY_INSERT [dbo].[TUsuario] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Identificacion]    Script Date: 11/12/2023 06:19:16 p. m. ******/
ALTER TABLE [dbo].[TUsuario] ADD  CONSTRAINT [UK_Identificacion] UNIQUE NONCLUSTERED 
(
	[Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TCarrito]  WITH CHECK ADD  CONSTRAINT [FK_TCarrito_TProducto] FOREIGN KEY([ConProducto])
REFERENCES [dbo].[TProducto] ([ConProducto])
GO
ALTER TABLE [dbo].[TCarrito] CHECK CONSTRAINT [FK_TCarrito_TProducto]
GO
ALTER TABLE [dbo].[TCarrito]  WITH CHECK ADD  CONSTRAINT [FK_TCarrito_TUsuario] FOREIGN KEY([ConUsuario])
REFERENCES [dbo].[TUsuario] ([ConUsuario])
GO
ALTER TABLE [dbo].[TCarrito] CHECK CONSTRAINT [FK_TCarrito_TUsuario]
GO
ALTER TABLE [dbo].[TDetalle]  WITH CHECK ADD  CONSTRAINT [FK_TDetalle_TMaestro] FOREIGN KEY([ConMaestro])
REFERENCES [dbo].[TMaestro] ([ConMaestro])
GO
ALTER TABLE [dbo].[TDetalle] CHECK CONSTRAINT [FK_TDetalle_TMaestro]
GO
ALTER TABLE [dbo].[TDetalle]  WITH CHECK ADD  CONSTRAINT [FK_TDetalle_TProducto] FOREIGN KEY([ConProducto])
REFERENCES [dbo].[TProducto] ([ConProducto])
GO
ALTER TABLE [dbo].[TDetalle] CHECK CONSTRAINT [FK_TDetalle_TProducto]
GO
ALTER TABLE [dbo].[TMaestro]  WITH CHECK ADD  CONSTRAINT [FK_TMaestro_TMaestro] FOREIGN KEY([ConUsuario])
REFERENCES [dbo].[TUsuario] ([ConUsuario])
GO
ALTER TABLE [dbo].[TMaestro] CHECK CONSTRAINT [FK_TMaestro_TMaestro]
GO
ALTER TABLE [dbo].[TUsuario]  WITH CHECK ADD  CONSTRAINT [FK_TUsuario_TProvincia] FOREIGN KEY([ConProvincia])
REFERENCES [dbo].[TProvincia] ([ConProvincia])
GO
ALTER TABLE [dbo].[TUsuario] CHECK CONSTRAINT [FK_TUsuario_TProvincia]
GO
ALTER TABLE [dbo].[TUsuario]  WITH CHECK ADD  CONSTRAINT [FK_TUsuario_TRol] FOREIGN KEY([ConRol])
REFERENCES [dbo].[TRol] ([ConRol])
GO
ALTER TABLE [dbo].[TUsuario] CHECK CONSTRAINT [FK_TUsuario_TRol]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarCuentaSP]    Script Date: 11/12/2023 06:19:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ActualizarCuentaSP]
	@Identificacion	VARCHAR(25),
	@Nombre			VARCHAR(250),
	@Correo			VARCHAR(100),
	@ConProvincia	BIGINT,
	@ConUsuario		BIGINT
AS
BEGIN
	
	UPDATE	dbo.TUsuario
	SET		Identificacion = @Identificacion,
			Nombre = @Nombre,
			Correo = @Correo,
			ConProvincia = @ConProvincia
	WHERE	ConUsuario = @ConUsuario

END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarEstadoUsuarioSP]    Script Date: 11/12/2023 06:19:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ActualizarEstadoUsuarioSP]
	@ConUsuario BIGINT
AS
BEGIN

	UPDATE	TUsuario
	SET		Estado = (CASE WHEN Estado = 1 THEN 0 ELSE 1 END)
	WHERE	ConUsuario = @ConUsuario

END
GO
/****** Object:  StoredProcedure [dbo].[IniciarSesionSP]    Script Date: 11/12/2023 06:19:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[IniciarSesionSP]
	@Correo         varchar(100),
    @Contrasenna    varchar(25)
AS
BEGIN
	
	SELECT ConUsuario,
		   Identificacion,
		   Nombre,
		   Correo,
		   Contrasenna,
		   Estado,
		   P.Descripcion 'DescripcionProvincia',
		   R.Descripcion 'DescripcionRol'
	  FROM dbo.TUsuario	  U
	  INNER JOIN dbo.TRol		R ON U.ConRol = R.ConRol
	  INNER JOIN dbo.TProvincia P ON U.ConProvincia = P.ConProvincia
	  WHERE Correo = @Correo
	  AND   Contrasenna = @Contrasenna
	  AND	Estado = 1

END
GO
/****** Object:  StoredProcedure [dbo].[PagarCarrito]    Script Date: 11/12/2023 06:19:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PagarCarrito]
	@ConUsuario BIGINT
AS
BEGIN
	
	--IF (SELECT	P.Cantidad - C.Cantidad 
	--	FROM	TProducto	P
	--	INNER	JOIN	TCarrito  C	ON P.ConProducto = C.ConProducto
	--	WHERE	ConUsuario = @ConUsuario) >= 0

	IF (SELECT	TOP 1 P.Cantidad - C.Cantidad 
		FROM	TProducto	P
		INNER	JOIN	TCarrito  C	ON P.ConProducto = C.ConProducto
		WHERE	ConUsuario = @ConUsuario) < 0
	BEGIN

		SELECT 'FALSE'
		
	END
	ELSE
	BEGIN

		DECLARE @TotalCompra DECIMAL(18,2)
		DECLARE @CodigoMaestro BIGINT
	
		SELECT	@TotalCompra = SUM(P.Precio * C.Cantidad) + (SUM(P.Precio * C.Cantidad) * 0.13)
		FROM	TCarrito C
		INNER	JOIN TProducto P ON C.ConProducto = P.ConProducto
		WHERE	ConUsuario = @ConUsuario

		INSERT INTO dbo.TMaestro(ConUsuario,FechaCompra,TotalCompra)
		VALUES (@ConUsuario, GETDATE(), @TotalCompra)

		SET @CodigoMaestro = @@IDENTITY

		INSERT INTO dbo.TDetalle(ConMaestro,ConProducto,PrecioPagado,CantidadPagado,ImpuestoPagado)
		SELECT	@CodigoMaestro, C.ConProducto, P.Precio, C.Cantidad, P.Precio * 0.13
		FROM	TCarrito C
		INNER	JOIN TProducto P ON C.ConProducto = P.ConProducto
		WHERE	ConUsuario = @ConUsuario

		UPDATE	P
		SET		P.Cantidad = P.Cantidad - C.Cantidad
		FROM	TProducto P
		INNER	JOIN TCarrito C ON C.ConProducto = P.ConProducto
		WHERE	ConUsuario = @ConUsuario

		DELETE FROM TCarrito
		WHERE ConUsuario = @ConUsuario

		SELECT 'TRUE'

	END

END
GO
/****** Object:  StoredProcedure [dbo].[RecuperarCuentaSP]    Script Date: 11/12/2023 06:19:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RecuperarCuentaSP]
	@Identificacion varchar(25)
AS
BEGIN
	
	SELECT Nombre,
		   Correo,
		   Contrasenna
	  FROM dbo.TUsuario
	  WHERE Identificacion = @Identificacion

END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarCuentaSP]    Script Date: 11/12/2023 06:19:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RegistrarCuentaSP]
	@Identificacion varchar(25),
    @Nombre         varchar(250),
    @Correo         varchar(100),
    @Contrasenna    varchar(25)
AS
BEGIN

	INSERT INTO dbo.TUsuario (Identificacion,Nombre,Correo,Contrasenna,Estado,ConProvincia,ConRol)
    VALUES (@Identificacion,@Nombre,@Correo,@Contrasenna,1,8,2)

END
GO
