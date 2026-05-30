-- -----------------------------------------------------------------------------------------
-- 🗄️ THIẾT LẬP CƠ SỞ DỮ LIỆU THỰC TẾ: csdl_quanlykho
-- Khớp chính xác với cấu trúc dữ liệu và tên bảng của đề bài bạn cung cấp!
-- -----------------------------------------------------------------------------------------

USE master;
GO
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'csdl_quanlykho') 
BEGIN 
    ALTER DATABASE csdl_quanlykho SET SINGLE_USER WITH ROLLBACK IMMEDIATE; 
    DROP DATABASE csdl_quanlykho; 
END
GO

CREATE DATABASE csdl_quanlykho;
GO

USE csdl_quanlykho;
GO

-- 1. Bảng DANH_MUC
CREATE TABLE DANH_MUC (
    madm VARCHAR(10) NOT NULL,
    tendm NVARCHAR(50) NOT NULL,
    mota NVARCHAR(150),
    CONSTRAINT PK_DANH_MUC PRIMARY KEY (madm)
);

-- 2. Bảng NHA_CUNG_CAP
CREATE TABLE NHA_CUNG_CAP (
    mancc VARCHAR(10) NOT NULL,
    tenncc NVARCHAR(100) NOT NULL,
    sdt VARCHAR(15),
    email VARCHAR(50),
    diachi NVARCHAR(200),
    CONSTRAINT PK_NHA_CUNG_CAP PRIMARY KEY (mancc)
);

-- 3. Bảng KHO
CREATE TABLE KHO (
    makho VARCHAR(10) NOT NULL,
    tenkho NVARCHAR(50) NOT NULL,
    diadiem NVARCHAR(100),
    dungtich INT,
    CONSTRAINT PK_KHO PRIMARY KEY (makho)
);

-- 4. Bảng SAN_PHAM
CREATE TABLE SAN_PHAM (
    masp VARCHAR(10) NOT NULL,
    tensp NVARCHAR(100) NOT NULL,
    madm VARCHAR(10) NOT NULL,
    dongia DECIMAL(10, 2) NOT NULL,
    soluongton INT NOT NULL,
    soluongtoithieu INT NOT NULL,
    CONSTRAINT PK_SAN_PHAM PRIMARY KEY (masp),
    CONSTRAINT FK_SAN_PHAM_DANH_MUC FOREIGN KEY (madm) REFERENCES DANH_MUC (madm)
);

-- 5. Bảng DON_NHAP_HANG
CREATE TABLE DON_NHAP_HANG (
    madon VARCHAR(10) NOT NULL,
    mancc VARCHAR(10) NOT NULL,
    makho VARCHAR(10) NOT NULL,
    ngaydat DATE NOT NULL,
    tongtien DECIMAL(12, 2) NOT NULL,
    trangthai CHAR(1) NOT NULL CHECK (trangthai IN ('P', 'R', 'C')),
    CONSTRAINT PK_DON_NHAP_HANG PRIMARY KEY (madon),
    CONSTRAINT FK_DON_NHAP_HANG_NHA_CUNG_CAP FOREIGN KEY (mancc) REFERENCES NHA_CUNG_CAP (mancc),
    CONSTRAINT FK_DON_NHAP_HANG_KHO FOREIGN KEY (makho) REFERENCES KHO (makho)
);

-- 6. Bảng CHI_TIET_DON_NHAP
CREATE TABLE CHI_TIET_DON_NHAP (
    madon VARCHAR(10) NOT NULL,
    masp VARCHAR(10) NOT NULL,
    soluong INT NOT NULL,
    dongianhap DECIMAL(10, 2) NOT NULL,
    CONSTRAINT PK_CHI_TIET_DON_NHAP PRIMARY KEY (madon, masp),
    CONSTRAINT FK_CHI_TIET_DON_NHAP_DON_NHAP_HANG FOREIGN KEY (madon) REFERENCES DON_NHAP_HANG (madon) ON DELETE CASCADE,
    CONSTRAINT FK_CHI_TIET_DON_NHAP_SAN_PHAM FOREIGN KEY (masp) REFERENCES SAN_PHAM (masp)
);

