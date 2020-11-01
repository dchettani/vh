-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-10-2020 a las 05:08:19
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `agencia_vuelos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avion`
--

CREATE TABLE `avion` (
  `IdAvion` int(11) NOT NULL,
  `Aerolinea` varchar(50) DEFAULT NULL,
  `Tipo` varchar(60) DEFAULT NULL,
  `Capacidad` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `IdPago` int(11) NOT NULL,
  `IdReserva` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `IdPasajero` int(11) DEFAULT NULL,
  `Monto` decimal(8,2) DEFAULT NULL,
  `Tipo_Comprobante` varchar(60) DEFAULT NULL,
  `Num_Comprobante` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `IdPais` char(50) NOT NULL,
  `Nombre` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`IdPais`, `Nombre`) VALUES
('CHI', 'Chile'),
('PER', 'Peru');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasajero`
--

CREATE TABLE `pasajero` (
  `IdPasajero` int(11) NOT NULL,
  `Nombre` varchar(60) DEFAULT NULL,
  `Apellido` varchar(60) DEFAULT NULL,
  `Tipo_Documento` varchar(60) DEFAULT NULL,
  `Num_Documento` varchar(20) DEFAULT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL,
  `IdPais` char(50) DEFAULT NULL,
  `Telefono` char(9) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pasajero`
--

INSERT INTO `pasajero` (`IdPasajero`, `Nombre`, `Apellido`, `Tipo_Documento`, `Num_Documento`, `Fecha_Nacimiento`, `IdPais`, `Telefono`, `Email`) VALUES
(0, 'Nicole', 'Quispe', 'DNI', '97896382', '1996-12-24', 'CHI', '897125874', 'Nicole@hotmail.com'),
(1, 'Aldo', 'Cardenas', 'DNI', '45815911', '1988-10-24', 'PER', '927158405', 'cardenastaldo24@gmail.com'),
(3, 'Miguel', 'Mora', 'DNI', '25896378', '1996-05-19', 'PER', '987125874', 'Mora@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `IdReserva` int(11) NOT NULL,
  `Costo` decimal(8,2) DEFAULT NULL,
  `Observacion` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `IdUsuario` int(11) NOT NULL,
  `Nombres` varchar(60) DEFAULT NULL,
  `Apellidos` varchar(60) DEFAULT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL,
  `Direccion` varchar(70) DEFAULT NULL,
  `Telefono` varchar(60) DEFAULT NULL,
  `User` varchar(60) DEFAULT NULL,
  `Password` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`IdUsuario`, `Nombres`, `Apellidos`, `Fecha_Nacimiento`, `Direccion`, `Telefono`, `User`, `Password`) VALUES
(1, 'Aldo', 'Cardenas', '1988-10-24', 'Av.Manzanilla 256', '927158405', 'Aldo', '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vuelo`
--

CREATE TABLE `vuelo` (
  `IdAvion` int(11) DEFAULT NULL,
  `IdReserva` int(11) DEFAULT NULL,
  `Nombre_Aeropuerto` varchar(60) DEFAULT NULL,
  `Pais_Aeropuerto` varchar(50) DEFAULT NULL,
  `Tarifa` decimal(8,2) DEFAULT NULL,
  `Asiento` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `avion`
--
ALTER TABLE `avion`
  ADD PRIMARY KEY (`IdAvion`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`IdPago`),
  ADD KEY `IdPasajero` (`IdPasajero`),
  ADD KEY `IdReserva` (`IdReserva`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`IdPais`);

--
-- Indices de la tabla `pasajero`
--
ALTER TABLE `pasajero`
  ADD PRIMARY KEY (`IdPasajero`),
  ADD KEY `IdPais` (`IdPais`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`IdReserva`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`IdUsuario`);

--
-- Indices de la tabla `vuelo`
--
ALTER TABLE `vuelo`
  ADD KEY `IdAvion` (`IdAvion`),
  ADD KEY `IdReserva` (`IdReserva`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `avion`
--
ALTER TABLE `avion`
  MODIFY `IdAvion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `IdPago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pasajero`
--
ALTER TABLE `pasajero`
  MODIFY `IdPasajero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `IdReserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `IdUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`IdPasajero`) REFERENCES `pasajero` (`IdPasajero`),
  ADD CONSTRAINT `pago_ibfk_2` FOREIGN KEY (`IdReserva`) REFERENCES `reserva` (`IdReserva`);

--
-- Filtros para la tabla `pasajero`
--
ALTER TABLE `pasajero`
  ADD CONSTRAINT `pasajero_ibfk_1` FOREIGN KEY (`IdPais`) REFERENCES `pais` (`IdPais`);

--
-- Filtros para la tabla `vuelo`
--
ALTER TABLE `vuelo`
  ADD CONSTRAINT `vuelo_ibfk_1` FOREIGN KEY (`IdAvion`) REFERENCES `avion` (`IdAvion`),
  ADD CONSTRAINT `vuelo_ibfk_2` FOREIGN KEY (`IdReserva`) REFERENCES `reserva` (`IdReserva`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
