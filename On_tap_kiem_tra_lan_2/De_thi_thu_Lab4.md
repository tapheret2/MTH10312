# ĐỀ THI THỬ CƠ SỞ DỮ LIỆU — HỌC KỲ II (2025-2026)
## Nội dung: Từ đầu đến hết Lab 4 (SQL Định nghĩa, Cập nhật & Truy vấn phức tạp)
**Thời gian làm bài: 90 phút**

---

## 🗂️ GIỚI THIỆU LƯỢC ĐỒ CƠ SỞ DỮ LIỆU
Đề thi sử dụng cơ sở dữ liệu **Quản lý rạp chiếu phim (`csdl_cinema`)** gồm 4 bảng dưới đây:

1.  **`phim`**(`maphim` [PK], `tenphim`, `theloai`, `thoiluong`, `daodien`, `namsx`)
    *   *Ý nghĩa:* Lưu trữ thông tin về các bộ phim.
2.  **`rap`**(`marap` [PK], `tenrap`, `diadiem`, `succhua`)
    *   *Ý nghĩa:* Lưu trữ thông tin về các rạp chiếu phim (phòng chiếu).
3.  **`lichchieu`**(`malich` [PK], `maphim` [FK], `marap` [FK], `ngaychieu`, `giochieu`, `giave_goc`)
    *   *Ý nghĩa:* Lịch chiếu của một bộ phim cụ thể tại một rạp nào đó vào ngày giờ cụ thể.
4.  **`ve`**(`mave` [PK], `malich` [FK], `ngayban`, `loaive`, `giaban`)
    *   *Ý nghĩa:* Thông tin vé đã bán cho một lịch chiếu (gồm loại vé `'Thuong'` hoặc `'VIP'`, và giá bán thực tế).

---

## 📝 PHẦN I: LÝ THUYẾT & KHÁI NIỆM (2.0 Điểm)
*Trả lời ngắn gọn hoặc chọn đáp án đúng nhất cho các câu hỏi sau:*

1.  **Câu A1:** Hãy phân biệt sự khác biệt cơ bản giữa mệnh đề `WHERE` và mệnh đề `HAVING` trong câu lệnh SQL `SELECT`.
2.  **Câu A2:** Một thuộc tính (hoặc bộ thuộc tính) đóng vai trò là **Khóa ngoại (Foreign Key)** có bắt buộc phải có giá trị khác rỗng (`NOT NULL`) hay không? Tại sao? Cho ví dụ minh họa từ lược đồ trên.
3.  **Câu A3:** Khi thực hiện phép kết `LEFT OUTER JOIN` giữa hai bảng `A` và `B` (`A LEFT JOIN B ON A.id = B.id`), nếu một dòng trong bảng `A` không tìm thấy dòng khớp trong bảng `B`, kết quả trả về sẽ như thế nào đối với các cột thuộc bảng `B`?
4.  **Câu A4:** Hãy giải thích ý nghĩa của ràng buộc toàn vẹn `CHECK (thoiluong > 0)` khi định nghĩa bảng `phim`. Ràng buộc này thuộc loại ràng buộc nào (miền giá trị, khóa, hay liên thuộc tính)?

---

## 💻 PHẦN II: ĐỊNH NGHĨA & CẬP NHẬT DỮ LIỆU — DDL & DML (3.0 Điểm)
*Sử dụng SQL Server để viết các lệnh thực hiện các yêu cầu sau:*

1.  **Câu B1 (Tạo bảng):** Viết lệnh SQL định nghĩa bảng **`nhanvien`** dùng để quản lý nhân viên của rạp chiếu phim gồm các thông tin:
    *   `manv` (Mã nhân viên, số nguyên, khóa chính).
    *   `hoten` (Họ tên nhân viên, chuỗi tối đa 50 ký tự, không được để trống).
    *   `ngaysinh` (Ngày sinh, kiểu ngày).
    *   `chucvu` (Chức vụ, chuỗi tối đa 30 ký tự, mặc định là `'Nhan vien'`).
    *   `marap` (Rạp nơi nhân viên làm việc, số nguyên, là khóa ngoại liên kết tới bảng `rap`).
2.  **Câu B2 (Thêm ràng buộc):** Viết lệnh SQL bổ sung một ràng buộc kiểm tra (`CHECK constraint`) cho bảng `ve` sao cho ngày bán vé (`ngayban`) phải trước hoặc bằng ngày chiếu phim (`ngaychieu`). *(Gợi ý: Cần kiểm tra liên kết thông qua lịch chiếu)*.
3.  **Câu B3 (Cập nhật dữ liệu):** Viết câu lệnh cập nhật tăng giá vé (`giaban`) thêm 10% cho tất cả các vé thuộc loại `'VIP'` của những bộ phim có thể loại là `'Khoa học viễn tưởng'`.
4.  **Câu B4 (Xóa dữ liệu):** Viết câu lệnh xóa tất cả các lịch chiếu (`lichchieu`) diễn ra trước ngày `2026-05-22` mà không bán được bất kỳ chiếc vé nào.

