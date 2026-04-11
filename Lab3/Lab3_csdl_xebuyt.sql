--1. Cho biết mã số tuyến, tên tuyến, cự ly, tên đơn vị vận hành của các tuyến xe buýt có cự ly lớn hơn 20,000m.
USE csdl_xebuyt;
SELECT tb.MaTB,tb.TenTuyen,tb.CuLy,dv.TenDonVi
FROM TUYENBUYT AS tb
INNER JOIN DVVANHANH AS dv
    ON tb.MaDV=dv.MaDV
--2. Với mỗi trạm dừng ở đường Hàm Nghi, Quận 1, cho biết mã số trạm, tên trạm và mã số các tuyến xe buýt có lộ trình qua trạm đó. (Lưu ý dữ liệu sử dụng tiếng Việt không dấu).
USE csdl_xebuyt;
SELECT td.MaTD,td.TenTram,lt.MaTB
FROM TRAMDUNG as td
INNER JOIN LOTRINH as lt
    ON td.MaTD = lt.MaTD
WHERE td.DiaDiem LIKE '%HAM NGHI, QUAN 1%'
--3. Cho biết mã số trạm, tên trạm, loại của các trạm dừng ở Quận 12 thuộc lộ trình của các tuyến xe buýt số 3. (Lưu ý dữ liệu sử dụng tiếng Việt không dấu).

--4. Cho biết mã số trạm, tên trạm, loại của các trạm dừng khởi hành của các tuyến xe buýt.

--5. Cho biết tên mã số tuyến, tên tuyến của các tuyến xe buýt có lộ trình đi qua trạm dừng có tên là Chợ Cũ ở Quận 1. (Lưu ý dữ liệu sử dụng tiếng Việt không dấu).

--6. Cho biết tên đơn vị vận hành có tuyến xe buýt có lộ trình đi qua trạm dừng có mã số 53.

--7. Với các tuyến buýt có số chuyến trong ngày nhỏ hơn 250, cho biết mã số, tên tuyến, cự ly và tên trạm dừng khởi hành.

--8. Cho biết mã số tuyến, tên tuyến của các tuyến xe buýt có lộ trình đi qua trạm dừng là bến xe trên đường Phạm Ngũ Lão ở Quận 1. (Lưu ý dữ liệu sử dụng tiếng Việt không dấu).

--9. Với các tuyến xe buýt do đơn vị HTX Vận tải 19/5 vận hành, cho biết mã số tuyến, tên tuyến, cự ly và lộ trình (số thứ tự trạm dừng, tên trạm, địa điểm). Sắp xếp theo mã số tuyến và số thứ tự trạm. (Lưu ý dữ liệu sử dụng tiếng Việt không dấu).

--10. Cho biết mã số tuyến, tên tuyến của các tuyến xe buýt có lộ trình đi qua trạm dừng có tên là Đền Thờ Ấn Giáo, Pastuer. Sắp xếp kết quả theo mã số tuyến. (Lưu ý dữ liệu sử dụng tiếng Việt không dấu).

--11. Với các trạm dừng ở Quận 1, cho biết mã số trạm, tên trạm, địa điểm, và mã số các tuyến xe buýt có lộ trình đi qua trạm đó. Sắp xếp theo tên trạm và mã số tuyến. (Lưu ý dữ liệu sử dụng tiếng Việt không dấu).

--12. Với mỗi đơn vị vận hành cho biết tên đơn vị và mã số tuyến, cự ly của các tuyến xe buýt có lộ trình đi qua trạm dừng số 36 mà đơn vị đó đảm nhận. Sắp xếp theo tên đơn vị vận hành và mã số tuyến.