create database QLNV_2021
use  QLNV_2021
create table PHONG(
	MaPhong char(3) NOT NULL primary key,
	TenPhong nvarchar(40) NOT NULL,
	DiaChi nvarchar(50) NOT NULL,
	Tel char(10) NOT NULL
)
create table DMNN(
	MaNN int Identity(01,1) NOT NULL primary key,
	TenNN nvarchar(20) NOT NULL
)
create table NHANVIEN(
	MaNV char(5) NOT NULL primary key,
	HoTen nvarchar(40) NOT NULL,
	GioiTinh char(3) NOT NULL,
	NgaySinh datetime NOT NULL ,
	Luong int NOT NULL,
	MaPhong char(3) foreign key references PHONG (MaPhong),
	SDT char(10) NOT NULL,
	NgayBC datetime NOT NULL
)
drop table NHANVIEN
create table TDNN (
	MaNV char(5) foreign key references NHANVIEN (MaNV),
	MaNN int foreign key references DMNN (MaNN),
	Tdo char(1) NOT NULL
)
drop table TDNN
Insert into PHONG
values('HCA','Hành chính nhân sự','123, Láng Hạ, Đống Đa, Hà Nội', 048585793)
Insert into PHONG
values('KDA','Kinh doanh','123, Láng Hạ, Đống Đa, Hà Nội', 048574943)
Insert into PHONG
values('KTA','Kỹ thuật','123, Láng Hạ, Đống Đa, Hà Nội', 049480485)
Insert into PHONG
values('QTA','Quản trị','123, Láng Hạ, Đống Đa, Hà Nội', 048508585)

Insert into DMNN
values('Anh')
Insert into DMNN
values('Nga')
Insert into DMNN
values('Pháp')
Insert into DMNN
values('Nhật')
Insert into DMNN
values('Trung Quốc')
Insert into DMNN
values('Hàn Quốc')

Insert into NHANVIEN
values('HC001','Nguyễn Thị Hà','Nữ',1975-1-1,2500000,'HCA',0129937,1990-8-2)
Insert into NHANVIEN
values('HC002','Trần Văn Nam','Nam',1975-12-6,3000000,'HCA',0129937,1997-8-6)
Insert into NHANVIEN
values('HC003','Nguyễn Thanh Tuyền','Nữ',1978-7-3,1500000,'HCA',0129937,1999-9-24)
Insert into NHANVIEN
values('KD001','Lê Tuyết Anh','Nữ',1977-3-2,2500000,'KDA',0129937,2001-2-10)
Insert into NHANVIEN
values('KD002','Nguyễn Anh Tú','Nam',1972-4-7,2600000,'KDA',0129937,1999-9-24)
Insert into NHANVIEN
values('KD003','Phạm An Thái','Nam',1975-9-5,1600000,'KDA',0129937,1999-9-24)
Insert into NHANVIEN
values('KD004','Lê Văn Hải','Nữ',1976-2-1,2700000,'KDA',0129937,1997-8-6)
Insert into NHANVIEN
values('KD005','Nguyễn Phương Minh','Nam',1980-2-1,2000000,'KDA',0129937,2001-2-10)
Insert into NHANVIEN
values('KT001','Trần Đình Khâm','Nam',1988-2-12,2700000,'KTA',0129937,2005-1-1)
Insert into NHANVIEN
values('KT002','Nguyễn Mạnh Hùng','Nam',1980-8-16,2300000,'KTA',0129937,2005-1-1)
Insert into NHANVIEN
values('KT003','Phạm Thanh Sơn','Nam',1984-8-20,2000000,'KTA',0129937,2005-1-1)
Insert into NHANVIEN
values('KT004','Vũ Thị Hoài','Nữ',1980-5-12,2500000,'KTA',0129937,2001-2-10)
Insert into NHANVIEN
values('KT005','Nguyễn Thu Lan','Nữ',1977-5-10,3000000,'KTA',0129937,2001-2-10)
Insert into NHANVIEN
values('KT006','Trần Hoài Nam','Nam',1978-2-7,2800000,'KTA',0129937,1997-8-6)
Insert into NHANVIEN
values('KT007','Hoàng Nam Sơn','Nam',1989-3-12,3000000,'KTA',0129937,1995-2-7)
Insert into NHANVIEN
values('KT008','Lê Thu Trang','Nữ',1950-6-7,2500000,'KTA',0129937,1998-2-8)
Insert into NHANVIEN
values('KT009','Khúc Nam Hải','Nam',1980-7-22,2000000,'KTA',0129937,2005-1-1)
Insert into NHANVIEN
values('KT010','Phùng Trung Dũng','Nam',1978-8-28,2200000,'KTA',0129937,1999-9-24)

