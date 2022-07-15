create database QLSV_2022
use QLSV_2022

create table DMKHOA(
	MaKhoa nvarchar(10) primary key not null, 
	TenKhoa nvarchar(50) not null
)
drop table DMKHOA 
create table DMNGANH(
	MaNganh char(10) primary key not null,
	TenNganh nvarchar(50) not null,
	MaKhoa nvarchar(10) foreign key references DMKHOA (MaKhoa) 
)
drop table DMNGANH 
create table DMLOP(
	MaLop char(5) primary key not null,
	TenLop nvarchar(50) not null,
	MaNganh char(10) foreign key references DMNGANH (MaNganh),
	KhoaHoc int not null,
	HeDT char(4) not null,
	NamNhapHoc int not null
)
drop table DMLOP 
create table SINHVIEN(
	MaSV int Identity(001,1) primary key not null,
	HoTen nvarchar(50) not null,
	MaLop char(5) foreign key references DMLOP (MaLop),
	Gioitinh int not null,
	NgaySinh date not null,
	Diachi nvarchar(200) not null
)
drop table SINHVIEN
create table DMHOCPHAN(
	MaHP int Identity(001,1) primary key not null,
	TenHP nvarchar(200) not null,
	Sodvht int not null,
	MaNganh char(10) foreign key references DMNGANH(MaNganh),
	HocKy int not null
)
drop table DMHOCPHAN 
create table DIEMHP (
	MaSV int foreign key references SINHVIEN (MASV),
	MaHP int foreign key references DMHOCPHAN (MaHP),
	DiemHP float not null
)
drop table DIEMHP

insert into DMKHOA 
values ('CNTT', N'Công nghệ thông tin')
insert into DMKHOA 
values ('KT', N'Kế toán')
insert into DMKHOA 
values ('SP', N'Sư phạm')

insert into DMNGANH
values (140902,N'Sư phạm toán tin','SP')
insert into DMNGANH
values (480202,N'Tin học ứng dụng','CNTT')
insert into DMNGANH
values (200902,N'Kế toán doanh nghiệp','KT')

insert into DMLOP
values ('CT11',N'Cao đẳng tin học',480202,11,'TC',2013)
insert into DMLOP
values ('CT12',N'Toán cao cấp',480202,12,'CĐ',2013)
insert into DMLOP
values ('CT13',N'Xác suất thống kê',480202,11,'TC',2014)
insert into DMLOP
values ('CT14',N'Toán và tin học',140902,11,'TC',2013)
insert into DMLOP
values ('CT15',N'Cấu trúc giải thuật',140902,12,'TC',2014)
insert into DMLOP
values ('CT16',N'Cơ sở dữ liệu',140902,13,'TC',2013)
insert into DMLOP
values ('CT17',N'Nhập môn tài chính tiền tệ',200902,12,'TC',2014)
insert into DMLOP
values ('CT18',N'Thiết kế website',200902,14,'TC',2014)

insert into SINHVIEN
values(N'Phan Thanh','CT11',0,'1990-12-09',N'Tuyên Quang')
insert into SINHVIEN
values(N'Nguyễn Thị Cấm','CT11',1,'1994-12-1',N'Quảng Ninh')
insert into SINHVIEN
values(N'Võ Thị Hà','CT12',1,'1995-2-7',N'An Nhơn')
insert into SINHVIEN
values(N'Trần Hoài Nam','CT12',0,'1994-5-4',N'Tây Sơn')
insert into SINHVIEN
values(N'Trần Văn Hoàng','CT13',0,'1990-5-9',N'Tuyên Quang')
insert into SINHVIEN
values(N'Đặng Thị Thảo','CT13',1,'1993-12-9',N'Phủ Cát')
insert into SINHVIEN
values(N'Lê Thị Sen','CT14',1,'1992-12-20',N'Thái Bình')
insert into SINHVIEN
values(N'Nguyễn Huy Nam','CT14',0,'1991-2-19',N'Nam Định')
insert into SINHVIEN
values(N'Trần Thị Hoa','CT15',1,'1993-2-28',N'Tuyên Quang')
insert into SINHVIEN
values(N'Phan Thanh Hoa','CT15',1,'1994-11-9',N'Hà Nội')
insert into SINHVIEN
values(N'Phan Thành','CT16',0,'1992-10-19',N'Hà Nội')
insert into SINHVIEN
values(N'Nguyễn Hà Lan','CT16',1,'1994-4-10',N'Thái Bình')
insert into SINHVIEN
values(N'Bùi Thị Lan Anh','CT17',1,'1996-12-9',N'Tuyên Quang')
insert into SINHVIEN
values(N'Nguyễn Thu Hiền','CT17',1,'1998-8-9',N'Tuyên Quang')
insert into SINHVIEN
values(N'Hoàng Mai Anh','CT18',1,'1990-12-8',N'Tuyên Quang')
insert into SINHVIEN
values(N'Đặng Ngọc Anh','CT18',1,'1992-12-29',N'Tuyên Quang')

