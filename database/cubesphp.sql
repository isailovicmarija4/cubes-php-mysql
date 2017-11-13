-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2017 at 11:54 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cubesphp`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `title` char(50) NOT NULL,
  `website_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `website_url`) VALUES
(1, 'Apple', ''),
(2, 'Beko', ''),
(3, 'Bosh aa', 'http://cubes.edu.rs'),
(4, 'Gorenje2', ''),
(5, 'HTC', ''),
(6, 'Huawei', ''),
(7, 'LG', ''),
(8, 'Samsung', ''),
(9, 'Sony', ''),
(16, 'Siemens', ''),
(17, 'Vivax', '');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` char(20) NOT NULL,
  `description` longtext NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `description`, `group_id`) VALUES
(1, 'Mobilni Telefonaa', '', 1),
(2, 'Televizor', '', 2),
(3, 'Frizider', '', 2),
(4, 'Ves Masina', '', 2),
(5, 'Sporet', '', 2),
(6, 'Fen za kosu', '', 2),
(7, 'Laptop', '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `title`) VALUES
(1, 'Mobilni Uredjaj'),
(2, 'Bela Tehnika'),
(3, 'Racunari');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `content` longtext,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `section_id`, `title`, `description`, `content`, `created_at`) VALUES
(3183, 6, 'Blic', 'Dinar danas u blagom rastu, kurs 119,40\'', 'Dinar ?e danas oja?ati prema evru za 0,1 odsto u odnosu na danas i zvani?ni srednji kurs iznosi?e 119,4013 dinara za evro, objavila je Narodna banka Srbije.\', \'http://www.blic.rs/vesti/ekonomija/dinar-danas-u-blagom-rastu-kurs-11940/nf786rr\')', '2017-10-26 09:19:16'),
(3184, 5, 'B92', 'Ove sobne biljke čuvaju zdravlje', 'Naučnici NASA su u saradnji sa Američkim koledžom ispitali koje kućne biljke su korisne u prevenciji određenih zdravstvenih problema.\', \'http://www.b92.net/zdravlje/vesti.php?yyyy=2017&mm=10&nav_id=1318401', '2017-08-15 18:17:13'),
(3185, 4, 'Kurir', 'SINGAPUR IMA NAJVREDNIJI PASOŠ NA SVETU: A evo na kom je mestu Srbija', 'Prema najnovijim podacima organizacije Pasport indeks, najvredniji pasoš na svetu trenutno je pasoš malene države Singapur čiji državljani mogu da putuju u ogroman broj država bez vize. Organizacija Pasport indeks koja istražuje mogućnosti tih dokumenata na ...\', \'http://www.kurir.rs/planeta/2930025/singapur-ima-najvredniji-pasos-na-svetu-a-evo-na-kom-je-mest', '2017-10-06 14:07:10'),
(3186, 3, 'Kurir', 'PREOKRETOM DO POBEDE: Srpski rukometaši savladali Austriju', 'Rukometna reprezentacija Srbije savladala je selekciju Austrije 34:32 (15:19) u prvom prijateljskom odmeravanju snaga u Tulnu.\', \'http://www.kurir.rs/sport/ostali-sportovi/2930755/preokretom-do-pobede-srpski-rukometasi-savladali-austriju', '2017-10-24 13:17:13'),
(3187, 3, 'Blic', 'IZ MINUTA U MINUT Zvezda - Makabi 87:84', 'Košarkaši Crvene zvezde savladali su Makabi sa 87:84 u 4. kola Evrolige a zbivanja sa utakmice u beogradskoj Areni mogli ste da pratite uživo uz Blicsport.\', \'http://sport.blic.rs/evroliga-1718/iz-minuta-u-minut-zvezda-makabi-8784/ec776xn', '2017-10-09 21:51:35'),
(3188, 2, 'Blic', 'NAJBRŽA ŽIVOTINJA NA KOPNU Gepard je brži i od \\\"poršea\\', 'Ova mačka je najbrža životinja na kopnu. Tri puta je lakši od tigra, može da pređe 29 metara u samo jednoj sekundi. Ženke žive same, a mužjaci u čoporu. Nemaju instinkt za ubijanjem čim se rode, ali predatori postaju već sa dva meseca\', \'http://www.blic.rs/slobodno-vreme/najbrza-zivotinja-na-kopnu-gepard-je-brzi-i-od-porsea/dklv6ws', '2017-09-11 11:25:19'),
(3189, 2, 'Blic', 'Ajnštajnove beleške o TAJNI SREĆE vrede 1,56 miliona dolara', 'Rukom napisana poruka fizičara Alberta Ajnštajna o tajni sreće prodata je danas na aukciji u Jerusalimu za 1,56 milion dolara, a bila je procenjena na između 5.000 i 8.000 dolara, saopštila je aukcijska kuća preko interneta.\', \'http://www.blic.rs/slobodno-vreme/vesti/ajnstajnove-beleske-o-tajni-srece-vrede-156-miliona-dolara/7qjzpme', '2017-10-03 09:13:10'),
(3190, 6, 'B92', 'U GSP novi validatori, spremite i platne kartice', 'Do kraja godine vožnja u gradskom prevozu će moći da se plaća bezkontaktnim platnim karticama, izjavio je gradski menadžer Goran Vesić.\\\"Kako bi se povećao udeo bezgotovinskog plaćanja, Grad je preduzeo niz aktivnosti. Do kraja godine ćemo početi da primamo beskontaktne platne kartice u javnom prevozu. I ta kartica će postati i platna kartica\\\", rekao je Vesić i napomenuo da u Beogradu više od 500.000 ljudi koristi Bus plus karticu za vožnju.\', \'http://www.b92.net/biz/vesti/srbija.php?yyyy=2017&mm=10&dd=25&nav_id=1318050', '2017-09-04 13:07:05'),
(3191, 1, 'Novosti', '\"Muzej umetnosti\\\" jedan od najluksuznijih naslova (VIDEO)', 'TEŠKA oko 10 kilograma, visoka 42, a široka 32,5 santimetara, na gotovo 1.000 strana, sa više od 2.700 reprezentativnih umetničkih dela iz 650 zemalja, knjiga \\\"Muzej umetnosti\\\", sigurno je jedan od najluksuznijih naslova ovogodišnjeg Sajma. Prvo izdanje na srpskom jeziku, jednog od najambicioznijih svetskih izdavačkih projekata iz istorije umetnosti, izloženo je na štandu \\\"Data presa\\\", gde se čitaoci mogu prošetati kroz ovaj svojevrsni virtuelni muzej.   PROČITAJTE JOŠ:  Savršena smotra odbrane jezika (FOTO+VIDEO)    Tačnije, prelistati delo u koga je tim od 100 kustosa, profesora, istraživača i urednika, uložio 10 godina rada, a prvobitno ga je 2011. godine objavio \\\"Fejdon pres\\\". U njemu je obuhvaćeno ljudsko stvaralaštvo, od nastanka čovečanstva do prve decenije 21. veka. Iz Srbije u Muzeju umetnosti izložena su dva dela - skulptura \\\"Praroditeljka\\\" iz Lepenskog vira i fotografski zapis performansa \\\"Ritam 5\\\" Marine Abramović. Ovaj \\\"muzej među koricama\\\", podeljen je na 25 odeljenja, sa 452 galerije.\', \'http://www.novosti.rs/vesti/kultura.71.html:692341-Muzej-umetnosti-jedan-od-najluksuznijih-naslova-VIDEO\'),\r\n', '2017-10-31 11:09:06'),
(3192, 1, 'Blic', 'Upoznajte najbolje od najgorih: Najgledanija španska komedija \\\"Junačine\\\" od sutra u bioskopima', '\"Junačine\\\" su rediteljski debi Hoakina Mazona, koji karikira čuvene akcione heroje sa velikog platna. Veštim humorom i odličnom glumačkom postavom, reditelj je pobrao sjajne kritike, a film je ocenjen kao osveženje u španskoj kinematografiji.\', \'http://www.blic.rs/kultura/vesti/upoznajte-najbolje-od-najgorih-najgledanija-spanska-komedija-junacine-od-sutra-u/mft023m\'),\r\n', '2017-11-08 10:07:07');

-- --------------------------------------------------------

--
-- Table structure for table `polaznici`
--

CREATE TABLE `polaznici` (
  `id` int(11) NOT NULL,
  `ime` char(50) CHARACTER SET utf8mb4 NOT NULL,
  `prezime` varchar(255) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `polaznici`
--

INSERT INTO `polaznici` (`id`, `ime`, `prezime`) VALUES
(1, 'Aleksandar', 'Dimic');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `specification` longtext,
  `price` decimal(10,2) NOT NULL,
  `quantity` float NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `on_sale` tinyint(1) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `title`, `description`, `specification`, `price`, `quantity`, `category_id`, `on_sale`, `discount`, `created_at`) VALUES
(7, 1, 'Apple iPhone7 32GB', 'Mobilni Telefon Apple iPhone7 32GB', '', '98546.21', 23, 1, 0, '0.00', '2016-06-12 12:53:00'),
(8, 1, 'Apple iPhone7 64GB', 'Mobilni Telefon Apple iPhone7 64GB', '', '112345.12', 2, 1, 0, '0.00', '2016-12-13 13:53:00'),
(9, 1, 'Apple iPhone7 32GB Gold', 'Mobilni Telefon Apple iPhone7 32GB Gold', '', '101234.23', 1, 1, 0, '0.00', '2016-03-14 14:53:00'),
(10, 1, 'Apple iPhone8 32GB', 'Mobilni Telefon Apple iPhone8 32GB', '', '127880.39', 12, 1, 1, '15.00', '2017-04-15 15:53:00'),
(11, 1, 'Apple iPhone8 64GB', 'Mobilni Telefon Apple iPhone8 64GB', '', '151339.32', 2, 1, 0, '0.00', '2017-06-16 16:53:00'),
(12, 1, 'Apple iPhone8 32GB Gold', 'Mobilni Telefon Apple iPhone8 32GB Gold', '', '161323.37', 0, 1, 0, '0.00', '2017-08-17 17:53:00'),
(13, 8, 'Samsung Galaxy S8', 'Mobilni Telefon Samsung Galaxy S8', '', '99876.34', 12, 1, 0, '0.00', '2017-06-18 18:53:00'),
(14, 8, 'Samsung Galaxy S7', 'Mobilni Telefon Samsung Galaxy S7', '', '69887.34', 3, 1, 0, '0.00', '2016-07-19 14:53:00'),
(15, 8, 'Samsung Galaxy S6', 'Mobilni Telefon Samsung Galaxy S6', '', '55763.34', 3, 1, 0, '0.00', '2015-02-20 11:53:00'),
(16, 6, 'Huawei P10', 'Mobilni Telefon Huawei P10', '', '67898.77', 6, 1, 0, '0.00', '2016-11-21 12:53:00'),
(17, 6, 'Huawei P9', 'Mobilni Telefon Huawei P9', '', '65632.33', 12, 1, 0, '0.00', '2015-03-22 12:53:00'),
(18, 5, 'HTC Desire 820', 'Mobilni Telefon HTC Desire 820', '', '32456.76', 3, 1, 0, '0.00', '2014-08-23 12:53:00'),
(19, 5, 'HTC One A9', 'Mobilni Telefon HTC One A9', '', '38271.12', 11, 1, 1, '20.00', '2016-05-24 12:53:00'),
(20, 5, 'HTC U12', 'Mobilni Telefon HTC U12', '', '55736.43', 7, 1, 0, '0.00', '2017-06-25 12:53:00'),
(21, 8, 'Samsung UE-32J4000AWXXH', 'Televizor Samsung UE-32J4000AWXXH', '', '32985.76', 0, 2, 0, '0.00', '2015-12-26 12:53:00'),
(22, 8, 'Samsung UE-32K4102AKXXH', 'Televizor Samsung UE-32K4102AKXXH', '', '34323.32', 5, 2, 0, '0.00', '2016-11-27 12:53:00'),
(23, 8, 'Samsung', 'Televizor Samsung', '', '11212.12', 0, 2, 0, '0.00', '2017-09-28 12:53:00'),
(24, 7, 'LG 32LH510B', 'Televizor LG 32LH510B', '', '14544.32', 6, 2, 0, '0.00', '2017-01-29 12:53:00'),
(25, 7, 'LG 32LH510U', 'Televizor LG 32LH510U', '', '12345.54', 8, 2, 0, '0.00', '2016-08-30 12:53:00'),
(26, 9, 'Sony KD 65XE9005BAEP', 'Televizor Sony KD 65XE9005BAEP', '', '89189.33', 12, 2, 1, '10.00', '2015-07-01 12:53:00'),
(27, 9, 'Sony LED LCD KDL 50W755CBAEP', 'Televizor Sony LED LCD KDL 50W755CBAEP', '', '72098.23', 2, 2, 0, '0.00', '2014-10-02 12:53:00'),
(28, 9, 'Sony 40WD650BAEP', 'Televizor Sony 40WD650BAEP', '', '56765.32', 12, 2, 0, '0.00', '2013-10-03 12:53:00'),
(29, 9, 'Sony TV KDL32WE615BAEP', 'Televizor Sony TV KDL32WE615BAEP', '', '32345.56', 4, 2, 0, '0.00', '2015-04-04 12:53:00'),
(30, 2, 'Beko RCS A300K 20W', 'Frizider Beko RCS A300K 20W', '', '29199.99', 2, 3, 1, '5.00', '2013-07-05 12:53:00'),
(31, 2, 'Beko DSA 28020', 'Frizider Beko DSA 28020', '', '27654.23', 1, 3, 0, '0.00', '2017-08-06 12:53:00'),
(33, 4, 'Gorenje RF 4120 AW', 'Frizider Gorenje RF 4120 AW', '', '21987.72', 3, 3, 0, '0.00', '2012-03-08 12:53:00'),
(34, 3, 'Bosh KGN 36NL30', 'Frizider Bosh KGN 36NL30', '', '54320.43', 1, 3, 0, '0.00', '2013-07-09 12:53:00'),
(39, 1, 'iPhone6 S', 'iPhone6 S', '', '39999.99', 12, 1, 0, '0.00', '2016-03-21 18:00:00'),
(40, 1, 'iPhone6 SE', 'iPhone6 SE', '', '37999.99', 11, 1, 0, '0.00', '2016-03-21 18:00:00'),
(41, 1, 'iPhone5', 'iPhone5', '', '32999.99', 10, 1, 0, '0.00', '2016-03-21 18:00:00'),
(42, NULL, 'Masina za sivenje', 'Masina za sivenje', 'Masina za sivenje', '1200.00', 1, NULL, 0, '0.00', '2017-11-13 08:22:20'),
(43, NULL, 'Televizor 8X56P', 'Televizor 8X56P', NULL, '11800.00', 36, 2, 0, '0.00', '2017-11-20 07:19:15'),
(44, 1, 'iPod Nano', 'iPod Nano', NULL, '9800.00', 3, NULL, 0, '0.00', '2017-11-14 05:12:12'),
(45, 2, 'Pegla 1200W', 'Pegla 1200W', NULL, '3200.00', 1, 99, 0, '0.00', '2017-11-14 08:19:18');

-- --------------------------------------------------------

--
-- Table structure for table `product_tags`
--

CREATE TABLE `product_tags` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_tags`
--

INSERT INTO `product_tags` (`id`, `product_id`, `tag_id`) VALUES
(1, 39, 1),
(2, 39, 2),
(3, 39, 5),
(4, 22, 2),
(5, 22, 5),
(6, 22, 2),
(7, 22, 5),
(8, 31, 4),
(10, 11, 2),
(11, 11, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `title`) VALUES
(1, 'Kultura'),
(2, 'Zanimljivosti'),
(3, 'Sport'),
(4, 'Svet'),
(5, 'Zivot'),
(6, 'Ekonomija');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `title`) VALUES
(1, 'Najprodavaniji'),
(2, 'Ekstra Kvalitet'),
(3, 'Pobednik Sajma Tehnike'),
(4, 'Garancija 5 Godina'),
(5, 'Garancija 2 Godine');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `polaznici`
--
ALTER TABLE `polaznici`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indexes for table `product_tags`
--
ALTER TABLE `product_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3193;

--
-- AUTO_INCREMENT for table `polaznici`
--
ALTER TABLE `polaznici`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `product_tags`
--
ALTER TABLE `product_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