-- 7. Bảng TON_KHO
CREATE TABLE TON_KHO (
    masp VARCHAR(10) NOT NULL,
    makho VARCHAR(10) NOT NULL,
    soluong INT NOT NULL,
    CONSTRAINT PK_TON_KHO PRIMARY KEY (masp, makho),
    CONSTRAINT FK_TON_KHO_SAN_PHAM FOREIGN KEY (masp) REFERENCES SAN_PHAM (masp),
    CONSTRAINT FK_TON_KHO_KHO FOREIGN KEY (makho) REFERENCES KHO (makho)
);

-- 8. Bảng GIAO_DICH_KHO
CREATE TABLE GIAO_DICH_KHO (
    magiaodich VARCHAR(10) NOT NULL,
    masp VARCHAR(10) NOT NULL,
    makho VARCHAR(10) NOT NULL,
    loaigiaodich CHAR(1) NOT NULL CHECK (loaigiaodich IN ('I', 'O')),
    soluong INT NOT NULL,
    ngaygiaodich DATE NOT NULL,
    CONSTRAINT PK_GIAO_DICH_KHO PRIMARY KEY (magiaodich),
    CONSTRAINT FK_GIAO_DICH_KHO_SAN_PHAM FOREIGN KEY (masp) REFERENCES SAN_PHAM (masp),
    CONSTRAINT FK_GIAO_DICH_KHO_KHO FOREIGN KEY (makho) REFERENCES KHO (makho)
);
GO

-- -----------------------------------------------------------------------------------------
-- 📥 CHÈN DỮ LIỆU CHUẨN XÁC TỪ ĐỀ BÀI CỦA BẠN
-- -----------------------------------------------------------------------------------------
INSERT INTO DANH_MUC VALUES
('CAT001', 'Dien tu', 'Thiet bi va phu kien dien tu'),
('CAT002', 'Quan ao', 'Thoi trang va phu kien'),
('CAT003', 'Thuc pham', 'San pham thuc pham va do uong');

INSERT INTO SAN_PHAM VALUES
-- Dien tu (CAT001)
('P00001', 'Dien thoai thong minh X', 'CAT001', 699.99, 20, 10),
('P00002', 'May tinh xach tay Pro', 'CAT001', 1299.99, 10, 5),
('P00003', 'Tai nghe khong day', 'CAT001', 99.99, 50, 20),
('P00004', 'Dong ho thong minh', 'CAT001', 199.99, 20, 10),
('P00005', 'May tinh bang 10 inch', 'CAT001', 499.99, 0, 5),
('P00006', 'May choi game', 'CAT001', 399.99, 0, 5),
('P00007', 'Man hinh LED', 'CAT001', 249.99, 0, 5),
('P00008', 'Loa Bluetooth', 'CAT001', 79.99, 0, 15),
('P00009', 'Sac USB', 'CAT001', 19.99, 100, 50),
('P00010', 'Cap HDMI', 'CAT001', 9.99, 0, 30),
-- Quan ao (CAT002)
('P00011', 'Ao thun nam', 'CAT002', 29.99, 100, 20),
('P00012', 'Quan jeans nu', 'CAT002', 59.99, 0, 15),
('P00013', 'Ao khoac co mu', 'CAT002', 79.99, 0, 10),
('P00014', 'Giay the thao', 'CAT002', 89.99, 50, 10),
('P00015', 'Ao so mi', 'CAT002', 49.99, 0, 15),
('P00016', 'Ao len', 'CAT002', 69.99, 0, 10),
('P00017', 'Goi tat', 'CAT002', 14.99, 0, 30),
('P00018', 'Khan quang', 'CAT002', 19.99, 0, 20),
('P00019', 'Mu', 'CAT002', 24.99, 0, 25),
('P00020', 'That lung', 'CAT002', 34.99, 20, 15),
-- Thuc pham (CAT003)
('P00021', 'Gao 5kg', 'CAT003', 14.99, 100, 50),
('P00022', 'Ca hop', 'CAT003', 2.99, 300, 100),
('P00023', 'Dau olive 1L', 'CAT003', 9.99, 0, 20),
('P00024', 'Mi Y 500g', 'CAT003', 1.99, 500, 50),
('P00025', 'Ca phe hat 1kg', 'CAT003', 19.99, 0, 15),
('P00026', 'Ngu coc hop', 'CAT003', 4.99, 0, 30),
('P00027', 'Sua hop 1L', 'CAT003', 1.49, 700, 100),
('P00028', 'Duong 1kg', 'CAT003', 2.49, 0, 40),
('P00029', 'Banh quy goi', 'CAT003', 3.99, 0, 30),
('P00030', 'Tra tui loc 100g', 'CAT003', 5.99, 400, 20);