insert into DMHOCPHAN
values (N'Toán cao cấp A1',4,480202,1)
insert into DMHOCPHAN
values (N'Tiếng anh 1',3,480202,1)
insert into DMHOCPHAN
values (N'Vật lý đại cương',4,140902,2)
insert into DMHOCPHAN
values (N'Tiếng anh 2',7,140902,2)
insert into DMHOCPHAN
values (N'Tiếng anh 1',3,200902,1)
insert into DMHOCPHAN
values (N'Tiếng anh 3',3,200902,3)

insert into DIEMHP
values (001,002,5.4)
insert into DIEMHP
values (002,003,4.5)
insert into DIEMHP
values (003,001,4.3)
insert into DIEMHP
values (003,002,6.7)
insert into DIEMHP
values (003,003,7.3)
insert into DIEMHP
values (004,001,5.0)
insert into DIEMHP
values (004,002,5.2)
insert into DIEMHP
values (004,003,3.5)
insert into DIEMHP
values (005,001,9.0)
insert into DIEMHP
values (005,002,7.8)
insert into DIEMHP
values (005,003,8.5)
insert into DIEMHP
values (006,001,9.7)
insert into DIEMHP
values (006,002,8.8)
insert into DIEMHP
values (006,003,8.2)
insert into DIEMHP
values (007,001,6.5)
insert into DIEMHP
values (007,002,8.4)
insert into DIEMHP
values (007,003,9.9)

--DANG 1 CAU LENH TRUY VAN CO DIEU KIEN
--Bai 1: Cau lenh khong ket noi
--CAU 1: Hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh, GioiTinh, Namsinh của những sinh viên có họ không bắt đầu bằng chữ N,L,T.
select MaSV, HoTen, MaLop, NgaySinh,case GioiTinh when 1 then N'Nu' else N'Nam' end as GioiTinh , Year(NgaySinh) as NamSinh 
from SINHVIEN 
where HoTen not like N'[NLT]%'

--CAU 2: Hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh, GioiTinh, Namsinh của những sinh viên nam học lớp CT11.
select MaSV, HoTen, MaLop, NgaySinh, case GioiTinh when 1 then N'Nu' else 'Nam' end as GioiTinh, year(NgaySinh) as NamSinh 
from SinhVien
where GioiTinh = 0 and MaLop= N'CT11'

--CAU 3: Hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh, GioiTinh của những sinh viên học lớp CT11,CT12,CT13.
select MaSV, HoTen, MaLop, NgaySinh, case GioiTinh when 1 then N'Nu' else 'Nam' end as GioiTinh
from SinhVien
where MaLop = N'CT11' or MaLop = N'CT12' or MaLop = N'CT13'

--CAU 4: Hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh, GioiTinh, Tuổi của những sinh viên có tuổi từ 19-21
select MaSV, HoTen, MaLop, CONVERT(varchar(10),NgaySinh,103) AS NgaySinh, case GioiTinh when 1 then N'Nu' else 'Nam' end as GioiTinh, year(getdate())-year(NgaySinh) as Tuoi 
from SinhVien
where year(getdate())-year(NgaySinh) between 27 and 28

