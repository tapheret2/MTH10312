-- Ma so: 24280006
-- Ho ten: Nguyen Lan Anh
-- RDBMS: PostgreSQL
SET search_path TO csdl_quanlykho;
-- Cau 1
SELECT ma_san_pham,
    ten_san_pham,
    don_gia,
    tong_so_luong
FROM csdl_quanlykho.SAN_PHAM
WHERE don_gia > 100
    AND tong_so_luong < 50;
-- Cau 2
SELECT d.ma_don_nhap,
    d.ngay_dat_hang,
    d.tong_tien,
    n.ten_nha_cung_cap
FROM csdl_quanlykho.DON_NHAP_HANG d
    JOIN csdl_quanlykho.NHA_CUNG_CAP n ON d.ma_nha_cung_cap = n.ma_nha_cung_cap
WHERE d.trang_thai = 'R'
    AND d.ma_kho = 'WH002';
-- Cau 3
SELECT sp.ma_san_pham,
    sp.ten_san_pham,
    tk.so_luong
FROM csdl_quanlykho.SAN_PHAM sp
    JOIN csdl_quanlykho.DANH_MUC dm ON sp.ma_danh_muc = dm.ma_danh_muc
    JOIN csdl_quanlykho.TON_KHO tk ON sp.ma_san_pham = tk.ma_san_pham
WHERE dm.ten_danh_muc = 'Thuc pham'
    AND tk.ma_kho = 'WH003'
    AND tk.so_luong > 100;
-- Cau 4
SELECT d.ma_don_nhap,
    d.ngay_dat_hang,
    d.tong_tien,
    n.ten_nha_cung_cap
FROM csdl_quanlykho.DON_NHAP_HANG d
    JOIN csdl_quanlykho.NHA_CUNG_CAP n ON d.ma_nha_cung_cap = n.ma_nha_cung_cap
WHERE d.ngay_dat_hang BETWEEN '2025-05-01' AND '2025-05-31'
    AND d.tong_tien > 2000
    AND d.trang_thai = 'P'
ORDER BY d.tong_tien DESC;
-- Cau 5
SELECT ct.ma_don_nhap,
    sp.ten_san_pham,
    d.ma_kho,
    ct.so_luong
FROM csdl_quanlykho.CHI_TIET_DON_NHAP ct
    JOIN csdl_quanlykho.DON_NHAP_HANG d ON ct.ma_don_nhap = d.ma_don_nhap
    JOIN csdl_quanlykho.SAN_PHAM sp ON ct.ma_san_pham = sp.ma_san_pham
WHERE ct.so_luong > 100
    AND d.trang_thai = 'R'
    AND d.ngay_dat_hang BETWEEN '2025-05-01' AND '2025-05-31'
    AND sp.ma_danh_muc = 'CAT003'
ORDER BY d.ma_kho ASC,
    ct.so_luong DESC;
-- Cau 6
SELECT n.ma_nha_cung_cap,
    n.ten_nha_cung_cap,
    SUM(d.tong_tien) AS tong_so_tien
FROM csdl_quanlykho.NHA_CUNG_CAP n
    JOIN csdl_quanlykho.DON_NHAP_HANG d ON n.ma_nha_cung_cap = d.ma_nha_cung_cap
WHERE d.trang_thai = 'R'
    AND d.ngay_dat_hang BETWEEN '2025-05-01' AND '2025-05-31'
GROUP BY n.ma_nha_cung_cap,
    n.ten_nha_cung_cap;
-- Cau 7
SELECT sp.ma_san_pham,
    sp.ten_san_pham,
    SUM(ct.so_luong) AS tong_so_luong
FROM csdl_quanlykho.SAN_PHAM sp
    JOIN csdl_quanlykho.CHI_TIET_DON_NHAP ct ON sp.ma_san_pham = ct.ma_san_pham
    JOIN csdl_quanlykho.DON_NHAP_HANG d ON ct.ma_don_nhap = d.ma_don_nhap
WHERE d.trang_thai = 'P'
    AND d.ngay_dat_hang BETWEEN '2025-05-01' AND '2025-05-31'
GROUP BY sp.ma_san_pham,
    sp.ten_san_pham
HAVING SUM(ct.so_luong * ct.don_gia_nhap) > 2000;
-- Cau 8
SELECT n.ma_nha_cung_cap,
    n.ten_nha_cung_cap,
    COUNT(d.ma_don_nhap) AS tong_don_hang,
    SUM(d.tong_tien) AS tong_tien
FROM csdl_quanlykho.NHA_CUNG_CAP n
    JOIN csdl_quanlykho.DON_NHAP_HANG d ON n.ma_nha_cung_cap = d.ma_nha_cung_cap
WHERE d.trang_thai = 'R'
    AND d.ngay_dat_hang BETWEEN '2025-05-01' AND '2025-05-31'
GROUP BY n.ma_nha_cung_cap,
    n.ten_nha_cung_cap;
-- Cau 9
SELECT gd.ma_kho,
    k.ten_kho,
    SUM(gd.so_luong) AS tong_sl_nhap
FROM csdl_quanlykho.GIAO_DICH_KHO gd
    JOIN csdl_quanlykho.KHO k ON gd.ma_kho = k.ma_kho
WHERE gd.loai_giao_dich = 'I'
GROUP BY gd.ma_kho,
    k.ten_kho
HAVING SUM(gd.so_luong) > (
        SELECT AVG(sp.tong_so_luong)
        FROM csdl_quanlykho.SAN_PHAM sp
        WHERE sp.ma_danh_muc = 'CAT003'
    );
-- Cau 10
SELECT dm.ma_danh_muc,
    dm.ten_danh_muc,
    SUM(ct.so_luong * ct.don_gia_nhap) AS tong_gia_tri
FROM csdl_quanlykho.DANH_MUC dm
    JOIN csdl_quanlykho.SAN_PHAM sp ON dm.ma_danh_muc = sp.ma_danh_muc
    JOIN csdl_quanlykho.CHI_TIET_DON_NHAP ct ON sp.ma_san_pham = ct.ma_san_pham
    JOIN csdl_quanlykho.DON_NHAP_HANG d ON ct.ma_don_nhap = d.ma_don_nhap
WHERE d.trang_thai = 'R'
    AND d.ngay_dat_hang BETWEEN '2025-05-01' AND '2025-05-31'
GROUP BY dm.ma_danh_muc,
    dm.ten_danh_muc
HAVING SUM(ct.so_luong * ct.don_gia_nhap) > (
        SELECT AVG(tgt)
        FROM (
                SELECT SUM(ct2.so_luong * ct2.don_gia_nhap) AS tgt
                FROM csdl_quanlykho.CHI_TIET_DON_NHAP ct2
                    JOIN csdl_quanlykho.DON_NHAP_HANG d2 ON ct2.ma_don_nhap = d2.ma_don_nhap
                    JOIN csdl_quanlykho.SAN_PHAM sp2 ON ct2.ma_san_pham = sp2.ma_san_pham
                WHERE d2.trang_thai = 'R'
                    AND d2.ngay_dat_hang BETWEEN '2025-05-01' AND '2025-05-31'
                GROUP BY sp2.ma_danh_muc
            ) AS tb
    );