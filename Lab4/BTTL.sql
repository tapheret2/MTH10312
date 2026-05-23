-- 18
USE csdl_congty;
SELECT nv.honv + ' ' + ISNULL(nv.dem + ' ', '') + nv.tennv AS ho_ten,
       nv.mapb,
       tg.mada
FROM nhanvien nv
LEFT JOIN thamgia tg ON nv.manv = tg.manv
ORDER BY nv.mapb ASC, nv.honv ASC, nv.tennv ASC;

-- 19
USE csdl_congty;
SELECT COUNT(nv.manv) AS tong_nv,
       MAX(nv.luong) AS luong_max,
       MIN(nv.luong) AS luong_min,
       AVG(nv.luong) AS luong_tb
FROM nhanvien nv
JOIN phongban pb ON nv.mapb = pb.mapb
WHERE pb.tenpb = 'Nghien cuu';

-- 20
USE csdl_congty;
SELECT pb.mapb, COUNT(nv.manv) AS tong_nv
FROM phongban pb
LEFT JOIN nhanvien nv ON pb.mapb = nv.mapb
GROUP BY pb.mapb;

-- 21
USE csdl_congty;
SELECT pb.mapb, AVG(nv.luong) AS luong_tb
FROM phongban pb
LEFT JOIN nhanvien nv ON pb.mapb = nv.mapb
GROUP BY pb.mapb;

-- 22
USE csdl_congty;
SELECT da.mada, da.tenda, COUNT(tg.manv) AS tong_nv
FROM duan da
JOIN thamgia tg ON da.mada = tg.mada
GROUP BY da.mada, da.tenda;

-- 23
USE csdl_congty;
SELECT da.mada, da.tenda, COUNT(tg.manv) AS tong_nv
FROM duan da
JOIN thamgia tg ON da.mada = tg.mada
GROUP BY da.mada, da.tenda
HAVING COUNT(tg.manv) > 2;

-- 24
USE csdl_congty;
SELECT pb.mapb, pb.tenpb, COUNT(nv.manv) AS tong_nv
FROM phongban pb
JOIN nhanvien nv ON pb.mapb = nv.mapb
GROUP BY pb.mapb, pb.tenpb
HAVING COUNT(nv.manv) > 5;

-- 25
USE csdl_congty;
SELECT da.mada, da.tenda, COUNT(tg.manv) AS tong_nv
FROM duan da
LEFT JOIN thamgia tg ON da.mada = tg.mada
GROUP BY da.mada, da.tenda;

-- 26
USE csdl_congty;
SELECT da.mada, da.tenda, COUNT(CASE WHEN nv.mapb = 5 THEN tg.manv END) AS tong_nv_p5
FROM duan da
LEFT JOIN thamgia tg ON da.mada = tg.mada
LEFT JOIN nhanvien nv ON tg.manv = nv.manv
GROUP BY da.mada, da.tenda;

-- 27
USE csdl_congty;
SELECT nv.honv + ' ' + ISNULL(nv.dem + ' ', '') + nv.tennv AS ho_ten,
       COUNT(tn.tentn) AS tong_nguoi_than
FROM nhanvien nv
LEFT JOIN thannhan tn ON nv.manv = tn.manv
GROUP BY nv.manv, nv.honv, nv.dem, nv.tennv;

-- 28
USE csdl_congty;
SELECT pb.tenpb, COUNT(nv.manv) AS tong_nv
FROM phongban pb
JOIN nhanvien nv ON pb.mapb = nv.mapb
GROUP BY pb.mapb, pb.tenpb
HAVING AVG(nv.luong) > 30000;

-- 29
USE csdl_congty;
SELECT da.tenda
FROM duan da
WHERE da.mada IN (
    SELECT tg.mada
    FROM thamgia tg
    JOIN nhanvien nv ON tg.manv = nv.manv
    WHERE nv.honv = 'Nguyen'
) OR da.mapb IN (
    SELECT pb.mapb
    FROM phongban pb
    JOIN nhanvien nv ON pb.maql = nv.manv
    WHERE nv.honv = 'Nguyen'
);

