-- -------------------------------------------------------------
-- SCRIPT TẠO CƠ SỞ DỮ LIỆU: csdl_cinema
-- Dùng để ôn tập kiểm tra (Từ đầu đến Lab 4)
-- Học phần: Cơ sở dữ liệu
-- -------------------------------------------------------------

CREATE DATABASE csdl_cinema;
GO

USE csdl_cinema;
GO

-- 1. Bảng phim (Lưu thông tin phim)
CREATE TABLE phim (
    maphim INT NOT NULL,
    tenphim NVARCHAR(100) NOT NULL,
    theloai NVARCHAR(50) NOT NULL,
    thoiluong INT NOT NULL CHECK (thoiluong > 0),
    daodien NVARCHAR(50),
    namsx INT,
    CONSTRAINT PK_phim PRIMARY KEY (maphim)
);

-- 2. Bảng rap (Lưu thông tin rạp chiếu)
CREATE TABLE rap (
    marap INT NOT NULL,
    tenrap NVARCHAR(50) NOT NULL,
    diadiem NVARCHAR(100) NOT NULL,
    succhua INT NOT NULL CHECK (succhua > 0),
    CONSTRAINT PK_rap PRIMARY KEY (marap)
);

-- 3. Bảng lichchieu (Lịch chiếu của phim tại các rạp)
CREATE TABLE lichchieu (
    malich INT NOT NULL,
    maphim INT NOT NULL,
    marap INT NOT NULL,
    ngaychieu DATE NOT NULL,
    giochieu TIME NOT NULL,
    giave_goc DECIMAL(10, 2) NOT NULL CHECK (giave_goc >= 0),
    CONSTRAINT PK_lichchieu PRIMARY KEY (malich)
);

-- 4. Bảng ve (Vé đã bán cho các lịch chiếu)
CREATE TABLE ve (
    mave INT NOT NULL,
    malich INT NOT NULL,
    ngayban DATE NOT NULL,
    loaive VARCHAR(20) NOT NULL CHECK (loaive IN ('Thuong', 'VIP')),
    giaban DECIMAL(10, 2) NOT NULL CHECK (giaban >= 0),
    CONSTRAINT PK_ve PRIMARY KEY (mave)
);

-- -------------------------------------------------------------
-- THIẾT LẬP KHÓA NGOẠI (FOREIGN KEYS)
-- -------------------------------------------------------------
ALTER TABLE lichchieu
    ADD CONSTRAINT FK_lichchieu_phim FOREIGN KEY (maphim) REFERENCES phim (maphim)
        ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE lichchieu
    ADD CONSTRAINT FK_lichchieu_rap FOREIGN KEY (marap) REFERENCES rap (marap)
        ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE ve
    ADD CONSTRAINT FK_ve_lichchieu FOREIGN KEY (malich) REFERENCES lichchieu (malich)
        ON DELETE CASCADE ON UPDATE CASCADE;

-- -------------------------------------------------------------
-- CHÈN DỮ LIỆU MẪU (MOCK DATA)
-- -------------------------------------------------------------

-- Chèn dữ liệu bảng phim
INSERT INTO phim (maphim, tenphim, theloai, thoiluong, daodien, namsx) VALUES
(1, N'Bố Già', N'Tâm lý', 128, N'Trấn Thành', 2021),
(2, N'Lật Mặt 6', N'Hành động', 132, N'Lý Hải', 2023),
(3, N'Mai', N'Tình cảm', 130, N'Trấn Thành', 2024),
(4, N'Dune: Hành Tinh Cát 2', N'Khoa học viễn tưởng', 166, N'Denis Villeneuve', 2024),
(5, N'Conan: Tàu Ngầm Sắt Màu Đen', N'Hoạt hình', 109, N'Yuzuru Tachikawa', 2023),
(6, N'Kẻ Huỷ Diệt', N'Hành động', 107, N'James Cameron', 1984),
(7, N'Phim Không Chiếu', N'Kinh dị', 90, N'Đạo diễn ẩn danh', 2025);

-- Chèn dữ liệu bảng rap
INSERT INTO rap (marap, tenrap, diadiem, succhua) VALUES
(101, N'CGV Hùng Vương Plaza', N'Quận 5, TP.HCM', 150),
(102, N'Lotte Cinema Nam Sài Gòn', N'Quận 7, TP.HCM', 200),
(103, N'Galaxy Nguyễn Du', N'Quận 1, TP.HCM', 120),
(104, N'BHD Star Thảo Điền', N'Quận 2, TP.HCM', 180),
(105, N'Beta Cinema Quang Trung', N'Quận Gò Vấp, TP.HCM', 100);

-- Chèn dữ liệu bảng lichchieu
-- Lưu ý: Phim 4 (Dune 2) sẽ được chiếu ở TẤT CẢ các rạp (để làm câu hỏi phép chia/EXISTS)
INSERT INTO lichchieu (malich, maphim, marap, ngaychieu, giochieu, giave_goc) VALUES
(201, 1, 101, '2026-05-20', '09:00:00', 80000),
(202, 1, 102, '2026-05-20', '14:30:00', 85000),
(203, 2, 101, '2026-05-21', '19:00:00', 90000),
(204, 2, 103, '2026-05-21', '21:15:00', 95000),
(205, 3, 102, '2026-05-22', '18:00:00', 100000),
(206, 3, 104, '2026-05-22', '20:30:00', 110000),
-- Phim 4 chiếu ở tất cả các rạp (101, 102, 103, 104, 105)
(207, 4, 101, '2026-05-23', '08:00:00', 120000),
(208, 4, 102, '2026-05-23', '13:00:00', 120000),
(209, 4, 103, '2026-05-23', '17:00:00', 115000),
(210, 4, 104, '2026-05-23', '21:00:00', 130000),
(211, 4, 105, '2026-05-24', '15:00:00', 90000),
-- Phim 5
(212, 5, 103, '2026-05-24', '10:00:00', 75000),
(213, 5, 105, '2026-05-24', '18:30:00', 70000),
-- Lịch chiếu không bán được vé nào (dành cho LEFT JOIN)
(214, 6, 101, '2026-05-25', '23:00:00', 60000);

-- Chèn dữ liệu bảng ve (Giả định giá vé VIP = giá gốc + 20k, vé thường = giá gốc)
INSERT INTO ve (mave, malich, ngayban, loaive, giaban) VALUES
(301, 201, '2026-05-19', 'Thuong', 80000),
(302, 201, '2026-05-19', 'VIP', 100000),
(303, 202, '2026-05-19', 'Thuong', 85000),
(304, 203, '2026-05-20', 'Thuong', 90000),
(305, 203, '2026-05-20', 'VIP', 110000),
(306, 204, '2026-05-20', 'VIP', 115000),
(307, 205, '2026-05-21', 'Thuong', 100000),
(308, 205, '2026-05-21', 'VIP', 120000),
(309, 206, '2026-05-21', 'VIP', 130000),
-- Vé cho phim Dune 2 (Lịch 207, 208, 209, 210, 211)
(310, 207, '2026-05-22', 'Thuong', 120000),
(311, 207, '2026-05-22', 'VIP', 140000),
(312, 208, '2026-05-22', 'Thuong', 120000),
(313, 209, '2026-05-22', 'Thuong', 115000),
(314, 210, '2026-05-22', 'VIP', 150000),
(315, 211, '2026-05-23', 'Thuong', 90000),
-- Vé cho phim Conan (Lịch 212, 213)
(316, 212, '2026-05-23', 'Thuong', 75000),
(317, 213, '2026-05-23', 'Thuong', 70000);