---

## 🔍 PHẦN III: TRUY VẤN DỮ LIỆU — SQL SELECT (5.0 Điểm)
*Viết các câu lệnh SQL để truy vấn thông tin theo các yêu cầu từ đơn giản đến phức tạp:*

### A. Truy vấn Đơn giản (Lab 3)
5.  **Câu C5:** Cho biết danh sách các phim thuộc thể loại `'Hành động'` hoặc `'Tình cảm'` có thời lượng từ `120` phút trở lên. Kết quả hiển thị: `maphim`, `tenphim`, `theloai`, `thoiluong`.
6.  **Câu C6:** Cho biết mã lịch chiếu, tên phim, tên rạp và ngày chiếu của những lịch chiếu có giá vé gốc (`giave_goc`) nằm trong khoảng từ `80,000` đến `110,000` VNĐ, sắp xếp tăng dần theo `ngaychieu`.
7.  **Câu C7:** Tìm danh sách các phim có tên bắt đầu bằng chữ `'L'` hoặc sản xuất trong năm `2024`.

### B. Gom nhóm và Kết ngoài (Lab 4 - Trung bình)
8.  **Câu C8:** Với mỗi rạp chiếu, cho biết mã rạp, tên rạp và **tổng số lịch chiếu** diễn ra tại rạp đó. *(Lưu ý: Rạp nào chưa có lịch chiếu nào vẫn phải hiển thị với tổng số lịch chiếu là 0)*.
9.  **Câu C9:** Cho biết mã phim, tên phim và **tổng doanh thu** (tổng tiền vé đã bán) của từng bộ phim. Sắp xếp doanh thu giảm dần.
10. **Câu C10:** Tìm những lịch chiếu (mã lịch chiếu, tên phim, ngày chiếu) đã bán được **nhiều hơn 2 vé**.
11. **Câu C11:** Cho biết thông tin các rạp chiếu (mã rạp, tên rạp, sức chứa) có **giá vé bán thực tế trung bình** (`giaban`) của các vé đã bán tại rạp đó lớn hơn `100,000` VNĐ.

### C. Truy vấn con & Phép toán tập hợp (Lab 4 - Nâng cao)
12. **Câu C12:** Tìm bộ phim (mã phim, tên phim, thời lượng) có **thời lượng dài nhất**.
13. **Câu C13:** Cho biết mã lịch chiếu và ngày chiếu của những lịch chiếu **không bán được bất kỳ vé nào**. *(Yêu cầu viết bằng 2 cách: dùng `LEFT JOIN` và dùng `NOT EXISTS` hoặc `NOT IN`)*.
14. **Câu C14:** Tìm bộ phim (mã phim, tên phim, đạo diễn) có tổng số vé bán được **nhiều nhất**.
15. **Câu C15 (Phép chia/Division):** Tìm phim (mã phim, tên phim) được xếp lịch chiếu tại **tất cả các rạp** hiện có trong cơ sở dữ liệu.
16. **Câu C16 (CTE / Gom nhóm phức tạp):** Cho biết thông tin đạo diễn và số lượng phim mà đạo diễn đó đã sản xuất có thời lượng lớn hơn `110` phút, chỉ hiển thị những đạo diễn có từ `2` bộ phim trở lên thỏa mãn điều kiện này.

---

## 🛠️ HƯỚNG DẪN THỰC HÀNH TRÊN MÁY TÍNH
Để tự đánh giá năng lực của mình, bạn hãy thực hiện các bước sau:
1.  Mở **SQL Server Management Studio (SSMS)** hoặc **VS Code (SQLTools)**.
2.  Chạy toàn bộ nội dung file [setup_csdl_cinema.sql](file:///d:/Database/On_tap_kiem_tra/setup_csdl_cinema.sql) để tạo cơ sở dữ liệu và chèn dữ liệu mẫu.
3.  Tạo một file có tên là `Lam_bai_kiem_tra.sql` và bắt đầu viết các câu lệnh SQL của bạn tương ứng với các câu hỏi trong đề.
4.  Đối chiếu kết quả chạy lệnh của bạn với file đáp án chi tiết tại [Dapan_De_thi_thu.sql](file:///d:/Database/On_tap_kiem_tra/Dapan_De_thi_thu.sql).
