-- 1. Đổi tên bảng countries  thành country_new
ALTER TABLE countries 
RENAME TO country_new


-- 2. Thêm cột region_id tới bảng locations
ALTER TABLE locations
ADD COLUMN region_id INT;

-- 3. thêm cột id vào bản locatión với điều kiện cột ID là cột đầu tiên của bảng
ALTER TABLE locations
ADD COLUMN ID INT FIRST;


-- 4. Thêm cột region_id đứng liền sau cột state_province của bảng location
ALTER TABLE locations
ADD COLUMN region_id INT
AFTER state_province;

-- 5. Thay đổi kiểu dữ liệu của cột country_id thành integer trong bảng locations
ALTER TABLE locations
ALTER COLUMN country_id TYPE integer;

-- 6. Xóa cột city trong bảng locations
ALTER TABLE locations
DROP COLUMN city;

-- 7 đổi tên cột state_province thành cột state, giữ nguyên kiểu và kích thước của cột
ALTER TABLE locations
DROP COLUMN state_province,
ADD COLUMN state varchar(25)
ALTER city

ALTER TABLE locations 
CHANGE state_province state varchar(25);


-- 8. thêm cột khóa chính cho cột location_id trong bảng location
ALTER TABLE locations
ADD PRIMARY KEY(location_id);


-- 9. thêm khóa chính là 2 cặp cột location_id , country_id  cho bảng locations
ALTER TABLE locations
ADD PRIMARY KEY(location_id, country_id);

-- 10 . Xóa khóa chính là cặp (location_id , country_id) đã tạo
ALTER TABLE locations DROP CONSTRAINT PRIMARY KEY;

--11.Tạo khóa ngoại job_id cho bảng job_history mà tham chiếu tới job_id của bảng jobs
ALTER TABLE job_history
ADD FOREIGN KEY(job_id)
REFERENCES jobs(job_id)


-- 12. tạo ràng buộc có tên là fk_job_id trong bảng job_history đã tạo
ALTER TABLE job_history
CONSTRAINT fk_job_id 
FOREIGN KEY (job_id) 
REFERENCES jobs(job_id) 
ON UPDATE RESTRICT
ON DELETE CASCADE;


-- 13. xóa kkhóa ngoại fk_job_id trong bảng job_histỏry đã tạo
ALTER TABLE job_history
DROP CONSTRAINT fk_job_id;


-- 14. thêm chỉ mục có tên indx_job_id trên cột job_id của bảng job_history
ALTER TABLE job_history
ADD INDEX indx_job_id(job_id);


-- 15 . xóa chỉ mục indx_job_id trong bảng job_history
ALTER TABLE job_history
DROP INDEX indx_job_id;