--Bai 2: Câu lệnh SQL có kết nối
--Cau 1. Hiển thị danh sách gồm MaSV, HoTên, MaLop, DiemHP, MaHP của những sinh viên có điểm HP >= 5.
select SinhVien.MaSV, Hoten, MaLop, DiemHP, MaHP
from SinhVien
inner join DiemHP on SinhVien.MaSV = DiemHP.MaSV 
where DiemHP >=5

--Cau 2. Hiển thị danh sách MaSV, HoTen , MaLop, MaHP, DiemHP được sắp xếp theo ưu tiên Mã lớp, Họ tên tăng dần.
select SinhVien.MaSV, Hoten, MaLop, DiemHP, MaHP
from SinhVien
inner join DiemHP on SinhVien.MaSV = DiemHP.MaSV 
order by SinhVien.MaLop , HoTen Asc

--Cau 3. Hiển thị danh sách gồm MaSV, HoTen, MaLop, DiemHP, MaHP của những sinh viên có điểm HP từ 5 đến 7 ở học kỳ I.
select SinhVien.MaSV, Hoten, MaLop, DiemHP, DiemHP.MaHP, HocKy
from SinhVien
inner join DiemHP on SinhVien.MaSV = DiemHP.MaSV 
inner join DMHOCPHAN on DiemHP.MaHP = DMHOCPHAN.MaHP
where HocKy = 1 and DiemHP between 5 and 7 

--Cau 4. Hiển thị danh sách sinh viên gồm MaSV, HoTen, MaLop, TenLop, MaKhoa của Khoa có mã CNTT.
select MaSV, HoTen, SV.MaLop, TenLop, MaKhoa 
from SinhVien as SV
inner join DMLOP on SV.MaLop= DMLOP.MaLop
inner join DMNganh on DMNganh.MaNganh= DMLOP.MaNganh
where MaKhoa= N'CNTT'

--Dang 2: CÂU LỆNH TRUY VẤN CÓ PHÂN NHÓM
--Bài số 1: Câu lệnh SQL có từ khoá GROUP BY không điều kiện.
--Cau 1. Cho biết MaLop, TenLop, tổng số sinh viên của mỗi lớp.
select DMLOP.MaLop, TenLop, count(MaSV) as SumSv
from DMLOP 
inner join SinhVien on SinhVien.Malop= DMLOP.MaLop
group by  DMLOP.MaLop, TenLop 

--Cau 2. Cho biết điểm trung bình chung của mỗi sinh viên, xuất ra bảng mới có tên DIEMTBC, 
--biết rằng công thức tính DiemTBC như sau: DiemTBC = (DiemHP * SoDvht) / (SoDvht)
select MaSV, round(sum(DiemHP * Sodvht)/sum(Sodvht),1) as DIEMTBC 
into DIEMTBC
from DMHOCPHAN 
inner join DIEMHP on DMHOCPHAN.MaHP= DIEMHP.MaHP
group by MaSV 

select * from DIEMTBC
drop table DIEMTBC 

--Cau 3. Cho biết điểm trung bình cong của mỗi sinh viên ở mỗi học kỳ.
select HocKy, MaSV, round(sum(DiemHP * Sodvht)/sum(Sodvht),1) as DIEMTBC 
from DMHOCPHAN 
inner join DIEMHP on DMHOCPHAN.MaHP= DIEMHP.MaHP
group by HocKy, MaSV
order by HocKy 

--Cau 4. Cho biết MaLop, TenLop, số lượng nam nữ theo từng lớp
select DMLOP.MaLop, TenLop, case GioiTinh when 1 then N'Nu' else N'Nam' end as GioiTinh, count (MaSV) as SUMSV
from DMLOP 
inner join SinhVien on SinhVien.MaLop = DMLOP.MaLop 
group by DMLOP.MaLop, TenLop, GioiTinh 
order by DMLOP.MaLop 