INSERT INTO NHA_CUNG_CAP VALUES
('SUP001', 'Cong ty Cong nghe Moi', '0901234567', 'lienhe@congnghemoi.com', '123 Duong Dinh Nghe, Ha Noi'),
('SUP002', 'Trung tam Thoi trang', '0912345678', 'banhang@thoitrang.com', '456 Nguyen Trai, TP HCM'),
('SUP003', 'Tap doan Thuc pham', '0923456789', 'thongtin@thucpham.com', '789 Duong Quang Ham, Da Nang'),
('SUP004', 'The gioi Do choi', '0934567890', 'hotro@dochoi.com', '101 Hai Ba Trung, Ha Noi'),
('SUP005', 'Cong ty Phong cach', '0945678901', 'banhang@phongcach.com', '202 Duong Ba Trac, TP HCM'),
('SUP006', 'Sieu thi Sach', '0956789012', 'hotro@sieuthisach.com', '303 Duong Quang Ham, Da Nang');

INSERT INTO KHO VALUES
('WH001', 'Kho Hoan Kiem', 'Ha Noi', 10000),
('WH002', 'Kho Nam Sai Gon', 'TP Ho Chi Minh', 8000),
('WH003', 'Kho Trung tam', 'Da Nang', 6000);

INSERT INTO TON_KHO VALUES
-- Dien tu (P00001 to P00010)
('P00001', 'WH001', 20), 
('P00002', 'WH001', 10), 
('P00003', 'WH001', 50), 
('P00004', 'WH001', 20), 
('P00009', 'WH001', 100), 
-- Quan ao (P00011 to P00020)
('P00011', 'WH002', 100),
('P00014', 'WH002', 50),
('P00020', 'WH002', 20),
-- Thuc pham (P00021 to P00030)
('P00021', 'WH001', 100), 
('P00022', 'WH002', 300), 
('P00024', 'WH003', 500),
('P00027', 'WH002', 700),
('P00030', 'WH001', 200), 
('P00030', 'WH003', 100),
('P00030', 'WH002', 100);

INSERT INTO DON_NHAP_HANG VALUES
('PO0001', 'SUP001', 'WH001', '2025-05-01', 20998.30, 'R'),
('PO0002', 'SUP002', 'WH002', '2025-05-05', 6698.30, 'R'),
('PO0003', 'SUP003', 'WH003', '2025-05-10', 2985.00, 'P'),
('PO0004', 'SUP004', 'WH001', '2025-05-15', 15999.70, 'R'),
('PO0005', 'SUP006', 'WH002', '2025-05-20', 4493.00, 'P'),
('PO0006', 'SUP005', 'WH002', '2025-05-22', 2398.90, 'C'),
('PO0007', 'SUP006', 'WH003', '2025-05-24', 1497.00, 'C'),
('PO0008', 'SUP006', 'WH001', '2025-05-25', 2497.00, 'R'),
('PO0009', 'SUP006', 'WH002', '2025-05-25', 1940.00, 'R'),
('PO0010', 'SUP006', 'WH003', '2025-05-25', 1494.00, 'R'),
('PO0011', 'SUP006', 'WH003', '2025-05-25', 1044.00, 'P'),
('PO0012', 'SUP006', 'WH002', '2025-05-25', 499.00, 'R');

