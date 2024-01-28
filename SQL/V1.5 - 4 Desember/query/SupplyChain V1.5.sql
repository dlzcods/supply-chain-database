use rantai_pasok

/*BUAT TABEL*/

CREATE TABLE [suplier] (
  [id_suplier] varchar(5) PRIMARY KEY NOT NULL,
  [nama_suplier] varchar(15) NOT NULL,
  [alamat] varchar(15) NOT NULL,
  [no_hp] varchar(15) NOT NULL,
  [email] varchar(15) NOT NULL
)
GO

CREATE TABLE [pabrik] (
  [id_pabrik] varchar(5) PRIMARY KEY NOT NULL,
  [nama_pabrik] varchar(15) NOT NULL,
  [kepala_pabrik] varchar(15) NOT NULL,
  [alamat] varchar(15) NOT NULL,
  [no_hp] varchar(15) NOT NULL,
  [jumlah_karyawan] int NOT NULL
)
GO

CREATE TABLE [distributor] (
  [id_distributor] varchar(5) PRIMARY KEY NOT NULL,
  [nama_distributor] varchar(15) NOT NULL,
  [wilayah] varchar(15) NOT NULL,
  [no_hp] varchar(15) NOT NULL,
  [email] varchar(15) NOT NULL
)
GO

CREATE TABLE [toko] (
  [id_toko] varchar(5) PRIMARY KEY NOT NULL,
  [nama_toko] varchar(15) NOT NULL,
  [manager_toko] varchar(15) NOT NULL,
  [kapasitas] int NOT NULL,
  [alamat] varchar(15) NOT NULL,
  [no_hp] varchar(15) NOT NULL,
  [email] varchar(15) NOT NULL
)
GO

CREATE TABLE [produk] (
  [id_produk] varchar(5) PRIMARY KEY NOT NULL,
  [nama_produk] varchar(15) NOT NULL,
  [harga] int NOT NULL
)
GO

CREATE TABLE [gudang] (
  [id_gudang] varchar(5) PRIMARY KEY NOT NULL,
  [id_pabrik] varchar(5) NOT NULL,
  [nama_gudang] varchar(15) NOT NULL,
  [kepala_gudang] varchar(15) NOT NULL,
  [kapasitas] int NOT NULL
)
GO

CREATE TABLE [transaksi_suplier] (
  [id_tran_sup] varchar(5) PRIMARY KEY NOT NULL,
  [id_suplier] varchar(5) NOT NULL,
  [total_biaya] int NOT NULL,
  [tgl_pesan] date NOT NULL
)
GO

CREATE TABLE [detail_transaksi_suplier] (
  [id_dt_tran_sup] varchar(5) PRIMARY KEY NOT NULL,
  [id_tran_sup] varchar(5) NOT NULL,
  [id_pabrik] varchar(5) NOT NULL,
  [tgl_terima] date NOT NULL,
  [biaya_transport] int NOT NULL,
  [total_biaya] int NOT NULL
)
GO

CREATE TABLE [detail_pesanan_bbk] (
  [id_dt_psn] varchar(5) PRIMARY KEY NOT NULL,
  [id_dt_tran_sup] varchar(5) NOT NULL,
  [bahan_baku] varchar(15) NOT NULL,
  [jumlah_dipesan] int NOT NULL,
  [total_biaya] int NOT NULL
)
GO

CREATE TABLE [pengiriman_produk] (
  [id_pengiriman] varchar(5) PRIMARY KEY NOT NULL,
  [id_distributor] varchar(5) NOT NULL
)
GO

CREATE TABLE [transaksi_pengiriman] (
  [id_trans_peng] varchar(5) PRIMARY KEY NOT NULL,
  [id_pengiriman] varchar(5) NOT NULL,
  [id_gudang] varchar(5) NOT NULL,
  [tgl_kirim] date NOT NULL,
  [tgl_terima] date NOT NULL,
  [biaya] int NOT NULL
)
GO

CREATE TABLE [detail_pengiriman] (
  [id_dt_peng] varchar(5) PRIMARY KEY NOT NULL,
  [id_trans_peng] varchar(5) NOT NULL,
  [id_toko] varchar(5) NOT NULL,
  [id_produk] varchar(5) NOT NULL,
  [jumlah_produk] int NOT NULL
)
GO