--Bai 2:  Câu lệnh SQL có từ khoá GROUP BY với điều kiện lọc.
--cau 1. Cho biết điểm trung bình chung của mỗi sinh viên ở học kỳ 1 DiemTBC =  (DiemHP * SoDvht) /  (SoDvht)
select HocKy, MaSV, round(sum(DiemHP * Sodvht)/sum(Sodvht),1) as DIEMTBC 
from DMHOCPHAN 
inner join DIEMHP on DMHOCPHAN.MaHP= DIEMHP.MaHP
where HocKy = 1
group by HocKy, MaSV
order by HocKy

--Cau 2. Cho biết MaSV, HoTen, Số các học phần thiếu điểm (DiemHP<5) của mỗi sinh viên.
select DIEMHP.MaSV, HoTen, count(DiemHP) as SL
from DIEMHP
inner join SINHVIEN on SINHVIEN.MaSV = DIEMHP.MaSV 
where DiemHP < 5
group by DIEMHP.MaSV, HoTen
order by DIEMHP.MaSV 

SELECT SINHVIEN.MaSV, HoTen, COUNT(DIEMHP.MaHP) AS SLuong
FROM DIEMHP
INNER JOIN SINHVIEN ON DIEMHP.MaSV=SINHVIEN.MaSV
INNER JOIN DMHOCPHAN ON DIEMHP.MaHP=DMHOCPHAN.MaHP
WHERE DiemHP<5
GROUP BY SINHVIEN.MaSV, HoTen

--Cau 3. Đếm số sinh viên có điểm HP <5 của mỗi học phần.
select MaHP, count(DiemHP) as SL
from DIEMHP
where DiemHP < 5
group by MaHP 
order by MaHP  

--Cau 4. Tính tổng số đơn vị học trình có điểm HP <5 của mỗi sinh viên.
SELECT SINHVIEN.MaSV, Hoten, SUM(SoDVHT) AS Tongdvht
FROM DIEMHP
INNER JOIN SINHVIEN ON DIEMHP.MaSV=SINHVIEN.MaSV
INNER JOIN DMHOCPHAN ON DMHOCPHAN.MaHP=DIEMHP.MaHP
WHERE DiemHP<5
GROUP BY SINHVIEN.MaSV, HoTen

--Bài số 3: Câu lệnh SQL có từ khoá GROUP BY với điều kiện nhóm.
--Cau 1. Cho biết MaLop, TenLop có tổng số sinh viên >10.
select DMLOP.MaLop, TenLop, count(MaSV) as SL
from DMLOP
inner join SINHVIEN on SINHVIEN.MaLop = DMLOP.MaLop 
group by DMLOP.MaLop, TenLop
Having count (MaSV) >1 

--Cau 2. Cho biết HoTen sinh viên có điểm Trung bình chung các học phần <7.
select  HoTen , round(sum(DiemHP *Sodvht)/sum(Sodvht),1) as DiemTB
from DIEMHP 
inner join SINHVIEN on SINHVIEN.MaSV= DIEMHP.MaSV 
inner join DMHOCPHAN on DMHOCPHAN.MaHP = DIEMHP.MaHP 
group by  HoTen
Having round(sum(DiemHP *Sodvht)/sum(Sodvht),1) <7 

--Cau 3. Cho biết HoTen sinh viên có ít nhất 2 học phần có điểm <5.
Select Hoten , DiemHP, count(MaHP) as SLHP 
from DIEMHP 
inner join SINHVIEN on SINHVIEN.MaSV = DIEMHP.MaSV 
where DiemHP < 5 
group by Hoten , DiemHP 
having count(MaHP) >=2 

--Cau 4. Cho biết HoTen sinh viên học TẤT CẢ các học phần ở ngành 140902.
select HoTen , count(MaHP) as SLHP 
from SINHVIEN 
inner join DMLop on SINHVIEN.MaLop = DMLop.MaLop 
inner join DIEMHP on SINHVIEN.MaSV = DIEMHP.MaSV 
where MaNganh = '140902'
group by HoTen 
having count(MaHP) = (Select count(MaHP) from DMHOCPHAN where MaNganh = '140902')

