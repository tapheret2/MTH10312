-- -------------------------------------------------------------
-- ĐÁP ÁN CHI TIẾT ĐỀ THI THỬ CƠ SỞ DỮ LIỆU
-- Nội dung: Từ đầu đến Lab 4
-- Hệ Quản Trị CSDL: SQL Server
-- -------------------------------------------------------------

USE csdl_cinema;
GO

-- -------------------------------------------------------------
-- PHẦN I: LÝ THUYẾT & KHÁI NIỆM (Gợi ý đáp án)
-- -------------------------------------------------------------
/*
Câu A1: Phân biệt WHERE và HAVING:
  - WHERE dùng để lọc các dòng dữ liệu (records) TRƯỚC khi thực hiện việc gom nhóm (GROUP BY).
    WHERE không thể sử dụng các hàm gom nhóm (như SUM, COUNT, AVG, MAX, MIN).
  - HAVING dùng để lọc các nhóm (groups) SAU khi thực hiện gom nhóm (GROUP BY).
    HAVING thường đi kèm với các hàm gom nhóm.

Câu A2: Khóa ngoại có bắt buộc NOT NULL không?
  - KHÔNG bắt buộc. Một khóa ngoại có thể nhận giá trị NULL nếu mối kết hợp đó là tùy chọn (optional).
  - Ví dụ: Trong bảng `nhanvien` (ở câu B1 dưới đây), cột `marap` làm khóa ngoại. Nếu một nhân viên mới tuyển
    chưa được phân bổ về rạp cụ thể nào, cột `marap` của nhân viên đó có thể nhận giá trị NULL.

Câu A3: Phép kết LEFT OUTER JOIN:
  - Tất cả các dòng của bảng bên trái (bảng A) sẽ được giữ lại trong kết quả.
  - Đối với các dòng trong bảng A không có dòng nào khớp ở bảng B (bảng bên phải) thông qua điều kiện kết,
    thì tất cả các cột tương ứng của bảng B trên dòng kết quả đó sẽ nhận giá trị NULL.

Câu A4: Ràng buộc CHECK (thoiluong > 0):
  - Ràng buộc này đảm bảo thời lượng phim luôn phải là một số dương hợp lệ, ngăn chặn việc nhập sai dữ liệu (như số âm hoặc bằng 0).
  - Đây là loại ràng buộc MIỀN GIÁ TRỊ (Domain Constraint) vì nó giới hạn các giá trị hợp lệ mà thuộc tính `thoiluong` có thể nhận.
*/


-- -------------------------------------------------------------
-- PHẦN II: ĐỊNH NGHĨA & CẬP NHẬT DỮ LIỆU — DDL & DML
-- -------------------------------------------------------------

-- Câu B1: Tạo bảng nhanvien
CREATE TABLE nhanvien (
    manv INT NOT NULL,
    hoten NVARCHAR(50) NOT NULL,
    ngaysinh DATE,
    chucvu NVARCHAR(30) DEFAULT N'Nhan vien',
    marap INT,
    CONSTRAINT PK_nhanvien PRIMARY KEY (manv),
    CONSTRAINT FK_nhanvien_rap FOREIGN KEY (marap) REFERENCES rap (marap)
        ON DELETE SET NULL ON UPDATE CASCADE
);
GO


-- Câu B2: Thêm ràng buộc kiểm tra ngày bán vé phải trước hoặc bằng ngày chiếu phim.
-- Trong SQL Server, ràng buộc CHECK trực tiếp không thể tham chiếu sang bảng khác (lichchieu).
-- Vì thế, cách chuẩn xác nhất là viết một hàm tự định nghĩa (UDF) để kiểm tra, sau đó áp dụng vào CHECK constraint.

CREATE FUNCTION dbo.fn_KiemTraNgayBanVe (
    @malich INT,
    @ngayban DATE
)
RETURNS INT
AS
BEGIN
    DECLARE @ngaychieu DATE;
    
    -- Lấy ngày chiếu từ bảng lichchieu
    SELECT @ngaychieu = ngaychieu 
    FROM lichchieu 
    WHERE malich = @malich;
    
    -- Kiểm tra điều kiện
    IF @ngayban <= @ngaychieu
        RETURN 1; -- Hợp lệ
        
    RETURN 0; -- Không hợp lệ
END;
GO

-- Áp dụng hàm vào ràng buộc CHECK trong bảng ve
ALTER TABLE ve
    ADD CONSTRAINT CK_ve_ngayban_truoc_ngaychieu 
    CHECK (dbo.fn_KiemTraNgayBanVe(malich, ngayban) = 1);
