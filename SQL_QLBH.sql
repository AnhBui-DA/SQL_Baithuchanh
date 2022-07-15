create database QLBH_2022
use QLBH_2022 

create table KHACHHANG (
	MaKH char(5) primary key not null, 
	TenKH nvarchar(30) not null, 
	DiaChi nvarchar(200) not null, 
	Tel char(12) not null, 
	Email nvarchar(100) not null, 
	LoaiKH char(10) not null
)

create table HANGHOA (
	MaH char(5) primary key not null, 
	TenH nvarchar(100) not null,
	DonVT nvarchar(10) not null,
	DonGia int not null
)

create table HOADON (
	MaHD int Identity (1,1) primary key, 
	MaKH char(5) foreign key references KHACHHANG (MaKH), 
	NgayLapHD date not null
)

create table CHITIETHOADON (
	MaHD int foreign key references HOADON (MaHD) , 
	MaH char(5) foreign key references HANGHOA (MaH), 
	SoLuong int not null
)
drop table CHITIETHOADON

insert into KHACHHANG
values ('KH001',N'Nguyễn Thị Mai Chi',N'Quy Nhơn',0976233445,N'maichi@gmail.com','VIP')
insert into KHACHHANG
values ('KH002',N'Phan Thị Thanh',N'Quy Nhơn',0976233555,N'thanh@gmail.com','TV')
insert into KHACHHANG
values ('KH003',N'Trần Văn Toàn',N'Tuy Phước',0988233445,N'toanvan@gmail.com','TV')
insert into KHACHHANG
values ('KH004',N'Trần Văn Ấn',N'Bình Dương',0977653445,N'anvantran@gmail.com','VIP')

insert into HANGHOA 
values ('H001',N'Sữa đặc ông thọ',N'lon',23000)
insert into HANGHOA 
values ('H002',N'Kẻo dẹo Hồng Hà',N'gói',80000)
insert into HANGHOA 
values ('H003',N'Bánh xốp Quy Kinh đô',N'hộp',120000)
insert into HANGHOA 
values ('H004',N'Bánh quy LuXy',N'hộp',150000)
insert into HANGHOA 
values ('H005',N'Đường trắng QUy Hà',N'gói',20000)
insert into HANGHOA 
values ('H006',N'Bánh Luxy Sài Gòn',N'hộp',100000)
insert into HANGHOA 
values ('H007',N'Sữa tươi TH TrueMilk',N'lốc',30000)
insert into HANGHOA 
values ('H008',N'Sữa tươi chuối',N'lốc',25000)

insert into HOADON
values('KH001','2018-02-01')
insert into HOADON
values('KH001','2018-03-02')
insert into HOADON
values('KH002','2018-02-01')
insert into HOADON
values('KH002','2018-03-01')
insert into HOADON
values('KH003','2018-03-02')
insert into HOADON
values('KH004','2018-05-02')
insert into HOADON
values('KH003','2018-05-03')
insert into HOADON
values('KH003','2018-05-04')

insert into CHITIETHOADON 
values(001,'H001',1)
insert into CHITIETHOADON 
values(001,'H002',3)
insert into CHITIETHOADON 
values(002,'H003',12)
insert into CHITIETHOADON 
values(002,'H004',2)
insert into CHITIETHOADON 
values(003,'H001',7)
insert into CHITIETHOADON 
values(003,'H004',5)
insert into CHITIETHOADON 
values(004,'H001',12)
insert into CHITIETHOADON 
values(005,'H003',19)
insert into CHITIETHOADON 
values(005,'H003',20)
insert into CHITIETHOADON 
values(006,'H007',20)
insert into CHITIETHOADON 
values(006,'H003',45)
insert into CHITIETHOADON 
values(007,'H002',60)
insert into CHITIETHOADON 
values(007,'H008',35)

--Bài số 1: Dang 1: Câu lệnh truy vấn có điều kiện
--1. Cho biết danh sách gồm MaKH, TenKH, NgaySinh, GioiTinh của khách hàng thành viên.
select * 
from KHACHHANG
where LoaiKH = 'TV'

--2. Cho biết danh sách gồm MaKH, TenKH, NgaySinh, GioiTinh của khách hàng nữ ở Quy Nhơn.
select * 
from KHACHHANG
where DiaChi = N'Quy Nhơn'

--3. Cho biết danh sách gồm MaKH, TenKH, NgaySinh, GioiTinh của khách hàng VIP ở Quy Nhơn hoặc Tuy Phước.
select *
from KHACHHANG
where LoaiKH = 'VIP ' and (DiaChi = N'Quy Nhơn' or DiaChi = N'Tuy Phước')

--4. Cho biết số lượng hoá đơn xuất vào tháng 8.
select count(MaHD) as SLHD 
from HOADON 
where month(NgayLapHD) = 3