CREATE TABLE [produk_gudang] (
  [id_prd_gud] varchar(5) PRIMARY KEY NOT NULL,
  [id_gudang] varchar(5) NOT NULL,
  [id_produk] varchar(5) NOT NULL,
  [stok] int,
  [tgl_update] date NOT NULL
)
GO

CREATE TABLE [produk_toko] (
  [id_prd_tok] varchar(5) PRIMARY KEY NOT NULL,
  [id_toko] varchar(5) NOT NULL,
  [id_produk] varchar(5) NOT NULL,
  [stok] int,
  [tgl_update] date NOT NULL
)
GO

CREATE TABLE [produksi_pabrik] (
  [id_produksi] varchar(5) PRIMARY KEY NOT NULL,
  [id_pabrik] varchar(5) NOT NULL,
  [tgl_produksi] date NOT NULL,
  [tgl_transfer] date NOT NULL
)
GO

CREATE TABLE [detail_produksi_pabrik] (
  [id_dt_prod] varchar(5) PRIMARY KEY NOT NULL,
  [id_produksi] varchar(5) NOT NULL,
  [id_produk] varchar(5) NOT NULL,
  [jmlh_produksi] int NOT NULL,
  [id_gudang] varchar(5) NOT NULL
)
GO


/*Relasi antar tabel*/
ALTER TABLE [gudang] ADD FOREIGN KEY ([id_pabrik]) REFERENCES [pabrik] ([id_pabrik])
GO

ALTER TABLE [transaksi_suplier] ADD FOREIGN KEY ([id_suplier]) REFERENCES [suplier] ([id_suplier])
GO

ALTER TABLE [detail_transaksi_suplier] ADD FOREIGN KEY ([id_tran_sup]) REFERENCES [transaksi_suplier] ([id_tran_sup])
GO

ALTER TABLE [detail_transaksi_suplier] ADD FOREIGN KEY ([id_pabrik]) REFERENCES [pabrik] ([id_pabrik])
GO

ALTER TABLE [detail_pesanan_bbk] ADD FOREIGN KEY ([id_dt_tran_sup]) REFERENCES [detail_transaksi_suplier] ([id_dt_tran_sup])
GO

ALTER TABLE [pengiriman_produk] ADD FOREIGN KEY ([id_distributor]) REFERENCES [distributor] ([id_distributor])
GO

ALTER TABLE [detail_pengiriman] ADD FOREIGN KEY ([id_trans_peng]) REFERENCES [transaksi_pengiriman] ([id_trans_peng])
GO

ALTER TABLE [produksi_pabrik] ADD FOREIGN KEY ([id_pabrik]) REFERENCES [pabrik] ([id_pabrik])
GO

ALTER TABLE [detail_produksi_pabrik] ADD FOREIGN KEY ([id_produksi]) REFERENCES [produksi_pabrik] ([id_produksi])
GO

ALTER TABLE [produk_gudang] ADD FOREIGN KEY ([id_gudang]) REFERENCES [gudang] ([id_gudang])
GO

ALTER TABLE [produk_gudang] ADD FOREIGN KEY ([id_produk]) REFERENCES [produk] ([id_produk])
GO

ALTER TABLE [produk_toko] ADD FOREIGN KEY ([id_toko]) REFERENCES [toko] ([id_toko])
GO

ALTER TABLE [produk_toko] ADD FOREIGN KEY ([id_produk]) REFERENCES [produk] ([id_produk])
GO

ALTER TABLE [transaksi_pengiriman] ADD FOREIGN KEY ([id_pengiriman]) REFERENCES [pengiriman_produk] ([id_pengiriman])
GO

ALTER TABLE [transaksi_pengiriman] ADD FOREIGN KEY ([id_gudang]) REFERENCES [gudang] ([id_gudang])
GO

ALTER TABLE [detail_pengiriman] ADD FOREIGN KEY ([id_toko]) REFERENCES [toko] ([id_toko])
GO

ALTER TABLE [detail_pengiriman] ADD FOREIGN KEY ([id_produk]) REFERENCES [produk] ([id_produk])
GO

ALTER TABLE [detail_produksi_pabrik] ADD FOREIGN KEY ([id_produk]) REFERENCES [produk] ([id_produk])
GO


