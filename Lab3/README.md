# Lab 03 — Lệnh SQL: Truy vấn Dữ liệu

## I. Nội dung thực hành

- Logic thực thi lệnh truy vấn
- Lệnh truy vấn cơ bản (`SELECT`, `FROM`, `WHERE`, `JOIN`, `ORDER BY`)
- Hàm xử lý kiểu thời gian (`YEAR()`, `MONTH()`, `DAY()`, ...)

---

## II. Bài tập ở lớp (không yêu cầu nộp bài)

Viết và thực thi các lệnh truy vấn cho các câu hỏi từ **1 đến 17** trong tập tin **"Cơ sở dữ liệu - Dự án công ty.pdf"** trên cơ sở dữ liệu `csdl_congty`.

> File bài làm: `BTTL.sql`

---

## III. Bài tập về nhà (nộp lên Sakai)

Cho lược đồ CSDL **Xe buýt** trong tập tin **"Cơ sở dữ liệu - Xe buýt - Lược đồ.pdf"** và tập tin lệnh tạo CSDL **"Scripts csdl_xebuyt.sql"**. Viết các lệnh truy vấn `SELECT` thực hiện các câu hỏi dưới đây:

1. Cho biết mã số tuyến, tên tuyến, cự ly, tên đơn vị vận hành của các tuyến xe buýt có cự ly lớn hơn 20,000m.
2. Với mỗi trạm dừng ở đường Hàm Nghi, Quận 1, cho biết mã số trạm, tên trạm và mã số các tuyến xe buýt có lộ trình qua trạm đó.
3. Cho biết mã số trạm, tên trạm, loại của các trạm dừng ở Quận 12 thuộc lộ trình của các tuyến xe buýt số 3.
4. Cho biết mã số trạm, tên trạm, loại của các trạm dừng khởi hành của các tuyến xe buýt.
5. Cho biết mã số tuyến, tên tuyến của các tuyến xe buýt có lộ trình đi qua trạm dừng có tên là Chợ Cũ ở Quận 1.
6. Cho biết tên đơn vị vận hành có tuyến xe buýt có lộ trình đi qua trạm dừng có mã số 53.
7. Với các tuyến buýt có số chuyến trong ngày nhỏ hơn 250, cho biết mã số, tên tuyến, cự ly và tên trạm dừng khởi hành.
8. Cho biết mã số tuyến, tên tuyến của các tuyến xe buýt có lộ trình đi qua trạm dừng là bến xe trên đường Phạm Ngũ Lão ở Quận 1.
9. Với các tuyến xe buýt do đơn vị HTX Vận tải 19/5 vận hành, cho biết mã số tuyến, tên tuyến, cự ly và lộ trình. Sắp xếp theo mã số tuyến và số thứ tự trạm.
10. Cho biết mã số tuyến, tên tuyến của các tuyến xe buýt có lộ trình đi qua trạm dừng có tên là Đền Thờ Ấn Giáo, Pastuer. Sắp xếp theo mã số tuyến.
11. Với các trạm dừng ở Quận 1, cho biết mã số trạm, tên trạm, địa điểm, và mã số các tuyến xe buýt có lộ trình đi qua trạm đó. Sắp xếp theo tên trạm và mã số tuyến.
12. Với mỗi đơn vị vận hành cho biết tên đơn vị và mã số tuyến, cự ly của các tuyến xe buýt có lộ trình đi qua trạm dừng số 36. Sắp xếp theo tên đơn vị vận hành và mã số tuyến.

> **Lưu ý:** Dữ liệu sử dụng tiếng Việt không dấu → dùng `LIKE` với chuỗi không dấu.

---

## IV. Nộp bài

Nộp lên **Sakai** các file sau:

- [x] `Lab3_csdl_xebuyt.sql` — Các lệnh truy vấn cho CSDL Xe buýt

---

## V. Tài nguyên đính kèm

| File | Mô tả |
|------|-------|
| `Cơ sở dữ liệu - Dự án công ty.pdf` | Tài liệu CSDL Dự án công ty (bài tập ở lớp) |
| `Cơ sở dữ liệu - Xe buýt - Lược đồ.pdf` | Lược đồ CSDL Xe buýt |
| `Scripts csdl_congty (sqlserver).sql` | Script tạo CSDL công ty |
| `Scripts csdl_xebuyt (sqlserver).sql` | Script tạo CSDL xe buýt |
| `Lab 03 - SQL - Truy vấn dữ liệu.pdf` | Slide bài giảng Lab 03 |

---

## VI. Tiến độ

| Câu | Trạng thái |
|-----|-----------|
| BTTL — Câu 1–9 (ở lớp) | ✅ Xong |
| BTTL — Câu 10–17 (ở lớp) | ✅ Xong |
| BTVN — Câu 1: Cự ly > 20,000m | ✅ Xong |
| BTVN — Câu 2: Trạm ở Hàm Nghi, Q1 | ✅ Xong |
| BTVN — Câu 3: Trạm Q12, tuyến số 3 | ✅ Xong |
| BTVN — Câu 4: Trạm khởi hành | ✅ Xong |
| BTVN — Câu 5: Trạm Chợ Cũ, Q1 | ✅ Xong |
| BTVN — Câu 6: Trạm mã số 53 | ✅ Xong |
| BTVN — Câu 7: Số chuyến < 250 | ✅ Xong |
| BTVN — Câu 8: Bến xe Phạm Ngũ Lão, Q1 | ✅ Xong |
| BTVN — Câu 9: HTX Vận tải 19/5 | ✅ Xong |
| BTVN — Câu 10: Đền Thờ Ấn Giáo | ✅ Xong |
| BTVN — Câu 11: Trạm Q1, sắp xếp | ✅ Xong |
| BTVN — Câu 12: Trạm số 36, đơn vị VH | ✅ Xong |
