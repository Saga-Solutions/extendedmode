-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 20 Mar 2021, 17:14:14
-- Sunucu sürümü: 10.4.13-MariaDB
-- PHP Sürümü: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `es_extended`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `addon_account`
--

CREATE TABLE `addon_account` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Tablo döküm verisi `addon_account`
--

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('caution', 'Caution', 0),
('property_black_money', 'Argent Sale Propriété', 0),
('society_ambulance', 'Ambulance', 1),
('society_cardealer', 'Concessionnaire', 1),
('society_mechanic', 'Mécano', 1),
('society_police', 'Police', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `addon_account_data`
--

CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL,
  `account_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Tablo döküm verisi `addon_account_data`
--

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(1, 'society_ambulance', 0, NULL),
(2, 'society_cardealer', 0, NULL),
(3, 'society_mechanic', 0, NULL),
(4, 'society_police', 0, NULL),
(12, 'caution', 0, 'steam:11000010944d838'),
(13, 'property_black_money', 0, 'steam:11000010944d838');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `addon_inventory`
--

CREATE TABLE `addon_inventory` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Tablo döküm verisi `addon_inventory`
--

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('property', 'Propriété', 0),
('society_ambulance', 'Ambulance', 1),
('society_cardealer', 'Concesionnaire', 1),
('society_mechanic', 'Mécano', 1),
('society_police', 'Police', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `addon_inventory_items`
--

CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL,
  `inventory_name` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `identifier` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `sender` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `target_type` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `target` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cardealer_vehicles`
--

CREATE TABLE `cardealer_vehicles` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `communityservice`
--

CREATE TABLE `communityservice` (
  `identifier` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `actions_remaining` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `crew_phone_bank`
--

CREATE TABLE `crew_phone_bank` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `identifier` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `crew_phone_news`
--

CREATE TABLE `crew_phone_news` (
  `id` int(11) NOT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `datastore`
--

CREATE TABLE `datastore` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Tablo döküm verisi `datastore`
--

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('property', 'Propriété', 0),
('society_ambulance', 'Ambulance', 1),
('society_mechanic', 'Mécano', 1),
('society_police', 'Police', 1),
('user_ears', 'Ears', 0),
('user_glasses', 'Glasses', 0),
('user_helmet', 'Helmet', 0),
('user_mask', 'Mask', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `datastore_data`
--

CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `owner` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Tablo döküm verisi `datastore_data`
--

INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(1, 'society_ambulance', NULL, '{}'),
(2, 'society_mechanic', NULL, '{}'),
(3, 'property', 'steam:11000010944d838', '{}'),
(4, 'user_ears', 'steam:11000010944d838', '{}'),
(5, 'user_helmet', 'steam:11000010944d838', '{}'),
(6, 'user_mask', 'steam:11000010944d838', '{}'),
(7, 'user_glasses', 'steam:11000010944d838', '{}'),
(8, 'society_police', NULL, '{}'),
(9, 'user_ears', 'steam:11000010e3b49ef', '{}'),
(10, 'user_glasses', 'steam:11000010e3b49ef', '{}'),
(11, 'user_helmet', 'steam:11000010e3b49ef', '{}'),
(12, 'user_mask', 'steam:11000010e3b49ef', '{}'),
(13, 'property', 'steam:11000010e3b49ef', '{}'),
(14, 'user_ears', 'steam:11000014016a17c', '{}'),
(15, 'user_glasses', 'steam:11000014016a17c', '{}'),
(16, 'user_helmet', 'steam:11000014016a17c', '{}'),
(17, 'user_mask', 'steam:11000014016a17c', '{}'),
(18, 'property', 'steam:11000014016a17c', '{}');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `disc_ammo`
--

CREATE TABLE `disc_ammo` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner` text COLLATE utf8mb4_bin NOT NULL,
  `hash` text COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `dpkeybinds`
--

CREATE TABLE `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `dpkeybinds`
--

INSERT INTO `dpkeybinds` (`id`, `keybind1`, `emote1`, `keybind2`, `emote2`, `keybind3`, `emote3`, `keybind4`, `emote4`, `keybind5`, `emote5`, `keybind6`, `emote6`) VALUES
('steam:11000010944d838', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `fine_types`
--

CREATE TABLE `fine_types` (
  `id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Tablo döküm verisi `fine_types`
--

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Usage abusif du klaxon', 30, 0),
(2, 'Franchir une ligne continue', 40, 0),
(3, 'Circulation à contresens', 250, 0),
(4, 'Demi-tour non autorisé', 250, 0),
(5, 'Circulation hors-route', 170, 0),
(6, 'Non-respect des distances de sécurité', 30, 0),
(7, 'Arrêt dangereux / interdit', 150, 0),
(8, 'Stationnement gênant / interdit', 70, 0),
(9, 'Non respect  de la priorité à droite', 70, 0),
(10, 'Non-respect à un véhicule prioritaire', 90, 0),
(11, 'Non-respect d\'un stop', 105, 0),
(12, 'Non-respect d\'un feu rouge', 130, 0),
(13, 'Dépassement dangereux', 100, 0),
(14, 'Véhicule non en état', 100, 0),
(15, 'Conduite sans permis', 1500, 0),
(16, 'Délit de fuite', 800, 0),
(17, 'Excès de vitesse < 5 kmh', 90, 0),
(18, 'Excès de vitesse 5-15 kmh', 120, 0),
(19, 'Excès de vitesse 15-30 kmh', 180, 0),
(20, 'Excès de vitesse > 30 kmh', 300, 0),
(21, 'Entrave de la circulation', 110, 1),
(22, 'Dégradation de la voie publique', 90, 1),
(23, 'Trouble à l\'ordre publique', 90, 1),
(24, 'Entrave opération de police', 130, 1),
(25, 'Insulte envers / entre civils', 75, 1),
(26, 'Outrage à agent de police', 110, 1),
(27, 'Menace verbale ou intimidation envers civil', 90, 1),
(28, 'Menace verbale ou intimidation envers policier', 150, 1),
(29, 'Manifestation illégale', 250, 1),
(30, 'Tentative de corruption', 1500, 1),
(31, 'Arme blanche sortie en ville', 120, 2),
(32, 'Arme léthale sortie en ville', 300, 2),
(33, 'Port d\'arme non autorisé (défaut de license)', 600, 2),
(34, 'Port d\'arme illégal', 700, 2),
(35, 'Pris en flag lockpick', 300, 2),
(36, 'Vol de voiture', 1800, 2),
(37, 'Vente de drogue', 1500, 2),
(38, 'Fabriquation de drogue', 1500, 2),
(39, 'Possession de drogue', 650, 2),
(40, 'Prise d\'ôtage civil', 1500, 2),
(41, 'Prise d\'ôtage agent de l\'état', 2000, 2),
(42, 'Braquage particulier', 650, 2),
(43, 'Braquage magasin', 650, 2),
(44, 'Braquage de banque', 1500, 2),
(45, 'Tir sur civil', 2000, 3),
(46, 'Tir sur agent de l\'état', 2500, 3),
(47, 'Tentative de meurtre sur civil', 3000, 3),
(48, 'Tentative de meurtre sur agent de l\'état', 5000, 3),
(49, 'Meurtre sur civil', 10000, 3),
(50, 'Meurte sur agent de l\'état', 30000, 3),
(51, 'Meurtre involontaire', 1800, 3),
(52, 'Escroquerie à l\'entreprise', 2000, 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hasan_stashouse`
--

CREATE TABLE `hasan_stashouse` (
  `identity` varchar(150) COLLATE utf8mb4_bin DEFAULT NULL,
  `houseid` varchar(150) COLLATE utf8mb4_bin DEFAULT NULL,
  `price` varchar(150) COLLATE utf8mb4_bin NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Tablo döküm verisi `hasan_stashouse`
--

INSERT INTO `hasan_stashouse` (`identity`, `houseid`, `price`) VALUES
('steam:11000010944d838', '42', '8900');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `items`
--

CREATE TABLE `items` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `limit` int(11) NOT NULL DEFAULT 10,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Tablo döküm verisi `items`
--

INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`) VALUES
('WEAPON_ADVANCEDRIFLE', 'Advanced Rifle', 1, 10, 0, 1),
('WEAPON_APPISTOL', 'AP Pistol', 1, 10, 0, 1),
('WEAPON_ASSAULTRIFLE', 'Assault Rifle', 1, 10, 0, 1),
('WEAPON_ASSAULTSHOTGUN', 'Assault Shotgun', 1, 10, 0, 1),
('WEAPON_ASSAULTSMG', 'Assault SMG', 1, 10, 0, 1),
('WEAPON_AUTOSHOTGUN', 'Auto Shotgun', 1, 10, 0, 1),
('WEAPON_BALL', 'Ball', 1, 10, 0, 1),
('WEAPON_BAT', 'Bat', 1, 10, 0, 1),
('WEAPON_BATTLEAXE', 'Battle Axe', 1, 10, 0, 1),
('WEAPON_BOTTLE', 'Bottle', 1, 10, 0, 1),
('WEAPON_BULLPUPRIFLE', 'Bullpup Rifle', 1, 10, 0, 1),
('WEAPON_BULLPUPSHOTGUN', 'Bullpup Shotgun', 1, 10, 0, 1),
('WEAPON_BZGAS', 'BZ Gas', 1, 10, 0, 1),
('WEAPON_CARBINERIFLE', 'Carbine Rifle', 1, 10, 0, 1),
('WEAPON_COMBATMG', 'Combat MG', 1, 10, 0, 1),
('WEAPON_COMBATPDW', 'Combat PDW', 1, 10, 0, 1),
('WEAPON_COMBATPISTOL', 'Combat Pistol', 1, 10, 0, 1),
('WEAPON_COMPACTLAUNCHER', 'Compact Launcher', 1, 10, 0, 1),
('WEAPON_COMPACTRIFLE', 'Compact Rifle', 1, 10, 0, 1),
('WEAPON_CROWBAR', 'Crowbar', 1, 10, 0, 1),
('WEAPON_DAGGER', 'Dagger', 1, 10, 0, 1),
('WEAPON_DBSHOTGUN', 'Double Barrel Shotgun', 1, 10, 0, 1),
('WEAPON_DIGISCANNER', 'Digiscanner', 1, 10, 0, 1),
('WEAPON_DOUBLEACTION', 'Double Action Revolver', 1, 10, 0, 1),
('WEAPON_FIREEXTINGUISHER', 'Fire Extinguisher', 1, 10, 0, 1),
('WEAPON_FIREWORK', 'Firework Launcher', 1, 10, 0, 1),
('WEAPON_FLARE', 'Flare', 1, 10, 0, 1),
('WEAPON_FLAREGUN', 'Flare Gun', 1, 10, 0, 1),
('WEAPON_FLASHLIGHT', 'Flashlight', 1, 10, 0, 1),
('WEAPON_GARBAGEBAG', 'Garbage Bag', 1, 10, 0, 1),
('WEAPON_GOLFCLUB', 'Golf Club', 1, 10, 0, 1),
('WEAPON_GRENADE', 'Grenade', 1, 10, 0, 1),
('WEAPON_GRENADELAUNCHER', 'Gernade Launcher', 1, 10, 0, 1),
('WEAPON_GUSENBERG', 'Gusenberg', 1, 10, 0, 1),
('WEAPON_HAMMER', 'Hammer', 1, 10, 0, 1),
('WEAPON_HANDCUFFS', 'Handcuffs', 1, 10, 0, 1),
('WEAPON_HATCHET', 'Hatchet', 1, 10, 0, 1),
('WEAPON_HEAVYPISTOL', 'Heavy Pistol', 1, 10, 0, 1),
('WEAPON_HEAVYSHOTGUN', 'Heavy Shotgun', 1, 10, 0, 1),
('WEAPON_HEAVYSNIPER', 'Heavy Sniper', 1, 10, 0, 1),
('WEAPON_HOMINGLAUNCHER', 'Homing Launcher', 1, 10, 0, 1),
('WEAPON_KNIFE', 'Knife', 1, 10, 0, 1),
('WEAPON_KNUCKLE', 'Knuckle Dusters ', 1, 10, 0, 1),
('WEAPON_MACHETE', 'Machete', 1, 10, 0, 1),
('WEAPON_MACHINEPISTOL', 'Machine Pistol', 1, 10, 0, 1),
('WEAPON_MARKSMANPISTOL', 'Marksman Pistol', 1, 10, 0, 1),
('WEAPON_MARKSMANRIFLE', 'Marksman Rifle', 1, 10, 0, 1),
('WEAPON_MG', 'MG', 1, 10, 0, 1),
('WEAPON_MICROSMG', 'Micro SMG', 1, 10, 0, 1),
('WEAPON_MINIGUN', 'Minigun', 1, 10, 0, 1),
('WEAPON_MINISMG', 'Mini SMG', 1, 10, 0, 1),
('WEAPON_MOLOTOV', 'Molotov', 1, 10, 0, 1),
('WEAPON_MUSKET', 'Musket', 1, 10, 0, 1),
('WEAPON_NIGHTSTICK', 'Police Baton', 1, 10, 0, 1),
('WEAPON_PETROLCAN', 'Petrol Can', 1, 10, 0, 1),
('WEAPON_PIPEBOMB', 'Pipe Bomb', 1, 10, 0, 1),
('WEAPON_PISTOL', 'Pistol', 1, 10, 0, 1),
('WEAPON_PISTOL50', 'Police .50', 1, 10, 0, 1),
('WEAPON_POOLCUE', 'Pool Cue', 1, 10, 0, 1),
('WEAPON_PROXMINE', 'Proximity Mine', 1, 10, 0, 1),
('WEAPON_PUMPSHOTGUN', 'Pump Shotgun', 1, 10, 0, 1),
('WEAPON_RAILGUN', 'Rail Gun', 1, 10, 0, 1),
('WEAPON_REVOLVER', 'Revolver', 1, 10, 0, 1),
('WEAPON_RPG', 'RPG', 1, 10, 0, 1),
('WEAPON_SAWNOFFSHOTGUN', 'Sawn Off Shotgun', 1, 10, 0, 1),
('WEAPON_SMG', 'SMG', 1, 10, 0, 1),
('WEAPON_SMOKEGRENADE', 'Smoke Gernade', 1, 10, 0, 1),
('WEAPON_SNIPERRIFLE', 'Sniper Rifle', 1, 10, 0, 1),
('WEAPON_SNOWBALL', 'Snow Ball', 1, 10, 0, 1),
('WEAPON_SNSPISTOL', 'SNS Pistol', 1, 10, 0, 1),
('WEAPON_SPECIALCARBINE', 'Special Rifle', 1, 10, 0, 1),
('WEAPON_STICKYBOMB', 'Sticky Bombs', 1, 10, 0, 1),
('WEAPON_STINGER', 'Stinger', 1, 10, 0, 1),
('WEAPON_STUNGUN', 'Police Taser', 1, 10, 0, 1),
('WEAPON_SWITCHBLADE', 'Switch Blade', 1, 10, 0, 1),
('WEAPON_VINTAGEPISTOL', 'Vintage Pistol', 1, 10, 0, 1),
('WEAPON_WRENCH', 'Wrench', 1, 10, 0, 1),
('armor', 'Agır Zırh', 1, 10, 0, 1),
('armorhalf', 'Hafif zırh', 1, 10, 0, 1),
('badge', 'badge', 1, 10, 0, 1),
('bandage', 'Bandage', 2, 10, 0, 1),
('black_money', 'Karapara', 0, 10, 0, 1),
('blowpipe', 'Chalumeaux', 2, 10, 0, 1),
('blue_phone', 'Mavi Telefon', 1, 10, 0, 1),
('carokit', 'Kit carosserie', 3, 10, 0, 1),
('carotool', 'outils carosserie', 2, 10, 0, 1),
('chips', 'Chips', 1, 10, 0, 1),
('chocolate', 'Cikolata', 1, 10, 0, 1),
('cigaret', 'Sigara', 1, 10, 0, 1),
('coffee', 'Coffee', 1, 10, 0, 1),
('coke', 'Coke', 1, 10, 0, 1),
('cupcake', 'Cupcake', 1, 10, 0, 1),
('disc_ammo_pistol', 'Pistol Ammo', 1, 10, 0, 1),
('disc_ammo_pistol_large', 'Pistol Ammo Large', 1, 10, 0, 1),
('disc_ammo_rifle', 'Rifle Ammo', 1, 10, 0, 1),
('disc_ammo_rifle_large', 'Rifle Ammo Large', 1, 10, 0, 1),
('disc_ammo_shotgun', 'Shotgun Shells', 1, 10, 0, 1),
('disc_ammo_shotgun_large', 'Shotgun Shells Large', 1, 10, 0, 1),
('disc_ammo_smg', 'SMG Ammo', 1, 10, 0, 1),
('disc_ammo_smg_large', 'SMG Ammo Large', 1, 10, 0, 1),
('disc_ammo_snp', 'Sniper Ammo', 1, 10, 0, 1),
('disc_ammo_snp_large', 'Sniper Ammo Large', 1, 10, 0, 1),
('donut', 'Donut', 1, 10, 0, 1),
('fixkit', 'Kit réparation', 3, 10, 0, 1),
('fixtool', 'outils réparation', 2, 10, 0, 1),
('frappuccino', 'Frappuccino', 1, 10, 0, 1),
('frenchtoast', 'Frenchtoast', 1, 10, 0, 1),
('gazbottle', 'bouteille de gaz', 2, 10, 0, 1),
('green_phone', 'Yesil Telefon', 1, 10, 0, 1),
('hackertablet', 'hackertablet', 1, 10, 0, 1),
('hamburger', 'Hamburger', 1, 10, 0, 1),
('hotdog', 'Hotdog', 1, 10, 0, 1),
('id_card', 'id_card', 1, 10, 0, 1),
('laptop_h', 'laptop_h', 1, 10, 0, 1),
('latte', 'Latte', 1, 10, 0, 1),
('lighter', 'Cakmak', 1, 10, 0, 1),
('medikit', 'Medikit', 2, 10, 0, 1),
('milkshake', 'Milkshake', 1, 10, 0, 1),
('phone', 'Telefon', 1, 10, 0, 1),
('pizza', 'Pizza', 1, 10, 0, 1),
('repairkit', 'Repairkit', 3, 10, 0, 1),
('rolex', 'Rolex', 1, 10, 0, 1),
('sandwich', 'Sandwich', 1, 10, 0, 1),
('sprunk', 'Sprunk', 1, 10, 0, 1),
('thermal_charge', 'thermal_charge', 1, 10, 0, 1),
('tyrekit', 'Tyrekit', 3, 10, 0, 1),
('water', 'Su', 1, 10, 0, 1),
('white_phone', 'Beyaz Telefon', 1, 10, 0, 1),
('x', 'X', 1, 10, 0, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `jail`
--

CREATE TABLE `jail` (
  `identifier` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `jail_time` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `jobs`
--

CREATE TABLE `jobs` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Tablo döküm verisi `jobs`
--

INSERT INTO `jobs` (`name`, `label`) VALUES
('ambulance', 'Ambulance'),
('cardealer', 'Concessionnaire'),
('fisherman', 'Pêcheur'),
('fueler', 'Raffineur'),
('lumberjack', 'Bûcheron'),
('mechanic', 'Mécano'),
('miner', 'Mineur'),
('police', 'LSPD'),
('reporter', 'Journaliste'),
('slaughterer', 'Abatteur'),
('tailor', 'Couturier'),
('unemployed', 'Unemployed');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `job_grades`
--

CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext COLLATE utf8mb4_bin NOT NULL,
  `skin_female` longtext COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Tablo döküm verisi `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'unemployed', 0, 'unemployed', 'Unemployed', 50, '{}', '{}'),
(2, 'mechanic', 0, 'recrue', 'Recrue', 12, '{}', '{}'),
(3, 'mechanic', 1, 'novice', 'Novice', 24, '{}', '{}'),
(4, 'mechanic', 2, 'experimente', 'Experimente', 36, '{}', '{}'),
(5, 'mechanic', 3, 'chief', 'Chef d\'équipe', 48, '{}', '{}'),
(6, 'mechanic', 4, 'boss', 'Patron', 0, '{}', '{}'),
(7, 'cardealer', 0, 'recruit', 'Recrue', 10, '{}', '{}'),
(8, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
(9, 'cardealer', 2, 'experienced', 'Experimente', 40, '{}', '{}'),
(10, 'cardealer', 3, 'boss', 'Patron', 0, '{}', '{}'),
(11, 'ambulance', 0, 'ambulance', 'Ambulancier', 20, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(12, 'ambulance', 1, 'doctor', 'Medecin', 40, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(13, 'ambulance', 2, 'chief_doctor', 'Medecin-chef', 60, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(14, 'ambulance', 3, 'boss', 'Chirurgien', 80, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(15, 'police', 0, 'recruit', 'Recrue', 20, '{}', '{}'),
(16, 'police', 1, 'officer', 'Officier', 40, '{}', '{}'),
(17, 'police', 2, 'sergeant', 'Sergent', 60, '{}', '{}'),
(18, 'police', 3, 'lieutenant', 'Lieutenant', 85, '{}', '{}'),
(19, 'police', 4, 'boss', 'Commandant', 100, '{}', '{}'),
(20, 'lumberjack', 0, 'employee', 'Intérimaire', 0, '{}', '{}'),
(21, 'fisherman', 0, 'employee', 'Intérimaire', 0, '{}', '{}'),
(22, 'fueler', 0, 'employee', 'Intérimaire', 0, '{}', '{}'),
(23, 'reporter', 0, 'employee', 'Intérimaire', 0, '{}', '{}'),
(24, 'tailor', 0, 'employee', 'Intérimaire', 0, '{\"mask_1\":0,\"arms\":1,\"glasses_1\":0,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":0,\"torso_1\":24,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":0,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":0,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":36,\"tshirt_2\":0,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":48,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}', '{\"mask_1\":0,\"arms\":5,\"glasses_1\":5,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":1,\"torso_1\":52,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":1,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":23,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":42,\"tshirt_2\":4,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":36,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}'),
(25, 'miner', 0, 'employee', 'Intérimaire', 0, '{\"tshirt_2\":1,\"ears_1\":8,\"glasses_1\":15,\"torso_2\":0,\"ears_2\":2,\"glasses_2\":3,\"shoes_2\":1,\"pants_1\":75,\"shoes_1\":51,\"bags_1\":0,\"helmet_2\":0,\"pants_2\":7,\"torso_1\":71,\"tshirt_1\":59,\"arms\":2,\"bags_2\":0,\"helmet_1\":0}', '{}'),
(26, 'slaughterer', 0, 'employee', 'Intérimaire', 0, '{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":67,\"pants_1\":36,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":0,\"torso_1\":56,\"beard_2\":6,\"shoes_1\":12,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":15,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":0,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}', '{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":72,\"pants_1\":45,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":1,\"torso_1\":49,\"beard_2\":6,\"shoes_1\":24,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":9,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":5,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `licenses`
--

CREATE TABLE `licenses` (
  `type` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Tablo döküm verisi `licenses`
--

INSERT INTO `licenses` (`type`, `label`) VALUES
('dmv', 'Code de la route'),
('drive', 'Permis de conduire'),
('drive_bike', 'Permis moto'),
('drive_truck', 'Permis camion');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `m3_inv_customstashs`
--

CREATE TABLE `m3_inv_customstashs` (
  `id` int(10) NOT NULL,
  `stashname` varchar(50) NOT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `m3_inv_gloveboxs`
--

CREATE TABLE `m3_inv_gloveboxs` (
  `id` int(10) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `m3_inv_stashs`
--

CREATE TABLE `m3_inv_stashs` (
  `id` int(10) NOT NULL,
  `stashname` varchar(50) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `m3_inv_stashs`
--

INSERT INTO `m3_inv_stashs` (`id`, `stashname`, `owner`, `data`) VALUES
(899, 'LSPD Deposu', 'police', '[]'),
(900, 'Mavi Çete', 'aztec', '[]'),
(901, 'Sheriff Deposu', 'police', '[]'),
(902, 'Yeşil Çete', 'gsf', '[]'),
(903, 'Sarı Çete', 'vagos', '[]'),
(904, 'Mor Çete', 'ballas', '[]');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `m3_inv_trunks`
--

CREATE TABLE `m3_inv_trunks` (
  `id` int(10) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `m3_robshops`
--

CREATE TABLE `m3_robshops` (
  `shopid` int(11) NOT NULL,
  `robtime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Tablo döküm verisi `m3_robshops`
--

INSERT INTO `m3_robshops` (`shopid`, `robtime`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 0),
(19, 0),
(20, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `owned_properties`
--

CREATE TABLE `owned_properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `owned_vehicles`
--

CREATE TABLE `owned_vehicles` (
  `owner` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `vehicle` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_bin NOT NULL DEFAULT 'car',
  `job` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `stored` tinyint(1) NOT NULL DEFAULT 0,
  `lasthouse` int(11) DEFAULT 0,
  `garage` varchar(200) COLLATE utf8mb4_bin DEFAULT 'A',
  `vehicleimage` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `finance` int(32) NOT NULL DEFAULT 0,
  `financetimer` int(32) NOT NULL DEFAULT 0,
  `jamstate` int(11) NOT NULL DEFAULT 0,
  `state` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `phone_calls`
--

CREATE TABLE `phone_calls` (
  `id` int(11) NOT NULL,
  `owner` varchar(10) NOT NULL,
  `num` varchar(10) NOT NULL,
  `incoming` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `phone_messages`
--

CREATE TABLE `phone_messages` (
  `id` int(11) NOT NULL,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `phone_users_contacts`
--

CREATE TABLE `phone_users_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `properties`
--

CREATE TABLE `properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `entering` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `exit` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `inside` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `outside` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ipls` varchar(255) COLLATE utf8mb4_bin DEFAULT '[]',
  `gateway` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `society_moneywash`
--

CREATE TABLE `society_moneywash` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `society` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `twitter_accounts`
--

CREATE TABLE `twitter_accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Tablo döküm verisi `twitter_accounts`
--

INSERT INTO `twitter_accounts` (`id`, `username`, `password`, `avatar_url`, `identifier`) VALUES
(1624, 'Can Demir', '0', NULL, 'steam:11000010944d838');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `twitter_tweets`
--

CREATE TABLE `twitter_tweets` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `twitter_tweets`
--

INSERT INTO `twitter_tweets` (`id`, `authorId`, `realUser`, `message`, `image`, `time`, `likes`) VALUES
(10712, 1624, 'steam:11000010944d838', '1', '', '2021-03-19 15:42:04', 0),
(10713, 1624, 'steam:11000010944d838', '', 'https://media.giphy.com/media/GODlx6QgaWxQ2xMgwo/giphy.gif....', '2021-03-19 15:42:58', 0),
(10714, 1624, 'steam:11000010944d838', '', 'https://media.giphy.com/media/GODlx6QgaWxQ2xMgwo/giphy.gif', '2021-03-19 15:43:23', 0),
(10715, 1624, 'steam:11000010944d838', '1', '', '2021-03-19 15:52:20', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `identifier` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `accounts` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_bin DEFAULT 'user',
  `inventory` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `job` varchar(20) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `position` varchar(255) COLLATE utf8mb4_bin DEFAULT '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}',
  `firstname` varchar(16) COLLATE utf8mb4_bin DEFAULT NULL,
  `lastname` varchar(16) COLLATE utf8mb4_bin DEFAULT NULL,
  `dateofbirth` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `sex` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `skin` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `status` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `last_property` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `crypto` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '{"bitcoin": 0, "ethereum": 0, "bitcoin-cash": 0, "bitcoin-sv": 0, "litecoin": 0, "binance-coin": 0, "monero": 0, "dash": 0, "zcash": 0, "maker": 0}',
  `phone_number` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`identifier`, `license`, `accounts`, `group`, `inventory`, `job`, `job_grade`, `loadout`, `position`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `skin`, `status`, `last_property`, `is_dead`, `crypto`, `phone_number`) VALUES
('steam:11000010944d838', 'license:da416b00c6de67b1a244fff2a59301946ecbcaad', '{\"money\":0,\"black_money\":0,\"bank\":50000}', 'user', '{\"blue_phone\":1}', 'unemployed', 0, '[]', '{\"y\":-977.8,\"x\":-256.8,\"heading\":221.3,\"z\":31.2}', 'Can', 'Demir', '12/11/1994', 'm', 71, '{\"hair_color_1\":0,\"helmet_2\":0,\"arms\":0,\"eyebrows_3\":0,\"beard_1\":0,\"chest_1\":0,\"face\":0,\"complexion_2\":0,\"moles_1\":0,\"lipstick_3\":0,\"pants_2\":0,\"mask_1\":0,\"skin\":0,\"makeup_3\":0,\"hair_2\":0,\"makeup_4\":0,\"eyebrows_2\":0,\"lipstick_2\":0,\"bproof_2\":0,\"shoes_1\":0,\"blemishes_1\":0,\"pants_1\":0,\"bodyb_1\":0,\"eyebrows_1\":0,\"bags_1\":0,\"makeup_1\":0,\"glasses_1\":0,\"chest_3\":0,\"watches_2\":0,\"tshirt_2\":0,\"complexion_1\":0,\"eye_color\":0,\"decals_1\":0,\"eyebrows_4\":0,\"blush_2\":0,\"glasses_2\":0,\"blush_1\":0,\"bracelets_1\":-1,\"hair_1\":0,\"age_2\":0,\"sun_2\":0,\"watches_1\":-1,\"beard_2\":0,\"ears_2\":0,\"blemishes_2\":0,\"sex\":0,\"hair_color_2\":0,\"bracelets_2\":0,\"lipstick_1\":0,\"beard_3\":0,\"sun_1\":0,\"chain_1\":0,\"chain_2\":0,\"blush_3\":0,\"torso_1\":0,\"ears_1\":-1,\"mask_2\":0,\"makeup_2\":0,\"bproof_1\":0,\"tshirt_1\":0,\"bodyb_2\":0,\"lipstick_4\":0,\"bags_2\":0,\"shoes_2\":0,\"helmet_1\":-1,\"beard_4\":0,\"decals_2\":0,\"torso_2\":0,\"arms_2\":0,\"chest_2\":0,\"moles_2\":0,\"age_1\":0}', '[]', NULL, 0, '{\"bitcoin\": 0, \"ethereum\": 0, \"bitcoin-cash\": 0, \"bitcoin-sv\": 0, \"litecoin\": 0, \"binance-coin\": 0, \"monero\": 0, \"dash\": 0, \"zcash\": 0, \"maker\": 0}', '8778045');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user_licenses`
--

CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL,
  `type` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `owner` varchar(40) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vehicles`
--

CREATE TABLE `vehicles` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Tablo döküm verisi `vehicles`
--

INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
('Akuma', 'AKUMA', 7500, 'motorcycles'),
('Adder', 'adder', 900000, 'super'),
('Alpha', 'alpha', 60000, 'sports'),
('Ardent', 'ardent', 1150000, 'sportsclassics'),
('Asea', 'asea', 5500, 'sedans'),
('Autarch', 'autarch', 1955000, 'super'),
('Avarus', 'avarus', 18000, 'motorcycles'),
('Bagger', 'bagger', 13500, 'motorcycles'),
('Baller', 'baller2', 40000, 'suvs'),
('Baller Sport', 'baller3', 60000, 'suvs'),
('Banshee', 'banshee', 70000, 'sports'),
('Banshee 900R', 'banshee2', 255000, 'super'),
('Bati 801', 'bati', 12000, 'motorcycles'),
('Bati 801RR', 'bati2', 19000, 'motorcycles'),
('Bestia GTS', 'bestiagts', 55000, 'sports'),
('BF400', 'bf400', 6500, 'motorcycles'),
('Bf Injection', 'bfinjection', 16000, 'offroad'),
('Bifta', 'bifta', 12000, 'offroad'),
('Bison', 'bison', 45000, 'vans'),
('Blade', 'blade', 15000, 'muscle'),
('Blazer', 'blazer', 6500, 'offroad'),
('Blazer Sport', 'blazer4', 8500, 'offroad'),
('blazer5', 'blazer5', 1755600, 'offroad'),
('Blista', 'blista', 8000, 'compacts'),
('BMX (velo)', 'bmx', 160, 'motorcycles'),
('Bobcat XL', 'bobcatxl', 32000, 'vans'),
('Brawler', 'brawler', 45000, 'offroad'),
('Brioso R/A', 'brioso', 18000, 'compacts'),
('Btype', 'btype', 62000, 'sportsclassics'),
('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
('Buccaneer', 'buccaneer', 18000, 'muscle'),
('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
('Buffalo', 'buffalo', 12000, 'sports'),
('Buffalo S', 'buffalo2', 20000, 'sports'),
('Bullet', 'bullet', 90000, 'super'),
('Burrito', 'burrito3', 19000, 'vans'),
('Camper', 'camper', 42000, 'vans'),
('Carbonizzare', 'carbonizzare', 75000, 'sports'),
('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
('Casco', 'casco', 30000, 'sportsclassics'),
('Cavalcade', 'cavalcade2', 55000, 'suvs'),
('Cheetah', 'cheetah', 375000, 'super'),
('Chimera', 'chimera', 38000, 'motorcycles'),
('Chino', 'chino', 15000, 'muscle'),
('Chino Luxe', 'chino2', 19000, 'muscle'),
('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
('Comet', 'comet2', 65000, 'sports'),
('Comet 5', 'comet5', 1145000, 'sports'),
('Contender', 'contender', 70000, 'suvs'),
('Coquette', 'coquette', 65000, 'sports'),
('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
('Cyclone', 'cyclone', 1890000, 'super'),
('Daemon', 'daemon', 11500, 'motorcycles'),
('Daemon High', 'daemon2', 13500, 'motorcycles'),
('Defiler', 'defiler', 9800, 'motorcycles'),
('Deluxo', 'deluxo', 4721500, 'sportsclassics'),
('Dominator', 'dominator', 35000, 'muscle'),
('Double T', 'double', 28000, 'motorcycles'),
('Dubsta', 'dubsta', 45000, 'suvs'),
('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
('Dukes', 'dukes', 28000, 'muscle'),
('Dune Buggy', 'dune', 8000, 'offroad'),
('Elegy', 'elegy2', 38500, 'sports'),
('Emperor', 'emperor', 8500, 'sedans'),
('Enduro', 'enduro', 5500, 'motorcycles'),
('Entity XF', 'entityxf', 425000, 'super'),
('Esskey', 'esskey', 4200, 'motorcycles'),
('Exemplar', 'exemplar', 32000, 'coupes'),
('F620', 'f620', 40000, 'coupes'),
('Faction', 'faction', 20000, 'muscle'),
('Faction Rider', 'faction2', 30000, 'muscle'),
('Faction XL', 'faction3', 40000, 'muscle'),
('Faggio', 'faggio', 1900, 'motorcycles'),
('Vespa', 'faggio2', 2800, 'motorcycles'),
('Felon', 'felon', 42000, 'coupes'),
('Felon GT', 'felon2', 55000, 'coupes'),
('Feltzer', 'feltzer2', 55000, 'sports'),
('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
('Fixter (velo)', 'fixter', 225, 'motorcycles'),
('FMJ', 'fmj', 185000, 'super'),
('Fhantom', 'fq2', 17000, 'suvs'),
('Fugitive', 'fugitive', 12000, 'sedans'),
('Furore GT', 'furoregt', 45000, 'sports'),
('Fusilade', 'fusilade', 40000, 'sports'),
('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
('Gauntlet', 'gauntlet', 30000, 'muscle'),
('Gang Burrito', 'gburrito', 45000, 'vans'),
('Burrito', 'gburrito2', 29000, 'vans'),
('Glendale', 'glendale', 6500, 'sedans'),
('Grabger', 'granger', 50000, 'suvs'),
('Gresley', 'gresley', 47500, 'suvs'),
('GT 500', 'gt500', 785000, 'sportsclassics'),
('Guardian', 'guardian', 45000, 'offroad'),
('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
('Hermes', 'hermes', 535000, 'muscle'),
('Hexer', 'hexer', 12000, 'motorcycles'),
('Hotknife', 'hotknife', 125000, 'muscle'),
('Huntley S', 'huntley', 40000, 'suvs'),
('Hustler', 'hustler', 625000, 'muscle'),
('Infernus', 'infernus', 180000, 'super'),
('Innovation', 'innovation', 23500, 'motorcycles'),
('Intruder', 'intruder', 7500, 'sedans'),
('Issi', 'issi2', 10000, 'compacts'),
('Jackal', 'jackal', 38000, 'coupes'),
('Jester', 'jester', 65000, 'sports'),
('Jester(Racecar)', 'jester2', 135000, 'sports'),
('Journey', 'journey', 6500, 'vans'),
('Kamacho', 'kamacho', 345000, 'offroad'),
('Khamelion', 'khamelion', 38000, 'sports'),
('Kuruma', 'kuruma', 30000, 'sports'),
('Landstalker', 'landstalker', 35000, 'suvs'),
('RE-7B', 'le7b', 325000, 'super'),
('Lynx', 'lynx', 40000, 'sports'),
('Mamba', 'mamba', 70000, 'sports'),
('Manana', 'manana', 12800, 'sportsclassics'),
('Manchez', 'manchez', 5300, 'motorcycles'),
('Massacro', 'massacro', 65000, 'sports'),
('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
('Mesa', 'mesa', 16000, 'suvs'),
('Mesa Trail', 'mesa3', 40000, 'suvs'),
('Minivan', 'minivan', 13000, 'vans'),
('Monroe', 'monroe', 55000, 'sportsclassics'),
('The Liberator', 'monster', 210000, 'offroad'),
('Moonbeam', 'moonbeam', 18000, 'vans'),
('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
('Nemesis', 'nemesis', 5800, 'motorcycles'),
('Neon', 'neon', 1500000, 'sports'),
('Nightblade', 'nightblade', 35000, 'motorcycles'),
('Nightshade', 'nightshade', 65000, 'muscle'),
('9F', 'ninef', 65000, 'sports'),
('9F Cabrio', 'ninef2', 80000, 'sports'),
('Omnis', 'omnis', 35000, 'sports'),
('Oppressor', 'oppressor', 3524500, 'super'),
('Oracle XS', 'oracle2', 35000, 'coupes'),
('Osiris', 'osiris', 160000, 'super'),
('Panto', 'panto', 10000, 'compacts'),
('Paradise', 'paradise', 19000, 'vans'),
('Pariah', 'pariah', 1420000, 'sports'),
('Patriot', 'patriot', 55000, 'suvs'),
('PCJ-600', 'pcj', 6200, 'motorcycles'),
('Penumbra', 'penumbra', 28000, 'sports'),
('Pfister', 'pfister811', 85000, 'super'),
('Phoenix', 'phoenix', 12500, 'muscle'),
('Picador', 'picador', 18000, 'muscle'),
('Pigalle', 'pigalle', 20000, 'sportsclassics'),
('Prairie', 'prairie', 12000, 'compacts'),
('Premier', 'premier', 8000, 'sedans'),
('Primo Custom', 'primo2', 14000, 'sedans'),
('X80 Proto', 'prototipo', 2500000, 'super'),
('Radius', 'radi', 29000, 'suvs'),
('raiden', 'raiden', 1375000, 'sports'),
('Rapid GT', 'rapidgt', 35000, 'sports'),
('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
('Reaper', 'reaper', 150000, 'super'),
('Rebel', 'rebel2', 35000, 'offroad'),
('Regina', 'regina', 5000, 'sedans'),
('Retinue', 'retinue', 615000, 'sportsclassics'),
('Revolter', 'revolter', 1610000, 'sports'),
('riata', 'riata', 380000, 'offroad'),
('Rocoto', 'rocoto', 45000, 'suvs'),
('Ruffian', 'ruffian', 6800, 'motorcycles'),
('Ruiner 2', 'ruiner2', 5745600, 'muscle'),
('Rumpo', 'rumpo', 15000, 'vans'),
('Rumpo Trail', 'rumpo3', 19500, 'vans'),
('Sabre Turbo', 'sabregt', 20000, 'muscle'),
('Sabre GT', 'sabregt2', 25000, 'muscle'),
('Sanchez', 'sanchez', 5300, 'motorcycles'),
('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
('Sanctus', 'sanctus', 25000, 'motorcycles'),
('Sandking', 'sandking', 55000, 'offroad'),
('Savestra', 'savestra', 990000, 'sportsclassics'),
('SC 1', 'sc1', 1603000, 'super'),
('Schafter', 'schafter2', 25000, 'sedans'),
('Schafter V12', 'schafter3', 50000, 'sports'),
('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
('Seminole', 'seminole', 25000, 'suvs'),
('Sentinel', 'sentinel', 32000, 'coupes'),
('Sentinel XS', 'sentinel2', 40000, 'coupes'),
('Sentinel3', 'sentinel3', 650000, 'sports'),
('Seven 70', 'seven70', 39500, 'sports'),
('ETR1', 'sheava', 220000, 'super'),
('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
('Slam Van', 'slamvan3', 11500, 'muscle'),
('Sovereign', 'sovereign', 22000, 'motorcycles'),
('Stinger', 'stinger', 80000, 'sportsclassics'),
('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
('Streiter', 'streiter', 500000, 'sports'),
('Stretch', 'stretch', 90000, 'sedans'),
('Stromberg', 'stromberg', 3185350, 'sports'),
('Sultan', 'sultan', 15000, 'sports'),
('Sultan RS', 'sultanrs', 65000, 'super'),
('Super Diamond', 'superd', 130000, 'sedans'),
('Surano', 'surano', 50000, 'sports'),
('Surfer', 'surfer', 12000, 'vans'),
('T20', 't20', 300000, 'super'),
('Tailgater', 'tailgater', 30000, 'sedans'),
('Tampa', 'tampa', 16000, 'muscle'),
('Drift Tampa', 'tampa2', 80000, 'sports'),
('Thrust', 'thrust', 24000, 'motorcycles'),
('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
('Trophy Truck', 'trophytruck', 60000, 'offroad'),
('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
('Tropos', 'tropos', 40000, 'sports'),
('Turismo R', 'turismor', 350000, 'super'),
('Tyrus', 'tyrus', 600000, 'super'),
('Vacca', 'vacca', 120000, 'super'),
('Vader', 'vader', 7200, 'motorcycles'),
('Verlierer', 'verlierer2', 70000, 'sports'),
('Vigero', 'vigero', 12500, 'muscle'),
('Virgo', 'virgo', 14000, 'muscle'),
('Viseris', 'viseris', 875000, 'sportsclassics'),
('Visione', 'visione', 2250000, 'super'),
('Voltic', 'voltic', 90000, 'super'),
('Voltic 2', 'voltic2', 3830400, 'super'),
('Voodoo', 'voodoo', 7200, 'muscle'),
('Vortex', 'vortex', 9800, 'motorcycles'),
('Warrener', 'warrener', 4000, 'sedans'),
('Washington', 'washington', 9000, 'sedans'),
('Windsor', 'windsor', 95000, 'coupes'),
('Windsor Drop', 'windsor2', 125000, 'coupes'),
('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
('XLS', 'xls', 32000, 'suvs'),
('Yosemite', 'yosemite', 485000, 'muscle'),
('Youga', 'youga', 10800, 'vans'),
('Youga Luxuary', 'youga2', 14500, 'vans'),
('Z190', 'z190', 900000, 'sportsclassics'),
('Zentorno', 'zentorno', 1500000, 'super'),
('Zion', 'zion', 36000, 'coupes'),
('Zion Cabrio', 'zion2', 45000, 'coupes'),
('Zombie', 'zombiea', 9500, 'motorcycles'),
('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
('Z-Type', 'ztype', 220000, 'sportsclassics');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vehicle_categories`
--

CREATE TABLE `vehicle_categories` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Tablo döküm verisi `vehicle_categories`
--

INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
('compacts', 'Compacts'),
('coupes', 'Coupés'),
('motorcycles', 'Motos'),
('muscle', 'Muscle'),
('offroad', 'Off Road'),
('sedans', 'Sedans'),
('sports', 'Sports'),
('sportsclassics', 'Sports Classics'),
('super', 'Super'),
('suvs', 'SUVs'),
('vans', 'Vans');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `vehicle_sold`
--

CREATE TABLE `vehicle_sold` (
  `client` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `soldby` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `date` varchar(50) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yellowpages_posts`
--

CREATE TABLE `yellowpages_posts` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `addon_account`
--
ALTER TABLE `addon_account`
  ADD PRIMARY KEY (`name`);

--
-- Tablo için indeksler `addon_account_data`
--
ALTER TABLE `addon_account_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  ADD KEY `index_addon_account_data_account_name` (`account_name`);

--
-- Tablo için indeksler `addon_inventory`
--
ALTER TABLE `addon_inventory`
  ADD PRIMARY KEY (`name`);

--
-- Tablo için indeksler `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  ADD KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  ADD KEY `index_addon_inventory_inventory_name` (`inventory_name`);

--
-- Tablo için indeksler `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `communityservice`
--
ALTER TABLE `communityservice`
  ADD PRIMARY KEY (`identifier`);

--
-- Tablo için indeksler `crew_phone_bank`
--
ALTER TABLE `crew_phone_bank`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `crew_phone_news`
--
ALTER TABLE `crew_phone_news`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `datastore`
--
ALTER TABLE `datastore`
  ADD PRIMARY KEY (`name`);

--
-- Tablo için indeksler `datastore_data`
--
ALTER TABLE `datastore_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  ADD KEY `index_datastore_data_name` (`name`);

--
-- Tablo için indeksler `disc_ammo`
--
ALTER TABLE `disc_ammo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Tablo için indeksler `fine_types`
--
ALTER TABLE `fine_types`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`name`);

--
-- Tablo için indeksler `jail`
--
ALTER TABLE `jail`
  ADD PRIMARY KEY (`identifier`);

--
-- Tablo için indeksler `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`name`);

--
-- Tablo için indeksler `job_grades`
--
ALTER TABLE `job_grades`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`type`);

--
-- Tablo için indeksler `m3_inv_customstashs`
--
ALTER TABLE `m3_inv_customstashs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Tablo için indeksler `m3_inv_gloveboxs`
--
ALTER TABLE `m3_inv_gloveboxs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Tablo için indeksler `m3_inv_stashs`
--
ALTER TABLE `m3_inv_stashs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Tablo için indeksler `m3_inv_trunks`
--
ALTER TABLE `m3_inv_trunks`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Tablo için indeksler `m3_robshops`
--
ALTER TABLE `m3_robshops`
  ADD PRIMARY KEY (`shopid`);

--
-- Tablo için indeksler `owned_properties`
--
ALTER TABLE `owned_properties`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  ADD PRIMARY KEY (`plate`);

--
-- Tablo için indeksler `phone_calls`
--
ALTER TABLE `phone_calls`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `phone_messages`
--
ALTER TABLE `phone_messages`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `society_moneywash`
--
ALTER TABLE `society_moneywash`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `twitter_accounts`
--
ALTER TABLE `twitter_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Tablo için indeksler `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_twitter_tweets_twitter_accounts` (`authorId`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`identifier`);

--
-- Tablo için indeksler `user_licenses`
--
ALTER TABLE `user_licenses`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`model`);

--
-- Tablo için indeksler `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  ADD PRIMARY KEY (`name`);

--
-- Tablo için indeksler `vehicle_sold`
--
ALTER TABLE `vehicle_sold`
  ADD PRIMARY KEY (`plate`);

--
-- Tablo için indeksler `yellowpages_posts`
--
ALTER TABLE `yellowpages_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_yellowpages_posts_twitter_accounts` (`authorId`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `addon_account_data`
--
ALTER TABLE `addon_account_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Tablo için AUTO_INCREMENT değeri `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `crew_phone_bank`
--
ALTER TABLE `crew_phone_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Tablo için AUTO_INCREMENT değeri `crew_phone_news`
--
ALTER TABLE `crew_phone_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `datastore_data`
--
ALTER TABLE `datastore_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Tablo için AUTO_INCREMENT değeri `disc_ammo`
--
ALTER TABLE `disc_ammo`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `fine_types`
--
ALTER TABLE `fine_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Tablo için AUTO_INCREMENT değeri `job_grades`
--
ALTER TABLE `job_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Tablo için AUTO_INCREMENT değeri `m3_inv_customstashs`
--
ALTER TABLE `m3_inv_customstashs`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `m3_inv_gloveboxs`
--
ALTER TABLE `m3_inv_gloveboxs`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `m3_inv_stashs`
--
ALTER TABLE `m3_inv_stashs`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=905;

--
-- Tablo için AUTO_INCREMENT değeri `m3_inv_trunks`
--
ALTER TABLE `m3_inv_trunks`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `m3_robshops`
--
ALTER TABLE `m3_robshops`
  MODIFY `shopid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Tablo için AUTO_INCREMENT değeri `owned_properties`
--
ALTER TABLE `owned_properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `phone_calls`
--
ALTER TABLE `phone_calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16291;

--
-- Tablo için AUTO_INCREMENT değeri `phone_messages`
--
ALTER TABLE `phone_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45219;

--
-- Tablo için AUTO_INCREMENT değeri `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=992;

--
-- Tablo için AUTO_INCREMENT değeri `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `society_moneywash`
--
ALTER TABLE `society_moneywash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `twitter_accounts`
--
ALTER TABLE `twitter_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1625;

--
-- Tablo için AUTO_INCREMENT değeri `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10716;

--
-- Tablo için AUTO_INCREMENT değeri `user_licenses`
--
ALTER TABLE `user_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `yellowpages_posts`
--
ALTER TABLE `yellowpages_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  ADD CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`);

--
-- Tablo kısıtlamaları `yellowpages_posts`
--
ALTER TABLE `yellowpages_posts`
  ADD CONSTRAINT `FK_yellowpages_posts_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
