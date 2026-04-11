-- 1
USE csdl_congty
SELECT MaNV, HoNV, TenNV , NgaySinh
FROM NHANVIEN
WHERE MaPB=4

--2
USE csdl_congty
SELECT MaNv, HoNV, TenNV, NgaySinh
FROM NHANVIEN
WHERE Luong>30000

--3
USE csdl_congty
SELECT MaNv, HoNV, TenNV, NgaySinh
FROM NHANVIEN
WHERE (Luong>25000 AND MaPB=4) OR (Luong>30000 AND MaPB=5)

--4
USE csdl_congty
SELECT HoNV, TenNV, NgaySinh, DiaChi
FROM NHANVIEN
WHERE DiaChi LIKE '%TpHCM'

--5
USE csdl_congty
SELECT NgaySinh, DiaChi
FROM NHANVIEN
WHERE HoNV LIKE '%Nguyen%' AND Dem LIKE '%Bao%' AND TenNV LIKE '%Hung%'

--6
USE csdl_congty
SELECT MaNV,HoNV, TenNV, NgaySinh, DiaChi
FROM NHANVIEN
WHERE DiaChi LIKE '%QPN%'

--7
USE csdl_congty
SELECT MaNV,HoNV, TenNV, NgaySinh, DiaChi
FROM NHANVIEN
WHERE YEAR(NgaySinh)>=1950 AND YEAR(NgaySinh)<1960

--8
USE csdl_congty
SELECT DISTINCT Luong
FROM NHANVIEN

--9
USE csdl_congty
SELECT MaNV,HoNV, TenNV, NgaySinh, DiaChi
FROM NHANVIEN
WHERE MaGS IS NULL

--10
USE csdl_congty;
SELECT p.TenPB, t.TruSo
FROM PHONGBAN AS p
INNER JOIN TRUSO_PHONG AS t
    ON p.MaPB = t.MaPB
ORDER BY MaPB 

--11
USE csdl_congty;
SELECT p.TenPB, n.TenNV as TenTruongPhong
FROM PHONGBAN AS p
INNER JOIN NHANVIEN AS n
    ON p.MaQL = n.MaNV

--12
USE csdl_congty;
SELECT 
    n.HoNV + ' ' + n.TenNV AS HoTenNhanVien,
    t.TenTN AS TenThanNhan,
    t.QuanHe,
    t.GioiTinh AS GioiTinhThanNhan
FROM NHANVIEN AS n
INNER JOIN THANNHAN AS t ON n.MaNV = t.MaNV
WHERE n.GioiTinh = 'F'
ORDER BY n.HoNV, n.TenNV, t.QuanHe, t.TenTN;

--13
USE csdl_congty;
SELECT n.HoNV + ' ' + ISNULL(n.Dem + ' ', '') + n.TenNV AS HoTen, n.DiaChi
FROM NHANVIEN AS n
INNER JOIN PHONGBAN AS p ON n.MaPB = p.MaPB
WHERE p.TenPB = 'Nghien cuu'

--14
USE csdl_congty;
SELECT 
    d.MaDA,
    p.TenPB AS TenPhongDieuPhoi,
    n.HoNV + ' ' + ISNULL(n.Dem + ' ', '') + n.TenNV AS HoTenTruongPhong,
    n.DiaChi,
    n.NgaySinh
FROM DUAN AS d
INNER JOIN PHONGBAN AS p ON d.MaPB = p.MaPB
INNER JOIN NHANVIEN AS n ON p.MaQL = n.MaNV
WHERE d.DiaDiem = 'Go Vap'

--15
USE csdl_congty;
SELECT 
    nv.HoNV + ' ' + ISNULL(nv.Dem + ' ', '') + nv.TenNV AS HoTenNhanVien,
    gs.HoNV + ' ' + ISNULL(gs.Dem + ' ', '') + gs.TenNV AS HoTenNguoiGiamSat
FROM NHANVIEN AS nv
LEFT JOIN NHANVIEN AS gs ON nv.MaGS = gs.MaNV

--16
USE csdl_congty;
SELECT 
    n.HoNV + ' ' + ISNULL(n.Dem + ' ', '') + n.TenNV AS HoTen,
    n.Luong AS LuongCu,
    n.Luong * 1.1 AS LuongMoi
FROM NHANVIEN AS n
INNER JOIN THAMGIA AS tg ON n.MaNV = tg.MaNV
INNER JOIN DUAN AS d ON tg.MaDA = d.MaDA
WHERE d.TenDA = 'San pham X'

--17
USE csdl_congty;
SELECT n.HoNV + ' ' + ISNULL(n.Dem + ' ', '') + n.TenNV AS HoTen
FROM NHANVIEN AS n
INNER JOIN THANNHAN AS t ON n.MaNV = t.MaNV
WHERE t.TenTN = n.TenNV AND t.GioiTinh = n.GioiTinh
