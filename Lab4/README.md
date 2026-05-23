# Lab 04 — Lệnh SQL: Truy vấn Phức tạp

## I. Nội dung thực hành

- Lệnh truy vấn phức tạp (Gom nhóm có điều kiện, Truy vấn con, ...)
- Thao tác kết ngoài (`LEFT/RIGHT/FULL JOIN`)
- Biểu thức bảng chung (`CTE` — Common Table Expression)

---

## II. Bài tập ở lớp (không yêu cầu nộp bài)

Viết và thực thi các lệnh truy vấn cho các câu hỏi từ **18 đến 38** trong tập tin **"Cơ sở dữ liệu - Dự án công ty-3-2-1-2-2-1.pdf"** trên cơ sở dữ liệu `csdl_congty`.

> File bài làm: `BTTL.sql`

---

## III. Bài tập về nhà (nộp lên Sakai)

Cho lược đồ CSDL **Xe buýt** trong tập tin **"Cơ sở dữ liệu - Xe buýt - Lược đồ-1-2-2-1.pdf"** và tập tin lệnh tạo CSDL **"Scripts csdl_xebuyt _sqlserver_-1-2-2-1.sql"**. Viết các lệnh truy vấn `SELECT` thực hiện các câu hỏi dưới đây:

13. Với các đơn vị vận hành có tổng số tuyến xe buýt mà đơn vị đảm nhận nhỏ hơn 2, cho biết tên đơn vị và tổng số tuyến xe buýt tương ứng.
14. Với các tuyến xe buýt có lộ trình có số trạm dừng nhỏ hơn 40, cho biết mã số, tên tuyến, cự ly và tổng số trạm dừng tương ứng.
15. Với các trạm dừng có nhiều hơn 1 tuyến xe buýt có lộ trình đi qua, cho biết mã số, tên trạm và tổng số tuyến xe buýt có lộ trình đi qua trạm.
16. Với mỗi trạm dừng, cho biết mã số trạm và tổng số tuyến buýt có lộ trình đi qua trạm đó.
17. Với mỗi lộ trình, cho biết mã số tuyến, loại trạm dừng và tổng số trạm dừng thuộc loại đó.
18. Với mỗi lộ trình, cho biết mã số tuyến và tổng số trạm dừng thuộc loại Nhà chờ. *(Lưu ý: dữ liệu sử dụng tiếng Việt không dấu)*.
19. Cho biết các tuyến buýt có cự ly dài nhất.
20. Cho biết các trạm dừng có nhiều tuyến buýt đi qua nhất.
21. Cho biết mã số, tên tuyến của tuyến xe buýt có lộ trình nhiều trạm dừng nhất.
22. Cho biết mã số, tên đơn vị của đơn vị vận hành đảm nhận nhiều tuyến xe buýt nhất.
23. Cho biết các tuyến xe buýt có lộ trình đi qua cả hai trạm dừng có tên là `TDH xe buyt Sai Gon` và `Cong vien 30/4`. *(Lưu ý: dữ liệu sử dụng tiếng Việt không dấu)*.
24. Cho biết các tuyến xe buýt có lộ trình đi qua tất cả các trạm dừng có mã số 31, 35, 81.

> **Lưu ý:** Dữ liệu sử dụng tiếng Việt không dấu → dùng `LIKE` với chuỗi không dấu hoặc so sánh trực tiếp không dấu tùy trường dữ liệu.

---

## IV. Nộp bài

Nộp lên **Sakai** các file sau:

- [x] `Lab4_csdl_xebuyt.sql` — Các lệnh truy vấn cho CSDL Xe buýt

---

## V. Tài nguyên đính kèm

| File | Mô tả |
|------|-------|
| `Cơ sở dữ liệu - Dự án công ty-3-2-1-2-2-1.pdf` | Tài liệu CSDL Dự án công ty (bài tập ở lớp) |
| `Cơ sở dữ liệu - Xe buýt - Lược đồ-1-2-2-1.pdf` | Lược đồ CSDL Xe buýt |
| `Scripts csdl_congty _sqlserver_-2-1-2-2-1.sql` | Script tạo CSDL công ty |
| `Scripts csdl_xebuyt _sqlserver_-1-2-2-1.sql` | Script tạo CSDL xe buýt |
| `Lab 03 - SQL - Truy vấn dữ liệu-1-2-2-1.pdf` | Slide bài giảng Lab 03 - SQL - Truy vấn dữ liệu |

---

## VI. Tiến độ

| Câu | Trạng thái |
|-----|-----------|
| BTTL — Câu 18–38 (ở lớp) | ✅ Xong |
| BTVN — Câu 13: Đơn vị VH < 2 tuyến | ✅ Xong |
| BTVN — Câu 14: Lộ trình < 40 trạm | ✅ Xong |
| BTVN — Câu 15: Trạm có > 1 tuyến đi qua | ✅ Xong |
| BTVN — Câu 16: Số tuyến đi qua mỗi trạm | ✅ Xong |
| BTVN — Câu 17: Tuyến, loại trạm & tổng số trạm | ✅ Xong |
| BTVN — Câu 18: Tuyến & tổng số trạm Nhà chờ | ✅ Xong |
| BTVN — Câu 19: Tuyến buýt cự ly dài nhất | ✅ Xong |
| BTVN — Câu 20: Trạm dừng nhiều tuyến qua nhất | ✅ Xong |
| BTVN — Câu 21: Tuyến có lộ trình nhiều trạm nhất | ✅ Xong |
| BTVN — Câu 22: Đơn vị vận hành nhiều tuyến nhất | ✅ Xong |
| BTVN — Câu 23: Đi qua TDH xe buýt Sài Gòn & CV 30/4 | ✅ Xong |
| BTVN — Câu 24: Đi qua các trạm 31, 35, 81 | ✅ Xong |