/*INPUT DATA TABEL*/
/*TABEL UTAMA*/
INSERT INTO	suplier VALUES
('S01BG', 'Bogel', 'Purbalingga', '089765432132', 'bogel@gmail.com'),
('S02RF', 'Rafael', 'Purwokerto', '089765432143', 'rfl@gmail.com'),
('S03SR', 'Siregar', 'Cilacap', '089765432123', 'srgar@gmail.com'),
('S04AP', 'Asep', 'Pekalongan', '089765432178', 'asp@gmail.com'),
('S05KL', 'Keling', 'Semarang', '089765432123', 'kling@gmail.com');

INSERT INTO distributor VALUES
('D01RL', 'Raul', 'Jawa Tengah', '082323946751', 'raul@gmail.com'),
('D02BD', 'Budiono', 'Jawa Timur', '082323946256', 'budi@gmail.com'),
('D03FR', 'Fernandes', 'Jawa Barat', '082323946464', 'fern@gmail.com'),
('D04SR', 'Surya', 'Bali', '082323946214', 'sry@gmail.com'),
('D05MT', 'Martin', 'Lampung', '082323946979', 'mrtn@gmail.com');

INSERT INTO pabrik VALUES
('P01', 'Pabrik 01', 'Firman', 'Cikarang', '082323946751', 30),
('P02', 'Pabrik 02', 'Agus', 'Karawang', '082323946363', 37),
('P03', 'Pabrik 03', 'Makmur', 'Tangerang', '082323946242', 35),
('P04', 'Pabrik 04', 'Sulis', 'Cilacap', '082323946776', 33),
('P05', 'Pabrik 05', 'Rizky', 'Sokaraja', '082323946968', 40);

INSERT INTO produk VALUES
('PDK01', 'Nastar', 30000),
('PDK02', 'Kastangel', 25000),
('PDK03', 'Putri Salju', 37000);

INSERT INTO gudang VALUES
('GD01', 'P01', 'Mega Manunggal', 'Walter', 700),
('GD02', 'P01', 'Suka Jaya', 'Romeo', 300),
('GD03', 'P02', 'Roman Picisan', 'Prilly', 500),
('GD04', 'P02', 'Guna Darma', 'Michael', 600),
('GD05', 'P03', 'Venus', 'Xavier', 800),
('GD06', 'P04', 'Mars', 'Sugeng', 270),
('GD07', 'P05', 'Curva Putih', 'Alucard', 450);

INSERT INTO toko VALUES
('TK01', 'Tong Fang', 'John Cina', 70, 'Kelapa Gading', '089764509923','tfg@gmail.com'),
('TK02', 'Berkat Abadi', 'Ling Ling', 60, 'Purbalingga', '089764509657','bai@gmail.com'),
('TK03', 'Feng Shui', 'Hansen', 75, 'Purwokerto', '089764509927','fsi@gmail.com'),
('TK04', 'Sudo Mukti', 'Mahmud', 65, 'Bogor', '089764509724','smi@gmail.com'),
('TK05', 'Bakrie Mart', 'Bento', 80, 'Bekasi', '089764509085','bmt@gmail.com');


/*TABEL PENDUKUNG SUPLIER*/
INSERT INTO transaksi_suplier VALUES
('TRS01', 'S01BG', 5000000, '2023-09-09'),
('TRS02', 'S01BG', 6000000, '2023-12-08'),
('TRS03', 'S02RF', 7500000, '2023-07-10'),
('TRS04', 'S03SR', 8000000, '2023-03-11'),
('TRS05', 'S03SR', 6500000, '2023-04-24'),
('TRS06', 'S04AP', 7000000, '2023-08-17'),
('TRS07', 'S05KL', 9000000, '2023-10-10');

INSERT INTO detail_transaksi_suplier VALUES
('DTS01', 'TRS01', 'P01', '2023-09-11', 250000, 3000000),
('DTS02', 'TRS01', 'P02', '2023-09-10', 400000, 2000000),
('DTS03', 'TRS02', 'P03', '2023-12-12', 450000, 4000000),
('DTS04', 'TRS02', 'P04', '2023-12-14', 350000, 2000000),
('DTS05', 'TRS03', 'P04', '2023-07-12', 300000, 7500000),
('DTS06', 'TRS04', 'P05', '2023-03-13', 500000, 8000000),
('DTS07', 'TRS05', 'P03', '2023-04-26', 550000, 3000000),
('DTS08', 'TRS05', 'P01', '2023-04-27', 600000, 3500000),
('DTS09', 'TRS06', 'P02', '2023-08-20', 650000, 7000000),
('DTS10', 'TRS07', 'P05', '2023-10-15', 575000, 9000000);

