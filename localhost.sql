-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  sam. 09 mai 2020 à 13:03
-- Version du serveur :  8.0.13-4
-- Version de PHP :  7.2.24-0ubuntu0.18.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `Um177LwAqA`
--
CREATE DATABASE IF NOT EXISTS `Um177LwAqA` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `Um177LwAqA`;

-- --------------------------------------------------------

--
-- Structure de la table `familles`
--

CREATE TABLE `familles` (
  `id` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `nom` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `familles`
--

INSERT INTO `familles` (`id`, `id_utilisateur`, `nom`, `type`) VALUES
(3, 4, 'Paul', 0),
(527954, 3, 'Adrien', 1),
(645047, 3, 'Steavee', 0),
(725740, 3, 'Nonow WU', 0),
(834246, 3, 'Sunland', 0),
(891577, 3, 'Tomasz', 0);

-- --------------------------------------------------------

--
-- Structure de la table `famille_spec`
--

CREATE TABLE `famille_spec` (
  `id_famille` int(11) NOT NULL,
  `id_spec` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `famille_spec`
--

INSERT INTO `famille_spec` (`id_famille`, `id_spec`) VALUES
(645047, 1),
(725740, 1),
(834246, 1),
(527954, 2),
(725740, 2),
(527954, 3),
(645047, 3),
(645047, 4);

-- --------------------------------------------------------

--
-- Structure de la table `imageRecette`
--

CREATE TABLE `imageRecette` (
  `id` int(11) NOT NULL,
  `id_recette` int(11) NOT NULL,
  `chemin` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `imageRecette`
--

INSERT INTO `imageRecette` (`id`, `id_recette`, `chemin`) VALUES
(1, 1, '1-1.jpg'),
(3, 1, '1-2.jpg'),
(4, 1, '1-3.jpg'),
(5, 1, '1-4.jpg'),
(6, 2, '2-1.jpg'),
(7, 2, '2-2.jpg'),
(8, 2, '2-3.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `ingredient_spec`
--

CREATE TABLE `ingredient_spec` (
  `id_ingredient` int(11) NOT NULL,
  `id_spec` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ingrédients`
--

CREATE TABLE `ingrédients` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `label` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `ingrédients`
--

INSERT INTO `ingrédients` (`id`, `nom`, `photo`, `label`) VALUES
(1, 'Farine', '1.jpg', 'Sans label '),
(2, 'Oeuf', '2.jpg', 'Bio'),
(3, 'Sucre', '3.jpg', 'Sans label '),
(4, 'Huile', '4.jpg', 'Bio'),
(5, 'Beurre', '5.jpg', 'Sans label'),
(6, 'Lait', '6.jpg', 'Sans OGM'),
(7, 'Rhum', '7.jpg', 'Sans label'),
(8, 'Eau', '8.jpg', 'Sans label'),
(9, 'Sel', '9.jpg', 'Label rouge'),
(10, 'Huile de pépin de raisin', '10.jpg', 'Bio'),
(11, 'Orange', '11.jpg', 'Sans label'),
(12, 'Ananas', '12.jpg', 'Sans label'),
(13, 'Tomate', '13.jpg', 'Sans label'),
(14, 'Citron', '14.jpg', 'Sans label'),
(15, 'Carotte', '15.jpg', 'Sans label'),
(16, 'Pomme', '16.jpg', 'Sans label'),
(17, 'Brocolis', '17.jpg', 'Sans label'),
(18, 'Concombre', '18.jpg', 'Sans label'),
(19, 'Courgette', '19.jpg', 'Sans label'),
(20, 'Aubergine', '20.jpg', 'Sans label'),
(21, 'Choucroute', '21.jpg', 'Sans label'),
(22, 'Oignon', '22.jpg', 'Sans label'),
(23, 'Grains de genièvre', '23.jpg', 'Sans label'),
(24, 'Porc fumé', '24.jpg', 'Sans label'),
(25, 'Saucisse de Montbéliard', '25.jpg', 'Sans label'),
(26, 'Saucisse de Strasbourg', '26.jpg', 'Sans label'),
(27, 'Riesling', '27.jpg', 'Sans label'),
(28, 'Pomme de terre', '28.jpg', 'Sans label'),
(29, 'Pâte feuilletée', '29.jpg', 'Sans label'),
(30, 'Poudre d\'amande', '30.jpg', 'Sans label'),
(31, 'Pilon de poulet', '31.jpg', 'Sans label'),
(32, 'Merguez', '32.jpg', 'Sans label'),
(33, 'Concentré de tomates', '33.jpg', 'Sans label'),
(34, 'Harissa', '34.jpg', 'Sans label'),
(35, 'Epices à couscous', '35.jpg', 'Sans label'),
(36, 'Navets', '36.jpg', 'Sans label'),
(37, 'Pois chiches', '37.jpg', 'Sans label'),
(38, 'Sardine', '38.jpg', 'Sans label'),
(39, 'Saumon', '39.jpg', 'Sans label'),
(40, 'Bar', '40.jpg', 'Sans label'),
(41, 'Bavette', '41.jpg', 'Sans label'),
(42, 'Riz', '42.jpg', 'Sans label'),
(43, 'Homard', '43.jpg', 'Sans label'),
(44, 'Anguille', '44.jpg', 'Sans label'),
(45, 'Feuille de nori', '45.jpg', 'Sans label'),
(46, 'Sauce soja', '46.jpg', 'Sans label'),
(47, 'Wasabi', '47.jpg', 'Sans label'),
(48, 'Gingembre', '48.jpg', 'Sans label'),
(49, 'Graine de sésame', '49.jpg', 'Sans label'),
(50, 'Vinaigre', '50.jpg', 'Sans label'),
(51, 'Viande de cheval', '51.jpg', NULL),
(52, 'Bavette de boeuf', '52.jpg', NULL),
(53, 'Faux filet', '53.jpg', NULL),
(54, 'Filet de poulet', '54.jpg', NULL),
(55, 'Cuisse de poulet', '55.jpg', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `magasins`
--

CREATE TABLE `magasins` (
  `id_magasin` int(11) NOT NULL,
  `Nom` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `Latitude` float NOT NULL,
  `Longitude` float NOT NULL,
  `postal` int(11) NOT NULL,
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `magasins`
--

INSERT INTO `magasins` (`id_magasin`, `Nom`, `Latitude`, `Longitude`, `postal`, `type`) VALUES
(1, 'Carrefour', 48.8439, 2.30707, 75015, NULL),
(2, 'Carrefour', 48.8932, 2.33916, 75018, NULL),
(3, 'Carrefour', 48.8276, 2.34562, 75013, NULL),
(4, 'Carrefour', 48.8466, 2.25554, 75016, NULL),
(5, 'Auchan', 48.8785, 2.38581, 75019, NULL),
(6, 'Monoprix', 48.8752, 2.38848, 75020, NULL),
(7, 'Auchan', 48.8709, 2.39824, 75020, NULL),
(8, 'Casino', 48.8679, 2.38631, 75020, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `magasin_ingredient`
--

CREATE TABLE `magasin_ingredient` (
  `id_magasin` int(11) NOT NULL,
  `id_ingredient` int(11) NOT NULL,
  `Prix` float DEFAULT NULL,
  `Rayon` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `magasin_ingredient`
--

INSERT INTO `magasin_ingredient` (`id_magasin`, `id_ingredient`, `Prix`, `Rayon`) VALUES
(1, 1, 1.5, 'Pains'),
(1, 2, 3, 'Oeufs'),
(1, 3, 1.2, 'sucre'),
(1, 4, 1.55, 'Huile'),
(1, 5, 1.45, 'Beurre'),
(1, 6, 2.1, 'Laitier'),
(1, 7, 13.9, 'Alcool'),
(1, 8, 2.8, 'Boisson'),
(1, 9, 0.9, 'Epice'),
(1, 10, 3.5, 'Huile'),
(1, 51, 20, 'Viande'),
(1, 52, 13, 'Viande'),
(1, 53, 13, 'Viande'),
(1, 54, 9.9, 'Viande'),
(1, 55, 4.9, 'Viande'),
(2, 1, 1.7, 'Pain'),
(2, 2, 4.9, 'Oeufs'),
(2, 3, 1.6, 'sucre'),
(2, 4, 1.9, 'Huile'),
(2, 5, 2.3, 'Beurre'),
(2, 6, 2, 'Laitier'),
(2, 7, 19.9, 'Alcool'),
(3, 3, 0.7, 'sucre'),
(4, 2, 2.9, 'Oeufs'),
(4, 3, 2, 'sucre'),
(5, 6, 3.5, 'Laitiers'),
(5, 8, 3.5, 'Boissons'),
(6, 1, 0.7, 'Pain'),
(6, 2, 2, 'Pains'),
(6, 3, 1.3, 'sucre'),
(6, 5, 1.9, 'Beurre'),
(6, 8, 2.1, 'Boissons'),
(6, 9, 1, 'Epice'),
(6, 10, 3.2, 'Huile');

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

CREATE TABLE `note` (
  `id_recette` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `note` int(2) UNSIGNED NOT NULL,
  `temps_cree` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

CREATE TABLE `panier` (
  `id_panier` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `nom` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `panier`
--

INSERT INTO `panier` (`id_panier`, `id_utilisateur`, `nom`) VALUES
(367348, 3, 'Oeuf'),
(566349, 3, 'Huile');

-- --------------------------------------------------------

--
-- Structure de la table `planning`
--

CREATE TABLE `planning` (
  `id` int(11) NOT NULL,
  `jour` int(11) DEFAULT NULL,
  `moment` int(11) DEFAULT NULL,
  `id_utilisateur` int(11) DEFAULT NULL,
  `id_recette` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `planning`
--

INSERT INTO `planning` (`id`, `jour`, `moment`, `id_utilisateur`, `id_recette`) VALUES
(14, 2, 2, 3, 3),
(18, 3, 3, 3, 1),
(19, 5, 4, 3, 1),
(20, 1, 2, NULL, 2),
(22, 1, 3, 3, 2),
(23, 1, 4, 3, 1),
(25, 1, 2, 3, 2),
(28, 1, 1, 3, 2),
(29, 2, 2, 3, 1),
(30, 1, 2, 3, 2),
(31, 1, 4, 3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `planning_famille`
--

CREATE TABLE `planning_famille` (
  `id_planning` int(11) NOT NULL,
  `id_famille` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `preparations`
--

CREATE TABLE `preparations` (
  `id` int(11) NOT NULL,
  `id_recette` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `preparations`
--

INSERT INTO `preparations` (`id`, `id_recette`, `numero`, `description`) VALUES
(1, 1, 1, 'Mettre la farine dans une terrine et former un puits.'),
(2, 1, 2, 'Y déposer les oeufs entiers'),
(3, 1, 3, 'Mélanger délicatement avec un fouet en ajoutant au fur et à mesure le lait. La pâte ainsi obtenue doit avoir une consistance d\'un liquide légèrement épais.'),
(4, 1, 4, 'Parfumer de rhum.'),
(5, 1, 5, 'Faire chauffer une poêle antiadhésive et la huiler très légèrement. Y verser une louche de pâte'),
(6, 2, 1, 'deposer 25g de farine'),
(7, 2, 2, 'déposer les œufs');

-- --------------------------------------------------------

--
-- Structure de la table `recettes`
--

CREATE TABLE `recettes` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `difficulte` int(11) NOT NULL,
  `tempsPreparation` int(11) DEFAULT NULL,
  `tempsCuisson` int(11) DEFAULT NULL,
  `categorie` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sousCategorie` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `chemin_rec` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `specialite` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `recettes`
--

INSERT INTO `recettes` (`id`, `nom`, `description`, `difficulte`, `tempsPreparation`, `tempsCuisson`, `categorie`, `sousCategorie`, `video`, `chemin_rec`, `specialite`) VALUES
(1, 'Pâte à crêpe', 'Délicieuse recette de pâte à crêpe', 2, 30, 20, 'Dessert', 'Végétarien', 'pate_a_crepe_360p.mp4', '1-1.jpg', NULL),
(2, 'Churros', 'Nouvelle recette de Churros !', 1, 20, 10, 'Dessert', 'Végétarien', 'Churros.mp4', '2-1.jpg', 'Espagnol'),
(3, 'Couscous poulet et merguez', 'Préparez la veille, car les ingrédients s\'impregnent bien des épices', 2, 30, 35, 'Plat', NULL, NULL, '3-1.jpg', NULL),
(10, 'Spaghettis aux tomates', 'Spaghettis aux tomates fraîches et basilic', 2, 10, 15, 'Plat', NULL, NULL, '10-1.jpg', 'Italien'),
(11, 'Salade de riz complet ', 'Salade de riz complet ', 1, 20, 0, 'Dîner', NULL, NULL, '11-1.jpg', NULL),
(12, 'gratin de courgette ', 'gratin de courgette ', 2, 20, 30, 'Plat', NULL, NULL, '12-1.jpg', NULL),
(13, 'Pain perdu salé ', 'Pain perdu salé ', 1, 10, 10, 'Plat', NULL, NULL, '13-1.jpg', NULL),
(14, 'Fish burger ', 'Fish burger ', 1, 20, 10, 'Plat', NULL, NULL, '14-1.jpg', NULL),
(15, 'Soupe de lentilles', 'Soupe de lentilles', 1, 5, 30, 'Dîner', NULL, NULL, '15-1.jpg', NULL),
(16, 'Crème de pois chiche', 'Crème de pois chiche et carottes ', 1, 30, 10, 'Dîner', NULL, NULL, '16-1.jpg', NULL),
(17, 'Quiche lorraine', 'Quiche lorraine', 2, 10, 30, 'Dîner', NULL, NULL, '17-1.jpg', NULL),
(18, 'Tarte saumon fumé', 'Tarte saumon fumé et brocolis', 2, 15, 40, 'Dîner', NULL, NULL, '18-1.jpg', NULL),
(19, 'Tarte au pesto', 'Tarte au pesto', 1, 10, 20, 'Dîner', NULL, NULL, '19-1.jpg', NULL),
(20, 'Salade d\'avocats', 'Salade d\'avocats', 1, 10, 0, 'Dîner', NULL, NULL, '20-1.jpg', NULL),
(21, 'Carbonara', 'Carbonara Courgette & Jambon de Parme', 2, 25, 10, 'Plat', NULL, NULL, '21-1.jpg', 'Italien'),
(22, 'Pâtes au saumon', 'Pâtes au saumon fumé et au fenouil', 2, 15, 20, 'Plat', NULL, NULL, '22-1.jpg', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `recette_favori`
--

CREATE TABLE `recette_favori` (
  `id_recette` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `recette_favori`
--

INSERT INTO `recette_favori` (`id_recette`, `id_utilisateur`) VALUES
(2, 3),
(3, 3),
(2, 4);

-- --------------------------------------------------------

--
-- Structure de la table `recette_ingredient`
--

CREATE TABLE `recette_ingredient` (
  `id_recette` int(11) NOT NULL,
  `id_ingredient` int(11) NOT NULL,
  `quantite` float NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `recette_ingredient`
--

INSERT INTO `recette_ingredient` (`id_recette`, `id_ingredient`, `quantite`, `type`) VALUES
(1, 1, 300, 0),
(1, 2, 3, 3),
(1, 3, 3, 4),
(1, 4, 2, 4),
(1, 5, 50, 0),
(1, 6, 0.6, 1),
(1, 7, 0.05, 1),
(2, 1, 225, 0),
(2, 2, 2, 3),
(2, 3, 60, 0),
(2, 5, 60, 0),
(2, 8, 0.25, 1),
(2, 9, 1, 3),
(2, 10, 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `recette_specMonde`
--

CREATE TABLE `recette_specMonde` (
  `id_recette` int(4) NOT NULL,
  `id_specialite` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `recette_specMonde`
--

INSERT INTO `recette_specMonde` (`id_recette`, `id_specialite`) VALUES
(2, 1),
(10, 4);

-- --------------------------------------------------------

--
-- Structure de la table `recette_typeRecette`
--

CREATE TABLE `recette_typeRecette` (
  `id_recette` int(11) NOT NULL,
  `id_typeRecette` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `recette_typeRecette`
--

INSERT INTO `recette_typeRecette` (`id_recette`, `id_typeRecette`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `specialiteMonde`
--

CREATE TABLE `specialiteMonde` (
  `id` int(11) NOT NULL,
  `nom_spe` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `chemin` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `specialiteMonde`
--

INSERT INTO `specialiteMonde` (`id`, `nom_spe`, `chemin`) VALUES
(1, 'Espagnol', 'espagne.png'),
(2, 'Bresilien', 'bresil.png'),
(4, 'italien', 'italie.png');

-- --------------------------------------------------------

--
-- Structure de la table `specificationsAlimentaires`
--

CREATE TABLE `specificationsAlimentaires` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `specificationsAlimentaires`
--

INSERT INTO `specificationsAlimentaires` (`id`, `nom`) VALUES
(1, 'Lactose'),
(2, 'Gluten'),
(3, 'Halal'),
(4, 'vegane');

-- --------------------------------------------------------

--
-- Structure de la table `typeRecette`
--

CREATE TABLE `typeRecette` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `typeRecette`
--

INSERT INTO `typeRecette` (`id`, `nom`) VALUES
(1, 'Dessert'),
(2, 'Végétarien');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL,
  `pseudonyme` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `motdepasse` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `postal` int(11) DEFAULT NULL,
  `nom` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `prenom` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `date_inscription` date DEFAULT NULL,
  `adresse` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `notification` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `pseudonyme`, `mail`, `motdepasse`, `postal`, `nom`, `prenom`, `date_naissance`, `date_inscription`, `adresse`, `telephone`, `notification`) VALUES
(3, 'toto', 'toto@gmail.com', '123', 93290, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'titi', 'titi@gmail.com', '123', 75004, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur_spec`
--

CREATE TABLE `utilisateur_spec` (
  `id_utilisateur` int(11) NOT NULL,
  `id_spec` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `utilisateur_spec`
--

INSERT INTO `utilisateur_spec` (`id_utilisateur`, `id_spec`) VALUES
(4, 1),
(3, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `familles`
--
ALTER TABLE `familles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `familles_utilisateurs_id_fk` (`id_utilisateur`);

--
-- Index pour la table `famille_spec`
--
ALTER TABLE `famille_spec`
  ADD PRIMARY KEY (`id_famille`,`id_spec`),
  ADD KEY `famille_spec_specificationsAlimentaires_id_fk` (`id_spec`);

--
-- Index pour la table `imageRecette`
--
ALTER TABLE `imageRecette`
  ADD PRIMARY KEY (`id`),
  ADD KEY `imageRecette_recettes_id_fk` (`id_recette`);

--
-- Index pour la table `ingredient_spec`
--
ALTER TABLE `ingredient_spec`
  ADD PRIMARY KEY (`id_ingredient`,`id_spec`),
  ADD KEY `ingredient_spec_specificationsAlimentaires_id_fk` (`id_spec`);

--
-- Index pour la table `ingrédients`
--
ALTER TABLE `ingrédients`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `magasins`
--
ALTER TABLE `magasins`
  ADD PRIMARY KEY (`id_magasin`);

--
-- Index pour la table `magasin_ingredient`
--
ALTER TABLE `magasin_ingredient`
  ADD PRIMARY KEY (`id_magasin`,`id_ingredient`),
  ADD KEY `magasin_ingredient_ingrédients_id_fk` (`id_ingredient`);

--
-- Index pour la table `panier`
--
ALTER TABLE `panier`
  ADD PRIMARY KEY (`id_panier`);

--
-- Index pour la table `planning`
--
ALTER TABLE `planning`
  ADD PRIMARY KEY (`id`),
  ADD KEY `planning_utilisateurs_id_fk` (`id_utilisateur`),
  ADD KEY `planning_recettes_id_fk` (`id_recette`);

--
-- Index pour la table `planning_famille`
--
ALTER TABLE `planning_famille`
  ADD PRIMARY KEY (`id_planning`,`id_famille`),
  ADD KEY `planning_famille_familles_id_fk` (`id_famille`);

--
-- Index pour la table `preparations`
--
ALTER TABLE `preparations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `preparations_recettes_id_fk` (`id_recette`);

--
-- Index pour la table `recettes`
--
ALTER TABLE `recettes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `recette_favori`
--
ALTER TABLE `recette_favori`
  ADD PRIMARY KEY (`id_recette`,`id_utilisateur`),
  ADD KEY `recette_favori_utilisateurs_id_fk` (`id_utilisateur`);

--
-- Index pour la table `recette_ingredient`
--
ALTER TABLE `recette_ingredient`
  ADD PRIMARY KEY (`id_recette`,`id_ingredient`),
  ADD KEY `recette_ingredient_ingrédients_id_fk` (`id_ingredient`);

--
-- Index pour la table `recette_specMonde`
--
ALTER TABLE `recette_specMonde`
  ADD PRIMARY KEY (`id_recette`);

--
-- Index pour la table `recette_typeRecette`
--
ALTER TABLE `recette_typeRecette`
  ADD PRIMARY KEY (`id_recette`,`id_typeRecette`),
  ADD KEY `recette_typeRecette_typeRecette_id_fk` (`id_typeRecette`);

--
-- Index pour la table `specialiteMonde`
--
ALTER TABLE `specialiteMonde`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `specificationsAlimentaires`
--
ALTER TABLE `specificationsAlimentaires`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `typeRecette`
--
ALTER TABLE `typeRecette`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur_spec`
--
ALTER TABLE `utilisateur_spec`
  ADD PRIMARY KEY (`id_utilisateur`,`id_spec`),
  ADD KEY `utilisateur_spec_specificationsAlimentaires_id_fk` (`id_spec`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `imageRecette`
--
ALTER TABLE `imageRecette`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `magasins`
--
ALTER TABLE `magasins`
  MODIFY `id_magasin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `planning`
--
ALTER TABLE `planning`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `preparations`
--
ALTER TABLE `preparations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `recettes`
--
ALTER TABLE `recettes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `specialiteMonde`
--
ALTER TABLE `specialiteMonde`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `typeRecette`
--
ALTER TABLE `typeRecette`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `familles`
--
ALTER TABLE `familles`
  ADD CONSTRAINT `familles_utilisateurs_id_fk` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateurs` (`id`);

--
-- Contraintes pour la table `famille_spec`
--
ALTER TABLE `famille_spec`
  ADD CONSTRAINT `famille_spec_familles_id_fk` FOREIGN KEY (`id_famille`) REFERENCES `familles` (`id`),
  ADD CONSTRAINT `famille_spec_specificationsAlimentaires_id_fk` FOREIGN KEY (`id_spec`) REFERENCES `specificationsAlimentaires` (`id`);

--
-- Contraintes pour la table `imageRecette`
--
ALTER TABLE `imageRecette`
  ADD CONSTRAINT `imageRecette_recettes_id_fk` FOREIGN KEY (`id_recette`) REFERENCES `recettes` (`id`);

--
-- Contraintes pour la table `ingredient_spec`
--
ALTER TABLE `ingredient_spec`
  ADD CONSTRAINT `ingredient_spec_ingrédients_id_fk` FOREIGN KEY (`id_ingredient`) REFERENCES `ingrédients` (`id`),
  ADD CONSTRAINT `ingredient_spec_specificationsAlimentaires_id_fk` FOREIGN KEY (`id_spec`) REFERENCES `specificationsAlimentaires` (`id`);

--
-- Contraintes pour la table `magasin_ingredient`
--
ALTER TABLE `magasin_ingredient`
  ADD CONSTRAINT `magasin_ingredient_ingrédients_id_fk` FOREIGN KEY (`id_ingredient`) REFERENCES `ingrédients` (`id`),
  ADD CONSTRAINT `magasin_ingredient_magasins_id_fk` FOREIGN KEY (`id_magasin`) REFERENCES `magasins` (`id_magasin`);

--
-- Contraintes pour la table `planning`
--
ALTER TABLE `planning`
  ADD CONSTRAINT `planning_recettes_id_fk` FOREIGN KEY (`id_recette`) REFERENCES `recettes` (`id`),
  ADD CONSTRAINT `planning_utilisateurs_id_fk` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateurs` (`id`);

--
-- Contraintes pour la table `planning_famille`
--
ALTER TABLE `planning_famille`
  ADD CONSTRAINT `planning_famille_familles_id_fk` FOREIGN KEY (`id_famille`) REFERENCES `familles` (`id`),
  ADD CONSTRAINT `planning_famille_planning_id_fk` FOREIGN KEY (`id_planning`) REFERENCES `planning` (`id`);

--
-- Contraintes pour la table `preparations`
--
ALTER TABLE `preparations`
  ADD CONSTRAINT `preparations_recettes_id_fk` FOREIGN KEY (`id_recette`) REFERENCES `recettes` (`id`);

--
-- Contraintes pour la table `recette_favori`
--
ALTER TABLE `recette_favori`
  ADD CONSTRAINT `recette_favori_recettes_id_fk` FOREIGN KEY (`id_recette`) REFERENCES `recettes` (`id`),
  ADD CONSTRAINT `recette_favori_utilisateurs_id_fk` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateurs` (`id`);

--
-- Contraintes pour la table `recette_ingredient`
--
ALTER TABLE `recette_ingredient`
  ADD CONSTRAINT `recette_ingredient_ingrédients_id_fk` FOREIGN KEY (`id_ingredient`) REFERENCES `ingrédients` (`id`),
  ADD CONSTRAINT `recette_ingredient_recettes_id_fk` FOREIGN KEY (`id_recette`) REFERENCES `recettes` (`id`);

--
-- Contraintes pour la table `recette_typeRecette`
--
ALTER TABLE `recette_typeRecette`
  ADD CONSTRAINT `recette_typeRecette_recettes_id_fk` FOREIGN KEY (`id_recette`) REFERENCES `recettes` (`id`),
  ADD CONSTRAINT `recette_typeRecette_typeRecette_id_fk` FOREIGN KEY (`id_typeRecette`) REFERENCES `typeRecette` (`id`);

--
-- Contraintes pour la table `utilisateur_spec`
--
ALTER TABLE `utilisateur_spec`
  ADD CONSTRAINT `utilisateur_spec_specificationsAlimentaires_id_fk` FOREIGN KEY (`id_spec`) REFERENCES `specificationsAlimentaires` (`id`),
  ADD CONSTRAINT `utilisateur_spec_utilisateurs_id_fk` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateurs` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
