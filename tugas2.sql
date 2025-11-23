-- Nama: A. Irgi Irwan. A
-- Nim: D0224318

--  menggunakan perintah where dan between

-- WHERE
SELECT * FROM krs WHERE nilai_huruf = 'A';
+--------+--------------+---------------+----------+-----------------+-------------+
| id_krs | id_mahasiswa | id_matakuliah | id_dosen | semester_ambil  | nilai_huruf |
+--------+--------------+---------------+----------+-----------------+-------------+
|      1 |            1 |             1 |       10 | Gasal 2024/2025 | A           |
|      3 |            1 |             3 |       14 | Gasal 2024/2025 | A           |
|      4 |            2 |             1 |       10 | Gasal 2024/2025 | A           |
|      5 |            2 |             2 |        5 | Gasal 2024/2025 | A           |
|     10 |            4 |             4 |        3 | Gasal 2024/2025 | A           |
|     11 |            4 |             5 |        4 | Gasal 2024/2025 | A           |
|     14 |            5 |             5 |        4 | Gasal 2024/2025 | A           |
+--------+--------------+---------------+----------+-----------------+-------------+

SELECT * FROM mahasiswa WHERE jenis_kelamin = 'L';
 id_mahasiswa |   nim    | nama_mahasiswa | jenis_kelamin | tanggal_lahir |   asal_kota    | angkatan
--------------+----------+----------------+---------------+---------------+----------------+----------
            1 | D0225001 | Ahmad          | L             | 2007-05-12    | Bandung        |     2025
            3 | D0223003 | Budi           | L             | 2005-01-15    | Jakarta        |     2023
            5 | D0221005 | Rizky          | L             | 2003-07-08    | Makassar       |     2021
            7 | D0222007 | Eko            | L             | 2004-09-19    | Semarang       |     2022
            9 | D0224009 | Fajar          | L             | 2006-03-22    | Denpasar       |     2024
           11 | D0225011 | Hendra         | L             | 2007-10-01    | Malang         |     2025
           13 | D0223013 | Doni           | L             | 2005-08-14    | Bandar Lampung |     2023
           15 | D0221015 | Bayu           | L             | 2003-01-07    | Tangerang      |     2021

SELECT * FROM matakuliah WHERE semester = 3;
+---------------+-----------------+----------------------------+-----+----------+------------------+
| id_matakuliah | kode_matakuliah | nama_matakuliah            | sks | semester | jenis_matakuliah |
+---------------+-----------------+----------------------------+-----+----------+------------------+
|             1 | IF101           | Mikrokontroler             |   3 |        3 | Wajib            |
|             4 | IF201           | Pemrograman Web            |   3 |        3 | Wajib            |
|             5 | IF202           | Basis Data                 |   3 |        3 | Wajib            |
|            10 | IF401           | Aljabar Linear             |   3 |        3 | Pilihan          |
|            12 | IF403           | Interaksi Mansuia Komputer |   3 |        3 | Pilihan          |
|            13 | IF404           | Algoritmna                 |   3 |        3 | Pilihan          |
|            15 | IF501           | Grafika Komputer           |   3 |        3 | Wajib            |
+---------------+-----------------+----------------------------+-----+----------+------------------+


-- BETWEEN
SELECT * FROM krs WHERE nilai_huruf BETWEEN 'B' AND 'C';
 id_krs | id_mahasiswa | id_matakuliah | id_dosen | semester_ambil  | nilai_huruf
--------+--------------+---------------+----------+-----------------+-------------
      2 |            1 |             2 |        5 | Gasal 2024/2025 | B
      6 |            2 |             3 |       14 | Gasal 2024/2025 | B
      7 |            3 |             1 |       10 | Gasal 2024/2025 | B
      8 |            3 |             2 |        5 | Gasal 2024/2025 | B
      9 |            3 |             3 |       14 | Gasal 2024/2025 | C
     12 |            4 |             6 |        6 | Gasal 2024/2025 | B
     13 |            5 |             4 |        3 | Gasal 2024/2025 | B
     15 |            5 |             6 |        6 | Gasal 2024/2025 | B

SELECT * FROM matakuliah WHERE semester BETWEEN 2 AND 4;
+---------------+-----------------+--------------------------------+-----+----------+------------------+
| id_matakuliah | kode_matakuliah | nama_matakuliah                | sks | semester | jenis_matakuliah |
+---------------+-----------------+--------------------------------+-----+----------+------------------+
|             1 | IF101           | Mikrokontroler                 |   3 |        3 | Wajib            |
|             2 | IF102           | Pemrograman Berorientasi Objek |   3 |        2 | Wajib            |
|             4 | IF201           | Pemrograman Web                |   3 |        3 | Wajib            |
|             5 | IF202           | Basis Data                     |   3 |        3 | Wajib            |
|             6 | IF203           | Sistem Operasi                 |   3 |        2 | Wajib            |
|            10 | IF401           | Aljabar Linear                 |   3 |        3 | Pilihan          |
|            11 | IF402           | Keamanan Siber                 |   3 |        4 | Pilihan          |
|            12 | IF403           | Interaksi Mansuia Komputer     |   3 |        3 | Pilihan          |
|            13 | IF404           | Algoritmna                     |   3 |        3 | Pilihan          |
|            14 | IF405           | Big Data Analytics             |   3 |        4 | Pilihan          |
|            15 | IF501           | Grafika Komputer               |   3 |        3 | Wajib            |
+---------------+-----------------+--------------------------------+-----+----------+------------------+

SELECT * FROM mahasiswa WHERE angkatan BETWEEN 2022 AND 2024;
 id_mahasiswa |   nim    | nama_mahasiswa | jenis_kelamin | tanggal_lahir |   asal_kota    | angkatan
--------------+----------+----------------+---------------+---------------+----------------+----------
            2 | D0224002 | Siti           | P             | 2006-08-21    | Surabaya       |     2024
            3 | D0223003 | Budi           | L             | 2005-01-15    | Jakarta        |     2023
            4 | D0222004 | Dewi           | P             | 2004-11-30    | Medan          |     2022
            7 | D0222007 | Eko            | L             | 2004-09-19    | Semarang       |     2022
            8 | D0223008 | Ana            | P             | 2005-12-05    | Palembang      |     2023
            9 | D0224009 | Fajar          | L             | 2006-03-22    | Denpasar       |     2024
           12 | D0224012 | Ratna          | P             | 2006-04-18    | Pekanbaru      |     2024
           13 | D0223013 | Doni           | L             | 2005-08-14    | Bandar Lampung |     2023
           14 | D0222014 | Widiastuti     | P             | 2004-05-28    | Bogor          |     2022


