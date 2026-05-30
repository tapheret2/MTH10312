/* Phần 1
Câu A1: 
- WHERE: Dùng để lọc các dòng dữ liệu (records) TRƯỚC khi thực hiện việc gom nhóm (GROUP BY).
- HAVING: Dùng để lọc các nhóm (groups) SAU khi thực hiện gom nhóm (GROUP BY).
Câu A2: 
- Khóa ngoại KHÔNG bắt buộc NOT NULL
- Có thể nhận giá trị NULL nếu mối kết hợp đó là tùy chọn (optional)
Câu A3: 
- Tất cả các dòng của bảng bên trái (bảng A) sẽ được giữ lại trong kết quả.
- Đối với các dòng trong bảng A không có dòng nào khớp ở bảng B (bảng bên phải) thông qua điều kiện kết,
    thì tất cả các cột tương ứng của bảng B trên dòng kết quả đó sẽ nhận giá trị NULL.
Câu A4: 
- Ràng buộc này đảm bảo thời lượng phim luôn phải là một số dương hợp lệ, ngăn chặn việc nhập sai dữ liệu (như số âm hoặc bằng 0).
- Đây là loại ràng buộc MIỀN GIÁ TRỊ (Domain Constraint) vì nó giới hạn các giá trị hợp lệ mà thuộc tính `thoiluong` có thể nhận.
*/

-- Phần 2
USE csdl_cinema;
GO

-- B1
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

-- B2
CREATE FUNCTION dbo.fn_KiemTraNgayBanVe (
    @malich INT,
    @ngayban DATE
)
RETURNS INT
AS
BEGIN
    DECLARE @ngaychieu DATE;
    SELECT @ngaychieu = ngaychieu FROM lichchieu WHERE malich = @malich;
    
    IF @ngayban <= @ngaychieu
        RETURN 1;
    RETURN 0;
END;
GO

USE csdl_cinema;
ALTER TABLE ve
ADD CONSTRAINT CK_ve_ngayban CHECK (dbo.fn_KiemTraNgayBanVe(malich, ngayban) = 1);
GO
-- B3
USE csdl_cinema;
GO

UPDATE ve
SET giaban = giaban * 1.1
FROM ve v
JOIN lichchieu lc ON v.malich = lc.malich
JOIN phim p ON lc.maphim = p.maphim
WHERE v.loaive = 'VIP' AND p.theloai = N'Khoa học viễn tưởng';
GO
--B4 
DELETE FROM lichchieu
WHERE ngaychieu < '2026-05-22'
  AND malich NOT IN (
      SELECT DISTINCT malich 
      FROM ve
  );
GO
-- Phần 3
-- A
-- C5
USE csdl_cinema;
GO
SELECT maphim,tenphim,theloai,thoiluong
FROM phim 
WHERE (theloai=N'Hành động' OR theloai LIKE N'Tình cảm') AND thoiluong>=120;
-- C6
USE csdl_cinema;
GO
SELECT lc.malich,p.tenphim,r.tenrap,lc.ngaychieu
FROM lichchieu AS lc
JOIN phim AS p ON lc.maphim=p.maphim
JOIN rap AS r ON lc.marap=r.marap
WHERE giave_goc BETWEEN 80000 AND 110000
ORDER BY lc.ngaychieu
-- C7
USE csdl_cinema;
GO
SELECT *
FROM phim
WHERE tenphim LIKE 'L%' OR namsx = 2024;
GO
-- B
-- C8
USE csdl_cinema;
GO
SELECT r.marap, r.tenrap, COUNT(lc.malich) AS tong_so_lichchieu
FROM rap r
LEFT JOIN lichchieu lc ON r.marap = lc.marap
GROUP BY r.marap, r.tenrap;
GO