GO


-- Câu B3: Cập nhật tăng giá vé thêm 10% cho vé VIP của phim thể loại 'Khoa học viễn tưởng'
UPDATE ve
SET giaban = giaban * 1.1
FROM ve v
JOIN lichchieu lc ON v.malich = lc.malich
JOIN phim p ON lc.maphim = p.maphim
WHERE v.loaive = 'VIP' AND p.theloai = N'Khoa học viễn tưởng';
GO


-- Câu B4: Xóa các lịch chiếu trước ngày 2026-05-22 mà không bán được vé nào
DELETE FROM lichchieu
WHERE ngaychieu < '2026-05-22'
  AND malich NOT IN (
      SELECT DISTINCT malich 
      FROM ve
  );
GO


-- -------------------------------------------------------------
-- PHẦN III: TRUY VẤN DỮ LIỆU — SQL SELECT
-- -------------------------------------------------------------

-- =============================================================
-- A. Truy vấn Đơn giản
-- =============================================================

-- Câu C5: Danh sách các phim thể loại 'Hành động' hoặc 'Tình cảm' có thời lượng >= 120 phút
-- Cách 1: Sử dụng các điều kiện OR ghép với AND
SELECT maphim, tenphim, theloai, thoiluong
FROM phim
WHERE (theloai = N'Hành động' OR theloai = N'Tình cảm')
  AND thoiluong >= 120;

-- Cách 2: Sử dụng toán tử IN
SELECT maphim, tenphim, theloai, thoiluong
FROM phim
WHERE theloai IN (N'Hành động', N'Tình cảm')
  AND thoiluong >= 120;


-- Câu C6: Thông tin lịch chiếu có giá vé gốc từ 80k đến 110k, sắp xếp ngày chiếu tăng dần
SELECT lc.malich, p.tenphim, r.tenrap, lc.ngaychieu, lc.giave_goc
FROM lichchieu lc
JOIN phim p ON lc.maphim = p.maphim
JOIN rap r ON lc.marap = r.marap
WHERE lc.giave_goc BETWEEN 80000 AND 110000
ORDER BY lc.ngaychieu ASC;


-- Câu C7: Phim có tên bắt đầu bằng chữ 'L' hoặc sản xuất năm 2024
SELECT maphim, tenphim, theloai, thoiluong, daodien, namsx
FROM phim
WHERE tenphim LIKE N'L%' 
   OR namsx = 2024;


-- =============================================================
-- B. Gom nhóm và Kết ngoài
-- =============================================================

-- Câu C8: Với mỗi rạp, cho biết tổng số lịch chiếu (bao gồm cả rạp chưa có lịch chiếu nào)
SELECT r.marap, r.tenrap, COUNT(lc.malich) AS tong_so_lichchieu
FROM rap r
LEFT JOIN lichchieu lc ON r.marap = lc.marap
GROUP BY r.marap, r.tenrap;


-- Câu C9: Mã phim, tên phim và tổng doanh thu của từng bộ phim (sắp xếp doanh thu giảm dần)
SELECT p.maphim, p.tenphim, SUM(ISNULL(v.giaban, 0)) AS tong_doanhthu
FROM phim p
LEFT JOIN lichchieu lc ON p.maphim = lc.maphim
LEFT JOIN ve v ON lc.malich = v.malich
GROUP BY p.maphim, p.tenphim
ORDER BY tong_doanhthu DESC;


-- Câu C10: Những lịch chiếu đã bán được nhiều hơn 2 vé
SELECT lc.malich, p.tenphim, lc.ngaychieu, COUNT(v.mave) AS so_ve_da_ban
FROM lichchieu lc
JOIN phim p ON lc.maphim = p.maphim
JOIN ve v ON lc.malich = v.malich
GROUP BY lc.malich, p.tenphim, lc.ngaychieu
HAVING COUNT(v.mave) > 2;


-- Câu C11: Rạp chiếu có giá vé bán thực tế trung bình > 100k
SELECT r.marap, r.tenrap, r.succhua, AVG(v.giaban) AS gia_ban_trung_binh
FROM rap r
JOIN lichchieu lc ON r.marap = lc.marap
JOIN ve v ON lc.malich = v.malich
GROUP BY r.marap, r.tenrap, r.succhua
HAVING AVG(v.giaban) > 100000;


-- =============================================================
-- C. Truy vấn con & Phép toán tập hợp
-- =============================================================

