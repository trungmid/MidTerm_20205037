--query 
select Diachi, tenChuNha
from nhaChoThue 
where giaThue < 10000000;

 
update nhaChoThue set tenChuNha = N'Nông Văn Điền' Where maN = 'Nha1'; 
select maKH, hoTen, coQuan
from khachHang 
where maKH in 
(   select maKH from hopDong where maN  in (select maN from nhaChoThue where tenChuNha = N'Nông Văn Điền')

);


select * 
from nhaChoThue
where maN not in (
    select maN 
	from hopDong);


	select max(giaThue) as giaThueCaoNhat 
	from nhaChoThue 
	where maN in (select maN from hopDong)
	;


-- c
create index Idx_KhachHang_coQuan on khachHang(coQuan);
select *
from khachHang where coQuan = 'HUST';


create index Idx_nhaChoThue_maN on nhaChoThue(maN);
select t.maN, t.tenChuNha, t1.soNhaChoThue
from nhaChoThue as t inner join (
    select maN, count(maN) as soNhaChoThue from hopDong group by maN)
	as t1 on t.maN = t1.maN;


-- d
--create procedure hopDongProcedure @threshold int 
--as
--select * 
--from hopDong 
--where maN in (  select maN from nhaChoThue where giaThue > @threshold)