INSERT INTO CHI_TIET_DON_NHAP VALUES
-- PO0001 (Dien tu, SUP001, WH001, R)
('PO0001', 'P00001', 20, 699.99),
('PO0001', 'P00003', 50, 99.99),
('PO0001', 'P00009', 100, 19.99),
-- PO0002 (Quan ao, SUP002, WH002, R)
('PO0002', 'P00011', 100, 29.99),
('PO0002', 'P00014', 50, 59.99),
('PO0002', 'P00020', 20, 34.99),
-- PO0003 (Thuc pham, SUP003, WH003, P)
('PO0003', 'P00022', 500, 2.99),
('PO0003', 'P00027', 1000, 1.49),
-- PO0004 (Dien tu, SUP004, WH001, R)
('PO0004', 'P00002', 10, 1299.99),
('PO0004', 'P00004', 20, 149.99),
-- PO0005 (Thuc pham, SUP006, WH002, P)
('PO0005', 'P00021', 200, 14.99),
('PO0005', 'P00024', 500, 2.99),
-- PO0006 (Quan ao, SUP005, WH002, C)
('PO0006', 'P00018', 60, 14.99),
-- PO0007 (Thuc pham, SUP006, WH003, C)
('PO0007', 'P00023', 50, 9.99),
('PO0007', 'P00029', 250, 3.99),
-- PO0008 (Thuc pham, SUP006, WH001, R)
('PO0008', 'P00021', 100, 14.99),
('PO0008', 'P00030', 200, 4.99),
-- PO0009 (Thuc pham, SUP006, WH002, R)
('PO0009', 'P00022', 300, 2.99),
('PO0009', 'P00027', 700, 1.49),
-- PO0010 (Thuc pham, SUP006, WH003, R)
('PO0010', 'P00024', 500, 1.99),
('PO0010', 'P00030', 100, 4.99),
-- PO0011 (Thuc pham, SUP006, WH003, P)
('PO0011', 'P00022', 100, 2.99),
('PO0011', 'P00027', 500, 1.49),
-- PO0012 (Thuc pham, SUP006, WH002, R)
('PO0012', 'P00030', 100, 4.99);

INSERT INTO GIAO_DICH_KHO VALUES
-- PO0001 (R, WH001)
('TX0001', 'P00001', 'WH001', 'I', 20, '2025-05-01'),
('TX0002', 'P00003', 'WH001', 'I', 50, '2025-05-01'),
('TX0003', 'P00009', 'WH001', 'I', 100, '2025-05-01'),
-- PO0002 (R, WH002)
('TX0004', 'P00011', 'WH002', 'I', 100, '2025-05-05'),
('TX0005', 'P00014', 'WH002', 'I', 50, '2025-05-05'),
('TX0006', 'P00020', 'WH002', 'I', 20, '2025-05-05'),
-- PO0004 (R, WH001)
('TX0007', 'P00002', 'WH001', 'I', 10, '2025-05-15'),
('TX0008', 'P00004', 'WH001', 'I', 20, '2025-05-15'),
-- PO0008 (R, WH001)
('TX0009', 'P00021', 'WH001', 'I', 100, '2025-05-25'),
('TX0010', 'P00030', 'WH001', 'I', 200, '2025-05-25'),
-- PO0009 (R, WH002)
('TX0011', 'P00022', 'WH002', 'I', 300, '2025-05-25'),
('TX0012', 'P00027', 'WH002', 'I', 700, '2025-05-25'),
-- PO0010 (R, WH003)
('TX0013', 'P00024', 'WH003', 'I', 500, '2025-05-25'),
('TX0014', 'P00030', 'WH003', 'I', 100, '2025-05-25'),
-- PO0012 (R, WH002)
('TX0015', 'P00030', 'WH002', 'I', 100, '2025-05-25');
GO