SELECT HoTen,COUNT(MaHP) AS Soluong
FROM DIEMHP 
INNER JOIN SINHVIEN ON DIEMHP.MaSV=SINHVIEN.MaSV 
INNER JOIN DMLOP ON DMLOP.MaLop=SINHVIEN.MaLop
WHERE MaNganh='140902'
GROUP BY HoTen
HAVING COUNT(MaHP)=(SELECT COUNT(MaHP) FROM DMHOCPHAN WHERE MaNganh='140902')

--cau 5. Cho biết HoTen sinh viên học ít nhất 3 học phần mã ‘001’, ‘002’, ‘003’.
select HoTen, count(MaHP) as SLHP 
from SINHVIEN 
inner join DIEMHP on DIEMHP.MaSV = SINHVIEN.MaSV 
where MaHP = '001' or MaHP = '002' or MaHP = '003'
group by HoTen 
having count(MaHP) >=3 

SELECT HoTen, COUNT(MaHP) AS Soluong 
FROM DIEMHP 
INNER JOIN SINHVIEN ON DIEMHP.MaSV=SINHVIEN.MaSV
WHERE MaHP IN ('001','002','003')
GROUP BY HoTen
HAVING COUNT(MaHP)>=3

--Bài số 4: Câu lệnh SQL có từ khoá TOP.
--Cau 1. Cho biết MaSV, HoTen sinh viên có điểm TBC cao nhất ở học kỳ 1.
select top 1 SV.MaSV, HoTen, round(sum(DiemHP * Sodvht)/sum(Sodvht),1) as DiemTBC 
from SINHVIEN as SV
inner join DIEMHP on SV.MaSV = DIEMHP.MaSV 
inner join DMHOCPHAN on DIEMHP.MaHP = DMHOCPHAN.MaHP 
where HocKy = 1
group by SV.MaSV, HoTen
order by DiemTBC Desc 

--Cau 2. Cho biết MaSV, HoTen sinh viên có số học phần điểm HP <5 nhiều nhất.
select top 1 SV.MaSV, HoTen , count(DIEMHP.MaHP) as SL 
from SINHVIEN as SV
inner join DIEMHP on SV.MaSV = DIEMHP.MaSV 
where DiemHP < 5
group by SV.MaSV, HoTen 
order by SL desc

SELECT TOP 1 SINHVIEN.MaSV, HoTen, 
COUNT(MaHP) AS 'So Hoc phan'
FROM DIEMHP
INNER JOIN SINHVIEN ON SINHVIEN.MaSV=DIEMHP.MaSV
WHERE DiemHP<5
GROUP BY SINHVIEN.MaSV, HoTen
ORDER BY COUNT(MaHP) DESC

--Cau 3. Cho biết MaHP, TenHP có số sinh viên điểm HP <5 nhiều nhất.
select top 1 DIEMHP.MaHP, TenHP, count(DIEMHP.MaSV) as SL 
from DMHOCPHAN 
inner join DIEMHP on DIEMHP.MaHP= DMHOCPHAN.MaHP 
inner join SINHVIEN on SINHVIEN.MaSV= DIEMHP.MaSV
where DiemHp < 5
group by DIEMHP.MaHP, TenHP
order by SL desc

SELECT TOP 1 DMHOCPHAN.MaHP, TenHP,
COUNT(MaSV) AS 'So sinh vien'
FROM DMHOCPHAN 
INNER JOIN DIEMHP ON DMHOCPHAN.MaHP=DIEMHP.MaHP
WHERE DiemHP<5
GROUP BY DMHOCPHAN.MaHP, TenHP
ORDER BY COUNT(MaSV) DESC

--DẠNG 3: CÂU LỆNH TRUY VẤN VỚI CẤU TRÚC LỒNG NHAU
--Bài số 1: Cấu trúc lồng nhau phủ định (KHÔNG, CHƯA).
--Cau 1. Cho biết Họ tên sinh viên KHÔNG học học phần nào.
SELECT MaSV, Hoten 
FROM SINHVIEN
WHERE MaSV NOT IN (SELECT MaSV FROM DIEMHP)

--Cau 2. Cho biết Họ tên sinh viên CHƯA học học phần có mã ‘001’.
select MaSV, Hoten 
from SINHVIEN 
where MaSV NOT IN (select MaSV from DIEMHP where MaHP = '001')

