-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-11-2017 a las 22:43:30
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `juegostore`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(40) NOT NULL,
  `Tarjeta` int(11) DEFAULT NULL,
  `Activo` tinyint(1) NOT NULL,
  `DNI` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`ID`, `Nombre`, `Tarjeta`, `Activo`, `DNI`) VALUES
(17, 'paco', 12345, 1, 1234);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `ID` int(11) NOT NULL,
  `CosteTotal` double NOT NULL,
  `Fecha` date NOT NULL,
  `Activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contiene`
--

CREATE TABLE `contiene` (
  `Compra` int(11) NOT NULL,
  `Videojuego` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `efectua`
--

CREATE TABLE `efectua` (
  `Cliente` int(11) NOT NULL,
  `Compra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juegoconsola`
--

CREATE TABLE `juegoconsola` (
  `ID` int(11) NOT NULL,
  `Marca` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `juegoconsola`
--

INSERT INTO `juegoconsola` (`ID`, `Marca`) VALUES
(29, 'chony'),
(31, 'Gondor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juegopc`
--

CREATE TABLE `juegopc` (
  `ID` int(11) NOT NULL,
  `Sistema` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `juegopc`
--

INSERT INTO `juegopc` (`ID`, `Sistema`) VALUES
(27, 'windows'),
(28, 'windows'),
(30, 'D20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videojuegos`
--

CREATE TABLE `videojuegos` (
  `ID` int(11) NOT NULL,
  `desarrollador` varchar(40) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` double NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `videojuegos`
--

INSERT INTO `videojuegos` (`ID`, `desarrollador`, `nombre`, `precio`, `activo`) VALUES
(27, 'pont', 'pipo y paco van al circo', 123, 1),
(28, 'pont', 'pipo y paco van al zoo', 129, 1),
(29, 'pont', 'pipo se comrpa una play', 110, 1),
(30, 'PontSW', 'Pont-chis', 999, 0),
(31, 'PontSW', 'pOca', 4, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `contiene`
--
ALTER TABLE `contiene`
  ADD PRIMARY KEY (`Compra`,`Videojuego`);

--
-- Indices de la tabla `efectua`
--
ALTER TABLE `efectua`
  ADD PRIMARY KEY (`Cliente`,`Compra`),
  ADD KEY `Compra` (`Compra`);

--
-- Indices de la tabla `juegoconsola`
--
ALTER TABLE `juegoconsola`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `juegopc`
--
ALTER TABLE `juegopc`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `videojuegos`
--
ALTER TABLE `videojuegos`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `videojuegos`
--
ALTER TABLE `videojuegos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `juegoconsola`
--
ALTER TABLE `juegoconsola`
  ADD CONSTRAINT `juegoconsola_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `videojuegos` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