INSERT INTO detail_pesanan_bbk values
('DPS01', 'DTS01', 'Gula', 120, 2750000),
('DPS02', 'DTS02', 'Tepung Terigu', 110, 1600000),
('DPS03', 'DTS03', 'Keju', 150, 3550000),
('DPS04', 'DTS04', 'Telur', 55, 1650000),
('DPS05', 'DTS05', 'Mentega', 24, 7200000),
('DPS06', 'DTS06', 'Susu Cair', 375, 7500000),
('DPS07', 'DTS07', 'Garam', 50, 2450000),
('DPS08', 'DTS08', 'Selai Nanas', 152, 2900000),
('DPS09', 'DTS09', 'Gula Halus', 290, 6350000),
('DPS10', 'DTS10', 'Tepung Maizena', 400, 8425000);

/*TABEL PENDUKUNG PABRIK*/
INSERT INTO produksi_pabrik VALUES
('PRD01', 'P01', '2023-09-09', '2023-09-12'),
('PRD02', 'P01', '2023-09-16', '2023-09-18'),
('PRD03', 'P02', '2023-09-23', '2023-09-25'),
('PRD04', 'P03', '2023-09-27', '2023-09-30'),
('PRD05', 'P03', '2023-10-02', '2023-10-04'),
('PRD06', 'P04', '2023-10-06', '2023-10-08'),
('PRD07', 'P05', '2023-10-12', '2023-10-14');

INSERT INTO detail_produksi_pabrik VALUES
('DPR01', 'PRD01', 'PDK01', 500, 'GD01'),
('DPR02', 'PRD01', 'PDK02', 120, 'GD01'),
('DPR03', 'PRD02', 'PDK03', 200, 'GD02'),
('DPR04', 'PRD02', 'PDK02', 50, 'GD02'),
('DPR05', 'PRD03', 'PDK03', 200, 'GD03'),
('DPR06', 'PRD03', 'PDK01', 130, 'GD04'),
('DPR07', 'PRD04', 'PDK02', 550, 'GD05'),
('DPR08', 'PRD05', 'PDK03', 200, 'GD05'),
('DPR09', 'PRD06', 'PDK01', 200, 'GD06'),
('DPR10', 'PRD07', 'PDK02', 370, 'GD07');

INSERT INTO detail_produksi_pabrik VALUES
('DPR10', 'PRD07', 'PDK02', 370, 'GD07');

/*TABEL PENDUKUNG DISTRIBUTOR*/
INSERT INTO pengiriman_produk VALUES
('PRM01', 'D01RL'),
('PRM02', 'D01RL'),
('PRM03', 'D02BD'),
('PRM04', 'D03FR'),
('PRM05', 'D03FR'),
('PRM06', 'D04SR'),
('PRM07', 'D05MT');

INSERT INTO transaksi_pengiriman VALUES
('TRP01', 'PRM01', 'GD01', '2023-10-23', '2023-10-26', 200000),
('TRP02', 'PRM01', 'GD02', '2023-10-27', '2023-11-02', 450000),
('TRP03', 'PRM02', 'GD03', '2023-11-04', '2023-11-07', 300000),
('TRP04', 'PRM03', 'GD05', '2023-11-09', '2023-11-13', 350000),
('TRP05', 'PRM04', 'GD07', '2023-11-15', '2023-11-18', 250000),
('TRP06', 'PRM05', 'GD04', '2023-11-20', '2023-11-24', 370000),
('TRP07', 'PRM06', 'GD06', '2023-11-26', '2023-11-30', 460000),
('TRP08', 'PRM07', 'GD05', '2023-12-01', '2023-12-04', 500000);

INSERT INTO detail_pengiriman VALUES
('DTP01', 'TRP01', 'TK01', 'PDK01', 30),
('DTP02', 'TRP01', 'TK01', 'PDK03', 15),
('DTP03', 'TRP02', 'TK03', 'PDK02', 40),
('DTP04', 'TRP03', 'TK02', 'PDK03', 30),
('DTP05', 'TRP04', 'TK04', 'PDK01', 25),
('DTP06', 'TRP05', 'TK05', 'PDK02', 45),
('DTP07', 'TRP06', 'TK02', 'PDK03', 20),
('DTP08', 'TRP07', 'TK03', 'PDK01', 55),
('DTP09', 'TRP08', 'TK01', 'PDK02', 12);

