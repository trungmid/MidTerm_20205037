-- --2.1

-- SELECT *
-- from giangVien
-- WHERE GV# = 'GV001';

-- --2.2

-- select count(DT#)
-- from deTai
-- where tenDt like 'ứng dụng';


-- --2.3


-- select count(DISTINCT SV#)
-- from huongDan join sinhVien
-- USING (SV#)
-- where queQuan = 'hải phòng';

-- --2.4

-- SELECT tenDT
-- from deTai dt 
-- WHERE not exists (SELECT * 
--                  from huongDan hd 
--                  WHERE hd.DT# = dt.DT#);

-- --2.5

-- update sinhVien SET ngaySinh = '1991-12-11'
-- WHERE tenSV = 'Nguyễn Xuân Dũng'
-- and queQuan = 'Hà Nam'


-- --2.6
-- delete from sinhVien 
-- where tenSV = 'Nguyễn Văn Nam'
-- and queQuan = 'bắc giang' CASCADE;



-- --2.7 
-- create or REPLACE VIEW thong_tin_huong_dan AS
-- SELECT giangVien.hoTen, deTai.*
-- from giangVien join huongDan
-- using (GV#) join detai using(DT#);





-- --2.8
-- select *
-- from thong_tin_huong_dan
-- where namThucHien ='2022';


-- --2.9

-- CREATE CLUSTERED INDEX ix_nth
-- ON thong_tin_huong_dan.namThucHien('2022');

-- create index ix_nth
-- ON thong_tin_huong_dan.namThucHien('2022');


-- --

-- -- sao lưu
-- USE htql
-- BACKUP DATABASE htql TO DISK = 'E:\Kì 2021-2\Cơ sở dữ liệu\Thực hành\Lab\Midterm\htql.bak'

-- -- phục hồi
-- RESTORE DATABASE htql FROM DISK = 'E:\Kì 2021-2\Cơ sở dữ liệu\Thực hành\Lab\Midterm\htql.bak'



-- --4 
-- create user thuyNV with password 'thuy123';
-- GRANT select on giangVien, huongDan to thuyNV;
-- create user quanTL with PASSWORD 'quan123';
-- GRANT create table on htql to quanTL;
-- grant create VIEW on htql to quanTL;

-- --4.b