-- Câu C12: Bộ phim có thời lượng dài nhất
-- Cách 1: Sử dụng truy vấn con với MAX()
SELECT maphim, tenphim, thoiluong
FROM phim
WHERE thoiluong = (SELECT MAX(thoiluong) FROM phim);

-- Cách 2: Sử dụng TOP 1 WITH TIES
SELECT TOP 1 WITH TIES maphim, tenphim, thoiluong
FROM phim
ORDER BY thoiluong DESC;


-- Câu C13: Lịch chiếu không bán được bất kỳ vé nào
-- Cách 1: Sử dụng LEFT JOIN và kiểm tra khóa chính của bảng bên phải IS NULL
SELECT lc.malich, p.tenphim, lc.ngaychieu
FROM lichchieu lc
JOIN phim p ON lc.maphim = p.maphim
LEFT JOIN ve v ON lc.malich = v.malich
WHERE v.mave IS NULL;

-- Cách 2: Sử dụng NOT EXISTS
SELECT lc.malich, p.tenphim, lc.ngaychieu
FROM lichchieu lc
JOIN phim p ON lc.maphim = p.maphim
WHERE NOT EXISTS (
    SELECT 1 
    FROM ve v 
    WHERE v.malich = lc.malich
);

-- Cách 3: Sử dụng NOT IN
SELECT lc.malich, p.tenphim, lc.ngaychieu
FROM lichchieu lc
JOIN phim p ON lc.maphim = p.maphim
WHERE lc.malich NOT IN (
    SELECT DISTINCT malich 
    FROM ve
);


-- Câu C14: Bộ phim có tổng số vé bán được nhiều nhất
-- Cách 1: Sử dụng CTE kết hợp với MAX() trong truy vấn con
WITH SoVeMoiPhim AS (
    SELECT lc.maphim, COUNT(v.mave) AS tong_ve
    FROM lichchieu lc
    JOIN ve v ON lc.malich = v.malich
    GROUP BY lc.maphim
)
SELECT p.maphim, p.tenphim, p.daodien, sv.tong_ve
FROM phim p
JOIN SoVeMoiPhim sv ON p.maphim = sv.maphim
WHERE sv.tong_ve = (SELECT MAX(tong_ve) FROM SoVeMoiPhim);

-- Cách 2: Sử dụng TOP 1 WITH TIES để lấy toàn bộ các phim đồng hạng nhất
SELECT TOP 1 WITH TIES p.maphim, p.tenphim, p.daodien, COUNT(v.mave) AS tong_ve
FROM phim p
JOIN lichchieu lc ON p.maphim = lc.maphim
JOIN ve v ON lc.malich = v.malich
GROUP BY p.maphim, p.tenphim, p.daodien
ORDER BY COUNT(v.mave) DESC;


-- Câu C15 (Phép chia): Phim được xếp lịch chiếu tại tất cả các rạp
-- Cách 1: Sử dụng NOT EXISTS lồng nhau (Đúng bản chất đại số quan hệ của phép chia)
-- Giải thích: Tìm bộ phim p sao cho không tồn tại một rạp r nào mà phim p không được chiếu ở rạp r đó.
SELECT p.maphim, p.tenphim
FROM phim p
WHERE NOT EXISTS (
    SELECT r.marap
    FROM rap r
    WHERE NOT EXISTS (
        SELECT 1
        FROM lichchieu lc
        WHERE lc.maphim = p.maphim 
          AND lc.marap = r.marap
    )
);

-- Cách 2: Gom nhóm và so sánh COUNT(DISTINCT) (Cách làm ngắn gọn, thông dụng trong SQL thực tế)
-- Giải thích: Gom nhóm lịch chiếu theo phim, đếm số lượng rạp duy nhất mà phim đó chiếu,
-- sau đó so sánh với tổng số lượng rạp có trong bảng rap.
SELECT p.maphim, p.tenphim
FROM phim p
JOIN lichchieu lc ON p.maphim = lc.maphim
GROUP BY p.maphim, p.tenphim
HAVING COUNT(DISTINCT lc.marap) = (SELECT COUNT(*) FROM rap);


-- Câu C16 (CTE / Gom nhóm phức tạp): Đạo diễn có từ 2 phim trở lên có thời lượng > 110 phút
WITH PhimDaiHon110 AS (
    SELECT maphim, tenphim, daodien
    FROM phim
    WHERE thoiluong > 110 
      AND daodien IS NOT NULL
)
SELECT daodien, COUNT(maphim) AS so_luong_phim
FROM PhimDaiHon110
GROUP BY daodien
HAVING COUNT(maphim) >= 2;
