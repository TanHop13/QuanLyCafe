# QuanLyCafe (hướng dẫn cài đặt)
1. Tải Visual Studio 2022
Tải Visual Studio phiên bản tương ưng theo dòng máy và link: https://visualstudio.microsoft.com/downloads/
![image](https://github.com/TanHop13/QuanLyCafe/assets/116043498/eed044dd-f4d8-4371-aeff-3790eabca869)
Sau khi tải và cài đặt file .exe, ta tải các data cần
![image](https://github.com/TanHop13/QuanLyCafe/assets/116043498/37c01176-f25e-47a9-9e79-67720f7906d7)

2. Tải SQL Server
Link tải: https://www.microsoft.com/vi-vn/sql-server/sql-server-downloads
![image](https://github.com/TanHop13/QuanLyCafe/assets/116043498/d1ad8876-91c9-4f32-980d-2327f1da64f0)
Có thể xem hướng dẫn cài đặt theo link: https://kb.pavietnam.vn/huong-dan-cai-dat-sql-server-2022.html

3. Tạo database
Sau khi pull code về máy, trong folder sẽ có một file database.sql -> chọn mở bằng SQL Server -> cho chạy toàn bộ code trong file:
![image](https://github.com/TanHop13/QuanLyCafe/assets/116043498/2dc82d92-6c59-4f6f-b44f-1608f2f77f71)
![image](https://github.com/TanHop13/QuanLyCafe/assets/116043498/aa8e1ec4-5c3e-4cb6-b7ff-2be4a95ea774)

4. Chạy file code
Mở file code -> Mở mục Web.config -> Sửa vị trị ba chấm "data source= ..." bằng tên SQL Server của máy tương ứng
![image](https://github.com/TanHop13/QuanLyCafe/assets/116043498/8db99934-d05d-4bb1-bcc5-aec1faacc5cc)