--5. Cho biết danh sách các mặt hàng có giá bán từ 20 nghìn đến 50 nghìn.
select * 
from HANGHOA 
where DonGia between 20000 and 50000

--6. Cho biết MaHD, MaH, SoLuong có số lượng bán >10. 
select MaHD, MaH, SoLuong 
from CHITIETHOADON 
where SoLuong > 10 

--7. Cho biết MaHD, MaH, TenH, DonGia, SoLuong, ThanhTien của hoá đơn 001.
select MaHD, sum(SoLuong*DonGia) as ThanhTien
from CHITIETHOADON
inner join HANGHOA on HANGHOA.MaH = CHITIETHOADON.MaH 
where MaHD = 001
group by MaHD

select MaHD, HANGHOA.MaH, TenH, DonGia, SoLuong, DonGia* SoLuong as ThanhTien 
from CHITIETHOADON
inner join HANGHOA on HANGHOA.MaH = CHITIETHOADON.MaH 
where MaHD = 001


--8. Cho biết MaHD, MaH, TenH, DonGia, SoLuong, ThanhTien có Thành tiền từ 1 triệu đến 2 triệu.
select MaHD, sum(SoLuong*DonGia) as ThanhTien
from CHITIETHOADON
inner join HANGHOA on HANGHOA.MaH = CHITIETHOADON.MaH 
group by MaHD
having  sum(SoLuong*DonGia) > 1000000

--9. Cho biết thông tin khách hàng không mua hàng vào tháng 6.
select distinct HOADON.MaKH, TenKH 
from HOADON 
inner join KHACHHANG on KHACHHANG.MaKH = HOADON.MaKH 
where month(NgayLapHD) != 5 

--10. Cho biết MaHD, NgayLapHD, MaHK, TenH, DonGia, SoLuong, ThanhTien bán vào tháng 6
select HOADON.MaHD, NgayLapHD, MaKH, sum(SoLuong*DonGia) as ThanhTien 
from CHITIETHOADON 
inner join HOADON on HOADON.MaHD= CHITIETHOADON.MaHD
INNER JOIN HANGHOA ON HANGHOA.MaH= CHITIETHOADON.MaH
WHERE month(NgayLapHD) = 2
GROUP BY HOADON.MaHD, NgayLapHD, MaKH

select HOADON.MaHD, NgayLapHD, MaKH, TenH,DonGia, SoLuong, sum(SoLuong*DonGia) as ThanhTien 
from CHITIETHOADON 
inner join HOADON on HOADON.MaHD= CHITIETHOADON.MaHD
INNER JOIN HANGHOA ON HANGHOA.MaH= CHITIETHOADON.MaH
WHERE month(NgayLapHD) = 2
GROUP BY HOADON.MaHD, NgayLapHD, MaKH, TenH,DonGia, SoLuong
order by HOADON.MaHD 

--11. Cho biết danh sách các mặt hàng đã bán được.
select distinct HANGHOA.MaH, TenH 
from CHITIETHOADON 
inner join HANGHOA on HANGHOA.MaH= CHITIETHOADON.MaH 

--DẠNG 2: CÂU LỆNH TRUY VẤN CÓ PHÂN NHÓM
--1. Cho biết MaKH, TenKH, Tổng Thành tiền của từng khách hàng.
select KHACHHANG.MaKH, TenKH, sum(SoLuong*DonGia) as ThanhTien 
from KHACHHANG 
inner join HOADON on HOADON.MaKH = KHACHHANG.MaKH 
inner join CHITIETHOADON on CHITIETHOADON.MaHD = HOADON.MaHD 
inner join HANGHOA on HANGHOA.MaH = CHITIETHOADON.MaH 
GROUP BY KHACHHANG.MaKH, TenKH 

--2. Cho biết MaKH, TenKH, Tổng Thành tiền của khách hàng VIP.
select KHACHHANG.MaKH, TenKH, sum(SoLuong*DonGia) as ThanhTien 
from KHACHHANG 
inner join HOADON on HOADON.MaKH = KHACHHANG.MaKH 
inner join CHITIETHOADON on CHITIETHOADON.MaHD = HOADON.MaHD 
inner join HANGHOA on HANGHOA.MaH = CHITIETHOADON.MaH 
WHERE LoaiKH = N'VIP'
GROUP BY KHACHHANG.MaKH, TenKH

--3. Cho biết MaKH, TenKH, Tổng Thành tiền của từng khách hàng có Tổng thành tiền mua được >=20 triệu.
select KHACHHANG.MaKH, TenKH, sum(SoLuong*DonGia) as ThanhTien 
from KHACHHANG 
inner join HOADON on HOADON.MaKH = KHACHHANG.MaKH 
inner join CHITIETHOADON on CHITIETHOADON.MaHD = HOADON.MaHD 
inner join HANGHOA on HANGHOA.MaH = CHITIETHOADON.MaH 
GROUP BY KHACHHANG.MaKH, TenKH
Having sum(SoLuong*DonGia) >= 2000000

