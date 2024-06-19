-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 19 juin 2024 à 19:16
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `medfinder`
--

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

CREATE TABLE `medicament` (
  `id_medicament` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prix` float NOT NULL,
  `code` varchar(255) NOT NULL,
  `dci` varchar(255) NOT NULL,
  `dosage` varchar(255) NOT NULL,
  `forme` varchar(255) NOT NULL,
  `presentation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `medicament`
--

INSERT INTO `medicament` (`id_medicament`, `nom`, `prix`, `code`, `dci`, `dosage`, `forme`, `presentation`) VALUES
(3630, 'URO / EAU POUR IRRIGATION', 95, '6,118E+12', 'EAU POUR PREPARATION INJECTABLE', '3000 ML', 'SOLUTION POUR IRRIGATION', '1 POCHE 3 L'),
(3631, 'ELOXATINE 5 MG/ML', 2882, '6,11801E+12', 'OXALIPLATINE', '200 MG', 'SOLUTION A DILUER POUR PERFUSION', '1 BOITE 1 FLACON 40 ML'),
(3632, 'ELOXATINE 5 MG/ML', 2882, '6,118E+12', 'OXALIPLATINE', '200 MG', 'SOLUTION A DILUER POUR PERFUSION', '1 BOITE 1 FLACON 40 ML'),
(3633, 'VIVALAN', 60.7, '6,118E+12', 'VILOXAZINE', '100 MG', 'COMPRIME PELLICULE', '1 BOITE 20 COMPRIME'),
(3634, 'ZADRYL', 31.9, '6,118E+12', 'CETIRIZINE', '1 MG', 'SOLUTION BUVABLE', '1 FLACON 60 ML'),
(3635, 'MYNAZOL', 87, '6,118E+12', 'FLUCONAZOLE', '50 MG', 'GELULE', '1 BOITE 7 GELULE'),
(3636, 'ALFACEFAL 125 MG/5 ML', 45, '6,118E+12', 'CEFACLOR', '1.5 G', 'POUDRE POUR SUSPENSION BUVABLE', '1 FLACON 60 ML'),
(3637, 'NOCAND 50 MG', 35, '6,118E+12', 'FLUCONAZOLE', '50 MG', 'GELULE', '1 BOITE 7 GELULE'),
(3638, 'MEDIATOR', 60, '6,118E+12', 'BENFLUOREX', '150 MG', 'COMPRIME ENROBE', '1 BOITE 30 COMPRIME'),
(3639, 'GASTROLIBER', 75, '6,118E+12', 'LANSOPRAZOLE', '30 MG', 'GELULE GASTRO-RESISTANTE', '1 BOITE 15 GELULE GASTRO-RESISTANTE'),
(3640, 'CLOFENE', 20.5, '6,118E+12', 'DICLOFENAC', '25 MG', 'COMPRIME ENROBE GASTRO-RESISTANT', '1 BOITE 20 COMPRIME'),
(3641, 'ZELDOX', 318, '6,118E+12', 'ZIPRASIDONE', '40 MG', 'GELULE', '1 BOITE 14 GELULE'),
(3642, 'TRIFLUCAN', 144.3, '6,118E+12', 'FLUCONAZOLE', '2 MG', 'SOLUTION POUR PERFUSION', '1 FLACON 50 ML'),
(3643, 'AVT', 10.5, '6,118E+12', 'ACIDE ACETYLSALICYLIQUE / THIAMINE (VITAMINE B1)', '600 / 5 MG / MG', 'SUPPOSITOIRE', '1 BOITE 10 SUPPOSITOIRE'),
(3644, 'KLONOPIN', 41.2, '6,118E+12', 'CLONAZEPAM', '2 MG', 'COMPRIME QUADRISECABLE', '1 BOITE 40 COMPRIME'),
(3645, 'HYDROXO 5000', 58.5, '6,118E+12', 'HYDROXOCOBALAMINE', '5000 µG', 'SOLUTION INJECTABLE', '1 BOITE 4 AMPOULE'),
(3646, 'DISPAMOX', 34.6, '6,118E+12', 'AMOXICILLINE', '500 MG', 'COMPRIME DISPERSIBLE', '1 BOITE 12 COMPRIME'),
(3647, 'MUSARIL', 51.8, '6,118E+12', 'TETRAZEPAM', '50 MG', 'COMPRIME ENROBE', '1 BOITE 20 COMPRIME'),
(3648, 'PRETERAX', 239, '6,118E+12', 'INDAPAMIDE / PERINDOPRIL', '0.625 / 2 MG / MG', 'COMPRIME SECABLE', '1 BOITE 30 COMPRIME'),
(3649, 'CLAFORAN', 69, '6,118E+12', 'CEFOTAXIME', '1 G', 'POUDRE POUR SOLUTION INJECTABLE', '1 BOITE 1 FLACON'),
(3650, 'RHINOFEBRAL', 14.3, '6,118E+12', 'PARACETAMOL / CHLORPHENAMINE', '240 / 3.2 MG / MG', 'GELULE', '1 BOITE 20 GELULE'),
(3651, 'RIFASONE', 12, '6,118E+12', 'RIFAMYCINE / PREDNISOLONE', '0.25 / 1 G / G', 'POMMADE', '1 TUBE 5 G'),
(3652, 'FLUIBRON', 38.85, '6,118E+12', 'AMBROXOL', '0.3 %', 'SOLUTION BUVABLE', '1 FLACON 200 ML'),
(3653, 'AMOXIL', 38.9, '6,118E+12', 'AMOXICILLINE', '500 MG', 'POUDRE POUR SUSPENSION BUVABLE', '1 FLACON 60 ML'),
(3654, 'BENCLAMID', 36.2, '6,118E+12', 'GLIBENCLAMIDE', '5 MG', 'COMPRIME', '1 BOITE 60 COMPRIME'),
(3655, 'UNASYN', 42, '6,118E+12', 'AMPICILLINE / SULBACTAM', '1 / 0.5 G / G', 'POUDRE POUR SOLUTION INJECTABLE', '1 FLACON 3.2 ML'),
(3656, 'LASILIX', 7.4, '6,118E+12', 'FUROSEMIDE', '20 MG', 'SOLUTION INJECTABLE', '1 AMPOULE 2 ML'),
(3657, 'DILATOR', 41.2, '6,11801E+12', 'SALBUTAMOL', '2.5 MG', 'SOLUTION POUR INHALATION PAR NEBULISEUR', '1 BOITE 10 RECIPIENT'),
(3658, 'DILATOR', 41.2, '6,118E+12', 'SALBUTAMOL', '2.5 MG', 'SOLUTION POUR INHALATION PAR NEBULISEUR', '1 BOITE 10 RECIPIENT'),
(3659, 'FORMOFTIL', 17.8, '6,11801E+12', 'FORMOCORTAL', '0.05 %', 'COLLYRE', '1 FLACON .5 ML'),
(3660, 'GENTAGAM 120', 15.8, '6,118E+12', 'GENTAMICINE', '120 MG', 'SOLUTION INJECTABLE', '1 BOITE 1 AMPOULE INJECTABLE'),
(3661, 'UMILINE PROFIL 30 PEN', 104, '6,118E+12', 'INSULINE HUMAINE', '100 UI', 'SUSPENSION INJECTABLE INTERMEDIAIRE', '1 CARTOUCHE 3 ML'),
(3662, 'BIRODOGYL', 102, '6,118E+12', 'SPIRAMYCINE / METRONIDAZOLE', '1.5 / 250 MUI / MG', 'COMPRIME PELLICULE', '1 BOITE 15 COMPRIME'),
(3663, 'GLEMA', 40, '6,118E+12', 'GLIMEPIRIDE', '2 MG', 'COMPRIME', '1 BOITE 30 COMPRIME'),
(3664, 'SALAZOPYRIN', 141.7, '6,118E+12', 'SULFASALAZINE', '500 MG', 'COMPRIME ENROBE GASTRO-RESISTANT', '1 BOITE 100 COMPRIME GASTRO-RESISTANT'),
(3665, 'XANTHIUM LP', 51.5, '6,118E+12', 'THEOPHYLLINE', '300 MG', 'GELULE LP', '1 BOITE 60 GELULE'),
(3666, 'AIRLIX', 31.9, '6,118E+12', 'CETIRIZINE', '1 MG', 'SOLUTION BUVABLE', '1 FLACON 60 ML'),
(3667, 'GYNOMYK', 62.2, '6,118E+12', 'BUTOCONAZOLE', '100 MG', 'OVULE', '1 BOITE 3 OVULE'),
(3668, 'AVASTIN', 3983, '6,118E+12', 'BEVACIZUMAB', '100 MG', 'SOLUTION A DILUER POUR PERFUSION', '1 BOITE 1 FLACON'),
(3669, 'FLUMAX 6000 UI ANTI-XA/0.6ML', 134.6, '6,118E+12', 'ENOXAPARINE', '6000 UI ANTI-XA', 'SOLUTION INJECTABLE', '1 BOITE 2 SERINGUE PREREMPLIE'),
(3670, 'PARAPLATINE', 835.3, '6,118E+12', 'CARBOPLATINE', '50 MG', 'SOLUTION POUR PERFUSION', '1 FLACON 5 ML'),
(3671, 'TRIFAX IV', 61, '6,118E+12', 'CEFTRIAXONE', '500 MG', 'POUDRE POUR SOLUTION INJECTABLE', '1 BOITE 1 FLACON'),
(3672, 'GLUCOVANCE', 42, '6,118E+12', 'METFORMINE / GLIBENCLAMIDE', '500 / 2.5 MG / MG', 'COMPRIME PELLICULE', '1 BOITE 30 COMPRIME PELLICULE'),
(3673, 'IXOR', 108, '6,118E+12', 'OMEPRAZOLE', '10 MG', 'COMPRIME EFFERVESCENT', '1 BOITE 28 COMPRIME'),
(3674, 'PENICILLINE G 1 M UI DIAMANT', 10.3, '6,118E+12', 'BENZYLPENICILLINE', '1 MUI', 'POUDRE POUR SOLUTION INJECTABLE', '1 BOITE 1 FLACON'),
(3675, 'DIPRIVAN', 314.9, '6,118E+12', 'PROPOFOL', '500 MG', 'EMULSION INJECTABLE', '1 BOITE 1 KIT'),
(3676, 'NEORAL', 1736, '6,118E+12', 'CICLOSPORINE', '100 MG', 'SOLUTION BUVABLE', '1 FLACON 50 ML'),
(3677, 'XANTHIUM LP', 21.8, '6,118E+12', 'THEOPHYLLINE', '200 MG', 'GELULE LP', '1 BOITE 30 GELULE'),
(3678, 'AGIDERM', 25, '6,118E+12', 'ACIDE FUSIDIQUE', '2 %', 'POMMADE', '1 TUBE 15 G'),
(3679, 'GYNO CANESTEN', 56.25, '6,118E+12', 'CLOTRIMAZOLE', '1 %', 'CREME VAGINALE', '1 TUBE 35 G'),
(3680, 'CIPRO LP 500 MG', 60, '6,118E+12', 'CIPROFLOXACINE', '500 MG', 'COMPRIME PELLICULE LP', '1 BOITE 3 COMPRIME PELLICULE'),
(3681, 'CIFLOXINE', 120, '6,118E+12', 'CIPROFLOXACINE', '500 MG', 'COMPRIME ENROBE GASTRO-RESISTANT', '1 BOITE 10 COMPRIME ENROBE'),
(3682, 'SUPRIMASE', 29.9, '6,118E+12', 'FLUCONAZOLE', '150 MG', 'GELULE', '1 BOITE 1 GELULE'),
(3683, 'MEDIVEINE', 62.4, '6,118E+12', 'DIOSMINE', '300 MG', 'COMPRIME PELLICULE', '1 BOITE 60 COMPRIME'),
(3684, 'PURSENNIDE', 16.9, '6,118E+12', 'SENOSIDES CALCIQUES', '20 MG', 'COMPRIME ENROBE', '1 BOITE 20 COMPRIME ENROBE'),
(3685, 'IDEOS', 53.4, '6,118E+12', 'CALCIUM / COLECALCIFEROL (VITAMINE D3)', '500 / 400 MG / UI', 'COMPRIME A SUCER', '1 BOITE 30 COMPRIME'),
(3686, 'NORMACOL LAVEMENT AD', 26.5, '6,118E+12', 'PHOSPHATE MONOSODIQUE / PHOSPHATE DISODIQUE', '23.66 / 10.4 G / G', 'SOLUTION RECTALE', '1 FLACON 130 ML'),
(3687, 'CRESTOR', 210, '6,11801E+12', 'ROSUVASTATINE', '5 MG', 'COMPRIME PELLICULE', '1 BOITE 30 COMPRIME'),
(3688, 'CRESTOR', 210, '6,118E+12', 'ROSUVASTATINE', '5 MG', 'COMPRIME PELLICULE', '1 BOITE 30 COMPRIME'),
(3689, 'INHIBACE', 179.9, '6,118E+12', 'CILAZAPRIL', '5 MG', 'COMPRIME PELLICULE', '1 BOITE 28 COMPRIME SECABLE'),
(3690, 'DIAMICRON', 37.2, '6,118E+12', 'GLICLAZIDE', '80 MG', 'COMPRIME SECABLE', '1 BOITE 20 COMPRIME'),
(3691, 'TEGRETOL', 81.1, '6,118E+12', 'CARBAMAZEPINE', '200 MG', 'COMPRIME SECABLE', '1 BOITE 50 COMPRIME SECABLE'),
(3692, 'ANDOL', 10, '6,118E+12', 'PARACETAMOL', '500 MG', 'COMPRIME', '1 BOITE 20 COMPRIME'),
(3693, 'ZECLAR', 171.65, '6,118E+12', 'CLARITHROMYCINE', '250 MG', 'COMPRIME PELLICULE', '1 BOITE 10 COMPRIME'),
(3694, 'OREX', 37.7, '6,118E+12', 'CEFALEXINE', '250 MG', 'GRANULE POUR SUSPENSION BUVABLE', '1 FLACON 60 ML'),
(3695, 'FENAC', 44.1, '6,118E+12', 'DICLOFENAC', '50 MG', 'COMPRIME GASTRO-RESISTANT', '1 BOITE 30 COMPRIME GASTRO-RESISTANT'),
(3696, 'LIPISTAT', 232, '6,11801E+12', 'SIMVASTATINE', '40 MG', 'COMPRIME ENROBE', '1 BOITE 28 COMPRIME ENROBE'),
(3697, 'LIPISTAT', 232, '6,118E+12', 'SIMVASTATINE', '40 MG', 'COMPRIME ENROBE', '1 BOITE 28 COMPRIME ENROBE'),
(3698, 'CALCIBRONAT', 26.4, '6,118E+12', 'BROMOGALACTOGLUCONATE DE CALCIUM', '13.3 %', 'SIROP', '1 FLACON 200 ML'),
(3699, 'VITA C 1000', 27.7, '6,118E+12', 'ACIDE ASCORBIQUE (VITAMINE C)', '1 G', 'COMPRIME EFFERVESCENT', '1 BOITE 20 COMPRIME EFFERVESCENT'),
(3700, 'DUPHALAC', 49.35, '6,118E+12', 'LACTULOSE', '66.5 %', 'SOLUTION BUVABLE', '1 FLACON 200 ML'),
(3701, 'CIALIS', 440, '6,118E+12', 'TADALAFIL', '20 MG', 'COMPRIME PELLICULE', '1 BOITE 4 COMPRIME PELLICULE'),
(3702, 'EPHEDRYL', 17.85, '6,118E+12', 'PARACETAMOL / TRIPROLIDINE', '2.5 / 25 G / MG', 'SOLUTION BUVABLE', '1 FLACON 100 ML'),
(3703, 'ECLARAN', 31.45, '6,118E+12', 'PEROXYDE DE BENZOYLE', '5 %', 'GEL', '1 TUBE 45 G'),
(3704, 'COQUELUSEDAL NOURRISSON', 11.4, '6,11801E+12', 'NIAOULI / GRINDELIA / GELSEMIUM', '10/10/2005 MG / MG / MG', 'SUPPOSITOIRE', '1 BOITE 12 SUPPOSITOIRE'),
(3705, 'NICOPASS 1.5 MG SANS SUCRE REGLISSE MENTHE', 120.4, '6,118E+12', 'NICOTINE', '1.5 MG', 'PASTILLE A SUCER', '1 BOITE 36 PASTILLE'),
(3706, 'MICROPAKINE LP 100 MG', 39.6, '6,11801E+12', 'VALPROATE DE SODIUM', '100 MG', 'GRANULE LP', '1 BOITE 30 SACHET'),
(3707, 'MICROPAKINE LP 100 MG', 39.6, '6,118E+12', 'VALPROATE DE SODIUM', '100 MG', 'GRANULE LP', '1 BOITE 30 SACHET'),
(3708, 'CYTARABINE EBEWE', 42, '6,118E+12', 'CYTARABINE', '100 MG', 'SOLUTION POUR PERFUSION', '1 FLACON 5 ML'),
(3709, 'FLEET PHOSPHO-SODA', 128, '6,118E+12', 'HYDROGENOPHOSPHATE DE SODIUM DODECAHYDRATE / DIHYDROGENOPHOSPHATE DE SODIUM HYDRATE', '10.8 / 24.4 G / G', 'SOLUTION BUVABLE', '2 FLACON 45 ML'),
(3710, 'NEOMOX', 28, '6,118E+12', 'AMOXICILLINE', '250 MG', 'POUDRE POUR SUSPENSION BUVABLE', '1 FLACON 60 ML'),
(3711, 'ANEXATE 0.5 MG / 5 ML', 1079, '6,118E+12', 'FLUMAZENIL', '0.5 MG', 'SOLUTION INJECTABLE', '1 BOITE 5 AMPOULE INJECTABLE'),
(3712, 'TOBRADEX', 60, '6,118E+12', 'TOBRAMYCINE / DEXAMETHASONE', '03-janv MG / MG', 'POMMADE OPHTALMIQUE', '1 TUBE 3.5 G'),
(3713, 'BAITANET G', 41, '6,118E+12', 'POLYVIDONE IODEE', '10 %', 'SOLUTION GYNECOLOGIQUE', '1 FLACON 550 ML'),
(3714, 'CARDIX', 44, '6,118E+12', 'CARVEDILOL', '6.25 MG', 'COMPRIME SECABLE', '1 BOITE 28 COMPRIME'),
(3715, 'CLARELUX 500 µG', 165.9, '6,118E+12', 'PROPIONATE DE CLOBETASOL', '500 µG', 'MOUSSE', '1 FLACON 100 G'),
(3716, 'BISOLVON', 18.3, '6,118E+12', 'BROMHEXINE', '0.2 %', 'SOLUTION BUVABLE', '1 FLACON 60 ML'),
(3717, 'ANAFRANIL', 47.9, '6,118E+12', 'CLOMIPRAMINE', '25 MG', 'COMPRIME ENROBE', '1 BOITE 30 COMPRIME ENROBE'),
(3718, 'AROMASINE', 969, '6,118E+12', 'EXEMESTANE', '25 MG', 'COMPRIME ENROBE', '1 BOITE 30 COMPRIME'),
(3719, 'CLARADOL PLUS', 17.25, '6,118E+12', 'PARACETAMOL / PROPYPHENAZONE', '250 / 150 MG / MG', 'COMPRIME', '1 BOITE 10 COMPRIME'),
(3720, 'VANTEC', 37.7, '6,11801E+12', 'CETIRIZINE', '10 MG', 'COMPRIME ENROBE SECABLE', '1 BOITE 30 COMPRIME ENROBE'),
(3721, 'VANTEC', 37.7, '6,118E+12', 'CETIRIZINE', '10 MG', 'COMPRIME ENROBE SECABLE', '1 BOITE 30 COMPRIME ENROBE'),
(3722, 'CEFOTRIM', 61, '6,118E+12', 'CEFTRIAXONE', '500 MG', 'POUDRE POUR SOLUTION INJECTABLE', '1 BOITE 1 FLACON'),
(3723, 'ACIVIR', 25, '6,118E+12', 'ACICLOVIR', '0.1 G', 'CREME', '1 TUBE 2 G'),
(3724, 'MADECASSOL', 24, '6,118E+12', 'CENTELLA ASIATICA', '1 %', 'POMMADE', '1 TUBE 10 G'),
(3725, 'MITOSYL IRRITATIONS', 17.25, '6,118E+12', 'FOIE DE POISSON / ZINC', '13 / 17.55 G / G', 'POMMADE', '1 TUBE 65 G'),
(3726, 'PANOXYL', 40.2, '6,118E+12', 'PEROXYDE DE BENZOYLE', '5 %', 'GEL', '1 TUBE 40 G'),
(3727, 'MICROVAL', 13.95, '6,118E+12', 'LEVONORGESTREL', '0.03 MG', 'COMPRIME ENROBE', '1 BOITE 28 COMPRIME'),
(3728, 'LAMICTAL', 41.2, '6,118E+12', 'LAMOTRIGINE', '5 MG', 'COMPRIME DISPERSIBLE', '1 BOITE 30 COMPRIME'),
(3729, 'GYNERGENE CAFEINE', 41.8, '6,118E+12', 'ERGOTAMINE / CAFEINE', '1 / 100 MG / MG', 'COMPRIME', '1 BOITE 20 COMPRIME'),
(4453, 'ALFACEFAL 125 MG/5 ML', 45, '', '', '', '', ''),
(4454, 'ALFACEFAL 125 MG/5 ML', 45, '', '', '', '', ''),
(4455, 'ALFACEFAL 125 MG/5 ML', 45, '', '', '', '', ''),
(4456, 'ALFACEFAL 125 MG/5 ML', 45, '', '', '', '', ''),
(4458, 'ALFACEFAL 125 MG/5 ML', 45, '', '', '', '', ''),
(4460, 'ALFACEFAL 125 MG/5 ML', 45, '', '', '', '', ''),
(4462, 'CLOFENE', 50, '', '', '', '', ''),
(4463, 'URO / EAU POUR IRRIGATION', 95, '', '', '', '', ''),
(4464, 'ELOXATINE 5 MG/ML', 180, '', '', '', '', ''),
(4465, 'ELOXATINE 5 MG/ML', 180, '', '', '', '', ''),
(4466, 'URO / EAU POUR IRRIGATION', 95, '', '', '', '', ''),
(4467, 'VIVALAN', 61, '', '', '', '', ''),
(4468, 'VIVALAN', 61, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

CREATE TABLE `patient` (
  `id_patient` int(11) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `nom` varchar(25) NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `telephone` varchar(25) NOT NULL,
  `adresse` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `patient`
--

INSERT INTO `patient` (`id_patient`, `email`, `password`, `nom`, `prenom`, `telephone`, `adresse`) VALUES
(1, 'aaa@aa.com', 'aaaa', 'Amdi', 'Samir', '0622434343', 'Casablanca');

-- --------------------------------------------------------

--
-- Structure de la table `pharmacie`
--

CREATE TABLE `pharmacie` (
  `id_pharmacie` int(11) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `raison_soc` varchar(25) NOT NULL,
  `adresse` varchar(25) NOT NULL,
  `telephone` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `pharmacie`
--

INSERT INTO `pharmacie` (`id_pharmacie`, `email`, `password`, `raison_soc`, `adresse`, `telephone`) VALUES
(1, 'pharmacie1@aa.com', 'aaaa', 'Pharmacie Essalam', 'Hay Mohamamdi', '0523434343'),
(2, 'pharmacie2@gmail.com', 'bbbbbb', 'Pharmacie Chifaa', 'Mohammedia', '0523434343');

-- --------------------------------------------------------

--
-- Structure de la table `proposer`
--

CREATE TABLE `proposer` (
  `id_proposer` int(11) NOT NULL,
  `id_pharmacie` int(11) NOT NULL,
  `id_medicament` int(11) NOT NULL,
  `quantite_disponible` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `proposer`
--

INSERT INTO `proposer` (`id_proposer`, `id_pharmacie`, `id_medicament`, `quantite_disponible`) VALUES
(2, 1, 3636, 68),
(3, 1, 3630, 190);

-- --------------------------------------------------------

--
-- Structure de la table `recherche`
--

CREATE TABLE `recherche` (
  `id_recherche` int(11) NOT NULL,
  `id_medicament` int(11) NOT NULL,
  `date_recherche` date NOT NULL,
  `heure_recherche` varchar(25) NOT NULL,
  `quantite_recherche` int(11) NOT NULL,
  `satisfait` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `recherche`
--

INSERT INTO `recherche` (`id_recherche`, `id_medicament`, `date_recherche`, `heure_recherche`, `quantite_recherche`, `satisfait`) VALUES
(2, 3640, '2024-05-10', '12:00', 50, 1),
(3, 3692, '2024-05-08', '13:00', 10, 1),
(5, 4458, '0000-00-00', '', 100, 1),
(6, 4460, '0000-00-00', '', 100, 1),
(7, 4463, '0000-00-00', '', 200, 1),
(8, 4464, '0000-00-00', '', 250, 1),
(9, 4468, '0000-00-00', '', 15, 1);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id_reservation` int(11) NOT NULL,
  `id_patient` int(11) NOT NULL,
  `id_medicament` int(11) NOT NULL,
  `date_reservation` date NOT NULL,
  `statut` varchar(25) NOT NULL,
  `quantite_reservation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id_reservation`, `id_patient`, `id_medicament`, `date_reservation`, `statut`, `quantite_reservation`) VALUES
(17, 0, 4454, '0000-00-00', '', 100),
(18, 0, 4455, '0000-00-00', '', 100),
(22, 0, 4462, '0000-00-00', '', 100),
(23, 0, 4465, '0000-00-00', '', 5),
(24, 0, 3636, '2024-06-18', '', 5),
(25, 0, 4466, '0000-00-00', '', 20),
(26, 0, 3636, '2024-06-18', '', 7),
(27, 0, 3630, '2024-06-18', '', 10),
(28, 0, 4467, '0000-00-00', '', 15);

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

CREATE TABLE `stock` (
  `id_stock` int(11) NOT NULL,
  `id_pharmacie` int(11) NOT NULL,
  `id_medicament` int(11) NOT NULL,
  `quantite` int(100) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
-- --------------------------------------------------------

--
-- Structure de la table `notifications`
--

CREATE TABLE notifications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    medication_name VARCHAR(255) NOT NULL,
    pharmacy_name VARCHAR(255) NOT NULL,
    requested_quantity INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


--
-- Index pour les tables déchargées
--

--
-- Index pour la table `medicament`
--
ALTER TABLE `medicament`
  ADD PRIMARY KEY (`id_medicament`);

--
-- Index pour la table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id_patient`);

--
-- Index pour la table `pharmacie`
--
ALTER TABLE `pharmacie`
  ADD PRIMARY KEY (`id_pharmacie`);

--
-- Index pour la table `proposer`
--
ALTER TABLE `proposer`
  ADD PRIMARY KEY (`id_proposer`),
  ADD KEY `id_medicament` (`id_medicament`),
  ADD KEY `id_pharmacie` (`id_pharmacie`);

--
-- Index pour la table `recherche`
--
ALTER TABLE `recherche`
  ADD PRIMARY KEY (`id_recherche`),
  ADD KEY `id_medicament` (`id_medicament`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id_reservation`),
  ADD KEY `id_medicament` (`id_medicament`);

--
-- Index pour la table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id_stock`),
  ADD KEY `id_pharmacie` (`id_pharmacie`),
  ADD KEY `id_medicament` (`id_medicament`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `medicament`
--
ALTER TABLE `medicament`
  MODIFY `id_medicament` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4469;

--
-- AUTO_INCREMENT pour la table `patient`
--
ALTER TABLE `patient`
  MODIFY `id_patient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `pharmacie`
--
ALTER TABLE `pharmacie`
  MODIFY `id_pharmacie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `proposer`
--
ALTER TABLE `proposer`
  MODIFY `id_proposer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `recherche`
--
ALTER TABLE `recherche`
  MODIFY `id_recherche` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id_reservation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `stock`
--
ALTER TABLE `stock`
  MODIFY `id_stock` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `proposer`
--
ALTER TABLE `proposer`
  ADD CONSTRAINT `proposer_ibfk_1` FOREIGN KEY (`id_medicament`) REFERENCES `medicament` (`id_medicament`),
  ADD CONSTRAINT `proposer_ibfk_2` FOREIGN KEY (`id_pharmacie`) REFERENCES `pharmacie` (`id_pharmacie`);

--
-- Contraintes pour la table `recherche`
--
ALTER TABLE `recherche`
  ADD CONSTRAINT `recherche_ibfk_1` FOREIGN KEY (`id_medicament`) REFERENCES `medicament` (`id_medicament`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`id_medicament`) REFERENCES `medicament` (`id_medicament`);

--
-- Contraintes pour la table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`id_pharmacie`) REFERENCES `pharmacie` (`id_pharmacie`),
  ADD CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`id_medicament`) REFERENCES `medicament` (`id_medicament`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
