-- --create database DBHousing; 




-- use DBHousing


-- drop table  if exists khachHang;
-- drop table  if exists nhaChoThue; 
-- drop table if exists hopDong;


-- create table khachHang
-- (
--     maKH nchar(50) not null primary key,
-- 	hoTen nchar(50) not null,
-- 	sdt varchar(15), 
-- 	coQuan nchar(50)
-- );


-- create table nhaChoThue
-- (
--       maN varchar(15) not null primary key,
-- 	  diaChi nchar(50) not null, 
-- 	  giaThue money, 
-- 	  tenChuNha nchar(50)
-- );

-- create table hopDong
-- (
--      maN varchar(15) not null ,
-- 	 maKH nchar(50) not null,
-- 	foreign key (maKH) references khachHang(maKH) on delete cascade on update cascade, 
-- 	foreign key (maN) references nhaChoThue(maN) on delete cascade on update cascade
-- );


-- insert into khachHang values
-- ('KH1', N'Lê Thị A', '012345678', 'Hust'),
-- ('KH2', N'Lê Thị B', '012345688', 'Hust'),
-- ('KH3', N'Lê Thị C', '012345698', 'Hust'),
-- ('KH4', N'Lê Thị D', '012345618', 'Hust'),
-- ('KH5', N'Lê Thị E', '012345628', 'Hust'),
-- ('KH6', N'Lê Thị F', '012345668', 'Hust'),
-- ('KH7', N'Lê Thị G', '012345178', 'Hust'),
-- ('KH8', N'Lê Thị H', '012345278', 'Hust'),
-- ('KH9', N'Lê Thị I', '012345378', 'Hust'),
-- ('KH10', N'Lê Thị K', '012344678', 'Hust'),
-- ('KH11', N'Lê Thị L', '012345678', 'Hust'),
-- ('KH12', N'Lê Thị M', '012346678', 'Hust'),
-- ('KH13', N'Lê Thị N', '012347678', 'Hust'),
-- ('KH14', N'Lê Thị O', '012348678', 'Hust'),
-- ('KH15', N'Lê Thị P', '012349678', 'Hust')



-- insert into nhaChoThue values
-- ('Nha1', N'Đại Cồ Việt, Hà Nội', 2000000, N'Mai Lan A'),
-- ('Nha2', N'Đại Cồ Việt, Hà Nội', 2500000, N'Mai Lan A'),
-- ('Nha3', N'Đại Cồ Việt, Hà Nội', 20000000, N'Mai Lan A'),
-- ('Nha4', N'Đại Cồ Việt, Hà Nội', 10000000, N'Mai Lan A'),
-- ('Nha5', N'Đại Cồ Việt, Hà Nội', 5000000, N'Mai Lan A'),
-- ('Nha6', N'Đại Cồ Việt, Hà Nội', 6500000, N'Mai Lan A'),
-- ('Nha7', N'Đại Cồ Việt, Hà Nội', 7800000, N'Mai Lan A'),
-- ('Nha8', N'Đại Cồ Việt, Hà Nội', 12000000, N'Mai Lan A'),
-- ('Nha9', N'Đại Cồ Việt, Hà Nội', 32000000, N'Mai Lan A'),
-- ('Nha10', N'Đại Cồ Việt, Hà Nội', 2500000, N'Mai Lan A'),
-- ('Nha11', N'Đại Cồ Việt, Hà Nội', 2006000, N'Mai Lan A'),
-- ('Nha12', N'Đại Cồ Việt, Hà Nội', 22000000, N'Mai Lan A'),
-- ('Nha13', N'Đại Cồ Việt, Hà Nội', 62000000, N'Mai Lan A'),
-- ('Nha14', N'Đại Cồ Việt, Hà Nội', 2700000, N'Mai Lan A'),
-- ('Nha15', N'Đại Cồ Việt, Hà Nội', 2900000, N'Mai Lan A')


-- alter table hopDong add ngayBatDau datetime; 
-- alter table hopDong add ngatKetThuc datetime;


-- insert into hopDong values
-- ('Nha1', 'KH1', '2012-1-12', '2021-1-12'),
-- ('Nha5', 'KH10', '2013-1-12', '2021-1-12'),
-- ('Nha2', 'KH9', '2014-1-12', '2021-1-12'),
-- ('Nha4', 'KH8', '2015-1-12', '2021-1-12'),
-- ('Nha7', 'KH3', '2016-1-12', '2021-1-12'),
-- ('Nha15', 'KH15', '2017-1-12', '2021-1-12'),
-- ('Nha12', 'KH7','2018-1-12', '2021-1-12'),
-- ('Nha14', 'KH14', '2019-1-12', '2021-1-12'),
-- ('Nha13', 'KH13', '2020-1-12', '2021-1-12')