--4. Cho biết MaH, TenH, Tổng số lượng của từng mặt hàng.
select HANGHOA.MaH, TenH, COUNT(SoLuong ) AS TongSL
from HANGHOA 
INNER JOIN CHITIETHOADON on CHITIETHOADON.MaH = HANGHOA.MaH
GROUP BY HANGHOA.MaH, TenH

--5. Cho biết MaHD, Tổng thành tiền của những hoá đơn có tổng thành tiền lớn hơn 5 triệu.
select HOADON.MaHD, sum(SoLuong*DonGia) as ThanhTien 
from CHITIETHOADON 
inner join HOADON on CHITIETHOADON.MaHD = HOADON.MaHD 
inner join HANGHOA on HANGHOA.MaH = CHITIETHOADON.MaH 
GROUP BY HOADON.MaHD 
Having sum(SoLuong*DonGia) >= 5000000 

--6. Cho biết hoá đơn bán ít nhất hai mặt hàng H001 và H002
SELECT MaHD , MaH 
from CHITIETHOADON 
where MaH in ('H001','H002')
group by MaHD , MaH 


--7. Cho biết MaKH mua tất các các mặt hàng bánh.
select distinct MaKH 
from HOADON 
inner join CHITIETHOADON ON HOADON.MaHD = CHITIETHOADON.MaHD 
INNER JOIN HANGHOA ON HANGHOA.MaH = CHITIETHOADON.MaH 
WHERE TenH = (select TenH from HANGHOA WHERE TenH LIKE '%kẻo%')

SELECT * FROM CHITIETHOADON
SELECT * FROM HANGHOA

SELECT HoTen,COUNT(MaHP) AS Soluong
FROM DIEMHP 
INNER JOIN SINHVIEN ON DIEMHP.MaSV=SINHVIEN.MaSV 
INNER JOIN DMLOP ON DMLOP.MaLop=SINHVIEN.MaLop
WHERE MaNganh='140902'
GROUP BY HoTen
HAVING COUNT(MaHP)=(SELECT COUNT(MaHP) FROM 
DMHOCPHAN WHERE MaNganh='140902')

--8. Đếm số hoá đơn của mỗi khách hàng.
SELECT MaKH, count (HOADON.MaHD ) as TongHD 
from CHITIETHOADON 
inner join HOADON on HOADON.MaHD = CHITIETHOADON.MaHD 
GROUP BY MaKH 

--9. Cho biết Cho biết MaHD, Tổng thành tiền, Khuyến mãi 5% cho những hoá đơn có tổng thành tiền lớn hơn 500 nghìn.
select MaHD, sum(DonGia* SoLuong) as ThanhTien , KhuyenMai = case  when sum(DonGia* SoLuong) >500000 then '5%' else '0'  end  
from CHITIETHOADON 
INNER JOIN HANGHOA ON HANGHOA.MaH = CHITIETHOADON.MaH 
group by MaHD 
--10. Cho biết thông tin khách hàng VIP có tổng thành tiến trong năm 2018 nhỏ hơn 20 triệu.
select KHACHHANG.MaKH , TenKH, DiaChi, Email, Tel, LoaiKH
from KHACHHANG 
inner join HOADON on HOADON.MaKH = KHACHHANG.MaKH 
inner join CHITIETHOADON on CHITIETHOADON.MaHD = HOADON.MaHD 
inner join HANGHOA on HANGHOA.MaH = CHITIETHOADON.MaH 
Where LoaiKH = N'VIP' and year(NgayLapHD) = 2018 
group by KHACHHANG.MaKH , TenKH, DiaChi, Email, Tel, LoaiKH
having sum(DonGia * SoLuong) <20000000

--11. Cho biết hoá đơn có tổng trị giá lớn nhất gồm các thông tin: Số hoá đơn, ngày bán, tên khách hàng, địa chỉ khách hàng, 
--tổng trị giá của hoá đơn.
select top 1 HOADON.MaHD , NgayLapHD, TenKH, DiaChi , sum(DonGia * SoLuong) as ThanhTien 
from KHACHHANG 
inner join HOADON on HOADON.MaKH = KHACHHANG.MaKH 
inner join CHITIETHOADON on CHITIETHOADON.MaHD = HOADON.MaHD 
inner join HANGHOA on HANGHOA.MaH = CHITIETHOADON.MaH 
group by HOADON.MaHD , NgayLapHD, TenKH, DiaChi 
ORDER BY ThanHTien desc 