/*TABEL PRODUK GUDANG*/
INSERT INTO produk_gudang VALUES
('PGD01', 'GD01', 'PDK01', 300, '2023-12-12'),
('PGD02', 'GD01', 'PDK02', 400, '2023-12-15'),
('PGD03', 'GD02', 'PDK03', 350, '2023-12-17'),
('PGD04', 'GD03', 'PDK02', 250, '2023-12-19'),
('PGD05', 'GD04', 'PDK01', 270, '2023-12-21'),
('PGD06', 'GD05', 'PDK02', 340, '2023-12-23'),
('PGD07', 'GD05', 'PDK01', 150, '2023-12-25'),
('PGD08', 'GD06', 'PDK03', 180, '2023-12-27'),
('PGD09', 'GD07', 'PDK02', 250, '2023-12-29');

/*TABEL PRODUK TOKO*/
INSERT INTO produk_toko VALUES
('PTK01', 'TK01', 'PDK01', 25, '2023-12-12'),
('PTK02', 'TK01', 'PDK03', 40, '2023-12-16'),
('PTK03', 'TK03', 'PDK02', 50, '2023-12-18'),
('PTK04', 'TK02', 'PDK03', 23, '2023-12-20'),
('PTK05', 'TK04', 'PDK01', 42, '2023-12-24'),
('PTK06', 'TK05', 'PDK02', 72, '2023-12-26'),
('PTK07', 'TK02', 'PDK03', 25, '2023-12-28'),
('PTK08', 'TK03', 'PDK01', 21, '2023-12-30'),
('PTK09', 'TK01', 'PDK02', 36, '2023-12-31');

/*CEK ISI TABEL*/
select * from suplier
select * from distributor
select * from pabrik
select * from gudang
select * from toko
select * from produk
---------------------------------
select * from transaksi_suplier
select * from detail_transaksi_suplier
select * from detail_pesanan_bbk
---------------------------------
select * from produksi_pabrik
select * from detail_produksi_pabrik
---------------------------------
select * from pengiriman_produk
select * from transaksi_pengiriman
select * from detail_pengiriman
---------------------------------
select * from produk_gudang
select * from produk_toko

INSERT INTO produk_toko values
('PTK10', 'TK04', 'PDK05', 17, '2024-01-03'),
('PTK11', 'TK05', 'PDK04', 26, '2024-01-10');

/*Modul 3&4*/
/*DELETE*/
DELETE FROM detail_produksi_pabrik
WHERE id_dt_prod = 'DPR10'

/*Modul 5&6*/
/*COUNT*/
SELECT COUNT (id_pabrik) AS jmlh_pabrik FROM pabrik

/*SUM*/
SELECT SUM (total_biaya) AS total_pengeluaran_bagi_suplier 
FROM transaksi_suplier

/*AVG*/
SELECT AVG (stok) AS avg_produk_di_toko FROM produk_toko

/*MIN*/
SELECT MIN (kapasitas) AS kapasitas_toko_terkecil FROM toko

/*MAX*/
SELECT MAX (jumlah_karyawan) AS kapasitas_karyawan_teranyak FROM pabrik

/*GROUP BY*/
SELECT id_produk, SUM (stok) AS jmlh_produk FROM produk_toko
GROUP BY id_produk

/*HAVING*/
SELECT id_produk, SUM (stok) AS stok
FROM produk_toko
GROUP BY id_produk
HAVING SUM(stok) > 88

/*Modul 7*/
/*INNER JOIN*/ 
SELECT distributor.nama_distributor, distributor.wilayah, transaksi_pengiriman.id_gudang, 
transaksi_pengiriman.tgl_kirim, transaksi_pengiriman.tgl_terima, transaksi_pengiriman.biaya
FROM distributor
JOIN pengiriman_produk ON distributor.id_distributor = pengiriman_produk.id_distributor
JOIN transaksi_pengiriman ON pengiriman_produk.id_pengiriman = transaksi_pengiriman.id_pengiriman

/*LEFT JOIN*/
SELECT pabrik.nama_pabrik, pabrik.alamat, gudang.nama_gudang, gudang.kapasitas 
FROM pabrik
LEFT JOIN gudang ON pabrik.id_pabrik = gudang.id_pabrik

