-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-11-2018 a las 23:01:25
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_emelinda_mendez_examen`
--
CREATE DATABASE IF NOT EXISTS `bd_emelinda_mendez_examen` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `bd_emelinda_mendez_examen`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `celestial_body`
--

CREATE TABLE `celestial_body` (
  `cb_id` int(11) NOT NULL,
  `st_id` int(11) NOT NULL,
  `cbt_id` int(11) NOT NULL,
  `cb_descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `cb_masa` float NOT NULL,
  `cb_tamanio` float NOT NULL,
  `sta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `celestial_body`
--

INSERT INTO `celestial_body` (`cb_id`, `st_id`, `cbt_id`, `cb_descripcion`, `cb_masa`, `cb_tamanio`, `sta_id`) VALUES
(1, 1, 2, 'Cuepecito', 3, 3, 2),
(2, 3, 2, 'Cuerpecito :E', 45, 77, 2),
(3, 4, 3, 'melon planet', 4, 89, 2),
(4, 1, 1, 'Ateoride K-60', 34, 44, 2),
(5, 2, 2, 'obejeto de su estrellita', 45, 34, 2),
(6, 4, 2, 'o}un objeto de melonuimm', 33, 3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `celestial_body_type`
--

CREATE TABLE `celestial_body_type` (
  `cbt_id` int(11) NOT NULL,
  `cbt_description` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `sta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `celestial_body_type`
--