--Cau 3. Cho biết Tên học phần KHÔNG có sinh viên điểm HP <5.
Select MaHP, TenHP
from DMHOCPHAN 
where MaHP NOT IN (select MaHP from DIEMHP where DiemHP <5)


--Cau 4. Cho biết Họ tên sinh viên KHÔNG có học phần điểm HP<5
select DISTINCT MaSV, HoTen 
from SINHVIEN 
where MaSV NOT IN (select DISTINCT MaSV from DIEMHP where DiemHP <5) 

--Bài số 2: Cấu trúc lồng nhau không kết nối.
--Cau 1. Cho biết Tên lớp có sinh viên tên Hoa.
select MaLop, TenLop 
from DMLOP 
where MaLop IN (select MaLop from SINHVIEN where HoTen like N'%Hoa')

--cau 2. Cho biết HoTen sinh viên có điểm học phần ‘001’là <5.
select MaSV, HoTen 
from SInhvien
where MaSV In (select MaSV from DIEMHP where DiemHP <5 and MaHP = '001' ) 

--Cau 3. Cho biết danh sách các học phần có số đơn vị học trình lớn hơn hoặc bằng số đơn vị học trình của học phần mã 001.
select MaHP, TenHP 
from DMHOCPHAN 
where Sodvht >= (select Sodvht from DMHOCPHAN where MaHP = 001) and MaHP != 001

--DẠNG 4: CÂU LỆNH TRUY VẤN VỚI LƯỢNG TỪ ALL, ANY, EXISTS
--Bài số 1: Lượng từ ALL
--Cau 1. Cho biết HoTen sinh viên có DiemHP cao nhất.
select * 
from Sinhvien 
inner join DIEMHP on Sinhvien.Masv= diemhp.masv
where diemhp >= all(select diemhp from diemhp)

--cau 2. Cho biết HoTen sinh viên có tuổi cao nhất.
select * , year(getdate())- year(ngaysinh) as Tuoi 
from sinhvien 
where year(getdate())- year(ngaysinh) >=all(select year(getdate())- year(ngaysinh) from sinhvien )

--cau 3. Cho biết MaSV, HoTen sinh viên có điểm học phần mã ‘001’ cao nhất.
select * 
from SINHVIEN 
inner join DIEMHP on SINHVIEN.MaSV = DIEMHP.MaSV 
where MaHP= 001 and DiemHP >= all(select DiemHP from DIEMHP where MaHP = 001 )

--Bài số 2: Lượng từ ANY 
--Cau 1. Cho biết MaSV, MaHP có điểm HP lớn hơn bất kỳ các điểm HP của sinh viên mã ‘001’.
select * 
from Sinhvien 
inner join diemhp on diemhp.masv = sinhvien.masv
where diemhp >= any (select diemhp from diemhp where masv= 001) and sinhvien.masv != 001

--Cau 2. Cho biết sinh viên có điểm học phần nào đó lớn hơn gấp rưỡi điểm trung bình chung của sinh viên đó.
select MaSV, round(sum(DiemHP * Sodvht)/ sum(Sodvht),1) as DiemTB 
into DiemTB
from DIEMHP 
inner join DMHOCPHAN on DMHOCPHAN.MaHP = DIEMHP.MaHP 
group by MaSV 

select * from DiemTB 

select *
from DiemTB
where DiemTB * 1.5 <= any (select DiemHP from DiemHP where DIEMHP.MaSV = DiemTB.MaSV )

--Bài số 3: Lượng từ EXISTS
--Cau 1. Cho biết MaSV, HoTen sinh viên đã ít nhất một lần học học phần nào đó.
select MaSV, HoTen 
from SinhVien
where exists (select * from DIEMHP where DIEMHP.MaSV = SinhVien.MaSV ) 

--Cau 2. Cho biết MaSV, HoTen sinh viên đã không học học phần nào.
select MaSV, HoTen 
from SinhVien 
where not exists (select *  from DIEMHP where DIEMHP.MaSV = SinhVien.MaSV )

