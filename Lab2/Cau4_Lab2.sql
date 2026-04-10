-- 1. Sua han su dung GPLX so '799876543210' thanh ngay 05/07/2031
USE csdl_taxi

UPDATE LAIXE
SET HanGP = '2031-07-05'
WHERE SoGP = '799876543210';

-- 2. Xoa ca lam viec cua lai xe co ma so 2
DELETE FROM CALAMVIEC
WHERE MaLX = 2;

-- 3. Cap nhat doi truong: cong nhan ma so 138 lam doi truong doi thi cong so 2
USE csdl_doithicong;

UPDATE DOITHICONG
SET DoiTruong = 138
WHERE MaDoi = 2;

-- 4. Xoa cac ngay cham cong trong thang 4/2024
DELETE FROM CHAMCONG
WHERE NgayLamViec >= '2024-04-01'
  AND NgayLamViec < '2024-05-01';
