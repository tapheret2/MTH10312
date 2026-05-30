CREATE DATABASE csdl_quanlykho;
GO
USE csdl_quanlykho;

CREATE TABLE DANH_MUC (
    ma_danh_muc    	CHAR(6)         NOT NULL,
    ten_danh_muc	VARCHAR(50)     NOT NULL,
    mo_ta           VARCHAR(200),
    CONSTRAINT PK_DM PRIMARY KEY (ma_danh_muc),
    CONSTRAINT SK_DM UNIQUE (ten_danh_muc)
);

CREATE TABLE SAN_PHAM (
    ma_san_pham       	CHAR(10)        NOT NULL,
    ten_san_pham      	VARCHAR(100)	NOT NULL,
    ma_danh_muc       	CHAR(6)       	NOT NULL,
    don_gia          	DECIMAL(10,2)  	CHECK (don_gia >= 0)
    									NOT NULL,
    tong_so_luong      	INT         	CHECK (tong_so_luong >= 0)
    									NOT NULL,
    so_luong_toi_thieu  INT    			CHECK (so_luong_toi_thieu >= 0)
    									NOT NULL,
    CONSTRAINT PK_SP PRIMARY KEY (ma_san_pham),
    CONSTRAINT FK_SP FOREIGN KEY (ma_danh_muc) 
        REFERENCES DANH_MUC (ma_danh_muc)
);

CREATE TABLE NHA_CUNG_CAP (
    ma_nha_cung_cap    	CHAR(8)         NOT NULL,
    ten_nha_cung_cap   	VARCHAR(100)    NOT NULL,
    so_dien_thoai     	VARCHAR(15)     NOT NULL,
    email           	VARCHAR(50),
    dia_chi          	VARCHAR(100),
    CONSTRAINT PK_NCC PRIMARY KEY (ma_nha_cung_cap),
    CONSTRAINT SK_NCC UNIQUE (email)
);

CREATE TABLE KHO (
    ma_kho  	CHAR(6)        	NOT NULL,
    ten_kho     VARCHAR(50)    	NOT NULL,
    dia_diem    VARCHAR(100)   	NOT NULL,
    suc_chua    INT     		CHECK (suc_chua > 0)
                                NOT NULL,
    CONSTRAINT PK_KH PRIMARY KEY (ma_kho)
);

CREATE TABLE TON_KHO (
    ma_san_pham		CHAR(10)        NOT NULL,
    ma_kho          CHAR(6)         NOT NULL,
    so_luong        INT             CHECK (so_luong >= 0)
    								NOT NULL,
    CONSTRAINT PK_TK PRIMARY KEY (ma_san_pham, ma_kho),
    CONSTRAINT FK_TK_SP FOREIGN KEY (ma_san_pham) 
        REFERENCES SAN_PHAM (ma_san_pham) ON DELETE CASCADE,
    CONSTRAINT FK_TK_KH FOREIGN KEY (ma_kho) 
        REFERENCES KHO(ma_kho) ON DELETE CASCADE    
);

CREATE TABLE DON_NHAP_HANG (
    ma_don_nhap			CHAR(10)        NOT NULL,
    ma_nha_cung_cap    	CHAR(8)         NOT NULL,
    ma_kho           	CHAR(6)         NOT NULL,
    ngay_dat_hang     	DATE            NOT NULL,
    tong_tien        	DECIMAL(10,2)   CHECK (tong_tien >= 0)
    									NOT NULL,
    trang_thai       	CHAR(1)         CHECK (trang_thai in ('P', 'p', 'R', 'r', 'C', 'c'))
    									NOT NULL,
    CONSTRAINT PK_DNH PRIMARY KEY (ma_don_nhap),
    CONSTRAINT FK_DNH_NCC FOREIGN KEY (ma_nha_cung_cap) 
        REFERENCES NHA_CUNG_CAP (ma_nha_cung_cap),
    CONSTRAINT FK_DNH_KH FOREIGN KEY (ma_kho) 
        REFERENCES KHO (ma_kho)
);

CREATE TABLE CHI_TIET_DON_NHAP (
    ma_don_nhap   	CHAR(10)        NOT NULL,
    ma_san_pham     CHAR(10)        NOT NULL,
    so_luong        INT             CHECK (so_luong > 0)
                                    NOT NULL,
    don_gia_nhap    DECIMAL(10,2)   CHECK (don_gia_nhap >= 0)
                                    NOT NULL,
    CONSTRAINT PK_CTD PRIMARY KEY (ma_don_nhap, ma_san_pham),
    CONSTRAINT FK_CTD_DNH FOREIGN KEY (ma_don_nhap) 
        REFERENCES DON_NHAP_HANG (ma_don_nhap) ON DELETE CASCADE,
    CONSTRAINT FK_CTD_SP FOREIGN KEY (ma_san_pham) 
        REFERENCES SAN_PHAM (ma_san_pham)
);

CREATE TABLE GIAO_DICH_KHO (
    ma_giao_dich    	CHAR(10)        NOT NULL,
    ma_san_pham     	CHAR(10)        NOT NULL,
    ma_kho          	CHAR(6)         NOT NULL,
    loai_giao_dich  	CHAR(10)        CHECK (loai_giao_dich in ('I', 'i', 'O', 'o'))
                                    	NOT NULL,
    so_luong         	INT             CHECK (so_luong > 0)
                                    	NOT NULL,
    ngay_thuc_hien    	DATE            NOT NULL,
    CONSTRAINT PK_GDK PRIMARY KEY (ma_giao_dich),
    CONSTRAINT FK_GDK_SP FOREIGN KEY (ma_san_pham) 
        REFERENCES SAN_PHAM (ma_san_pham),
    CONSTRAINT FK_GDK_KH FOREIGN KEY (ma_kho) 
        REFERENCES KHO (ma_kho)
);