/*RIGHT JOIN*/
SELECT toko.nama_toko, produk.nama_produk, produk_toko.stok
FROM toko
RIGHT JOIN produk_toko ON toko.id_toko = produk_toko.id_toko
RIGHT JOIN produk ON produk_toko.id_produk = produk.id_produk

/*MODUL 9*/
/*PROSEDUR DAFTAR PRODUK*/
CREATE PROCEDURE daftar_produk
AS
BEGIN
	SELECT nama_produk, harga
	FROM produk
	ORDER BY
		nama_produk
END

EXEC daftar_produk

/*PROSEDUR INPUT PRODUK*/
CREATE PROCEDURE input_produk
   @id_produk VARCHAR(5),
   @nama_produk VARCHAR(15),
   @harga INT
AS
BEGIN
	INSERT INTO produk values (@id_produk, @nama_produk, @harga);
END

EXEC input_produk 'PDK04', 'Chocochip', 40000
select * from produk

/*FUNCTION TOTAL STOK*/
CREATE FUNCTION dbo.StokNama
(
    @TokoID1 VARCHAR(5),
    @TokoID2 VARCHAR(5)
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
		NamaToko = tk.nama_toko,
        TotalStok = ISNULL(SUM(pt.stok), 0)
    FROM 
        toko tk
    LEFT JOIN 
        produk_toko pt ON tk.id_toko = pt.id_toko
    WHERE 
        tk.id_toko IN (@TokoID1, @TokoID2)
    GROUP BY 
        tk.nama_toko
);

SELECT * FROM dbo.StokNama('TK01', 'TK03')

DROP FUNCTION dbo.StokNama

/*MODUL 10*/
/*CONTROL FLOW STATEMENT*/
select id_dt_tran_sup, biaya_transport,
case
when biaya_transport > 0 and biaya_transport <= 500000 then 'Murah'
when biaya_transport > 500000 then 'Mahal'
else 'tidak diketahui'
end as Keterangan from detail_transaksi_suplier

/*AVG BIAYA PENGIRIMAN*/
if(select avg(biaya) from transaksi_pengiriman) > 200000
print 'rata rata biaya pengiriman boros';
else
print 'rata rata biaya pengiriman hemat';

/*NESTED IF LEVEL PRODUKSI*/
SELECT
    id_dt_prod,
	id_produk,
    jmlh_produksi,
    id_gudang,
    Level_Produksi =
        CASE
            WHEN jmlh_produksi < 0 THEN 'None'
            WHEN jmlh_produksi >= 50 AND jmlh_produksi < 100 THEN 'Low'
            WHEN jmlh_produksi >= 100 AND jmlh_produksi < 300 THEN 'Medium'
            WHEN jmlh_produksi >= 300 THEN 'High'
            ELSE 'Unknown'
        END
FROM
    detail_produksi_pabrik;

/*LOOPING WHILE UBAH KAPASITAS JIKA DI BAWAH 300*/
DECLARE @Minimum INT;

SET @Minimum = 300;

WHILE EXISTS (SELECT 1 FROM gudang WHERE kapasitas < @Minimum)
BEGIN
    UPDATE gudang
    SET kapasitas = kapasitas + kapasitas * 0.7
    WHERE kapasitas < @Minimum;
END

----------------------------------------------
update gudang
set kapasitas = 270 where id_gudang = 'GD06'
select * from gudang

/*MODUL 11*/

-- Deklarasi cursor
DECLARE cursor_produk CURSOR FOR
SELECT id_produk, nama_produk, harga
FROM produk;

DECLARE @id_produk varchar(5), @nama_produk varchar(15), @harga int;

OPEN cursor_produk;
FETCH NEXT FROM cursor_produk INTO @id_produk, @nama_produk, @harga;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Proses data sesuai kebutuhan
    PRINT 'Produk: ' + @nama_produk + ', Harga: ' + CAST(@harga AS varchar(10));
    FETCH NEXT FROM cursor_produk INTO @id_produk, @nama_produk, @harga;
END

-- Menutup cursor
CLOSE cursor_produk;
DEALLOCATE cursor_produk;
---------------------------------------------------------------------------------

-- Deklarasi cursor
DECLARE cursor_jumlah_produk_gudang CURSOR FOR
SELECT G.id_gudang, G.nama_gudang, COUNT(PG.id_prd_gud) as jumlah_produk
FROM gudang G
LEFT JOIN produk_gudang PG ON G.id_gudang = PG.id_gudang
GROUP BY G.id_gudang, G.nama_gudang;

