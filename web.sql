-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-10-2024 a las 14:18:34
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `web`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quizz`
--

CREATE TABLE `quizz` (
  `QuizzID` int(11) NOT NULL,
  `SitioID` int(11) NOT NULL,
  `Pregunta1` varchar(20) NOT NULL,
  `Pregunta2` varchar(20) NOT NULL,
  `Pregunta3` varchar(20) NOT NULL,
  `Pregunta4` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sitios`
--

CREATE TABLE `sitios` (
  `SitioID` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `IDusuario` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `contraseña` varchar(50) NOT NULL,
  `email` varchar(20) NOT NULL,
  `imagen` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarioquizz`
--

CREATE TABLE `usuarioquizz` (
  `UsuarioQuizzID` int(11) NOT NULL,
  `IDUsuario` int(11) NOT NULL,
  `QuizzID` int(11) NOT NULL,
  `Puntaje` int(11) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `quizz`
--
ALTER TABLE `quizz`
  ADD PRIMARY KEY (`QuizzID`),
  ADD KEY `FKSitioID` (`SitioID`);

--
-- Indices de la tabla `sitios`
--
ALTER TABLE `sitios`
  ADD PRIMARY KEY (`SitioID`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`IDusuario`);

--
-- Indices de la tabla `usuarioquizz`
--
ALTER TABLE `usuarioquizz`
  ADD PRIMARY KEY (`UsuarioQuizzID`),
  ADD KEY `FKIDUsuario` (`IDUsuario`),
  ADD KEY `FKQuizzID` (`QuizzID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `quizz`
--
ALTER TABLE `quizz`
  MODIFY `QuizzID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sitios`
--
ALTER TABLE `sitios`
  MODIFY `SitioID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `IDusuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarioquizz`
--
ALTER TABLE `usuarioquizz`
  MODIFY `UsuarioQuizzID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `quizz`
--
ALTER TABLE `quizz`
  ADD CONSTRAINT `quizz_ibfk_1` FOREIGN KEY (`QuizzID`) REFERENCES `usuarioquizz` (`QuizzID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sitios`
--
ALTER TABLE `sitios`
  ADD CONSTRAINT `sitios_ibfk_1` FOREIGN KEY (`SitioID`) REFERENCES `quizz` (`SitioID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarioquizz`
--
ALTER TABLE `usuarioquizz`
  ADD CONSTRAINT `usuarioquizz_ibfk_1` FOREIGN KEY (`IDUsuario`) REFERENCES `user` (`IDusuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
