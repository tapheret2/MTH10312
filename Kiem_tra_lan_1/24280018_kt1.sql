-- Mssv: 24280018
-- Ho ten: Pham Tien Phat
-- DBMS: SQL Server

--1: Viết các lệnh SQL định nghĩa dữ liệu để tạo cơ sở dữ liệu có tên là csdl_olympic ứng với lược đồ đã cho trong tập tin Olympic - Lược đồ.pdf.
CREATE DATABASE csdl_olympic;
USE csdl_olympic;
CREATE TABLE monthi (
    mamon INT NOT NULL,
    noidung VARCHAR(35) NOT NULL,
    montt VARCHAR(35) NOT NULL,
    CONSTRAINT PK_monthi PRIMARY KEY(mamon)
);
CREATE TABLE quocgia (
    maqg INT NOT NULL,
    tennuoc VARCHAR(70) NOT NULL,
    CONSTRAINT PK_quocgia PRIMARY KEY(maqg)
);
CREATE TABLE van_dongvien(
    mavdv INT NOT NULL,
    tenvdv VARCHAR(20) NOT NULL,
    hovdv VARCHAR(30) NOT NULL,
    gioitinh CHAR(1) NOT NULL CHECK (gioitinh IN('m','M','f','F')),
    ngaysinh DATE NOT NULL,
    maqg INT NOT NULL,
    CONSTRAINT PK_van_dongvien PRIMARY KEY(mavdv)
);
CREATE TABLE ketqua(
    makq INT NOT NULL,
    mavdv INT NOT NULL,
    mamon INT NOT NULL,
    hang INT NOT NULL,
    huychuong VARCHAR(5) NOT NULL,
    CONSTRAINT PK_ketqua PRIMARY KEY(makq)
);
ALTER TABLE van_dongvien
    ADD CONSTRAINT FK_van_dongvien_quocgia FOREIGN KEY(maqg)
    REFERENCES quocgia(maqg);
ALTER TABLE ketqua
    ADD CONSTRAINT FK_ketqua_monthi FOREIGN KEY(mamon)
    REFERENCES monthi(mamon);
ALTER TABLE ketqua
    ADD CONSTRAINT FK_ketqua_vandongvien FOREIGN KEY(mavdv)
    REFERENCES van_dongvien(mavdv);
--2  Viết lệnh SQL để cập nhật trạng thái ban đầu cho cơ sở dữ liệu với dữ liệu đã cho trong tập tin Olympic - Dữ liệu.xlsx.
-- Bảng quocgia
INSERT INTO quocgia(maqg, tennuoc) VALUES (101, 'My');
INSERT INTO quocgia(maqg, tennuoc) VALUES (102, 'Trung Quoc');
INSERT INTO quocgia(maqg, tennuoc) VALUES (103, 'Kazakhstan');
INSERT INTO quocgia(maqg, tennuoc) VALUES (104, 'Nhat Ban');
-- Bảng monthi
INSERT INTO monthi(mamon, noidung, montt) VALUES (201, 'Don nam', 'Truot bang nghe thuat');
INSERT INTO monthi(mamon, noidung, montt) VALUES (202, 'Don nu', 'Truot bang nghe thuat');
INSERT INTO monthi(mamon, noidung, montt) VALUES (203, 'Halfpine', 'Truot tuyet tu do');
-- Bảng van_dongvien
INSERT INTO van_dongvien(mavdv, tenvdv, hovdv, gioitinh, ngaysinh, maqg) VALUES (111, 'Alyssa', 'Liu', 'F', '2005-08-08', 101);
INSERT INTO van_dongvien(mavdv, tenvdv, hovdv, gioitinh, ngaysinh, maqg) VALUES (112, 'Eileen', 'Gu', 'F', '2000-08-02', 102);
INSERT INTO van_dongvien(mavdv, tenvdv, hovdv, gioitinh, ngaysinh, maqg) VALUES (113, 'Mikhail', 'Shaidorov', 'M', '2004-06-25', 103);
INSERT INTO van_dongvien(mavdv, tenvdv, hovdv, gioitinh, ngaysinh, maqg) VALUES (114, 'Akira', 'Minamoto', 'M', '2001-05-10', 104);
-- Bảng ketqua
INSERT INTO ketqua(makq, mavdv, mamon, hang, huychuong) VALUES (221, 111, 202, 1, 'Vang');
INSERT INTO ketqua(makq, mavdv, mamon, hang, huychuong) VALUES (222, 112, 203, 1, 'Vang');
INSERT INTO ketqua(makq, mavdv, mamon, hang, huychuong) VALUES (223, 113, 201, 1, 'Vang');
INSERT INTO ketqua(makq, mavdv, mamon, hang, huychuong) VALUES (224, 114, 201, 2, 'Bac');
--3. (4.0 điểm) - Viết lệnh SQL để:
-- 3.1 - Điều chỉnh ngày sinh của vận động viên "Eileen Gu" thành '2003-09-03'.
UPDATE van_dongvien
SET ngaysinh = '2003-09-03'
WHERE tenvdv = 'Eileen' AND hovdv = 'Gu';
-- 3.2 - Xóa thông tin của kết quả có mã số 224.
DELETE FROM ketqua
WHERE makq = 224;