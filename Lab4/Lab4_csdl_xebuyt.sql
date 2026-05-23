-- 13
USE csdl_xebuyt;
SELECT dv.tendonvi, COUNT(tb.matb) AS tong_tuyen
FROM dvvanhanh dv
LEFT JOIN tuyenbuyt tb ON dv.madv = tb.madv
GROUP BY dv.madv, dv.tendonvi
HAVING COUNT(tb.matb) < 2;

-- 14
USE csdl_xebuyt;
SELECT tb.matb, tb.tentuyen, tb.culy, COUNT(lt.matd) AS tong_tram_dung
FROM tuyenbuyt tb
LEFT JOIN lotrinh lt ON tb.matb = lt.matb
GROUP BY tb.matb, tb.tentuyen, tb.culy
HAVING COUNT(lt.matd) < 40;

-- 15
USE csdl_xebuyt;
SELECT td.matd, td.tentram, COUNT(DISTINCT lt.matb) AS tong_tuyen
FROM tramdung td
JOIN lotrinh lt ON td.matd = lt.matd
GROUP BY td.matd, td.tentram
HAVING COUNT(DISTINCT lt.matb) > 1;

-- 16
USE csdl_xebuyt;
SELECT td.matd, COUNT(DISTINCT lt.matb) AS tong_tuyen
FROM tramdung td
LEFT JOIN lotrinh lt ON td.matd = lt.matd
GROUP BY td.matd;

-- 17
USE csdl_xebuyt;
SELECT lt.matb, td.loai, COUNT(lt.matd) AS tong_tram
FROM lotrinh lt
JOIN tramdung td ON lt.matd = td.matd
GROUP BY lt.matb, td.loai;

-- 18
USE csdl_xebuyt;
SELECT tb.matb, COUNT(lt.matd) AS tong_tram_nha_cho
FROM tuyenbuyt tb
LEFT JOIN lotrinh lt ON tb.matb = lt.matb
LEFT JOIN tramdung td ON lt.matd = td.matd AND td.loai LIKE 'NHA CHO'
GROUP BY tb.matb;

-- 19
USE csdl_xebuyt;
SELECT matb, tentuyen, culy
FROM tuyenbuyt
WHERE culy = (SELECT MAX(culy) FROM tuyenbuyt);

-- 20
USE csdl_xebuyt;
WITH SoTuyenQuaTram AS (
    SELECT lt.matd, COUNT(DISTINCT lt.matb) AS so_tuyen
    FROM lotrinh lt
    GROUP BY lt.matd
)
SELECT td.matd, td.tentram, st.so_tuyen
FROM tramdung td
JOIN SoTuyenQuaTram st ON td.matd = st.matd
WHERE st.so_tuyen = (SELECT MAX(so_tuyen) FROM SoTuyenQuaTram);

-- 21
USE csdl_xebuyt;
WITH SoTramTuyen AS (
    SELECT lt.matb, COUNT(lt.matd) AS so_tram
    FROM lotrinh lt
    GROUP BY lt.matb
)
SELECT tb.matb, tb.tentuyen, st.so_tram
FROM tuyenbuyt tb
JOIN SoTramTuyen st ON tb.matb = st.matb
WHERE st.so_tram = (SELECT MAX(so_tram) FROM SoTramTuyen);

-- 22
USE csdl_xebuyt;
WITH SoTuyenDV AS (
    SELECT madv, COUNT(matb) AS so_tuyen
    FROM tuyenbuyt
    GROUP BY madv
)
SELECT dv.madv, dv.tendonvi, sd.so_tuyen
FROM dvvanhanh dv
JOIN SoTuyenDV sd ON dv.madv = sd.madv
WHERE sd.so_tuyen = (SELECT MAX(so_tuyen) FROM SoTuyenDV);

-- 23
USE csdl_xebuyt;
SELECT tb.matb, tb.tentuyen
FROM tuyenbuyt tb
WHERE EXISTS (
    SELECT 1
    FROM lotrinh lt
    JOIN tramdung td ON lt.matd = td.matd
    WHERE lt.matb = tb.matb AND td.tentram LIKE '%TDH XE BUYT SAI GON%'
) AND EXISTS (
    SELECT 1
    FROM lotrinh lt
    JOIN tramdung td ON lt.matd = td.matd
    WHERE lt.matb = tb.matb AND td.tentram LIKE '%CONG VIEN 30/4%'
);

-- 24
USE csdl_xebuyt;
SELECT tb.matb, tb.tentuyen
FROM tuyenbuyt tb
JOIN lotrinh lt ON tb.matb = lt.matb
WHERE lt.matd IN (31, 35, 81)
GROUP BY tb.matb, tb.tentuyen
HAVING COUNT(DISTINCT lt.matd) = 3;
