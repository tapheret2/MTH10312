USE csdl_quanlykho;
GO
INSERT INTO DANH_MUC VALUES
('CAT001', 'Dien tu', 'Thiet bi va phu kien dien tu'),
('CAT002', 'Quan ao', 'Thoi trang va phu kien'),
('CAT003', 'Thuc pham', 'San pham thuc pham va do uong');

INSERT INTO SAN_PHAM VALUES
-- Dien tu (CAT001)
('P00001', 'Dien thoai thong minh X', 'CAT001', 699.99, 20, 10),
('P00002', 'May tinh xach tay Pro', 'CAT001', 1299.99, 10, 5),
('P00003', 'Tai nghe khong day', 'CAT001', 99.99, 50, 20),
('P00004', 'Dong ho thong minh', 'CAT001', 199.99, 20, 10),
('P00005', 'May tinh bang 10 inch', 'CAT001', 499.99, 0, 5),
('P00006', 'May choi game', 'CAT001', 399.99, 0, 5),
('P00007', 'Man hinh LED', 'CAT001', 249.99, 0, 5),
('P00008', 'Loa Bluetooth', 'CAT001', 79.99, 0, 15),
('P00009', 'Sac USB', 'CAT001', 19.99, 100, 50),
('P00010', 'Cap HDMI', 'CAT001', 9.99, 0, 30),
-- Quan ao (CAT002)
('P00011', 'Ao thun nam', 'CAT002', 29.99, 100, 20),
('P00012', 'Quan jeans nu', 'CAT002', 59.99, 0, 15),
('P00013', 'Ao khoac co mu', 'CAT002', 79.99, 0, 10),
('P00014', 'Giay the thao', 'CAT002', 89.99, 50, 10),
('P00015', 'Ao so mi', 'CAT002', 49.99, 0, 15),
('P00016', 'Ao len', 'CAT002', 69.99, 0, 10),
('P00017', 'Goi tat', 'CAT002', 14.99, 0, 30),
('P00018', 'Khan quang', 'CAT002', 19.99, 0, 20),
('P00019', 'Mu', 'CAT002', 24.99, 0, 25),
('P00020', 'That lung', 'CAT002', 34.99, 20, 15),
-- Thuc pham (CAT003)
('P00021', 'Gao 5kg', 'CAT003', 14.99, 100, 50),
('P00022', 'Ca hop', 'CAT003', 2.99, 300, 100),
('P00023', 'Dau olive 1L', 'CAT003', 9.99, 0, 20),
('P00024', 'Mi Y 500g', 'CAT003', 1.99, 500, 50),
('P00025', 'Ca phe hat 1kg', 'CAT003', 19.99, 0, 15),
('P00026', 'Ngu coc hop', 'CAT003', 4.99, 0, 30),
('P00027', 'Sua hop 1L', 'CAT003', 1.49, 700, 100),
('P00028', 'Duong 1kg', 'CAT003', 2.49, 0, 40),
('P00029', 'Banh quy goi', 'CAT003', 3.99, 0, 30),
('P00030', 'Tra tui loc 100g', 'CAT003', 5.99, 400, 20);

INSERT INTO NHA_CUNG_CAP VALUES
('SUP001', 'Cong ty Cong nghe Moi', '0901234567', 'lienhe@congnghemoi.com', '123 Duong Dinh Nghe, Ha Noi'),
('SUP002', 'Trung tam Thoi trang', '0912345678', 'banhang@thoitrang.com', '456 Nguyen Trai, TP HCM'),
('SUP003', 'Tap doan Thuc pham', '0923456789', 'thongtin@thucpham.com', '789 Duong Quang Ham, Da Nang'),
('SUP004', 'The gioi Do choi', '0934567890', 'hotro@dochoi.com', '101 Hai Ba Trung, Ha Noi'),
('SUP005', 'Cong ty Phong cach', '0945678901', 'banhang@phongcach.com', '202 Duong Ba Trac, TP HCM'),
('SUP006', 'Sieu thi Sach', '0956789012', 'hotro@sieuthisach.com', '303 Duong Quang Ham, Da Nang');

INSERT INTO KHO VALUES
('WH001', 'Kho Hoan Kiem', 'Ha Noi', 10000),
('WH002', 'Kho Nam Sai Gon', 'TP Ho Chi Minh', 8000),
('WH003', 'Kho Trung tam', 'Da Nang', 6000);

INSERT INTO TON_KHO VALUES
-- Dien tu (P00001 to P00010)
('P00001', 'WH001', 20), 
('P00002', 'WH001', 10), 
('P00003', 'WH001', 50), 
('P00004', 'WH001', 20), 
('P00009', 'WH001', 100), 
-- Quan ao (P00011 to P00020)
('P00011', 'WH002', 100),
('P00014', 'WH002', 50),
('P00020', 'WH002', 20),
-- Thuc pham (P00021 to P00030)
('P00021', 'WH001', 100), 
('P00022', 'WH002', 300), 
('P00024', 'WH003', 500),
('P00027', 'WH002', 700),
('P00030', 'WH001', 200), 
('P00030', 'WH003', 100),
('P00030', 'WH002', 100);

