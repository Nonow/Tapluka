-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  lun. 17 fév. 2020 à 14:11
-- Version du serveur :  8.0.13-4
-- Version de PHP :  7.2.24-0ubuntu0.18.04.2

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

-- --------------------------------------------------------

--
-- Structure de la table `familles`
--

CREATE TABLE `familles` (
  `id` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `nom` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `famille_spec`
--

CREATE TABLE `famille_spec` (
  `id_famille` int(11) NOT NULL,
  `id_spec` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `nom` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `magasins`
--

CREATE TABLE `magasins` (
  `id` int(11) NOT NULL,
  `postal` int(11) NOT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `magasin_ingredient`
--

CREATE TABLE `magasin_ingredient` (
  `id_magasin` int(11) NOT NULL,
  `id_ingredient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `preparations`
--

CREATE TABLE `preparations` (
  `id` int(11) NOT NULL,
  `id_recette` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `description` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `recettes`
--

CREATE TABLE `recettes` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `difficulte` int(11) NOT NULL,
  `tempsPreparation` int(11) DEFAULT NULL,
  `tempsCuisson` int(11) DEFAULT NULL,
  `theme` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

-- --------------------------------------------------------

--
-- Structure de la table `recette_preparation`
--

CREATE TABLE `recette_preparation` (
  `id_recette` int(11) NOT NULL,
  `id_preparation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `specificationsAlimentaires`
--

CREATE TABLE `specificationsAlimentaires` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL,
  `pseudonyme` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `mail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `motdepasse` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `postal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur_spec`
--

CREATE TABLE `utilisateur_spec` (
  `id_utilisateur` int(11) NOT NULL,
  `id_spec` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `magasin_ingredient`
--
ALTER TABLE `magasin_ingredient`
  ADD PRIMARY KEY (`id_magasin`,`id_ingredient`),
  ADD KEY `magasin_ingredient_ingrédients_id_fk` (`id_ingredient`);

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
-- Index pour la table `recette_ingredient`
--
ALTER TABLE `recette_ingredient`
  ADD PRIMARY KEY (`id_recette`,`id_ingredient`),
  ADD KEY `recette_ingredient_ingrédients_id_fk` (`id_ingredient`);

--
-- Index pour la table `recette_preparation`
--
ALTER TABLE `recette_preparation`
  ADD PRIMARY KEY (`id_recette`,`id_preparation`),
  ADD KEY `recette_preparation_preparations_id_fk` (`id_preparation`);

--
-- Index pour la table `specificationsAlimentaires`
--
ALTER TABLE `specificationsAlimentaires`
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
-- AUTO_INCREMENT pour la table `magasins`
--
ALTER TABLE `magasins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `preparations`
--
ALTER TABLE `preparations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `recettes`
--
ALTER TABLE `recettes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `magasin_ingredient_magasins_id_fk` FOREIGN KEY (`id_magasin`) REFERENCES `magasins` (`id`);

--
-- Contraintes pour la table `preparations`
--
ALTER TABLE `preparations`
  ADD CONSTRAINT `preparations_recettes_id_fk` FOREIGN KEY (`id_recette`) REFERENCES `recettes` (`id`);

--
-- Contraintes pour la table `recette_ingredient`
--
ALTER TABLE `recette_ingredient`
  ADD CONSTRAINT `recette_ingredient_ingrédients_id_fk` FOREIGN KEY (`id_ingredient`) REFERENCES `ingrédients` (`id`),
  ADD CONSTRAINT `recette_ingredient_recettes_id_fk` FOREIGN KEY (`id_recette`) REFERENCES `recettes` (`id`);

--
-- Contraintes pour la table `recette_preparation`
--
ALTER TABLE `recette_preparation`
  ADD CONSTRAINT `recette_preparation_preparations_id_fk` FOREIGN KEY (`id_preparation`) REFERENCES `preparations` (`id`),
  ADD CONSTRAINT `recette_preparation_recettes_id_fk` FOREIGN KEY (`id_recette`) REFERENCES `recettes` (`id`);

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
