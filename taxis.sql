-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-02-2021 a las 01:33:44
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `taxis`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `choferes`
--

CREATE TABLE `choferes` (
  `idChoferes` int(11) NOT NULL,
  `NombreChofer` varchar(50) NOT NULL,
  `CorreoChofer` varchar(15) NOT NULL,
  `TelefonoChofer` int(11) NOT NULL,
  `CurpChofer` varchar(25) NOT NULL,
  `INE_IFEChofer` varchar(50) NOT NULL,
  `StatusDisponible` tinyint(1) NOT NULL,
  `EstatusActivo` tinyint(1) NOT NULL,
  `idMunicipio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `idEstado` int(11) NOT NULL,
  `NombreEstado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gananciasefectivo`
--

CREATE TABLE `gananciasefectivo` (
  `idGananciaEfectivo` int(11) NOT NULL,
  `TotalGeneralDia` decimal(10,0) NOT NULL,
  `GananciasChoferE` decimal(10,0) NOT NULL,
  `GananciasNuestrasE` decimal(10,0) NOT NULL,
  `FechaHoraE` datetime NOT NULL,
  `idPagoChofer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gananciastarjetas`
--

CREATE TABLE `gananciastarjetas` (
  `idGananciaTarjeta` int(11) NOT NULL,
  `GananciasDiaChofer` decimal(10,0) NOT NULL,
  `FechaHoraT` datetime NOT NULL,
  `TotalDia` decimal(10,0) NOT NULL,
  `GananciasNuestrasT` decimal(10,0) NOT NULL,
  `idPagoChofer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE `municipios` (
  `idMunicipio` int(11) NOT NULL,
  `NombreMunicipio` varchar(50) NOT NULL,
  `idEstado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `idPagos` int(11) NOT NULL,
  `Monto` decimal(10,0) NOT NULL,
  `TipoPago` varchar(45) NOT NULL,
  `Fecha_Hora` datetime NOT NULL,
  `idPasajeros` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagoschoferes`
--

CREATE TABLE `pagoschoferes` (
  `idPagoChofer` int(11) NOT NULL,
  `MontoPagoChofer` decimal(10,0) NOT NULL,
  `Fecha_HoraChofer` datetime NOT NULL,
  `TipoPagoosChofer` decimal(10,0) NOT NULL,
  `TotalChofer` decimal(10,0) NOT NULL,
  `TotalNuestro` decimal(10,0) NOT NULL,
  `idChoferes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasajeros`
--

CREATE TABLE `pasajeros` (
  `idPasajeros` int(11) NOT NULL,
  `NombrePasajero` varchar(45) DEFAULT NULL,
  `CorreoPasajero` varchar(45) DEFAULT NULL,
  `ContraseñaPasajero` varchar(45) DEFAULT NULL,
  `TelefonoPasajeros` int(11) DEFAULT NULL,
  `FotoPasajero` varchar(45) DEFAULT NULL,
  `INE_IFEPasajero` varchar(45) DEFAULT NULL,
  `NumCuentaPasajero` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacioneschoferes`
--

CREATE TABLE `ubicacioneschoferes` (
  `idUbicacionChofer` int(11) NOT NULL,
  `UbicacionChofer` varchar(50) NOT NULL,
  `idChoferes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacionespasajeros`
--

CREATE TABLE `ubicacionespasajeros` (
  `idUbicacionesPasajeros` int(11) NOT NULL,
  `UbicacionPasajero` varchar(50) NOT NULL,
  `idPasajeros` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viajes`
--

CREATE TABLE `viajes` (
  `idViaje` int(11) NOT NULL,
  `UbicacionInicial` varchar(50) NOT NULL,
  `Destino` varchar(50) NOT NULL,
  `Precio` decimal(10,0) NOT NULL,
  `FechaHoraV` datetime NOT NULL,
  `TipoPagoV` varchar(45) NOT NULL,
  `idPasajeros` int(11) NOT NULL,
  `idChoferes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `choferes`
--
ALTER TABLE `choferes`
  ADD PRIMARY KEY (`idChoferes`),
  ADD KEY `idMunicipio` (`idMunicipio`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `gananciasefectivo`
--
ALTER TABLE `gananciasefectivo`
  ADD PRIMARY KEY (`idGananciaEfectivo`),
  ADD KEY `idPagoChofer` (`idPagoChofer`);

--
-- Indices de la tabla `gananciastarjetas`
--
ALTER TABLE `gananciastarjetas`
  ADD PRIMARY KEY (`idGananciaTarjeta`),
  ADD KEY `idPagoChofer` (`idPagoChofer`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`idMunicipio`),
  ADD KEY `idEstado` (`idEstado`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`idPagos`),
  ADD KEY `idPasajeros` (`idPasajeros`);

--
-- Indices de la tabla `pagoschoferes`
--
ALTER TABLE `pagoschoferes`
  ADD PRIMARY KEY (`idPagoChofer`),
  ADD KEY `idChoferes` (`idChoferes`);

--
-- Indices de la tabla `pasajeros`
--
ALTER TABLE `pasajeros`
  ADD PRIMARY KEY (`idPasajeros`);

--
-- Indices de la tabla `ubicacioneschoferes`
--
ALTER TABLE `ubicacioneschoferes`
  ADD PRIMARY KEY (`idUbicacionChofer`),
  ADD KEY `idChoferes` (`idChoferes`);

--
-- Indices de la tabla `ubicacionespasajeros`
--
ALTER TABLE `ubicacionespasajeros`
  ADD PRIMARY KEY (`idUbicacionesPasajeros`),
  ADD KEY `idPasajeros` (`idPasajeros`);

--
-- Indices de la tabla `viajes`
--
ALTER TABLE `viajes`
  ADD PRIMARY KEY (`idViaje`),
  ADD KEY `idChoferes` (`idChoferes`),
  ADD KEY `idPasajeros` (`idPasajeros`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `choferes`
--
ALTER TABLE `choferes`
  MODIFY `idChoferes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gananciasefectivo`
--
ALTER TABLE `gananciasefectivo`
  MODIFY `idGananciaEfectivo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gananciastarjetas`
--
ALTER TABLE `gananciastarjetas`
  MODIFY `idGananciaTarjeta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `municipios`
--
ALTER TABLE `municipios`
  MODIFY `idMunicipio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `idPagos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagoschoferes`
--
ALTER TABLE `pagoschoferes`
  MODIFY `idPagoChofer` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pasajeros`
--
ALTER TABLE `pasajeros`
  MODIFY `idPasajeros` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ubicacioneschoferes`
--
ALTER TABLE `ubicacioneschoferes`
  MODIFY `idUbicacionChofer` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ubicacionespasajeros`
--
ALTER TABLE `ubicacionespasajeros`
  MODIFY `idUbicacionesPasajeros` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `viajes`
--
ALTER TABLE `viajes`
  MODIFY `idViaje` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `choferes`
--
ALTER TABLE `choferes`
  ADD CONSTRAINT `choferes_ibfk_1` FOREIGN KEY (`idMunicipio`) REFERENCES `municipios` (`idMunicipio`);

--
-- Filtros para la tabla `gananciasefectivo`
--
ALTER TABLE `gananciasefectivo`
  ADD CONSTRAINT `gananciasefectivo_ibfk_1` FOREIGN KEY (`idPagoChofer`) REFERENCES `pagoschoferes` (`idPagoChofer`);

--
-- Filtros para la tabla `gananciastarjetas`
--
ALTER TABLE `gananciastarjetas`
  ADD CONSTRAINT `gananciastarjetas_ibfk_1` FOREIGN KEY (`idPagoChofer`) REFERENCES `pagoschoferes` (`idPagoChofer`);

--
-- Filtros para la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD CONSTRAINT `municipios_ibfk_1` FOREIGN KEY (`idEstado`) REFERENCES `estados` (`idEstado`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`idPasajeros`) REFERENCES `pasajeros` (`idPasajeros`);

--
-- Filtros para la tabla `pagoschoferes`
--
ALTER TABLE `pagoschoferes`
  ADD CONSTRAINT `pagoschoferes_ibfk_1` FOREIGN KEY (`idChoferes`) REFERENCES `choferes` (`idChoferes`);

--
-- Filtros para la tabla `ubicacioneschoferes`
--
ALTER TABLE `ubicacioneschoferes`
  ADD CONSTRAINT `ubicacioneschoferes_ibfk_1` FOREIGN KEY (`idChoferes`) REFERENCES `choferes` (`idChoferes`);

--
-- Filtros para la tabla `ubicacionespasajeros`
--
ALTER TABLE `ubicacionespasajeros`
  ADD CONSTRAINT `ubicacionespasajeros_ibfk_1` FOREIGN KEY (`idPasajeros`) REFERENCES `pasajeros` (`idPasajeros`);

--
-- Filtros para la tabla `viajes`
--
ALTER TABLE `viajes`
  ADD CONSTRAINT `viajes_ibfk_1` FOREIGN KEY (`idChoferes`) REFERENCES `choferes` (`idChoferes`),
  ADD CONSTRAINT `viajes_ibfk_2` FOREIGN KEY (`idPasajeros`) REFERENCES `pasajeros` (`idPasajeros`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