DECLARE @id_gudang varchar(5), @nama_gudang varchar(15), @jumlah_produk int;
OPEN cursor_jumlah_produk_gudang;

FETCH NEXT FROM cursor_jumlah_produk_gudang INTO @id_gudang, @nama_gudang, @jumlah_produk;
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Gudang ' + @nama_gudang + ' memiliki ' + CAST(@jumlah_produk AS varchar(10)) + ' produk.';
    FETCH NEXT FROM cursor_jumlah_produk_gudang INTO @id_gudang, @nama_gudang, @jumlah_produk;
END

-- Menutup cursor
CLOSE cursor_jumlah_produk_gudang;
DEALLOCATE cursor_jumlah_produk_gudang;


/*MODUL 12*/

/* trigger notif stok jika kurang dari 25*/
DROP TRIGGER IF EXISTS notifstok;
GO
CREATE TRIGGER notifstok ON produk_toko INSTEAD OF INSERT
AS BEGIN
	DECLARE @id_produk_toko VARCHAR(5);
	DECLARE @id_toko VARCHAR(5);
	DECLARE @id_produk VARCHAR(15);
	DECLARE @stok int;
	DECLARE @tgl_update VARCHAR(10);

	SELECT @id_produk_toko = id_prd_tok, @id_toko = id_toko, @id_produk = id_produk, @stok = stok, @tgl_update = tgl_update
	FROM INSERTED;
	
	if @stok <= 25
	PRINT 'Input stok produk harus lebih dari 25'
	END;


insert into produk_toko values
('PTK12', 'TK03', 'PDK05', 5, '2024-01-15');
select * from produk_toko


/*trigger set harga otomatis ke 50000*/s
DROP TRIGGER IF EXISTS minimum_harga;
GO
CREATE TRIGGER minimum_harga ON produk INSTEAD OF INSERT
AS BEGIN
	DECLARE @id_produk VARCHAR(5);
	DECLARE @nama_produk VARCHAR(5);
	DECLARE @harga int;

	SELECT @id_produk = id_produk, @nama_produk = nama_produk, @harga = harga
	FROM INSERTED

	if @harga <= 50000 set @harga = 50000
	insert into produk (id_produk, nama_produk, harga)
	values(@id_produk, @nama_produk, @harga);

	END;

insert into produk values
('PDK05', 'Chess Cake', 20000);
select * from produk


/*MODUL 13*/
/*VIEW JOIN TABLE*/
CREATE VIEW transview AS 
SELECT 
transaksi_suplier.id_tran_sup, 
detail_pesanan_bbk.bahan_baku, 
detail_pesanan_bbk.jumlah_dipesan, 
detail_pesanan_bbk.total_biaya

FROM transaksi_suplier 

JOIN detail_transaksi_suplier 
ON transaksi_suplier.id_tran_sup = detail_transaksi_suplier.id_tran_sup
JOIN detail_pesanan_bbk 
ON detail_transaksi_suplier.id_dt_tran_sup = detail_pesanan_bbk.id_dt_tran_sup

select * from transview

/*Trigger hitung total biaya*/
DROP TRIGGER IF EXISTS trg_UpdateTotalBiaya
GO
CREATE TRIGGER trg_UpdateTotalBiaya
ON detail_transaksi_suplier
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @id_tran_sup varchar(5);
    DECLARE @total_biaya int;

    -- Mendapatkan id_tran_sup dari record yang dipengaruhi oleh operasi INSERT, UPDATE, atau DELETE
    SELECT @id_tran_sup = id_tran_sup FROM inserted;

    -- Menghitung total_biaya dari tabel detail_transaksi_suplier untuk id_tran_sup tertentu
    SELECT @total_biaya = SUM(total_biaya) FROM detail_transaksi_suplier WHERE id_tran_sup = @id_tran_sup;

    -- Memperbarui total_biaya di tabel transaksi_suplier
    UPDATE transaksi_suplier SET total_biaya = @total_biaya WHERE id_tran_sup = @id_tran_sup;
END;

insert into transaksi_suplier values
('TRS08', 'S05KL', 1, '2024-01-15');

insert into detail_transaksi_suplier values
('DTS11', 'TRS08', 'P01', '2024-01-15', 250000, 1200000),
('DTS12', 'TRS08', 'P01', '2024-01-16', 500000, 2000000);


select * from transaksi_suplier
select * from detail_transaksi_suplier