--12. Cho biết hoá đơn có tổng trị giá lớn nhất trong tháng 5/2000 gồm các thông tin: Số hoá đơn, ngày, tên khách hàng, địa chỉ khách hàng, 
--tổng trị giá của hoá đơn.
select top 1 HOADON.MaHD , NgayLapHD, TenKH, DiaChi , sum(DonGia * SoLuong) as ThanhTien 
from KHACHHANG 
inner join HOADON on HOADON.MaKH = KHACHHANG.MaKH 
inner join CHITIETHOADON on CHITIETHOADON.MaHD = HOADON.MaHD 
inner join HANGHOA on HANGHOA.MaH = CHITIETHOADON.MaH 
where Year(NgayLapHD) = 2018 and month(NgayLapHD) = 3
group by HOADON.MaHD , NgayLapHD, TenKH, DiaChi 
ORDER BY ThanHTien desc

--13. Cho biết hoá đơn có tổng trị giá nhỏ nhất gồm các thông tin: Số hoá đơn, ngày, tên khách hàng, địa chỉ khách hàng, tổng trị giá của hoá đơn.
select top 1 HOADON.MaHD , NgayLapHD, TenKH, DiaChi , sum(DonGia * SoLuong) as ThanhTien 
from KHACHHANG 
inner join HOADON on HOADON.MaKH = KHACHHANG.MaKH 
inner join CHITIETHOADON on CHITIETHOADON.MaHD = HOADON.MaHD 
inner join HANGHOA on HANGHOA.MaH = CHITIETHOADON.MaH 
group by HOADON.MaHD , NgayLapHD, TenKH, DiaChi 
ORDER BY ThanHTien asc 

--14. Cho biết các thông tin của khách hàng có số lượng hoá đơn mua hàng nhiều nhất.
select top 1 HOADON.MaKH, TenKH, DiaCHi, Tel, LoaiKH , count (MaHD) as SLHD 
from KHACHHANG 
inner join HOADON on HOADON.MaKH = KHACHHANG.MaKH 
group by HOADON.MaKH, TenKH, DiaCHi, Tel, LoaiKH  
order by SLHD desc 

--15. Cho biết các thông tin của khách hàng có số lượng hàng mua nhiều nhất.
select top 1 HOADON.MaKH, TenKH, DiaCHi, Tel, LoaiKH , count (Soluong) as SLHH 
from KHACHHANG 
inner join HOADON on HOADON.MaKH = KHACHHANG.MaKH 
inner join CHITIETHOADON on CHITIETHOADON.MaHD = HOADON.MaHD 
group by HOADON.MaKH, TenKH, DiaCHi, Tel, LoaiKH  
order by SLHH desc 

--16. Cho biết các thông tin về các mặt hàng mà được bán trong nhiều hoá đơn nhất.
select top 1 HANGHOA.MaH, TenH, DonGia, DonVT , count (MaHD) as SLHD 
from HANGHOA 
inner join CHITIETHOADON on CHITIETHOADON.MaH = HANGHOA.MaH
group by HANGHOA.MaH, TenH, DonGia, DonVT 
order by SLHD DESC 

--17. Cho biết các thông tin về các mặt hàng mà được bán nhiều nhất.
select top 1 HANGHOA.MaH, TenH, DonGia, DonVT , SUM(SoLuong) as TongHH
from HANGHOA 
inner join CHITIETHOADON on CHITIETHOADON.MaH = HANGHOA.MaH
group by HANGHOA.MaH, TenH, DonGia, DonVT 
order by TongHH DESC 

--Bai 3: DẠNG 3: CÂU LỆNH TRUY VẤN VỚI CẤU TRÚC LỒNG NHAU
--Cau 1. Cho biết MaH, TenH chưa được bán.
select MaH, TenH 
from HANGHOA 
where MaH not in (select MaH from CHITIETHOADON) 

--Cau 2. Cho biết thông tin khách hàng chưa mua hàng vào tháng 5
Select * 
from KHACHHANG 
where MaKH not in (sELECT MaKH FROM HOADON WHERE MONTH(NgayLapHD) = 5)

--Cau 3. Cho biết thông tin mặt hàng chưa được bán vào tháng 2.
select * 
from HANGHOA 
where MaH not in ( select MaH from CHITIETHOADON 
					INNER JOIN HOADON ON HOADON.MaHD = CHITIETHOADON.MaHD 
					WHERE MONTH(NgayLapHD) = 2) 

--Cau 4. Cho biết TenKH có mua mặt hàng BÁNH.
select DISTINCT TenKH 
from KHACHHANG
INNER JOIN HOADON ON HOADON.MaKH = KHACHHANG.MaKH
INNER JOIN CHITIETHOADON ON CHITIETHOADON.MaHD = HOADON.MaHD
INNER JOIN HANGHOA ON HANGHOA.MaH = CHITIETHOADON.MaH 
WHERE TenH LIKE '%Bánh%'