--Cau 3. Cho biết MaLop,TenLop đã không có sinh viên nào học.
select MaLop, TenLop
from DMLOP  
where  not exists (select * from SinhVien where SinhVien.MaLop = DMLOP.MaLop )

--DẠNG 5: CÂU LỆNH TRUY VẤN VỚI CẤU TRÚC TẬP HỢP
--Cau 1. Cho biết MaSV đã học ít nhất một trong 2 học phần có mã là ‘001’, ‘002’.
select MaSV 
from DIEMHP  
where MaHP = '001' union (select MaSV from DIEMHP where MaHP = '002')

--Cau 2. Cho biết MaSV chưa học học phần nào.
select MaSV 
from SinhVien 
except (select MaSV from DIEMHP)

--Cau 3. Cho biết Mã sinh viên học ít nhất hai học phần có mã ‘001’ và ‘002’.
select MaSV 
from DIEMHP  
Where MaHP = '001' intersect (select MaSV from DIEMHP where MaHP = '002')

--DẠNG 6: CÂU LỆNH BỔ SUNG, CẬP NHẬT, XOÁ DỮ DIỆU
--Bài số 1: Lệnh INSERT bổ sung dữ liệu
--Cau 1. Bổ sung một dòng dữ liệu cho bảng DMKHOA bộ giá trị sau: (‘HT’, ‘Hệ thống thông tin quản lý’).
insert into DMKHOA
values('HT',N'Hệ thống thông tin quản lý')
select * from DMKHOA 

--Cau 2. Bổ sung một sinh viên cho bảng SINHVIEN (dữ liệu nào bất kỳ).
insert into SINHVIEN 
values (N'Bui Thu Ha','CT11',1,'1989-12-09',N'Ninh Bình')

--Cau 3. Bổ sung điểm học phần cho bảng DIEMHP (dữ liệu bất kỳ)
insert into DIEMHP 
values (008, 002, 5.4)
select * from DIEMHP 

--Bài số 2: Lệnh DELETE xoá dữ liệu
--cau 1. Xóa những sinh viên có DTBC <3 (sinh viên buộc thôi học)
delete from DIEMHP 
where MaSV in (select MaSV from DiemTB where DiemTB <6)

select * from DIEMHP 

--Cau 2. Xóa những sinh viên không học học phần nào
delete from SINHVIEN 
where MaSV Not in (select MaSV from DIEMHP where DIEMHP.MaSV = SINHVIEN.MaSV )

select * from SINHVIEN 

--cau 3. Xóa khỏi bảng DMLOP những lớp không có sinh viên nào
delete from DMLOP 
where MaLop not in (select MaLop from SINHVIEN where SINHVIEN.MaLop = DMLOP.MaLop) 
select * from DMLOP 

--Bài số 3: Lệnh UPDATE cập nhật dữ liệu
--Cau 1. Thêm cột XepLoai, Cập nhật dữ liệu cột XepLoai theo yêu cầu sau:
--Nếu DiemTBC >=8 thì xếp loại Giỏi, ngược lại Nếu DiemTBC >=7 thì xếp loại Khá, 
--ngược lại Nếu DiemTBC >=5 thì xếp loại Trung bình, Ngược lại là yếu
alter table DiemTB add Xeploai nvarchar(15)
update DiemTB set Xeploai= case when DiemTB>= 8 then N'Gioi' 
								when DiemTB >=7 then N'Kha'
								when DiemTB >=5 then N'Trung Binh'
								else N'Yeu'
								end 

select * from DiemTB

--cau 2. Thêm cột XetLenLop, Cập nhập dữ liệu cho cột với yêu cầu sau: 
--Nếu DiemTBC >=5 thì được lên lớp, ngược lại Nếu DiemTBC>=3 thì tạm ngừng tiến độ học tập Ngược lại Buộc thôi học.
alter table DiemTB add XetLenLop nvarchar (30) 
update DiemTB set XetLenLop = case when DiemTB>= 5 then N'Đươc lên lớp'
									when DiemTB >=3 then N'Tạm ngừng tiến độ học tập'
									else N'Buộc thôi học'
									end 