INSERT INTO DON_NHAP_HANG VALUES
('PO0001', 'SUP001', 'WH001', '2025-05-01', 20998.30, 'R'),
('PO0002', 'SUP002', 'WH002', '2025-05-05', 6698.30, 'R'),
('PO0003', 'SUP003', 'WH003', '2025-05-10', 2985.00, 'P'),
('PO0004', 'SUP004', 'WH001', '2025-05-15', 15999.70, 'R'),
('PO0005', 'SUP006', 'WH002', '2025-05-20', 4493.00, 'P'),
('PO0006', 'SUP005', 'WH002', '2025-05-22', 2398.90, 'C'),
('PO0007', 'SUP006', 'WH003', '2025-05-24', 1497.00, 'C'),
('PO0008', 'SUP006', 'WH001', '2025-05-25', 2497.00, 'R'),
('PO0009', 'SUP006', 'WH002', '2025-05-25', 1940.00, 'R'),
('PO0010', 'SUP006', 'WH003', '2025-05-25', 1494.00, 'R'),
('PO0011', 'SUP006', 'WH003', '2025-05-25', 1044.00, 'P'),
('PO0012', 'SUP006', 'WH002', '2025-05-25', 499.00, 'R');

INSERT INTO CHI_TIET_DON_NHAP VALUES
-- PO0001 (Dien tu, SUP001, WH001, R)
('PO0001', 'P00001', 20, 699.99),
('PO0001', 'P00003', 50, 99.99),
('PO0001', 'P00009', 100, 19.99),
-- PO0002 (Quan ao, SUP002, WH002, R)
('PO0002', 'P00011', 100, 29.99),
('PO0002', 'P00014', 50, 59.99),
('PO0002', 'P00020', 20, 34.99),
-- PO0003 (Thuc pham, SUP003, WH003, P)
('PO0003', 'P00022', 500, 2.99),
('PO0003', 'P00027', 1000, 1.49),
-- PO0004 (Dien tu, SUP004, WH001, R)
('PO0004', 'P00002', 10, 1299.99),
('PO0004', 'P00004', 20, 149.99),
-- PO0005 (Thuc pham, SUP006, WH002, P)
('PO0005', 'P00021', 200, 14.99),
('PO0005', 'P00024', 500, 2.99),
-- PO0006 (Quan ao, SUP005, WH002, C)
('PO0006', 'P00018', 60, 14.99),
-- PO0007 (Thuc pham, SUP006, WH003, C)
('PO0007', 'P00023', 50, 9.99),
('PO0007', 'P00029', 250, 3.99),
-- PO0008 (Thuc pham, SUP006, WH001, R)
('PO0008', 'P00021', 100, 14.99),
('PO0008', 'P00030', 200, 4.99),
-- PO0009 (Thuc pham, SUP006, WH002, R)
('PO0009', 'P00022', 300, 2.99),
('PO0009', 'P00027', 700, 1.49),
-- PO0010 (Thuc pham, SUP006, WH003, R)
('PO0010', 'P00024', 500, 1.99),
('PO0010', 'P00030', 100, 4.99),
-- PO0011 (Thuc pham, SUP006, WH003, P)
('PO0011', 'P00022', 100, 2.99),
('PO0011', 'P00027', 500, 1.49),
-- PO0012 (Thuc pham, SUP006, WH002, R)
('PO0012', 'P00030', 100, 4.99);

INSERT INTO GIAO_DICH_KHO VALUES
-- PO0001 (R, WH001)
('TX0001', 'P00001', 'WH001', 'I', 20, '2025-05-01'),
('TX0002', 'P00003', 'WH001', 'I', 50, '2025-05-01'),
('TX0003', 'P00009', 'WH001', 'I', 100, '2025-05-01'),
-- PO0002 (R, WH002)
('TX0004', 'P00011', 'WH002', 'I', 100, '2025-05-05'),
('TX0005', 'P00014', 'WH002', 'I', 50, '2025-05-05'),
('TX0006', 'P00020', 'WH002', 'I', 20, '2025-05-05'),
-- PO0004 (R, WH001)
('TX0007', 'P00002', 'WH001', 'I', 10, '2025-05-15'),
('TX0008', 'P00004', 'WH001', 'I', 20, '2025-05-15'),
-- PO0008 (R, WH001)
('TX0009', 'P00021', 'WH001', 'I', 100, '2025-05-25'),
('TX0010', 'P00030', 'WH001', 'I', 200, '2025-05-25'),
-- PO0009 (R, WH002)
('TX0011', 'P00022', 'WH002', 'I', 300, '2025-05-25'),
('TX0012', 'P00027', 'WH002', 'I', 700, '2025-05-25'),
-- PO0010 (R, WH003)
('TX0013', 'P00024', 'WH003', 'I', 500, '2025-05-25'),
('TX0014', 'P00030', 'WH003', 'I', 100, '2025-05-25'),
-- PO0012 (R, WH002)
('TX0015', 'P00030', 'WH002', 'I', 100, '2025-05-25');