INSERT INTO `celestial_body_type` (`cbt_id`, `cbt_description`, `sta_id`) VALUES
(1, 'Asteroide', 2),
(2, 'OTN(Objeto Transneptunianos)', 2),
(3, 'Cometa', 2),
(4, 'Meteroide', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee`
--

CREATE TABLE `employee` (
  `em_id` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `em_name` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `em_lastname` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `po_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `employee`
--

INSERT INTO `employee` (`em_id`, `em_name`, `em_lastname`, `po_id`) VALUES
('18.317.999-3', 'Emelinda', 'Méndez', 1),
('9.591.441-1', 'Bessie', 'Tabilo', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planet`
--

CREATE TABLE `planet` (
  `p_id` int(11) NOT NULL,
  `st_id` int(11) NOT NULL,
  `pt_id` int(11) NOT NULL,
  `p_descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `p_simbologia` varchar(1000) COLLATE utf8_spanish_ci NOT NULL,
  `p_decuatorial` float NOT NULL,
  `p_masa` float NOT NULL,
  `p_rorbital` float NOT NULL,
  `p_porbital` float NOT NULL,
  `p_rotacion` float NOT NULL,
  `p_catmosfera` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `p_imagen` varchar(1000) COLLATE utf8_spanish_ci NOT NULL,
  `sta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `planet`
--

INSERT INTO `planet` (`p_id`, `st_id`, `pt_id`, `p_descripcion`, `p_simbologia`, `p_decuatorial`, `p_masa`, `p_rorbital`, `p_porbital`, `p_rotacion`, `p_catmosfera`, `p_imagen`, `sta_id`) VALUES
(1, 1, 1, 'Tierra ', '', 5, 5, 5, 5, 5.9, 'Carbono 70%', '', 2),
(2, 1, 1, 'Marte', 'bloqueador.png', 44, 4, 44, 45, 7, 'Hidrogeno 34', '84d37b5a13a380b2d6db1195625ec9bb-icono-de-la-tina-de-ba-o-de-inmuebles-by-vexels.png', 2),
(3, 1, 2, 'Plutón ', 'bloqueador.png', 34, 34, 34, 34, 34, 'Helio 3%', '135702.png', 2),
(4, 1, 1, 'Venus', 'etereo.jpg', 1, 23, 99, 99, 94, 'Carbono 70%', 'dino.jpg', 2),
(5, 2, 1, 'su estrellita', 'dino.jpg', 2, 3, 1, 2, 2, '2', 'Blue Clouds desktop wallpaper.jpg', 2),
(6, 5, 1, 'planeta de solu', 'dino.jpg', 45, 65, 79, 99, 77, 'eeeee', 'etereo.jpg', 2),
(7, 5, 1, 'planeta de solu 2', 'Blue Clouds desktop wallpaper.jpg', 45, 65, 8888, 888, 8888, 'eeeee', ',o Veado no Briluz da Lua (2).jpg', 2),
(8, 4, 1, 'planeta de melonium', 'etereo.jpg', 3, 3, 3, 3, 3, '44', 'dino2.jpg', 2);

--
-- Disparadores `planet`
--
DELIMITER $$
CREATE TRIGGER `trigger_planet` AFTER UPDATE ON `planet` FOR EACH ROW IF NEW.sta_id = 1 and OLD.sta_id = 2
THEN 
UPDATE satelite SET sta_id = 1
WHERE satelite.p_id = NEW.p_id;
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planetary_system`
--

CREATE TABLE `planetary_system` (
  `ps_id` int(11) NOT NULL,
  `ps_description` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `sta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `planetary_system`
--

INSERT INTO `planetary_system` (`ps_id`, `ps_description`, `sta_id`) VALUES
(1, 'Sistema Solar', 2),
(2, 'Alfa Centauri', 2),
(3, 'Sistema Melons :# :v', 2),
(4, 'Sistemita que se yo', 2),
(5, 'k', 1),
(6, 'xd', 1),
(7, 'vqalentima', 1),
(8, 'sisetema de eduardo jhskdgjksjfkdsajk', 1),
(9, 'nuevo sistema xd', 1),
(10, 'jejejojo', 1),
(11, 'patito-kun', 2);

--
-- Disparadores `planetary_system`
--
DELIMITER $$
CREATE TRIGGER `tri_ps` AFTER UPDATE ON `planetary_system` FOR EACH ROW IF NEW.sta_id = 1  AND OLD.sta_id = 2
THEN 
UPDATE star set star.sta_id=1
WHERE star.ps_id = NEW.ps_id;
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planet_type`
--

CREATE TABLE `planet_type` (
  `pt_id` int(11) NOT NULL,
  `pt_description` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `sta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `planet_type`
--

INSERT INTO `planet_type` (`pt_id`, `pt_description`, `sta_id`) VALUES
(1, 'Planeta', 2),
(2, 'Planeta enano', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `position`
--

CREATE TABLE `position` (
  `po_id` int(11) NOT NULL,
  `po_decription` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `position`
--

INSERT INTO `position` (`po_id`, `po_decription`) VALUES
(1, 'cargo 1'),
(2, 'cargo 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `satelite`
--

CREATE TABLE `satelite` (
  `sa_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `sa_description` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `sa_diameter` float NOT NULL,
  `sa_days` int(11) NOT NULL,
  `sa_hours` int(11) NOT NULL,
  `sa_minutes` int(11) NOT NULL,
  `sa_image` varchar(1000) COLLATE utf8_spanish_ci NOT NULL,
  `sta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `satelite`
--

INSERT INTO `satelite` (`sa_id`, `p_id`, `sa_description`, `sa_diameter`, `sa_days`, `sa_hours`, `sa_minutes`, `sa_image`, `sta_id`) VALUES
(1, 1, 'Luna', 4, 1, 5, 9, 'bloqueador.png', 2),
(2, 2, 'Luna Marte', 22, 2, 2, 2, '135702.png', 2),
(3, 4, 'Luna de Venus', 4, 1, 45, 45, 'etereo.jpg', 2),
(4, 4, 'Segunda Luna de Venus', 3, 3, 2, 2, 'landscape-nature-sunset-trees.jpg', 2),
(5, 6, 'satelite de solu', 44, 33, 3, 3, 'wolfchilderenloopmp41.gif', 2),
(6, 6, 'satelite dos de solu', 44, 4, 45, 34, 'dino2.jpg', 2),
(7, 8, 'su lunita', 456, 5, 5, 3, 'bosque.jpg', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `star`
--

CREATE TABLE `star` (
  `st_id` int(11) NOT NULL,
  `ps_id` int(11) NOT NULL,
  `st_description` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `sta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `star`
--

INSERT INTO `star` (`st_id`, `ps_id`, `st_description`, `sta_id`) VALUES
(1, 1, 'Sol', 2),
(2, 1, 'su esttellita', 2),
(3, 3, 'Sistema Melon´s Estrella', 2),
(4, 4, 'melonium', 2),
(5, 2, 'Soluu', 2),
(6, 2, 'iuytreiuyt678654', 2);

--
-- Disparadores `star`
--
DELIMITER $$
CREATE TRIGGER `tri_star` AFTER UPDATE ON `star` FOR EACH ROW IF NEW.sta_id = 1 AND OLD.sta_id = 2
THEN 
UPDATE planet set planet.sta_id=1
WHERE planet.st_id = NEW.st_id;
UPDATE celestial_body SET celestial_body.sta_id = 1
WHERE celestial_body.st_id = NEW.st_id;
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `state`
--

CREATE TABLE `state` (
  `sta_id` int(11) NOT NULL,
  `sta_description` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `state`
--

INSERT INTO `state` (`sta_id`, `sta_description`) VALUES
(1, 'No Disponible'),
(2, 'Disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `us_id` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `us_pass` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `em_id` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`us_id`, `us_pass`, `em_id`) VALUES
('mami@universe.tux', '123456', '9.591.441-1'),
('melon@universe.tux', '123456', '18.317.999-3');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `celestial_body`
--
ALTER TABLE `celestial_body`
  ADD PRIMARY KEY (`cb_id`),
  ADD KEY `tcc_id` (`cbt_id`),
  ADD KEY `st_id` (`st_id`),
  ADD KEY `sta_id` (`sta_id`);

--
-- Indices de la tabla `celestial_body_type`
--
ALTER TABLE `celestial_body_type`
  ADD PRIMARY KEY (`cbt_id`),
  ADD KEY `sta_id` (`sta_id`);

--
-- Indices de la tabla `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`em_id`),
  ADD KEY `po_id` (`po_id`);

--
-- Indices de la tabla `planet`
--
ALTER TABLE `planet`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `tp_id` (`pt_id`),
  ADD KEY `st_id` (`st_id`),
  ADD KEY `sta_id` (`sta_id`);

--
-- Indices de la tabla `planetary_system`
--
ALTER TABLE `planetary_system`
  ADD PRIMARY KEY (`ps_id`),
  ADD KEY `sta_id` (`sta_id`);

--
-- Indices de la tabla `planet_type`
--
ALTER TABLE `planet_type`
  ADD PRIMARY KEY (`pt_id`),
  ADD KEY `sta_id` (`sta_id`);

--
-- Indices de la tabla `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`po_id`);

--
-- Indices de la tabla `satelite`
--
ALTER TABLE `satelite`
  ADD PRIMARY KEY (`sa_id`),
  ADD KEY `p_id` (`p_id`),
  ADD KEY `sta_id` (`sta_id`);

--
-- Indices de la tabla `star`
--
ALTER TABLE `star`
  ADD PRIMARY KEY (`st_id`),
  ADD KEY `sp_id` (`ps_id`),
  ADD KEY `sta_id` (`sta_id`);

--
-- Indices de la tabla `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`sta_id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`us_id`),
  ADD KEY `em_id` (`em_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `celestial_body`
--
ALTER TABLE `celestial_body`
  MODIFY `cb_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `celestial_body_type`
--
ALTER TABLE `celestial_body_type`
  MODIFY `cbt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `planet`
--
ALTER TABLE `planet`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `planetary_system`
--
ALTER TABLE `planetary_system`
  MODIFY `ps_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `planet_type`
--
ALTER TABLE `planet_type`
  MODIFY `pt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `satelite`
--
ALTER TABLE `satelite`
  MODIFY `sa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `star`
--
ALTER TABLE `star`
  MODIFY `st_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `state`
--
ALTER TABLE `state`
  MODIFY `sta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `celestial_body`
--
ALTER TABLE `celestial_body`
  ADD CONSTRAINT `celestial_body_ibfk_2` FOREIGN KEY (`cbt_id`) REFERENCES `celestial_body_type` (`cbt_id`),
  ADD CONSTRAINT `celestial_body_ibfk_3` FOREIGN KEY (`st_id`) REFERENCES `star` (`st_id`),
  ADD CONSTRAINT `celestial_body_ibfk_4` FOREIGN KEY (`sta_id`) REFERENCES `state` (`sta_id`);

--
-- Filtros para la tabla `celestial_body_type`
--
ALTER TABLE `celestial_body_type`
  ADD CONSTRAINT `celestial_body_type_ibfk_1` FOREIGN KEY (`sta_id`) REFERENCES `state` (`sta_id`);

--
-- Filtros para la tabla `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`po_id`) REFERENCES `position` (`po_id`);

--
-- Filtros para la tabla `planet`
--
ALTER TABLE `planet`
  ADD CONSTRAINT `planet_ibfk_2` FOREIGN KEY (`pt_id`) REFERENCES `planet_type` (`pt_id`),
  ADD CONSTRAINT `planet_ibfk_3` FOREIGN KEY (`st_id`) REFERENCES `star` (`st_id`),
  ADD CONSTRAINT `planet_ibfk_4` FOREIGN KEY (`sta_id`) REFERENCES `state` (`sta_id`);

--
-- Filtros para la tabla `planetary_system`
--
ALTER TABLE `planetary_system`
  ADD CONSTRAINT `planetary_system_ibfk_1` FOREIGN KEY (`sta_id`) REFERENCES `state` (`sta_id`);

--
-- Filtros para la tabla `planet_type`
--
ALTER TABLE `planet_type`
  ADD CONSTRAINT `planet_type_ibfk_1` FOREIGN KEY (`sta_id`) REFERENCES `state` (`sta_id`);

--
-- Filtros para la tabla `satelite`
--
ALTER TABLE `satelite`
  ADD CONSTRAINT `satelite_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `planet` (`p_id`),
  ADD CONSTRAINT `satelite_ibfk_2` FOREIGN KEY (`sta_id`) REFERENCES `state` (`sta_id`);

--
-- Filtros para la tabla `star`
--
ALTER TABLE `star`
  ADD CONSTRAINT `star_ibfk_1` FOREIGN KEY (`ps_id`) REFERENCES `planetary_system` (`ps_id`),
  ADD CONSTRAINT `star_ibfk_2` FOREIGN KEY (`sta_id`) REFERENCES `state` (`sta_id`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`em_id`) REFERENCES `employee` (`em_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