Insert into TDNN
values('HC001',01,'A')
Insert into TDNN
values('HC001',02,'B')
Insert into TDNN
values('HC002',01,'C')
Insert into TDNN
values('HC002',03,'C')
Insert into TDNN
values('HC003',01,'D')
Insert into TDNN
values('KD001',01,'C')
Insert into TDNN
values('KD001',02,'B')
Insert into TDNN
values('KD002',01,'D')
Insert into TDNN
values('KD002',02,'A')
Insert into TDNN
values('KD003',01,'B')
Insert into TDNN
values('KD003',02,'C')
Insert into TDNN
values('KD004',01,'C')
Insert into TDNN
values('KD004',04,'A')
Insert into TDNN
values('KD004',05,'A')
Insert into TDNN
values('KD005',01,'B')
Insert into TDNN
values('KD005',02,'D')
Insert into TDNN
values('KD005',03,'B')
Insert into TDNN
values('KD005',04,'B')
Insert into TDNN
values('KT001',01,'D')
Insert into TDNN
values('KT001',04,'E')
Insert into TDNN
values('KT002',01,'C')
Insert into TDNN
values('KT002',02,'B')
Insert into TDNN
values('KT003',01,'D')
Insert into TDNN
values('KT003',03,'C')
Insert into TDNN
values('KT004',01,'D')
Insert into TDNN
values('KT005',01,'C')

select * from NHANVIEN
/*cau 1 cho biet dia chi, sdt cua phong voi ten phong nhap vao tu ban phim*/
select DiaChi, Tel
from PHONG
where TenPhong ='Hành chính nhân sự'

/*cau 2: 2.Cho biết mã nhân viên, họ tên, ngày vào biên chế của những nhân viên có mức lương thấp mức lương trung bình 
của toàn bộ nhân viên trong cty (mức lương nhập vào từ bàn phím)*/
select MaNV, HoTen, NgayBC, Luong 
from NHANVIEN
where luong < (select avg(Luong) from NHANVIEN)

create view nv_nv1
as
  select MaNV, HoTen, NgayBC, Luong
  from NHANVIEN 
  where luong < ( select avg(Luong) 
                  from NHANVIEN)
 select * from nv_nv1

 /*cau 3.Đưa ra danh sách nhân viên gồm mã nhân viên, họ, tên, ngày sinh của nhân viên với tên phòng nhập vào từ bàn phím.*/
 select MaNV, HoTen, NgaySinh 
 from NHANVIEN as NV
 Inner join PHONG On NV.MaPhong = PHONG.MaPhong
 where TenPhong= 'Hành chính nhân sự'

 create view cau_3
 as 
  select MaNV, HoTen, NgaySinh 
 from NHANVIEN as NV
 Inner join PHONG On NV.MaPhong = PHONG.MaPhong
 where TenPhong= 'Hành chính nhân sự'

	select * from cau_3

/*4.Hiển thị thông tin về các nhân viên có ngày vào biên chế trước 
ngày nhập vào từ bàn phím và do phòng có mã phòng được nhập từ bàn phím quản lý*/
select *
from NHANVIEN as NV
inner join PHONG on NV.MaPhong= PHONG.MaPhong
where NgayBC < '1995-3-2'
And PHONG.MaPhong = 'KDA'

/*5.Hiển thị thông tin các nhân viên: mã nhân viên, họ, tên, ngày sinh, tên ngoại ngữ, trình độ ngoại ngữ với tên ngoại ngữ và 
trình độ ngoại ngữ được nhập vào từ bàn phím*/
select NV.MaNV, HoTen, NgaySinh, TenNN, Tdo
from NHANVIEN As NV
inner join TDNN on NV.MaNV = TDNN.MaNV
inner join DMNN on TDNN.MaNN = DMNN.MaNN
where TenNN='Anh' 
and Tdo='A'

/*6.Hiển thị thông tin về số lượng nhân viên đã học 1 ngoại ngữ nào đó với tên ngoại ngữ được nhập vào từ bàn phím*/
Select count(NV.MaNV)
from NHANVIEN as NV
inner join TDNN on NV.MaNV = TDNN.MaNV
inner join DMNN on TDNN.MaNN = DMNN.MaNN
where TenNN= 'Pháp'

/*7.Cho biết toàn cơ quan có bao nhiêu nhân viên nữ? (VIEW)*/
select count(MaNV)
from NHANVIEN 
where GioiTinh = 'Nữ'

/*8.Hiển thị thông tin đưa ra gồm mã nhân viên, họ tên, số ngoại ngữ mà nhân viên này học với số lượng ngoại ngữ mà 
nhân viên đó đã học lớn hơn số lượng được nhập vào từ bàn phím.*/
Select NV.MaNV, HoTen, count(MaNN) as SL
from NHANVIEN as NV
inner join TDNN on NV.MaNV = TDNN.MaNV 
group by NV.MaNV, HoTen
having count(MaNN) > 3


