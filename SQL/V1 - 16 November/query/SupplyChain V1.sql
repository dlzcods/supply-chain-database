use SupplyChain

CREATE TABLE [suplier] (
  [id_suplier] varchar(50) PRIMARY KEY NOT NULL,
  [nama_suplier] varchar(50) NOT NULL,
  [bahan_baku] varchar(50) NOT NULL,
  [harga_bahan_baku] int NOT NULL,
  [jumlah_pesanan] int NOT NULL,
  [alamat] varchar(50) NOT NULL,
  [no_hp] varchar(50) NOT NULL,
  [email] varchar(50) NOT NULL
)
GO

INSERT INTO suplier values
('A1', 'Darman', 'Tepung Terigu', 12000, 40, 'Purwokerto', '083214567', 'darman12@gmail.com');

CREATE TABLE [distributor] (
  [id_distributor] varchar(50) PRIMARY KEY NOT NULL,
  [nama_distributor] varchar(50) NOT NULL,
  [id_gudang] varchar(50) NOT NULL,
  [id_produk] varchar(50) NOT NULL,
  [id_toko] varchar(50) NOT NULL,
  [wilayah] varchar(50) NOT NULL,
  [no_hp] varchar(50) NOT NULL,
  [email] varchar(50) NOT NULL
)
GO

INSERT INTO distributor values
('AB1', 'Junaidi', );

CREATE TABLE [toko] (
  [id_toko] varchar(50) PRIMARY KEY NOT NULL,
  [nama_toko] varchar(50) NOT NULL,
  [manager_toko] varchar(50) NOT NULL,
  [id_distributor] varchar(50) NOT NULL,
  [id_produk] varchar(50) NOT NULL,
  [stok] int,
  [alamat] varchar(50) NOT NULL,
  [no_hp] varchar(50) NOT NULL,
  [email] varchar(50) NOT NULL
)
GO

CREATE TABLE [produk] (
  [id_produk] varchar(50) PRIMARY KEY NOT NULL,
  [nama_produk] varchar(50) NOT NULL,
  [stok] int
)
GO

CREATE TABLE [gudang] (
  [id_gudang] varchar(50) PRIMARY KEY NOT NULL,
  [nama_gudang] varchar(50) NOT NULL,
  [kepala_gudang] varchar(50) NOT NULL,
  [id_distributor] varchar(50) NOT NULL,
  [id_produk] varchar(50) NOT NULL,
  [stok] int,
  [wilayah] varchar(50) NOT NULL
)
GO

-- Adding Foreign Key
ALTER TABLE [distributor] ADD FOREIGN KEY ([id_gudang], [id_produk]) REFERENCES [gudang] ([id_gudang]), [produk] ([id_produk]);
GO

ALTER TABLE [gudang_distributor] ADD FOREIGN KEY ([distributor_id_gudang]) REFERENCES [gudang] ([id_gudang]);
GO