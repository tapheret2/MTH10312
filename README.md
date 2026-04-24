# Cơ Sở Dữ Liệu — HK2 2025-2026

> Môn học: **Cơ sở dữ liệu** | Học kỳ 2, năm học 2025 – 2026

## 📋 Lớp học

### Lý thuyết

| Lớp | Lịch học | Địa điểm | Tuần bắt đầu | Giảng viên |
|-----|----------|----------|--------------|------------|
| 24KDL | T4 (9:20 – 11:50) – P.cs2:F205 | CS2 | 09/03/2026 | Nguyễn Hiền Lương |
| 24TTH | T6 (9:20 – 11:50) – P.cs2:E105 | CS2 | 09/03/2026 | Nguyễn Hiền Lương |

### Thực hành

| Nhóm | Lịch học | Địa điểm | Tuần bắt đầu | Giảng viên |
|------|----------|----------|--------------|------------|
| 24KDL1 | T7 (1–3.5) – P.cs2:C205 | CS2 | 23/03/2026 | Lý Như Bình |
| 24KDL2 | T7 (3.5–5) – P.cs2:C205 | CS2 | 23/03/2026 | Lý Như Bình |
| 24KDL3L | T5 (6–8.5) – P.cs2:NĐH4.4 | CS2 | 23/03/2026 | Nguyễn Hiền Lương |
| 24TTH1L | T7 (3.5–5) – P.cs2:NĐH4.2 | CS2 | 23/03/2026 | Nguyễn Thị Kiều Trang |
| 24TTH2L | T7 (6–8.5) – P.cs2:NĐH4.2 | CS2 | 23/03/2026 | Nguyễn Thị Kiều Trang |
| 24TTH3 | T4 (6–8.5) – P.cs2:C205 | CS2 | 23/03/2026 | Nguyễn Hiền Lương |

---

## 📊 Phương án đánh giá

```
Điểm tổng kết = Điểm quá trình (60%) + Điểm thi cuối kỳ (40%)

Điểm quá trình:
  ├── Kiểm tra 1   20%
  ├── Kiểm tra 2   30%
  └── Bài tập      10%
```

- Kiểm tra quá trình: **trắc nghiệm + tự luận trên máy tính**
- Kiểm tra cuối kỳ: **tự luận**

---

## 📅 Lịch giảng

| Tuần | Lý thuyết | Thực hành |
|------|-----------|-----------|
| 09/03 | Giới thiệu học phần · Bài 1 – Tổng quan về CSDL | — |
| 16/03 | Bài 2 – Mô hình dữ liệu quan hệ | — |
| 23/03 | Bài 3 – Ngôn ngữ SQL | **Lab 1** – Môi trường thực hành CSDL quan hệ |
| 30/03 | Bài 3 – Ngôn ngữ SQL (tiếp) | **Lab 2** – SQL: Định nghĩa và cập nhật dữ liệu |
| 06/04 | Bài 4 – Đại số và phép tính quan hệ | **Lab 3** – SQL: Truy vấn dữ liệu đơn giản |
| 13/04 | Bài 5 – Ràng buộc trên CSDL quan hệ | **Kiểm tra #1** – Viết lệnh SQL định nghĩa & cập nhật |
| 20/04 | Bài 6 – Mô hình thực thể – mối kết hợp | **Lab 4** – SQL: Truy vấn dữ liệu phức tạp |
| 27/04 | Bài 7 – Thiết kế CSDL quan hệ | — |
| 11/05 | Bài 8 – Chuẩn hóa CSDL quan hệ | **Lab 5** – Ngôn ngữ đại số quan hệ |
| 18/05 | Bài 9 – CSDL phi quan hệ | **Kiểm tra #2** – Viết lệnh SQL truy vấn dữ liệu |
| 25/05 | — | **Lab 6** – Thiết kế lược đồ ER |
| 01/06 | Ôn tập | **Lab 7** – Chuẩn hóa lược đồ quan hệ |

---

## 📁 Cấu trúc thư mục

```
Database/
├── Lab2/          # Lab 2 – SQL: Định nghĩa và cập nhật dữ liệu
│   ├── cau1.sql                        # Câu 1: Tạo lược đồ csdl_taxi
│   ├── cau1_doithicong.sql             # Câu 1: Tạo lược đồ csdl_doithicong
│   ├── Cau3_Lab2_csdl_taxi.sql         # Câu 3: Script tổng hợp csdl_taxi
│   ├── Cau3_Lab2_csdl_doithicong.sql   # Câu 3: Script tổng hợp csdl_doithicong
│   └── Cau4_Lab2.sql                   # Câu 4: Cập nhật dữ liệu
└── Lab3/          # Lab 3 – SQL: Truy vấn dữ liệu
    ├── BTTL.sql                        # Bài tập ở lớp (câu 1–17, csdl_congty)
    └── Lab3_csdl_xebuyt.sql            # Bài tập về nhà (câu 1–12, csdl_xebuyt)
```

---

## ⚙️ Môi trường

- **SQL Server**: Microsoft SQL Server Express (`localhost\SQLEXPRESS`)
- **IDE**: VS Code + SQLTools (MSSQL driver)
- **Kết nối**: `sa@localhost\SQLEXPRESS` — port 1433
