
create database DBHousing; 
use DBHousing


drop table  if exists khachHang;
drop table  if exists nhaChoThue; 
drop table if exists hopDong;


create table khachHang
(
    maKH nchar(50) not null primary key,
	hoTen nchar(50) not null,
	sdt varchar(15), 
	coQuan nchar(50)
);


create table nhaChoThue
(
      maN varchar(15) not null primary key,
	  diaChi nchar(50) not null, 
	  giaThue money, 
	  tenChuNha nchar(50)
);

create table hopDong
(
     maN varchar(15) not null ,
	 maKH nchar(50) not null,
	 ngaybatdau datetime, 
	 ngayketthuc datetime,
	foreign key (maKH) references khachHang(maKH) on delete cascade on update cascade, 
	foreign key (maN) references nhaChoThue(maN) on delete cascade on update cascade
);


insert into khachHang values
('KH1', N'Lê Thị A', '094285678', 'Hust'),
('KH2', N'Lê Thị B', '094285688', 'Hust'),
('KH3', N'Lê Thị C', '094285698', 'Hust'),
('KH4', N'Lê Thị D', '094285618', 'Hust'),
('KH5', N'Lê Thị E', '094285628', 'Hust'),
('KH6', N'Lê Thị F', '094285668', 'Hust'),
('KH7', N'Lê Thị G', '094285178', 'Hust'),
('KH8', N'Lê Thị H', '094285278', 'Hust'),
('KH9', N'Lê Thị I', '094285378', 'Hust'),
('KH10', N'Lê Thị K', '094284678', 'Hust'),
('KH11', N'Lê Thị L', '094285678', 'Hust'),
('KH12', N'Lê Thị M', '094286678', 'Hust'),
('KH13', N'Lê Thị N', '094287678', 'Hust'),
('KH14', N'Lê Thị O', '094288678', 'Hust'),
('KH15', N'Lê Thị P', '094289678', 'Hust')



insert into nhaChoThue values
('Nha1', N'Đại Cồ Việt, Hà Nội', 2888880, N'Mai Lan A'),
('Nha2', N'Đại Cồ Việt, Hà Nội', 2588888, N'Mai Lan A'),
('Nha3', N'Đại Cồ Việt, Hà Nội', 28888800, N'Mai Lan A'),
('Nha4', N'Đại Cồ Việt, Hà Nội', 18888800, N'Mai Lan A'),
('Nha5', N'Đại Cồ Việt, Hà Nội', 5888880, N'Mai Lan A'),
('Nha6', N'Đại Cồ Việt, Hà Nội', 6588888, N'Mai Lan A'),
('Nha7', N'Đại Cồ Việt, Hà Nội', 7888888, N'Mai Lan A'),
('Nha8', N'Đại Cồ Việt, Hà Nội', 12888880, N'Mai Lan A'),
('Nha9', N'Đại Cồ Việt, Hà Nội', 32888880, N'Mai Lan A'),
('Nha10', N'Đại Cồ Việt, Hà Nội', 2588888, N'Mai Lan A'),
('Nha11', N'Đại Cồ Việt, Hà Nội', 2006000, N'Mai Lan A'),
('Nha12', N'Đại Cồ Việt, Hà Nội', 22888880, N'Mai Lan A'),
('Nha13', N'Đại Cồ Việt, Hà Nội', 62888880, N'Mai Lan A'),
('Nha14', N'Đại Cồ Việt, Hà Nội', 2788888, N'Mai Lan A'),
('Nha15', N'Đại Cồ Việt, Hà Nội', 2988888, N'Mai Lan A')


--alter table hopDong add ngayBatDau datetime; 
--alter table hopDong add ngatKetThuc datetime;


insert into hopDong values
('Nha1', 'KH1', '2012-1-12', '2021-1-12'),
('Nha5', 'KH10', '2013-1-12', '2021-1-12'),
('Nha2', 'KH9', '2014-1-12', '2021-1-12'),
('Nha4', 'KH8', '2015-1-12', '2021-1-12'),
('Nha7', 'KH3', '2016-1-12', '2021-1-12'),
('Nha15', 'KH15', '2017-1-12', '2021-1-12'),
('Nha12', 'KH7','2018-1-12', '2021-1-12'),
('Nha14', 'KH14', '2019-1-12', '2021-1-12'),
('Nha13', 'KH13', '2020-1-12', '2021-1-12')






