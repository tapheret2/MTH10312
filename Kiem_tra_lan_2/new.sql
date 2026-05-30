-- Ma so: 24280018
-- Ho ten: Pham Tien Phat
-- RDBMS: SQL Server

-- Cau 1 
USE csdl_quanlykho;
GO
SELECT ma_san_pham,ten_san_pham,don_gia,tong_so_luong
FROM SAN_PHAM
WHERE don_gia>100 AND tong_so_luong<50;
GO

-- Cau 2
USE csdl_quanlykho;
GO
SELECT d.ma_don_nhap,d.ngay_dat_hang,d.tong_tien,n.ten_nha_cung_cap
FROM DON_NHAP_HANG AS d
JOIN NHA_CUNG_CAP AS n ON d.ma_nha_cung_cap=n.ma_nha_cung_cap
WHERE d.trang_thai IN ('R','r') AND d.ma_kho='WH002';
GO

-- Cau 3
USE csdl_quanlykho;
GO
SELECT s.ma_san_pham,s.ten_san_pham,t.so_luong
FROM SAN_PHAM AS s
JOIN DANH_MUC AS d ON s.ma_danh_muc=d.ma_danh_muc
JOIN TON_KHO AS t ON s.ma_san_pham=t.ma_san_pham
WHERE d.ten_danh_muc='Thuc pham' AND t.ma_kho='WH003' AND t.so_luong>100;
GO

-- Cau 4
USE csdl_quanlykho;
GO
SELECT d.ma_don_nhap,d.ngay_dat_hang,d.tong_tien,n.ten_nha_cung_cap
FROM DON_NHAP_HANG AS d
JOIN NHA_CUNG_CAP AS n ON d.ma_nha_cung_cap=n.ma_nha_cung_cap
WHERE d.ngay_dat_hang BETWEEN '2025-05-01' AND '2025-05-31'
  AND d.tong_tien>2000
  AND d.trang_thai IN ('P','p')
ORDER BY d.tong_tien DESC;
GO

-- Cau 5
USE csdl_quanlykho;
GO
SELECT c.ma_don_nhap,s.ten_san_pham,d.ma_kho,c.so_luong
FROM CHI_TIET_DON_NHAP AS c
JOIN DON_NHAP_HANG AS d ON c.ma_don_nhap=d.ma_don_nhap
JOIN SAN_PHAM AS s ON c.ma_san_pham=s.ma_san_pham
WHERE c.so_luong>100
  AND d.trang_thai IN ('R','r')
  AND d.ngay_dat_hang BETWEEN '2025-05-01' AND '2025-05-31'
  AND s.ma_danh_muc='CAT003'
ORDER BY d.ma_kho ASC,c.so_luong DESC;
GO

-- Cau 6
USE csdl_quanlykho;
GO
SELECT n.ma_nha_cung_cap,n.ten_nha_cung_cap,SUM(d.tong_tien) AS tong_tien
FROM NHA_CUNG_CAP AS n
LEFT JOIN DON_NHAP_HANG AS d ON n.ma_nha_cung_cap=d.ma_nha_cung_cap AND d.trang_thai IN ('R','r') AND d.ngay_dat_hang BETWEEN '2025-05-01' AND '2025-05-31'
GROUP BY n.ma_nha_cung_cap,n.ten_nha_cung_cap;
GO

-- Cau 7
USE csdl_quanlykho;
GO
SELECT s.ma_san_pham,s.ten_san_pham,SUM(c.so_luong) AS tong_so_luong
FROM SAN_PHAM AS s
JOIN CHI_TIET_DON_NHAP AS c ON s.ma_san_pham=c.ma_san_pham
JOIN DON_NHAP_HANG AS d ON c.ma_don_nhap=d.ma_don_nhap
WHERE d.trang_thai IN ('P','p') AND d.ngay_dat_hang BETWEEN '2025-05-01' AND '2025-05-31'
GROUP BY s.ma_san_pham,s.ten_san_pham
HAVING SUM(c.so_luong * c.don_gia_nhap)>2000;
GO

-- Cau 8
USE csdl_quanlykho;
GO
SELECT n.ma_nha_cung_cap,n.ten_nha_cung_cap,COUNT(d.ma_don_nhap) AS tong_don_hang,SUM(ISNULL(d.tong_tien,0)) AS tong_tien
FROM NHA_CUNG_CAP AS n
LEFT JOIN DON_NHAP_HANG AS d ON n.ma_nha_cung_cap=d.ma_nha_cung_cap AND d.trang_thai IN ('R','r') AND d.ngay_dat_hang BETWEEN '2025-05-01' AND '2025-05-31'
GROUP BY n.ma_nha_cung_cap,n.ten_nha_cung_cap;
GO

--Cau 9
USE csdl_quanlykho;
GO
SELECT k.ma_kho,k.ten_kho,SUM(c.so_luong) AS tong_so_luong
FROM KHO AS k
JOIN DON_NHAP_HANG AS d ON k.ma_kho=d.ma_kho
JOIN CHI_TIET_DON_NHAP AS c ON d.ma_don_nhap=c.ma_don_nhap
WHERE d.trang_thai IN ('R','r')
GROUP BY k.ma_kho,k.ten_kho