-- =========================================================================================
-- 🔑 ĐÁP ÁN CHUẨN XÁC 10 CÂU TRUY VẤN (Khớp 100% với dữ liệu và phong cách tối giản của bạn)
-- =========================================================================================

-- Cau 1 Lập danh sách mã số, tên, đơn giá và số lượng tồn của các sản phẩm có đơn giá lớn hơn 100 và số lượng tồn kho dưới 50.
USE csdl_quanlykho;
GO
SELECT masp,tensp,dongia,soluongton
FROM SAN_PHAM
WHERE dongia>100 AND soluongton<50;
GO

-- Cau 2. Lập danh sách mã số, ngày đặt hàng, tổng tiền, tên nhà cung cấp của các đơn nhập hàng có trạng thái đã nhập vào kho WH002.
USE csdl_quanlykho;
GO
SELECT d.madon,d.ngaydat,d.tongtien,n.tenncc
FROM DON_NHAP_HANG AS d
JOIN NHA_CUNG_CAP AS n ON d.mancc=n.mancc
WHERE d.trangthai='R' AND d.makho='WH002';
GO

-- Cau 3. Lập danh sách mã số, tên và số lượng của các sản phẩm thuộc danh mục Thuc pham có số lượng tại kho WH003 lớn hơn 100.
USE csdl_quanlykho;
GO
SELECT s.masp,s.tensp,t.soluong
FROM SAN_PHAM AS s
JOIN DANH_MUC AS d ON s.madm=d.madm
JOIN TON_KHO AS t ON s.masp=t.masp
WHERE d.tendm=N'Thuc pham' AND t.makho='WH003' AND t.soluong>100;
GO

-- Cau 4. Lập danh sách mã số, ngày đặt hàng, tổng tiền và tên nhà cung cấp của các đơn nhập hàng được đặt trong tháng 5/2025 có tổng tiền trên 2000 và đang chờ giao hàng. 
-- Sắp xếp kết quả theo tổng tiền giảm.
USE csdl_quanlykho;
GO
SELECT d.madon,d.ngaydat,d.tongtien,n.tenncc
FROM DON_NHAP_HANG AS d
JOIN NHA_CUNG_CAP AS n ON d.mancc=n.mancc
WHERE d.ngaydat BETWEEN '2025-05-01' AND '2025-05-31'
  AND d.tongtien>2000
  AND d.trangthai='P'
ORDER BY d.tongtien DESC;
GO

-- Cau 5. Lập danh sách các chi tiết đơn hàng có số lượng nhập lớn hơn 100 từ các đơn nhập hàng đã nhập kho trong tháng 5/2025 cho danh mục CAT003.
USE csdl_quanlykho;
GO
SELECT c.madon,c.masp,c.soluong,c.dongianhap
FROM CHI_TIET_DON_NHAP AS c
JOIN DON_NHAP_HANG AS d ON c.madon=d.madon
JOIN SAN_PHAM AS s ON c.masp=s.masp
WHERE c.soluong>100
  AND d.trangthai='R'
  AND d.ngaydat BETWEEN '2025-05-01' AND '2025-05-31'
  AND s.madm='CAT003';
GO

-- Cau 6. Lập danh sách mã số, tên và tổng số tiền từ các đơn nhập hàng đã nhập trong tháng 5/2025 của các nhà cung cấp.
USE csdl_quanlykho;
GO
SELECT n.mancc,n.tenncc,SUM(d.tongtien) AS tong_so_tien
FROM NHA_CUNG_CAP AS n
LEFT JOIN DON_NHAP_HANG AS d ON n.mancc=d.mancc AND d.trangthai='R' AND d.ngaydat BETWEEN '2025-05-01' AND '2025-05-31'
GROUP BY n.mancc,n.tenncc;
GO

