-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for reservasitiketpesawat
CREATE DATABASE IF NOT EXISTS `reservasitiketpesawat` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `reservasitiketpesawat`;

-- Dumping structure for table reservasitiketpesawat.bandara
CREATE TABLE IF NOT EXISTS `bandara` (
  `idBandara` varchar(100) NOT NULL,
  `namaBandara` varchar(100) NOT NULL,
  `kota` varchar(100) NOT NULL,
  `negara` varchar(100) NOT NULL,
  PRIMARY KEY (`idBandara`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table reservasitiketpesawat.bandara: ~15 rows (approximately)
INSERT INTO `bandara` (`idBandara`, `namaBandara`, `kota`, `negara`) VALUES
	('B001', 'Soekarno-Hatta International Airport', 'Jakarta', 'Indonesia'),
	('B002', 'Ngurah Rai International Airport', 'Denpasar', 'Indonesia'),
	('B003', 'Juanda International Airport', 'Surabaya', 'Indonesia'),
	('B004', 'Hasanuddin International Airport', 'Makassar', 'Indonesia'),
	('B005', 'Kuala Namu International Airport', 'Medan', 'Indonesia'),
	('B006', 'Hang Nadim International Airport', 'Batam', 'Indonesia'),
	('B007', 'Sultan Aji Muhammad Sulaiman Airport', 'Balikpapan', 'Indonesia'),
	('B008', 'Sultan Hasanuddin International Airport', 'Makassar', 'Indonesia'),
	('B009', 'Adisutjipto International Airport', 'Yogyakarta', 'Indonesia'),
	('B010', 'Achmad Yani International Airport', 'Semarang', 'Indonesia'),
	('B011', 'Sultan Iskandar Muda International Airport', 'Banda Aceh', 'Indonesia'),
	('B012', 'Sam Ratulangi International Airport', 'Manado', 'Indonesia'),
	('B013', 'Supadio International Airport', 'Pontianak', 'Indonesia'),
	('B014', 'Sultan Thaha Airport', 'Jambi', 'Indonesia'),
	('B015', 'Minangkabau International Airport', 'Padang', 'Indonesia');

-- Dumping structure for table reservasitiketpesawat.pelanggan
CREATE TABLE IF NOT EXISTS `pelanggan` (
  `idPelanggan` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nomorTelepon` varchar(20) DEFAULT NULL,
  `alamat` text,
  PRIMARY KEY (`idPelanggan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table reservasitiketpesawat.pelanggan: ~16 rows (approximately)
INSERT INTO `pelanggan` (`idPelanggan`, `nama`, `email`, `nomorTelepon`, `alamat`) VALUES
	('P001', 'John Doe', 'johndoe@example.com', '081234567890', 'Jl. Merdeka No.1'),
	('P002', 'Jane Smith', 'janesmith@example.com', '081234567891', 'Jl. Sudirman No.2'),
	('P003', 'Michael Johnson', 'michaelj@example.com', '081234567892', 'Jl. Thamrin No.3'),
	('P004', 'Emily Davis', 'emilyd@example.com', '081234567893', 'Jl. Gatot Subroto No.4'),
	('P005', 'David Brown', 'davidb@example.com', '081234567894', 'Jl. Diponegoro No.5'),
	('P006', 'Sarah Wilson', 'sarahw@example.com', '081234567895', 'Jl. Hayam Wuruk No.6'),
	('P007', 'James Taylor', 'jamest@example.com', '081234567896', 'Jl. Sabang No.7'),
	('P008', 'Jessica Lee', 'jessical@example.com', '081234567897', 'Jl. Kaliurang No.8'),
	('P009', 'William Harris', 'williamh@example.com', '081234567898', 'Jl. Malioboro No.9'),
	('P010', 'Sophia Martin', 'sophiam@example.com', '081234567899', 'Jl. Jaksa No.10'),
	('P011', 'Christopher White', 'chrisw@example.com', '081234567900', 'Jl. Gajah Mada No.11'),
	('P012', 'Olivia Lewis', 'olivial@example.com', '081234567901', 'Jl. Sudirman No.12'),
	('P013', 'Daniel Walker', 'danielw@example.com', '081234567902', 'Jl. Thamrin No.13'),
	('P014', 'Natalie Hall', 'natalieh@example.com', '081234567903', 'Jl. Merdeka No.14'),
	('P015', 'Matthew King', 'matthewk@example.com', '081234567904', 'Jl. Sabang No.15'),
	('P016', 'Budi Santoso', 'budi.santoso@example.com', '081234567890', 'Jl. Jenderal Sudirman No. 123, Jakarta');

-- Dumping structure for table reservasitiketpesawat.pembayaran
CREATE TABLE IF NOT EXISTS `pembayaran` (
  `idPembayaran` varchar(100) NOT NULL,
  `idReservasi` varchar(100) DEFAULT NULL,
  `tanggalPembayaran` date NOT NULL,
  `jumlah` decimal(10,2) NOT NULL,
  `metodePembayaran` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idPembayaran`),
  KEY `idReservasi` (`idReservasi`),
  CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`idReservasi`) REFERENCES `reservasi` (`idReservasi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table reservasitiketpesawat.pembayaran: ~14 rows (approximately)
INSERT INTO `pembayaran` (`idPembayaran`, `idReservasi`, `tanggalPembayaran`, `jumlah`, `metodePembayaran`) VALUES
	('PY002', 'R002', '2024-05-02', 200.00, 'Debit Card'),
	('PY003', 'R003', '2024-05-03', 180.00, 'Cash'),
	('PY004', 'R004', '2024-05-04', 220.00, 'Credit Card'),
	('PY005', 'R005', '2024-05-05', 250.00, 'Debit Card'),
	('PY006', 'R006', '2024-05-06', 160.00, 'Cash'),
	('PY007', 'R007', '2024-05-07', 190.00, 'Credit Card'),
	('PY008', 'R008', '2024-05-08', 170.00, 'Debit Card'),
	('PY009', 'R009', '2024-05-09', 210.00, 'Cash'),
	('PY010', 'R010', '2024-05-10', 230.00, 'Credit Card'),
	('PY011', 'R011', '2024-05-11', 140.00, 'Debit Card'),
	('PY012', 'R012', '2024-05-12', 200.00, 'Cash'),
	('PY013', 'R013', '2024-05-13', 180.00, 'Credit Card'),
	('PY014', 'R014', '2024-05-14', 170.00, 'Debit Card'),
	('PY015', 'R015', '2024-05-15', 210.00, 'Cash');

-- Dumping structure for table reservasitiketpesawat.penerbangan
CREATE TABLE IF NOT EXISTS `penerbangan` (
  `idPenerbangan` varchar(100) NOT NULL,
  `nomorPenerbangan` varchar(100) NOT NULL,
  `idPesawat` varchar(100) DEFAULT NULL,
  `idBandaraTujuan` varchar(100) DEFAULT NULL,
  `tanggalBerangkat` date NOT NULL,
  `tanggalTiba` date NOT NULL,
  `waktuBerangkat` time NOT NULL,
  `waktuTiba` time NOT NULL,
  PRIMARY KEY (`idPenerbangan`),
  KEY `idPesawat` (`idPesawat`),
  KEY `idBandaraTujuan` (`idBandaraTujuan`),
  CONSTRAINT `penerbangan_ibfk_1` FOREIGN KEY (`idPesawat`) REFERENCES `pesawat` (`idPesawat`),
  CONSTRAINT `penerbangan_ibfk_3` FOREIGN KEY (`idBandaraTujuan`) REFERENCES `bandara` (`idBandara`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table reservasitiketpesawat.penerbangan: ~18 rows (approximately)
INSERT INTO `penerbangan` (`idPenerbangan`, `nomorPenerbangan`, `idPesawat`, `idBandaraTujuan`, `tanggalBerangkat`, `tanggalTiba`, `waktuBerangkat`, `waktuTiba`) VALUES
	('FL001', 'GA1001', 'PS001', 'B002', '2024-06-01', '2024-06-01', '08:00:00', '10:00:00'),
	('FL002', 'GA1002', 'PS002', 'B003', '2024-06-02', '2024-06-02', '09:00:00', '11:00:00'),
	('FL003', 'GA1003', 'PS003', 'B004', '2024-06-03', '2024-06-03', '10:00:00', '12:00:00'),
	('FL004', 'GA1004', 'PS004', 'B005', '2024-06-04', '2024-06-04', '11:00:00', '13:00:00'),
	('FL005', 'GA1005', 'PS005', 'B006', '2024-06-05', '2024-06-05', '12:00:00', '14:00:00'),
	('FL006', 'GA1006', 'PS006', 'B007', '2024-06-06', '2024-06-06', '13:00:00', '15:00:00'),
	('FL007', 'GA1007', 'PS007', 'B008', '2024-06-07', '2024-06-07', '14:00:00', '16:00:00'),
	('FL008', 'GA1008', 'PS008', 'B009', '2024-06-08', '2024-06-08', '15:00:00', '17:00:00'),
	('FL009', 'GA1009', 'PS009', 'B010', '2024-06-09', '2024-06-09', '16:00:00', '18:00:00'),
	('FL010', 'GA1010', 'PS010', 'B011', '2024-06-10', '2024-06-10', '17:00:00', '19:00:00'),
	('FL011', 'GA1011', 'PS011', 'B012', '2024-06-11', '2024-06-11', '18:00:00', '20:00:00'),
	('FL012', 'GA1012', 'PS012', 'B013', '2024-06-12', '2024-06-12', '19:00:00', '21:00:00'),
	('FL013', 'GA1013', 'PS013', 'B014', '2024-06-13', '2024-06-13', '20:00:00', '22:00:00'),
	('FL014', 'GA1014', 'PS014', 'B015', '2024-06-14', '2024-06-14', '21:00:00', '23:00:00'),
	('FL015', 'GA1015', 'PS015', 'B001', '2024-06-15', '2024-06-15', '22:00:00', '00:00:00'),
	('FL016', 'GA1016', 'PS015', 'B015', '2024-12-25', '2024-12-25', '10:00:00', '14:00:00'),
	('FL017', 'GA1017', 'PS015', 'B015', '2024-12-25', '2024-12-25', '10:00:00', '14:00:00'),
	('FL018', 'GA1018', 'PS015', 'B015', '2024-12-25', '2024-12-25', '10:00:00', '14:00:00');

-- Dumping structure for table reservasitiketpesawat.pesawat
CREATE TABLE IF NOT EXISTS `pesawat` (
  `idPesawat` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `kapasitas` int NOT NULL,
  PRIMARY KEY (`idPesawat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table reservasitiketpesawat.pesawat: ~15 rows (approximately)
INSERT INTO `pesawat` (`idPesawat`, `model`, `kapasitas`) VALUES
	('PS001', 'Boeing 737', 180),
	('PS002', 'Airbus A320', 150),
	('PS003', 'Boeing 777', 300),
	('PS004', 'Airbus A330', 250),
	('PS005', 'Boeing 787', 240),
	('PS006', 'Airbus A350', 280),
	('PS007', 'Boeing 747', 400),
	('PS008', 'Airbus A380', 500),
	('PS009', 'Boeing 737 MAX', 200),
	('PS010', 'Airbus A321', 190),
	('PS011', 'Boeing 767', 210),
	('PS012', 'Airbus A319', 140),
	('PS013', 'Boeing 737-800', 190),
	('PS014', 'Airbus A321neo', 220),
	('PS015', 'Boeing 787-9', 280);

-- Dumping structure for table reservasitiketpesawat.reservasi
CREATE TABLE IF NOT EXISTS `reservasi` (
  `idReservasi` varchar(100) NOT NULL,
  `idPelanggan` varchar(100) DEFAULT NULL,
  `idPenerbangan` varchar(100) DEFAULT NULL,
  `tanggalReservasi` date NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idReservasi`),
  KEY `idPelanggan` (`idPelanggan`),
  KEY `idPenerbangan` (`idPenerbangan`),
  CONSTRAINT `reservasi_ibfk_1` FOREIGN KEY (`idPelanggan`) REFERENCES `pelanggan` (`idPelanggan`),
  CONSTRAINT `reservasi_ibfk_2` FOREIGN KEY (`idPenerbangan`) REFERENCES `penerbangan` (`idPenerbangan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table reservasitiketpesawat.reservasi: ~16 rows (approximately)
INSERT INTO `reservasi` (`idReservasi`, `idPelanggan`, `idPenerbangan`, `tanggalReservasi`, `status`) VALUES
	('R001', 'P001', 'FL001', '2024-05-01', 'Cancelled'),
	('R002', 'P002', 'FL002', '2024-05-02', 'Pending'),
	('R003', 'P003', 'FL003', '2024-05-03', 'Confirmed'),
	('R004', 'P004', 'FL004', '2024-05-04', 'Cancelled'),
	('R005', 'P005', 'FL005', '2024-05-05', 'Confirmed'),
	('R006', 'P006', 'FL006', '2024-05-06', 'Pending'),
	('R007', 'P007', 'FL007', '2024-05-07', 'Confirmed'),
	('R008', 'P008', 'FL008', '2024-05-08', 'Cancelled'),
	('R009', 'P009', 'FL009', '2024-05-09', 'Confirmed'),
	('R010', 'P010', 'FL010', '2024-05-10', 'Pending'),
	('R011', 'P011', 'FL011', '2024-05-11', 'Confirmed'),
	('R012', 'P012', 'FL012', '2024-05-12', 'Cancelled'),
	('R013', 'P013', 'FL013', '2024-05-13', 'Confirmed'),
	('R014', 'P014', 'FL014', '2024-05-14', 'Pending'),
	('R015', 'P015', 'FL015', '2024-05-15', 'Confirmed'),
	('R016', 'P016', 'FL016', '2024-12-01', 'Cancelled');

-- Dumping structure for trigger reservasitiketpesawat.after_delete_pembayaran
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `after_delete_pembayaran` AFTER DELETE ON `pembayaran` FOR EACH ROW BEGIN
    UPDATE reservasi
    SET status = 'Cancelled'
    WHERE idReservasi = OLD.idReservasi;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger reservasitiketpesawat.after_insert_penerbangan
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `after_insert_penerbangan` BEFORE INSERT ON `bandara` FOR EACH ROW BEGIN

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
