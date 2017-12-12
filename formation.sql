-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le :  mar. 12 déc. 2017 à 15:18
-- Version du serveur :  5.7.19
-- Version de PHP :  7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `formation`
--

-- --------------------------------------------------------

--
-- Structure de la table `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `titre` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `auteur` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `date_publication` datetime NOT NULL,
  `slug_titre` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `book`
--

INSERT INTO `book` (`id`, `titre`, `auteur`, `image`, `date_publication`, `slug_titre`, `description`) VALUES
(2, 'Tintin au congo ', 'Hergé', 'tintin-congo.png', '1990-12-12 14:04:55', 'tintin-congo', 'C\'est tintin au congo'),
(3, 'Tintin objectif Lune', 'Hergé', 'tintin-lune.png', '1990-12-12 14:05:08', 'tintin-lune', 'C\'est tintin sur la lune'),
(4, 'Lucky Luck', 'René Goscinny', 'lucky-luck.png', '1995-12-12 14:05:15', 'lucky-luck', 'C\'est les aventures de Lucky Luck'),
(5, 'Vingt mille lieues sous les mers', 'Jules Verne', 'jules1.png', '1869-12-12 14:06:19', 'jules1', 'C\'est un mec en sous marin'),
(6, 'Le tour du monde en 80 jours', 'Jules Verne', 'jules2.png', '1803-12-12 14:06:02', 'jules2', 'C\'est un mec qui fait le tour du monde'),
(10, 'Le Crime de l\'Orient-Express', 'Agatha Chritie', 'orient-express.png', '1934-12-12 15:33:33', 'orient-express', 'C\'est un crime dans un train'),
(11, 'Dix petits nègres', 'Agatha Chritie', '10-petits-negres.png', '1939-12-12 15:35:26', '10-petits-negres', 'C\'est des crimes sur une ile'),
(12, '1984', 'George Orwell', '1984.png', '1984-12-12 15:57:49', '1984', 'Big brother');

-- --------------------------------------------------------

--
-- Structure de la table `book_category`
--

CREATE TABLE `book_category` (
  `book_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `book_category`
--

INSERT INTO `book_category` (`book_id`, `category_id`) VALUES
(2, 1),
(3, 1),
(4, 1),
(5, 4),
(6, 4),
(10, 2),
(10, 5),
(11, 2),
(11, 5),
(12, 3),
(12, 5);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `slug_cat` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `nom_cat` varchar(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `slug_cat`, `nom_cat`) VALUES
(1, 'bd', 'Bande Dessinée'),
(2, 'policier', 'Policier'),
(3, 'sf', 'Science Fiction'),
(4, 'fantastique', 'Fantastique'),
(5, 'roman', 'Roman');

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `firstname` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `os_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`id`, `firstname`, `lastname`, `email`, `message`, `os_id`) VALUES
(1, 'Valentin', 'Bouillennec', 'val.bouillennec@gmail.com', 'Bonjour les amis !', 1),
(2, 'toto', 'TATA', 'toto@mail.fr', 'je suis toto', 1),
(3, 'Adrien', 'Neto Ferreira', 'bg@gmail.com', 'Bouge de là !', 1);

-- --------------------------------------------------------

--
-- Structure de la table `contact_hobbies`
--

CREATE TABLE `contact_hobbies` (
  `contact_id` int(11) NOT NULL,
  `hobby_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `contact_hobbies`
--