-- Cau 7. Lập danh sách mã số, tên và tổng số lượng của các sản phẩm đang chờ giao hàng (từ các đơn nhập hàng có trạng thái là P) 
-- trong tháng 5/2025 với tổng tiền hàng (dựa trên so_luong * don_gia_nhap) trên 2000
USE csdl_quanlykho;
GO
SELECT s.masp,s.tensp,SUM(c.soluong) AS tong_so_luong
FROM SAN_PHAM AS s
JOIN CHI_TIET_DON_NHAP AS c ON s.masp=c.masp
JOIN DON_NHAP_HANG AS d ON c.madon=d.madon
WHERE d.trangthai='P' AND d.ngaydat BETWEEN '2025-05-01' AND '2025-05-31'
GROUP BY s.masp,s.tensp
HAVING SUM(c.soluong * c.dongianhap)>2000;
GO

-- Cau 8. Với mỗi nhà cung cấp, cho biết mã số, tên, tổng số đơn hàng đã nhập trong tháng 5/2025 và tổng số tiền từ các đơn hàng đã nhập.
USE csdl_quanlykho;
GO
SELECT n.mancc,n.tenncc,COUNT(d.madon) AS tong_don_hang,SUM(ISNULL(d.tongtien,0)) AS tong_so_tien
FROM NHA_CUNG_CAP AS n
LEFT JOIN DON_NHAP_HANG AS d ON n.mancc=d.mancc AND d.trangthai='R' AND d.ngaydat BETWEEN '2025-05-01' AND '2025-05-31'
GROUP BY n.mancc,n.tenncc;
GO

-- Cau 9. Lập danh sách các kho có tổng số lượng sản phẩm đã nhập lớn hơn số lượng tồn kho trung bình của tất cả sản phẩm trong danh mục Thuc pham. 
-- Danh sách gồm các thông tin mã số kho, tên kho và tổng số lượng sản phẩm đã nhập.
USE csdl_quanlykho;
GO
SELECT k.makho,k.tenkho,SUM(c.soluong) AS tong_so_luong
FROM KHO AS k
JOIN DON_NHAP_HANG AS d ON k.makho=d.makho
JOIN CHI_TIET_DON_NHAP AS c ON d.madon=c.madon
WHERE d.trangthai='R'
GROUP BY k.makho,k.tenkho
HAVING SUM(c.soluong) > (
    SELECT AVG(s.soluongton)
    FROM SAN_PHAM AS s
    JOIN DANH_MUC AS dm ON s.madm=dm.madm
    WHERE dm.tendm=N'Thuc pham'
);
GO

-- Cau 10. Lập danh sách các danh mục sản phẩm có tổng giá trị hàng nhập (dựa trên so_luong * don_gia_nhap của các đơn nhập hàng có trạng thái là R) trong tháng 5/2025 lớn hơn mức trung bình trong cùng tháng của tất cả các danh mục.
-- Danh sách gồm các thông tin mã danh mục, tên danh mục, tổng giá trị hàng nhập.
USE csdl_quanlykho;
GO
WITH GiaTriTheoDanhMuc AS (
    SELECT dm.madm,dm.tendm,SUM(c.soluong * c.dongianhap) AS tong_gia_tri
    FROM DANH_MUC AS dm
    JOIN SAN_PHAM AS s ON dm.madm=s.madm
    JOIN CHI_TIET_DON_NHAP AS c ON s.masp=c.masp
    JOIN DON_NHAP_HANG AS d ON c.madon=d.madon
    WHERE d.trangthai='R' AND d.ngaydat BETWEEN '2025-05-01' AND '2025-05-31'
    GROUP BY dm.madm,dm.tendm
)
SELECT madm,tendm,tong_gia_tri
FROM GiaTriTheoDanhMuc
WHERE tong_gia_tri > (SELECT AVG(tong_gia_tri) FROM GiaTriTheoDanhMuc);
GO
