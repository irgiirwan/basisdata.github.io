-- Nama: A. Irgi Irwan. A
-- Nim: D0224318

-- create Database
CREATE DATABASE db_perkuliahan;
-- masuk ke dalam database
use db_perkuliahan; -- di MYSQL
\c db_perkuliahan; -- di POSTGRESQL

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE dosen (
    id_dosen INT AUTO_INCREMENT PRIMARY KEY,
    nip VARCHAR(10) NOT NULL UNIQUE,
    nama_dosen VARCHAR(100) NOT NULL
); -- di MYSQL

CREATE TABLE dosen (
    id_dosen SERIAL PRIMARY KEY,
    nip VARCHAR(10) NOT NULL UNIQUE,
    nama_dosen VARCHAR(100) NOT NULL
); -- DI POSTGRESQL

--
-- Insert data untuk tabel `dosen`
--

INSERT INTO dosen (id_dosen, nip, nama_dosen) VALUES
(1, '012345678', 'Prof. Dr. Ir. Bambang Sutedjo'),
(2, '023456789', 'Dr. Andi Wijaya, S.Kom., M.Kom.'),
(3, '034567891', 'Dr. Lestari Handayani, S.T., M.T.'),
(4, '045678912', 'Ahmad Fauzi, S.Si., M.Cs.'),
(5, '056789123', 'Siti Aminah, M.Kom.'),
(6, '067891234', 'Ir. Hendra Kusuma, M.Eng.'),
(7, '078912345', 'Rina Permata, S.T., M.T.'),
(8, '089123456', 'Dr. Chandra Kusuma, S.Kom., Ph.D.'),
(9, '091234567', 'Dedi Setiawan, M.Kom.'),
(10, '102345678', 'Prof. Dr. Susilo Wibowo'),
(11, '113456789', 'Tanti Rahayu, S.Kom., M.Cs.'),
(12, '124567891', 'Yudi Hermawan, S.T., M.T.'),
(13, '135678912', 'Fitriani, M.Eng.'),
(14, '146789123', 'Galih Prakoso, S.Si., M.Si.'),
(15, '157891234', 'Nia Kurnia, Ph.D.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `krs`
--

CREATE TABLE krs (
    id_krs INT AUTO_INCREMENT PRIMARY KEY,
    id_mahasiswa INT NOT NULL,
    id_matakuliah INT NOT NULL,
    id_dosen INT NOT NULL,
    semester_ambil VARCHAR(20) NOT NULL,
    nilai_huruf CHAR(2),
    FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa(id_mahasiswa),
    FOREIGN KEY (id_matakuliah) REFERENCES matakuliah(id_matakuliah),
    FOREIGN KEY (id_dosen) REFERENCES dosen(id_dosen)
); -- DI MYSQL

CREATE TABLE krs (
    id_krs SERIAL PRIMARY KEY,
    id_mahasiswa SERIAL NOT NULL,
    id_matakuliah SERIAL NOT NULL,
    id_dosen INT NOT NULL,
    semester_ambil VARCHAR(20) NOT NULL,
    nilai_huruf CHAR(2),
    FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa(id_mahasiswa),
    FOREIGN KEY (id_matakuliah) REFERENCES matakuliah(id_matakuliah),
    FOREIGN KEY (id_dosen) REFERENCES dosen(id_dosen)
); -- DI POSTGRESQL

--
-- Insert data untuk tabel `krs`
--

INSERT INTO krs (id_krs, id_mahasiswa, id_matakuliah, id_dosen, semester_ambil, nilai_huruf) VALUES
(1, 1, 1, 10, 'Gasal 2024/2025', 'A'),
(2, 1, 2, 5, 'Gasal 2024/2025', 'B'),
(3, 1, 3, 14, 'Gasal 2024/2025', 'A'),
(4, 2, 1, 10, 'Gasal 2024/2025', 'A'),
(5, 2, 2, 5, 'Gasal 2024/2025', 'A'),
(6, 2, 3, 14, 'Gasal 2024/2025', 'B'),
(7, 3, 1, 10, 'Gasal 2024/2025', 'B'),
(8, 3, 2, 5, 'Gasal 2024/2025', 'B'),
(9, 3, 3, 14, 'Gasal 2024/2025', 'C'),
(10, 4, 4, 3, 'Gasal 2024/2025', 'A'),
(11, 4, 5, 4, 'Gasal 2024/2025', 'A'),
(12, 4, 6, 6, 'Gasal 2024/2025', 'B'),
(13, 5, 4, 3, 'Gasal 2024/2025', 'B'),
(14, 5, 5, 4, 'Gasal 2024/2025', 'A'),
(15, 5, 6, 6, 'Gasal 2024/2025', 'B');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE mahasiswa (
    id_mahasiswa INT AUTO_INCREMENT PRIMARY KEY,
    nim VARCHAR(15) NOT NULL UNIQUE,
    nama_mahasiswa VARCHAR(100) NOT NULL,
    jenis_kelamin ENUM('L', 'P') NOT NULL,
    tanggal_lahir DATE,
    asal_kota VARCHAR(50),
    angkatan YEAR
); -- DI MYSQL

CREATE TABLE mahasiswa (
    id_mahasiswa SERIAL PRIMARY KEY,
    nim VARCHAR(15) NOT NULL UNIQUE,
    nama_mahasiswa VARCHAR(100) NOT NULL,
    jenis_kelamin VARCHAR(1) NOT NULL CHECK (jenis_kelamin IN ('L', 'P')),
    tanggal_lahir DATE,
    asal_kota VARCHAR(50),
    angkatan INT
); -- DIPOSTGRESQL

--
-- Insert data untuk tabel `mahasiswa`
--

INSERT INTO mahasiswa (id_mahasiswa, nim, nama_mahasiswa, jenis_kelamin, tanggal_lahir, asal_kota, angkatan) VALUES
(1, 'D0225001', 'Ahmad', 'L', '2007-05-12', 'Bandung', '2025'),
(2, 'D0224002', 'Siti', 'P', '2006-08-21', 'Surabaya', '2024'),
(3, 'D0223003', 'Budi', 'L', '2005-01-15', 'Jakarta', '2023'),
(4, 'D0222004', 'Dewi', 'P', '2004-11-30', 'Medan', '2022'),
(5, 'D0221005', 'Rizky', 'L', '2003-07-08', 'Makassar', '2021'),
(6, 'D0221006', 'Putri', 'P', '2003-02-25', 'Yogyakarta', '2021'),
(7, 'D0222007', 'Eko', 'L', '2004-09-19', 'Semarang', '2022'),
(8, 'D0223008', 'Ana', 'P', '2005-12-05', 'Palembang', '2023'),
(9, 'D0224009', 'Fajar', 'L', '2006-03-22', 'Denpasar', '2024'),
(10, 'D0225010', 'Maya', 'P', '2007-06-10', 'Balikpapan', '2025'),
(11, 'D0225011', 'Hendra', 'L', '2007-10-01', 'Malang', '2025'),
(12, 'D0224012', 'Ratna', 'P', '2006-04-18', 'Pekanbaru', '2024'),
(13, 'D0223013', 'Doni', 'L', '2005-08-14', 'Bandar Lampung', '2023'),
(14, 'D0222014', 'Widiastuti', 'P', '2004-05-28', 'Bogor', '2022'),
(15, 'D0221015', 'Bayu', 'L', '2003-01-07', 'Tangerang', '2021');

-- --------------------------------------------------------

--
-- Struktur dari tabel `matakuliah`
--

CREATE TABLE matakuliah (
    id_matakuliah INT AUTO_INCREMENT PRIMARY KEY,
    kode_matakuliah VARCHAR(10) NOT NULL UNIQUE,
    nama_matakuliah VARCHAR(100) NOT NULL,
    sks TINYINT NOT NULL,
    semester TINYINT NOT NULL,
    jenis_matakuliah ENUM('Wajib', 'Pilihan') NOT NULL
); -- DI MYSQL

CREATE TABLE matakuliah (
    id_matakuliah SERIAL PRIMARY KEY,
    kode_matakuliah VARCHAR(10) NOT NULL UNIQUE,
    nama_matakuliah VARCHAR(100) NOT NULL,
    sks SMALLINT NOT NULL,
    semester SMALLINT NOT NULL,
    jenis_matakuliah VARCHAR(10) NOT NULL CHECK (jenis_matakuliah IN ('Wajib', 'Pilihan'))
); -- POSTGRESQL

--
-- Insert data untuk tabel `matakuliah`
--

INSERT INTO matakuliah (id_matakuliah, kode_matakuliah, nama_matakuliah, sks, semester, jenis_matakuliah) VALUES
(1, 'IF101', 'Mikrokontroler', 3, 3, 'Wajib'),
(2, 'IF102', 'Pemrograman Berorientasi Objek', 3, 2, 'Wajib'),
(3, 'IF103', 'Matematika Diskrit', 3, 1, 'Wajib'),
(4, 'IF201', 'Pemrograman Web', 3, 3, 'Wajib'),
(5, 'IF202', 'Basis Data', 3, 3, 'Wajib'),
(6, 'IF203', 'Sistem Operasi', 3, 2, 'Wajib'),
(7, 'IF301', 'Rekayasa Perangkat Lunak', 3, 5, 'Wajib'),
(8, 'IF302', 'Jaringan Komputer', 3, 5, 'Wajib'),
(9, 'IF303', 'Pemrograman Mobile', 3, 5, 'Pilihan'),
(10, 'IF401', 'Aljabar Linear', 3, 3, 'Pilihan'),
(11, 'IF402', 'Keamanan Siber', 3, 4, 'Pilihan'),
(12, 'IF403', 'Interaksi Mansuia Komputer', 3, 3, 'Pilihan'),
(13, 'IF404', 'Algoritmna', 3, 3, 'Pilihan'),
(14, 'IF405', 'Big Data Analytics', 3, 4, 'Pilihan'),
(15, 'IF501', 'Grafika Komputer', 3, 3, 'Wajib');



-- Menampilkan Seluruh Isi table
select * from mahasiswa;
+--------------+----------+----------------+---------------+---------------+----------------+----------+
| id_mahasiswa | nim      | nama_mahasiswa | jenis_kelamin | tanggal_lahir | asal_kota      | angkatan |
+--------------+----------+----------------+---------------+---------------+----------------+----------+
|            1 | D0225001 | Ahmad          | L             | 2007-05-12    | Bandung        |     2025 |
|            2 | D0224002 | Siti           | P             | 2006-08-21    | Surabaya       |     2024 |
|            3 | D0223003 | Budi           | L             | 2005-01-15    | Jakarta        |     2023 |
|            4 | D0222004 | Dewi           | P             | 2004-11-30    | Medan          |     2022 |
|            5 | D0221005 | Rizky          | L             | 2003-07-08    | Makassar       |     2021 |
|            6 | D0221006 | Putri          | P             | 2003-02-25    | Yogyakarta     |     2021 |
|            7 | D0222007 | Eko            | L             | 2004-09-19    | Semarang       |     2022 |
|            8 | D0223008 | Ana            | P             | 2005-12-05    | Palembang      |     2023 |
|            9 | D0224009 | Fajar          | L             | 2006-03-22    | Denpasar       |     2024 |
|           10 | D0225010 | Maya           | P             | 2007-06-10    | Balikpapan     |     2025 |
|           11 | D0225011 | Hendra         | L             | 2007-10-01    | Malang         |     2025 |
|           12 | D0224012 | Ratna          | P             | 2006-04-18    | Pekanbaru      |     2024 |
|           13 | D0223013 | Doni           | L             | 2005-08-14    | Bandar Lampung |     2023 |
|           14 | D0222014 | Widiastuti     | P             | 2004-05-28    | Bogor          |     2022 |
|           15 | D0221015 | Bayu           | L             | 2003-01-07    | Tangerang      |     2021 |
+--------------+----------+----------------+---------------+---------------+----------------+----------+

select * from matakuliah;
+---------------+-----------------+--------------------------------+-----+----------+------------------+
| id_matakuliah | kode_matakuliah | nama_matakuliah                | sks | semester | jenis_matakuliah |
+---------------+-----------------+--------------------------------+-----+----------+------------------+
|             1 | IF101           | Mikrokontroler                 |   3 |        3 | Wajib            |
|             2 | IF102           | Pemrograman Berorientasi Objek |   3 |        2 | Wajib            |
|             3 | IF103           | Matematika Diskrit             |   3 |        1 | Wajib            |
|             4 | IF201           | Pemrograman Web                |   3 |        3 | Wajib            |
|             5 | IF202           | Basis Data                     |   3 |        3 | Wajib            |
|             6 | IF203           | Sistem Operasi                 |   3 |        2 | Wajib            |
|             7 | IF301           | Rekayasa Perangkat Lunak       |   3 |        5 | Wajib            |
|             8 | IF302           | Jaringan Komputer              |   3 |        5 | Wajib            |
|             9 | IF303           | Pemrograman Mobile             |   3 |        5 | Pilihan          |
|            10 | IF401           | Aljabar Linear                 |   3 |        3 | Pilihan          |
|            11 | IF402           | Keamanan Siber                 |   3 |        4 | Pilihan          |
|            12 | IF403           | Interaksi Mansuia Komputer     |   3 |        3 | Pilihan          |
|            13 | IF404           | Algoritmna                     |   3 |        3 | Pilihan          |
|            14 | IF405           | Big Data Analytics             |   3 |        4 | Pilihan          |
|            15 | IF501           | Grafika Komputer               |   3 |        3 | Wajib            |
+---------------+-----------------+--------------------------------+-----+----------+------------------+

select * from dosen;
+----------+-----------+-----------------------------------+
| id_dosen | nip       | nama_dosen                        |
+----------+-----------+-----------------------------------+
|        1 | 012345678 | Prof. Dr. Ir. Bambang Sutedjo     |
|        2 | 023456789 | Dr. Andi Wijaya, S.Kom., M.Kom.   |
|        3 | 034567891 | Dr. Lestari Handayani, S.T., M.T. |
|        4 | 045678912 | Ahmad Fauzi, S.Si., M.Cs.         |
|        5 | 056789123 | Siti Aminah, M.Kom.               |
|        6 | 067891234 | Ir. Hendra Kusuma, M.Eng.         |
|        7 | 078912345 | Rina Permata, S.T., M.T.          |
|        8 | 089123456 | Dr. Chandra Kusuma, S.Kom., Ph.D. |
|        9 | 091234567 | Dedi Setiawan, M.Kom.             |
|       10 | 102345678 | Prof. Dr. Susilo Wibowo           |
|       11 | 113456789 | Tanti Rahayu, S.Kom., M.Cs.       |
|       12 | 124567891 | Yudi Hermawan, S.T., M.T.         |
|       13 | 135678912 | Fitriani, M.Eng.                  |
|       14 | 146789123 | Galih Prakoso, S.Si., M.Si.       |
|       15 | 157891234 | Nia Kurnia, Ph.D.                 |
+----------+-----------+-----------------------------------+

select * from krs;
+--------+--------------+---------------+----------+-----------------+-------------+
| id_krs | id_mahasiswa | id_matakuliah | id_dosen | semester_ambil  | nilai_huruf |
+--------+--------------+---------------+----------+-----------------+-------------+
|      1 |            1 |             1 |       10 | Gasal 2024/2025 | A           |
|      2 |            1 |             2 |        5 | Gasal 2024/2025 | B           |
|      3 |            1 |             3 |       14 | Gasal 2024/2025 | A           |
|      4 |            2 |             1 |       10 | Gasal 2024/2025 | A           |
|      5 |            2 |             2 |        5 | Gasal 2024/2025 | A           |
|      6 |            2 |             3 |       14 | Gasal 2024/2025 | B           |
|      7 |            3 |             1 |       10 | Gasal 2024/2025 | B           |
|      8 |            3 |             2 |        5 | Gasal 2024/2025 | B           |
|      9 |            3 |             3 |       14 | Gasal 2024/2025 | C           |
|     10 |            4 |             4 |        3 | Gasal 2024/2025 | A           |
|     11 |            4 |             5 |        4 | Gasal 2024/2025 | A           |
|     12 |            4 |             6 |        6 | Gasal 2024/2025 | B           |
|     13 |            5 |             4 |        3 | Gasal 2024/2025 | B           |
|     14 |            5 |             5 |        4 | Gasal 2024/2025 | A           |
|     15 |            5 |             6 |        6 | Gasal 2024/2025 | B           |
+--------+--------------+---------------+----------+-----------------+-------------+