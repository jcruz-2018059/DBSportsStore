/*
	Nombre Completo: José Javier Cruz de la Cruz
    Código Tecnico: IN5AM
    Fecha de Creación: 1/02/2022
    Fecha de Modificación: 9/02/2022
*/

Drop database if exists DBSportStore2018059;
Create database DBSportStore2018059;

Use DBSportStore2018059;

Create table Categorias(
	codigoCategoria int auto_increment not null,
    descripcion varchar(150) not null,
    primary key PK_codigoCategoria (codigoCategoria)
);

Create table Marcas(
	codigoMarca int not null auto_increment,
    descripcion varchar(150) not null,
    primary key PK_codigoMarca (codigoMarca)
);

Create table Tallas(
	codigoTalla int not null auto_increment,
	descripcion varchar(150) not null,
	primary key PK_codigoTalla (codigoTalla)
);

Create table Productos (
	codigoProducto int not null auto_increment,
    descripcion varchar(150) not null,
    existencia int not null,
    precioUnitario decimal (10,2) not null default 0.00,
    precioPorDocena decimal (10,2) not null default 0.00,
    precioPorMayor decimal (10,2) not null default 0.00,
    codigoCategoria int not null,
    codigoMarca int not null,
    codigoTalla int not null,
    primary key PK_codigoProducto (codigoProducto),
    constraint FK_Productos_Categoria foreign key (codigoCategoria)
		references Categorias(codigoCategoria),
    constraint FK_Productos_Marcas foreign key (codigoMarca)
		references Marcas(codigoMarca),
	constraint FK_Productos_Tallas foreign key (codigoTalla)
		references Tallas(codigoTalla)
);

-- ------------------PROCEDIMIENTOS ALMACENADOS CATEGORIAS------------------------

-- -----------------------------Agregar-------------------------------------------
Delimiter $$
	Create procedure sp_AgregarCategoria (in descripcion varchar(150))
		Begin
			Insert into Categorias (descripcion) values (descripcion);
		End$$
Delimiter ;

call sp_AgregarCategoria('Ropa de Caballero');
call sp_AgregarCategoria('Ropa para dama');
call sp_AgregarCategoria('Ropa para niño');
call sp_AgregarCategoria('Ropa para niña');
call sp_AgregarCategoria('Accesorios');

-- ------------------------------Listar-------------------------------------------
Delimiter $$
	Create procedure sp_ListarCategorias()
		Begin	
			Select 
            C.codigoCategoria,
            C.descripcion
            from Categorias C;
		End$$
Delimiter ;

call sp_ListarCategorias();
	
-- ------------------------------Buscar-------------------------------------------
Delimiter $$
	Create procedure sp_BuscarCategoria(in codCat int)
		Begin	
			select 	
				C.codigoCategoria,
				C.descripcion
				from Categorias C where codigoCategoria = codCat;
		End$$
Delimiter ;

call sp_BuscarCategoria(1);

-- ------------------------------Eliminar-----------------------------------------
Delimiter $$
	Create procedure sp_EliminarCategoria(in codCat int)
		Begin
			Delete from Categorias
				where codigoCategoria = codCat;
		End$$
Delimiter ;

call sp_EliminarCategoria(1);
call sp_ListarCategorias();

-- ------------------------------Editar-------------------------------------------
Delimiter $$
	Create procedure sp_EditarCategoria(in codCat int, in descr varchar(150))
		Begin 
			update Categorias C 
				Set descripcion = descr
					where codigoCategoria = codCat;
		End$$
Delimiter ;

call sp_EditarCategoria(2,'Zapatos Deportivos');
call sp_ListarCategorias();



-- ------------------PROCEDIMIENTOS ALMACENADOS MARCAS----------------------------

-- -----------------------------Agregar-------------------------------------------
Delimiter $$
	Create procedure sp_AgregarMarca (in descripcion varchar(150))
		Begin
			Insert into Marcas (descripcion) values (descripcion);
		End$$
Delimiter ;

call sp_AgregarMarca('Adidas');
call sp_AgregarMarca('Nike');
call sp_AgregarMarca('Skechers');
call sp_AgregarMarca('Puma');
call sp_AgregarMarca('Rebook');

-- ------------------------------Listar-------------------------------------------
Delimiter $$
	Create procedure sp_ListarMarcas()
		Begin	
			Select 
            M.codigoMarca,
            M.descripcion
            from Marcas M;
		End$$
Delimiter ;

call sp_ListarMarcas();

-- ------------------------------Buscar-------------------------------------------
Delimiter $$
	Create procedure sp_BuscarMarca(in codMarc int)
		Begin	
			select 	
				M.codigoMarca,
				M.descripcion
				from Marcas M where codigoMarca = codMarc;
		End$$
Delimiter ;

call sp_BuscarMarca(3);

-- ------------------------------Eliminar-----------------------------------------
Delimiter $$
	Create procedure sp_EliminarMarca(in codMarc int)
		Begin
			Delete from Marcas
				where codigoMarca = codMarc;
		End$$
Delimiter ;

call sp_EliminarMarca(2);
call sp_ListarMarcas();

