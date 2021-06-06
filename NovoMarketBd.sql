create database novomarket;                         
use novomarket;
/**/

/*Tabla cliente*/
create table Cliente(
idcli int primary key not null auto_increment,
nomcli varchar(40)not null,
apecli varchar(80)not null,
numcli char(8)not null
);
select*from cliente;
insert into Cliente values(1,"Luis","Zavala Terrones","95874153");
insert into Cliente values(2,"Rodrigo","Sarazu Taipe","95874153");


create table proveedor(
	idprove int primary key not null auto_increment,
    nomprove varchar(50) not null,
    ruc int(8) not null,
    nomcontacto varchar(50) not null,
    direccion varchar(90) not null,
    telefono char(9) not null
);
 
insert into proveedor values(1,'San Fernando',45214589,'Juan Guerra','AV. Las Colmenas 750',998542138);
/*insert into proveedor values(1,"Av.Alfonso Ugarte","Juan Garcia","Metro",700214536,235146);*/
	



create table MetodoPago(
idmetpago int primary key not null auto_increment,
tipopago varchar(20)not null
);

select*from metodopago;

insert into MetodoPago values(1,'America express');
insert into MetodoPago values(2,'Paypal');
insert into MetodoPago values(3,'Yape');
insert into MetodoPago values(4,'Visa');
insert into MetodoPago values(5,'Bitcoin');
insert into MetodoPago values(6,'MasterCard');
/*Tabla categorias*/
create table categorias(
idcat int primary key not null auto_increment,
nomcat varchar(20)not null
);
insert into categorias values(1,"Bebidas gaseosas");
select*from categorias;

-- Productos del Oxoo

create table Producto(
idprod int primary key not null auto_increment,
idcat int not null,
idprove int not null,
nomprod varchar(30)not null,
fechavenc datetime not null,
precio double not null,
stock_min int not null,
stock_act int not null,
foto varchar(150)not null,
foreign key(idcat)references categorias(idcat),
foreign key(idprove)references proveedor(idprove)
);

select*from Producto;

insert into Producto values(1,1,1,'Pepsi cola','2020-12-22',2.50,3,30,'pepsi.png');

/*tabla domicilio*/

create table Domicilio(
iddomici int primary key not null auto_increment,
idcli int not null,
ciudad varchar(20) not null,
distrito varchar(20)not null,
calle varchar(100) not null,
foreign key(idcli) references Cliente(idcli)
);

select*from Domicilio;

insert into Domicilio values(1,1,'Lima','Santa Anita','Av. Magallares 150');
/*insert into Domicilio values(2,2,'Lima','Breña','Av. Pilcomayo 735') ;
insert into Domicilio values(3,3,'Lima','Callao','Av. La Punta 751');
--Solo hay un usuario
*/

create table Pedido_Venta(
idvta int primary key not null,
idcli int not null,
iddomici int not null,
idmetpago int not null,
fecha datetime not null,
estado varchar(20)not null,
total double not null,
foreign key (idcli) references Cliente(idcli),
foreign key (iddomici) references Domicilio(iddomici),
foreign key (idmetpago) references MetodoPago(idmetpago)
);

select*from pedido_venta;
insert into pedido_venta values(1,1,1,1,"2020-12-21","E",15.5);

create table Detallepedidoventa(
iddetvta int primary key not null,
idprod int not null,
idvta int not null,
cantidad int not null,
precio double not null,
foreign key (idprod) references Producto(idprod),
foreign key (idvta) references pedido_venta(idvta)
);
select*from Detallepedidoventa;
insert into Detallepedidoventa values (1,1,1,5,50.5);