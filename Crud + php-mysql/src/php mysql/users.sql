-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  jeu. 21 avr. 2022 à 08:28
-- Version du serveur :  10.1.38-MariaDB
-- Version de PHP :  7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `users`
--

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `name`, `email`) VALUES
(1, 'Aggi Southworth', 'asouthworth0@princeton.edu'),
(2, 'Thornie rasta', 'tdiggons1@parallels.com'),
(3, 'Ivett Westley', 'iwestley2@example.com'),
(4, 'Libby Styant', 'lstyant3@shareasale.com'),
(5, 'zoky', 'zoky@gmail.com'),
(6, 'Carlen Ranklin', 'cranklin5@mashable.com'),
(7, 'Ardra Nafzger', 'anafzger6@furl.net'),
(8, 'Aubert Tennison', 'atennison7@engadget.com'),
(9, 'Francklin Izod', 'fizod8@g.co'),
(11, 'Dael Torn', 'dtorna@imageshack.us'),
(12, 'Aurea Edards', 'aedardsb@flavors.me'),
(13, 'Virgie Diggins', 'vdigginsc@forbes.com'),
(14, 'Klarrisa Brahan', 'kbrahand@smh.com.au'),
(15, 'Phillie Avison', 'pavisone@weibo.com'),
(16, 'Lauralee Bowhey', 'lbowheyf@desdev.cn'),
(17, 'Cthrine Soots', 'csootsg@liveinternet.ru'),
(18, 'Nicol Gavagan', 'ngavaganh@meetup.com'),
(19, 'Georgi Ellam', 'gellami@wordpress.com'),
(20, 'Ellary Ffrench', 'effrenchj@sbwire.com'),
(21, '', 'stany@gmail.com'),
(24, 'zandry', 'zandry@gmail.com'),
(25, 'test', 'test@gmail.com');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
