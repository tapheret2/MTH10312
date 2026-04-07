# Lab 02 — Lệnh SQL: Định nghĩa và Cập nhật Dữ liệu

## I. Nội dung thực hành

- Soạn thảo và thực thi lệnh SQL
- Tạo cơ sở dữ liệu (`CREATE DATABASE`, `CREATE TABLE`)
- Cập nhật cơ sở dữ liệu (`INSERT`, `UPDATE`, `DELETE`)
- Hủy cơ sở dữ liệu (`DROP TABLE`, `DROP DATABASE`)

---

## II. Bài tập về nhà

### Câu 1 — Tạo cơ sở dữ liệu

Viết các lệnh tạo cơ sở dữ liệu (schema):

- `csdl_taxi` theo lược đồ trong **Taxi - Lược đồ.pdf**
- `csdl_doithicong` theo lược đồ trong **Đội Thi Công - Lược đồ.pdf**

### Câu 2 — Xây dựng trạng thái (Insert dữ liệu)

Viết lệnh chèn dữ liệu vào các bảng:

- `csdl_taxi` với dữ liệu trong **Taxi - Dữ liệu.xlsx**
- `csdl_doithicong` với dữ liệu trong **Đội Thi Công - Dữ liệu.xlsx**

### Câu 3 — Tạo file SQL hoàn chỉnh

Tạo các file `.sql` tổng hợp Câu 1 + Câu 2 (có thể chạy một lần để tạo toàn bộ CSDL):

| File | Cơ sở dữ liệu |
|------|--------------|
| `Cau3_Lab2_csdl_taxi.sql` | csdl_taxi |
| `Cau3_Lab2_csdl_doithicong.sql` | csdl_doithicong |

### Câu 4 — Cập nhật dữ liệu

Thực hiện các thao tác sau và lưu vào file `Cau4_Lab2.sql`:

1. **UPDATE** — Sửa hạn sử dụng GPLX số `799876543210` thành ngày **05/07/2031**
2. **DELETE** — Xóa ca làm việc của lái xe có mã số **2**
3. **UPDATE** — Cập nhật đội trưởng: công nhân mã số **138** làm đội trưởng đội thi công số **2**
4. **DELETE** — Xóa các ngày chấm công trong tháng **4/2024**

---

## III. Nộp bài

Nộp lên **Sakai** các file sau:

- [ ] `Cau3_Lab2_csdl_taxi.sql`
- [ ] `Cau3_Lab2_csdl_doithicong.sql`
- [ ] `Cau4_Lab2.sql`

---

## IV. Tài nguyên đính kèm

| File | Mô tả |
|------|-------|
| `Scripts csdl_congty (sqlserver).sql` | Script mẫu csdl_congty cho SQL Server |
| `Scripts csdl_congty (postgresql).sql` | Script mẫu csdl_congty cho PostgreSQL |
| `Scripts csdl_congty (mysql).sql` | Script mẫu csdl_congty cho MySQL |
| `Taxi - Lược đồ.pdf` | Lược đồ CSDL Taxi |
| `Taxi - Dữ liệu.xlsx` | Dữ liệu mẫu CSDL Taxi |
| `Đội Thi Công - Lược đồ.pdf` | Lược đồ CSDL Đội Thi Công |
| `Đội Thi Công - Dữ liệu.xlsx` | Dữ liệu mẫu CSDL Đội Thi Công |
| `Cơ sở dữ liệu - Dự án công ty.pdf` | Tài liệu tham khảo CSDL Công ty |
| `Lab 02 - Lệnh SQL - Định nghĩa và cập nhật dữ liệu.pdf` | Slide bài giảng Lab 02 |

---

## V. Tiến độ

| Câu | Trạng thái |
|-----|-----------|
| Câu 1 — Schema csdl_taxi | ✅ Xong |
| Câu 1 — Schema csdl_doithicong | ✅ Xong |
| Câu 2 — Insert data csdl_taxi | ⬜ Chưa làm |
| Câu 2 — Insert data csdl_doithicong | ⬜ Chưa làm |
| Câu 3 — Cau3_Lab2_csdl_taxi.sql | ⬜ Chưa làm |
| Câu 3 — Cau3_Lab2_csdl_doithicong.sql | ⬜ Chưa làm |
| Câu 4 — Cau4_Lab2.sql | ⬜ Chưa làm |