-- ------------------------------Editar-------------------------------------------
Delimiter $$
	Create procedure sp_EditarMarca(in codMarc int, in descr varchar(150))
		Begin 
			update Marcas M
				Set descripcion = descr
					where codigoMarca = codMarc;
		End$$
Delimiter ;

call sp_EditarMarca(4,'Champions');
call sp_ListarMarcas();



-- ------------------PROCEDIMIENTOS ALMACENADOS TALLAS----------------------------

-- -----------------------------Agregar-------------------------------------------
Delimiter $$
	Create procedure sp_AgregarTalla (in descripcion varchar(150))
		Begin
			Insert into Tallas(descripcion) values(descripcion);
		End$$
Delimiter ;

call sp_AgregarTalla('S');
call sp_AgregarTalla('M');
call sp_AgregarTalla('L');
call sp_AgregarTalla('XL');
call sp_AgregarTalla('XXL');

-- ------------------------------Listar-------------------------------------------
Delimiter $$
	Create procedure sp_ListarTallas ()
		Begin
			Select
			T.codigoTalla,
			T.descripcion 
			from Tallas T;
		End$$
Delimiter ;

call sp_ListarTallas();

-- ------------------------------Buscar-------------------------------------------
Delimiter $$
	Create procedure sp_BuscarTalla (in codTa int)
		Begin 
			Select
			T.codigoTalla,
			T.descripcion 
			from Tallas T where codigoTalla = codTa;
		End$$
Delimiter ;

call sp_BuscarTalla(5);

-- ------------------------------Eliminar-----------------------------------------
Delimiter $$
	Create procedure sp_EliminarTalla (in codTa int)
		Begin
			Delete from Tallas
				where codigoTalla = codTa;
		End$$
Delimiter ;

call sp_EliminarTalla(3);
call sp_ListarTallas();

-- ------------------------------Editar-------------------------------------------
Delimiter $$
	Create procedure sp_EditarTalla (in codta int, in descr varchar(150))
		Begin
			update Tallas T
				set descripcion = descr
					where codigoTalla = codta;
		End$$
Delimiter ;

call sp_EditarTalla (1,'40');
call sp_ListarTallas();



-- ------------------PROCEDIMIENTOS ALMACENADOS PRODUCTOS-------------------------

-- -----------------------------Agregar-------------------------------------------
Delimiter $$
	Create procedure sp_AgregarProducto (in descripcion varchar(150), in existencia int, in codigoCategoria int, in codigoMarca int, in codigoTalla int)
		Begin
			insert into Productos(descripcion, existencia, codigoCategoria, codigoMarca, codigoTalla) 
            values (descripcion, existencia, codigoCategoria, codigoMarca, codigoTalla);
		End$$
Delimiter ;

call sp_AgregarProducto('Camisola', 15, 3, 1, 2);
call sp_AgregarProducto('Sudadera', 20, 4, 4, 5);
call sp_AgregarProducto('Gorra', 10, 5, 3, 2);
call sp_AgregarProducto('Tennis', 25, 2, 5, 1);
call sp_AgregarProducto('Rodilleras', 12, 5, 4, 2);

-- ------------------------------Listar-------------------------------------------
Delimiter $$
	Create procedure sp_ListarProductos ()
		Begin
			Select 
            P.codigoProducto, 
            P.descripcion, 
            P.existencia, 
            P.precioUnitario, 
            P.precioPorDocena, 
            P.precioPorMayor, 
            P.codigoCategoria, 
            P.codigoMarca, 
            P.codigoTalla
            from Productos P;
		End$$
Delimiter ;

call sp_ListarProductos ();

-- ------------------------------Buscar-------------------------------------------
Delimiter $$
	Create procedure sp_BuscarProducto (in codPro int)
		Begin
			Select 
            P.codigoProducto, 
            P.descripcion, 
            P.existencia, 
            P.precioUnitario, 
            P.precioPorDocena, 
            P.precioPorMayor, 
            P.codigoCategoria, 
            P.codigoMarca, 
            P.codigoTalla
            from Productos P where codigoProducto = codPro;
		End$$
Delimiter ;

call sp_BuscarProducto(3);

-- ------------------------------Eliminar-----------------------------------------
Delimiter $$
	Create procedure sp_EliminarProducto (in codPro int)
		Begin 
			delete from Productos
				where codigoProducto = codPro;
		End$$
Delimiter ;

call sp_EliminarProducto(1);
call sp_ListarProductos ();

-- ------------------------------Editar-------------------------------------------
Delimiter $$
	Create procedure sp_EditarProducto (in codPro int, in descripcion varchar(150), in existencia int, in codigoCategoria int, in codigoMarca int, in codigoTalla int)
		Begin
			Update Productos P
				set P.descripcion = descripcion,
					P.existencia = existencia,
					P.codigoCategoria = codigoCategoria,
					P.codigoMarca =  codigoMarca,
					P.codigoTalla = codigoTalla
					where codigoProducto = codPro;
			End$$
Delimiter ;
                
call sp_EditarProducto(5,'Casco', 16, 5, 4, 1);
call sp_ListarProductos ();