INSERT INTO `contact_hobbies` (`contact_id`, `hobby_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(3, 3),
(3, 4);

-- --------------------------------------------------------

--
-- Structure de la table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `slug` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `courses`
--

INSERT INTO `courses` (`id`, `slug`, `name`) VALUES
(1, 'developpeur-back', 'Developpeur Back'),
(2, 'developpeur-front', 'Developpeur Front'),
(3, 'webdesigner', 'Web Designer');

-- --------------------------------------------------------

--
-- Structure de la table `course_modules`
--

CREATE TABLE `course_modules` (
  `courses_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `course_modules`
--

INSERT INTO `course_modules` (`courses_id`, `module_id`) VALUES
(1, 1),
(1, 2),
(1, 6),
(2, 1),
(2, 2),
(2, 7),
(3, 3),
(3, 4),
(3, 5);

-- --------------------------------------------------------

--
-- Structure de la table `hobby`
--

CREATE TABLE `hobby` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `hobby`
--

INSERT INTO `hobby` (`id`, `name`) VALUES
(1, 'Football'),
(2, 'Basket'),
(3, 'Ping-Pong'),
(4, 'Pêche');

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

CREATE TABLE `module` (
  `id` int(11) NOT NULL,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `module`
--

INSERT INTO `module` (`id`, `name`) VALUES
(7, 'Angular'),
(5, 'Bootstrap'),
(4, 'CSS'),
(3, 'HTML'),
(1, 'PHP'),
(2, 'SQL'),
(6, 'Symfony');

-- --------------------------------------------------------

--
-- Structure de la table `module_courses`
--

CREATE TABLE `module_courses` (
  `module_id` int(11) NOT NULL,
  `courses_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `operating_system`
--

CREATE TABLE `operating_system` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `operating_system`
--

INSERT INTO `operating_system` (`id`, `name`) VALUES
(4, 'Android'),
(2, 'Linux'),
(3, 'MacOS'),
(1, 'Windows');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `book_category`
--
ALTER TABLE `book_category`
  ADD PRIMARY KEY (`book_id`,`category_id`),
  ADD KEY `IDX_1FB30F9816A2B381` (`book_id`),
  ADD KEY `IDX_1FB30F9812469DE2` (`category_id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_4C62E6383DCA04D1` (`os_id`);

--
-- Index pour la table `contact_hobbies`
--
ALTER TABLE `contact_hobbies`
  ADD PRIMARY KEY (`contact_id`,`hobby_id`),
  ADD KEY `IDX_A2E5159CE7A1254A` (`contact_id`),
  ADD KEY `IDX_A2E5159C322B2123` (`hobby_id`);

--
-- Index pour la table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_A9A55A4C989D9B62` (`slug`),
  ADD UNIQUE KEY `UNIQ_A9A55A4C5E237E06` (`name`);

--
-- Index pour la table `course_modules`
--
ALTER TABLE `course_modules`
  ADD PRIMARY KEY (`courses_id`,`module_id`),
  ADD KEY `IDX_2674463BF9295384` (`courses_id`),
  ADD KEY `IDX_2674463BAFC2B591` (`module_id`);

--
-- Index pour la table `hobby`
--
ALTER TABLE `hobby`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C2426285E237E06` (`name`);

--
-- Index pour la table `module_courses`
--
ALTER TABLE `module_courses`
  ADD PRIMARY KEY (`module_id`,`courses_id`),
  ADD KEY `IDX_2DE6455AFC2B591` (`module_id`),
  ADD KEY `IDX_2DE6455F9295384` (`courses_id`);

--
-- Index pour la table `operating_system`
--
ALTER TABLE `operating_system`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_BCF9A7815E237E06` (`name`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `hobby`
--
ALTER TABLE `hobby`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `module`
--
ALTER TABLE `module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `operating_system`
--
ALTER TABLE `operating_system`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `book_category`
--
ALTER TABLE `book_category`
  ADD CONSTRAINT `FK_1FB30F9812469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1FB30F9816A2B381` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `FK_4C62E6383DCA04D1` FOREIGN KEY (`os_id`) REFERENCES `operating_system` (`id`);

--
-- Contraintes pour la table `contact_hobbies`
--
ALTER TABLE `contact_hobbies`
  ADD CONSTRAINT `FK_A2E5159C322B2123` FOREIGN KEY (`hobby_id`) REFERENCES `hobby` (`id`),
  ADD CONSTRAINT `FK_A2E5159CE7A1254A` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`id`);

--
-- Contraintes pour la table `course_modules`
--
ALTER TABLE `course_modules`
  ADD CONSTRAINT `FK_2674463BAFC2B591` FOREIGN KEY (`module_id`) REFERENCES `module` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_2674463BF9295384` FOREIGN KEY (`courses_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `module_courses`
--
ALTER TABLE `module_courses`
  ADD CONSTRAINT `FK_2DE6455AFC2B591` FOREIGN KEY (`module_id`) REFERENCES `module` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_2DE6455F9295384` FOREIGN KEY (`courses_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