-- 30
USE csdl_congty;
SELECT pb.tenpb, COUNT(CASE WHEN nv.gioitinh IN ('F', 'f') THEN nv.manv END) AS tong_nv_nu
FROM phongban pb
JOIN nhanvien nv ON pb.mapb = nv.mapb
GROUP BY pb.mapb, pb.tenpb
HAVING AVG(nv.luong) > 30000;

-- 31
USE csdl_congty;
SELECT nv.honv + ' ' + ISNULL(nv.dem + ' ', '') + nv.tennv AS ho_ten
FROM nhanvien nv
WHERE nv.manv IN (
    SELECT tn.manv
    FROM thannhan tn
    GROUP BY tn.manv
    HAVING COUNT(tn.tentn) > 2
);

-- 32
USE csdl_congty;
SELECT nv.honv + ' ' + ISNULL(nv.dem + ' ', '') + nv.tennv AS ho_ten
FROM nhanvien nv
WHERE NOT EXISTS (
    SELECT 1
    FROM thannhan tn
    WHERE tn.manv = nv.manv
);

-- 33
USE csdl_congty;
SELECT nv.honv + ' ' + ISNULL(nv.dem + ' ', '') + nv.tennv AS ho_ten
FROM nhanvien nv
WHERE nv.manv IN (SELECT maql FROM phongban)
  AND EXISTS (
      SELECT 1
      FROM thannhan tn
      WHERE tn.manv = nv.manv
  );

-- 34
USE csdl_congty;
SELECT nv.honv + ' ' + ISNULL(nv.dem + ' ', '') + nv.tennv AS ho_ten
FROM nhanvien nv
WHERE nv.luong > (
    SELECT AVG(nv2.luong)
    FROM nhanvien nv2
    JOIN phongban pb ON nv2.mapb = pb.mapb
    WHERE pb.tenpb = 'Nghien cuu'
);

-- 35
USE csdl_congty;
SELECT TOP 1 WITH TIES pb.tenpb, nv.honv + ' ' + ISNULL(nv.dem + ' ', '') + nv.tennv AS ho_ten_tp
FROM phongban pb
JOIN nhanvien nv ON pb.maql = nv.manv
JOIN nhanvien nv_mem ON pb.mapb = nv_mem.mapb
GROUP BY pb.mapb, pb.tenpb, nv.honv, nv.dem, nv.tennv
ORDER BY COUNT(nv_mem.manv) DESC;

-- 36
USE csdl_congty;
SELECT DISTINCT nv.honv + ' ' + ISNULL(nv.dem + ' ', '') + nv.tennv AS ho_ten, nv.diachi
FROM nhanvien nv
JOIN thamgia tg ON nv.manv = tg.manv
JOIN duan da ON tg.mada = da.mada
WHERE da.diadiem = 'Phu Nhuan'
  AND nv.mapb NOT IN (
      SELECT tsp.mapb
      FROM truso_phong tsp
      WHERE tsp.truso = 'Phu Nhuan'
  );

-- 37
USE csdl_congty;
SELECT nv.honv + ' ' + ISNULL(nv.dem + ' ', '') + nv.tennv AS ho_ten
FROM nhanvien nv
WHERE NOT EXISTS (
    SELECT da.mada
    FROM duan da
    WHERE NOT EXISTS (
        SELECT 1
        FROM thamgia tg
        WHERE tg.manv = nv.manv AND tg.mada = da.mada
    )
);

-- 38
USE csdl_congty;
SELECT nv.honv + ' ' + ISNULL(nv.dem + ' ', '') + nv.tennv AS ho_ten
FROM nhanvien nv
WHERE NOT EXISTS (
    SELECT da.mada
    FROM duan da
    WHERE da.mapb = 5
      AND NOT EXISTS (
          SELECT 1
          FROM thamgia tg
          WHERE tg.manv = nv.manv AND tg.mada = da.mada
      )
);
