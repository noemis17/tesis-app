-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-07-2020 a las 19:55:40
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `movil`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idPromocionProducto` bigint(20) UNSIGNED DEFAULT NULL,
  `idRegistros` bigint(20) UNSIGNED DEFAULT NULL,
  `id_Productos` bigint(20) UNSIGNED DEFAULT NULL,
  `idOrdenar` bigint(20) UNSIGNED NOT NULL,
  `cantidad` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `idPromocionProducto`, `idRegistros`, `id_Productos`, `idOrdenar`, `cantidad`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 171, 1, 1, '2020-07-04 23:57:04', '2020-07-04 23:57:04'),
(2, NULL, NULL, 172, 1, 1, '2020-07-04 23:57:05', '2020-07-04 23:57:05'),
(3, NULL, NULL, 171, 2, 1, '2020-07-07 15:27:16', '2020-07-07 15:27:16'),
(4, NULL, 1, NULL, 3, 1, '2020-07-10 18:58:52', '2020-07-10 18:58:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idventa` bigint(20) UNSIGNED DEFAULT NULL,
  `idcliente` bigint(20) UNSIGNED NOT NULL,
  `idproducto` bigint(20) UNSIGNED NOT NULL,
  `precio_u` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtotal` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_del` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `nome_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_ventas`
--

CREATE TABLE `estado_ventas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cod` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_del` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `nome_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estado_ventas`
--

INSERT INTO `estado_ventas` (`id`, `cod`, `descripcion`, `estado_del`, `nome_token`, `created_at`, `updated_at`) VALUES
(1, '001', 'Solicitud', '1', '2y10PEeRtVHIX7tE5LGTfvUGepg80NHuvHXucRSjcEvVTg4yzjvcpW', NULL, NULL),
(2, '002', 'En_proceso', '1', '2y107meUlNVVFeSrOkxDlyeS50uL5QKrFxqumlTVGap1rRe0kGK45K', NULL, NULL),
(3, '003', 'Finalizado', '1', '2y10fuQIdzAeus1SfAyduCuIuqU9kXPjnDjpm3vyAoyrwL8wSwA3nxm', NULL, NULL),
(4, '004', 'Rechazado', '1', '2y10YZWrEAsddoB8SmBtGNLPreLy3p4kkgjcZj4Bnxho10IjFpEW7eUG', NULL, NULL),
(5, '005', 'Aceptado', '1', '2y10s12O5rlSC8IGp2dKsQomxePK8lRBs7kujXprNyGveEGN48CQuIq', NULL, NULL),
(6, '005', 'Cancelado', '1', '2y10LwnRYANTViZVbU2gdhNWduSMId7EBZ1TyymnX5RY60lbXf7DFdzOm', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kits`
--

CREATE TABLE `kits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idRegistro` bigint(20) UNSIGNED NOT NULL,
  `idProducto` bigint(20) UNSIGNED NOT NULL,
  `cantidad` int(11) NOT NULL,
  `estado_del` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `kits`
--

INSERT INTO `kits` (`id`, `idRegistro`, `idProducto`, `cantidad`, `estado_del`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 1, '1', '2020-07-10 18:55:37', '2020-07-10 18:55:37'),
(2, 1, 3, 1, '1', '2020-07-10 18:55:53', '2020-07-10 18:55:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_09_11_235854_create_tipo_usuarios_table', 1),
(5, '2019_09_12_001155_create_estado_ventas_table', 1),
(6, '2019_09_12_001231_create_productos_table', 1),
(7, '2019_09_12_001330_create_ventas_table', 1),
(8, '2019_09_12_001357_create_detalle_ventas_table', 1),
(9, '2019_11_28_223639_create_ubicacions_table', 1),
(10, '2020_03_10_125908_create_tipo_promocions_table', 1),
(11, '2020_05_11_160704_create_promocion_del_productos_table', 1),
(12, '2020_05_19_093222_create_kits_table', 1),
(13, '2020_05_19_101145_create_registro_promociones_table', 1),
(14, '2020_06_15_113545_create_compras_table', 1),
(15, '2020_06_16_100619_create_ordens_table', 1),
(16, '2020_07_03_132550_create_tipo_pagos_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordens`
--

CREATE TABLE `ordens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idUsuario` bigint(20) UNSIGNED NOT NULL,
  `idestado` bigint(20) UNSIGNED NOT NULL,
  `idTipoPago` bigint(20) UNSIGNED NOT NULL,
  `Orden` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechaOrden` date NOT NULL,
  `total` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `finalizado` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `latitud` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitud` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ordens`
--

INSERT INTO `ordens` (`id`, `idUsuario`, `idestado`, `idTipoPago`, `Orden`, `fechaOrden`, `total`, `finalizado`, `latitud`, `longitud`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, 'super-orden-000000000000001', '2020-07-04', '2.45321429', '0', '-0.8405323', '-80.1756164', '2020-07-04 23:57:03', '2020-07-04 23:57:03'),
(2, 1, 1, 2, 'super-orden-000000000000002', '2020-07-07', '1.23', '0', '-0.843633', '-80.16894599999999', '2020-07-07 15:27:16', '2020-07-07 15:27:16'),
(3, 1, 1, 2, 'super-orden-000000000000003', '2020-07-10', '2.2098214328142842', '0', '-0.8410394999999999', '-80.1803901', '2020-07-10 18:58:51', '2020-07-10 18:58:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_foraneo` bigint(20) NOT NULL,
  `NAME` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PRICE` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IDBRAND` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MARCA` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PESOITEM` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado_del` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `id_foraneo`, `NAME`, `PRICE`, `IDBRAND`, `MARCA`, `PESOITEM`, `stock`, `estado_del`, `created_at`, `updated_at`) VALUES
(1, 1, 'GASTOS CON IVA', NULL, '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(2, 2, 'GASTOS SIN IVA', NULL, '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(3, 2589, 'ESPONJA ACERO DON BRILLO                                                                                  ', '0.44642857142857', '00000001', 'NO DEFINIDA', '0', '0', '1', NULL, NULL),
(4, 2330, 'COLA GALLITO 3L', '1.78571429', '00000001', 'NO DEFINIDA', '0', '0', '1', NULL, NULL),
(5, 2328, 'CAFE DON CAFE SUPREMO 50GR', '1.33928571', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(6, 2331, 'ACTIVE KIWI  FRESA                                                                                        ', '0.44642857142857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(7, 2332, 'COLA GALLITO 1 GALON', '2.1894125', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(8, 2250, 'UVA 3LB', '6', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(9, 1890, 'DEJA POLVO SUAVIZANTE 2K', '5.39', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(10, 1940, 'REXONA DEO STI ANTIBACTERIAL FRESH                                                                        ', '3.4', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(11, 1952, 'ARROZ SUPERCITO LB', '0.39', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(12, 2408, 'MANTEQUILLA BLANCA SUPERCITO', '1.25', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(13, 2202, 'CHOCOLISTO', '1.46428571', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(14, 2327, 'CILANTRO                                                                                                  ', NULL, '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(15, 2254, 'PRESTOBARBA3', '1.11607143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(16, 2171, 'PAPA CHOLA 3LB', '1.2', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(17, 2179, 'COSTILLA CERDO 2LB                                                                                        ', '5.8', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(18, 2325, 'FIORAVANTI ARMONY', '0.3125', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(19, 2106, 'COBERTOR LYO', '39.27678571', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(20, 2107, 'COBERTOR', '29', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(21, 2108, 'CORTINA', '18.74107143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(22, 2109, 'CORTINA CASA LUNA', '31.24107143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(23, 2110, 'COLCHA                                                                                                    ', '8.7', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(24, 2111, 'TOALLAS', '13.38392857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(25, 2112, 'TOALLA RAYADA', '11.59821429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(26, 2335, 'MONTBLANC DOY PACK', '2.428571', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(27, 2113, 'SABANAS', '13.38392857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(28, 2114, 'SABANA INFANTIL', '20.52678571', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(29, 2115, 'SABANA 2PLAZAS RUEDO', '15.16964286', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(30, 2116, 'SABANAS 2.5 RUEDO', '17.84821429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(31, 2117, 'CORTINA DE BAÑO', '5.34821429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(32, 2118, 'MANTELES                                                                                                  ', '7.54', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(33, 2119, 'ALFOMBRA RODAPIES', '3.5625', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(34, 2120, 'CARNE RES LOMO 1LB', '2.9', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(35, 2121, 'CARNE CERDO LOMO 1LB', '2.9', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(36, 2122, 'COSTILLA CERDO 1LB', '2.9', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(37, 2123, 'HUESO CHANCHO  1LB', '2.15', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(38, 2128, 'PAPA CHOLA 1LB', '0.4', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(39, 2124, 'HUESO RES PICADO 1LB', '1.2', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(40, 2170, 'PAPA CHOLA 2LB', '0.8', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(41, 2125, 'CARNE MOLIDA 1LB', '2.4', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(42, 2126, 'HIGADO RES 1LB', '2.9', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(43, 2127, 'PATAS RES 1LB', '1.65', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(44, 2129, 'HUEVOS', '0.11', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(45, 2130, 'LENTEJA SUPERCITO', '0.84', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(46, 2131, 'ALMIDON SUPERCITO', '0.73', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(47, 2249, 'UVA 2 LB', '4', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(48, 2132, 'OREGANO SUPERCITO', '0.25', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(49, 2133, 'HARINA SUPERCITO', '0.4', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(50, 2134, 'CEBOLLA COLORADA 1LB', '0.6', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(51, 2135, 'ZANAHORIA 1LB', '0.3', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(52, 2178, 'CARNE CERDO LOMO 2LB', '5.8', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(53, 2136, 'PIMIENTO X4', '0.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(54, 2180, 'HUESO CHANCHO 2LB', '4.3', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(55, 2137, 'PEPINO X3', '0.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(56, 2138, 'TOMATE LB', '0.6', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(57, 2139, 'LECHUGA X1', '0.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(58, 2140, 'REPOLLO X1', '0.6', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(59, 2141, 'BROCOLI X1', '0.55', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(60, 2142, 'COLIFLOR X1', '0.6', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(61, 2143, 'CEBOLLA BLANCA MAZO', '0.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(62, 2144, 'CAMOTE 1LB', '0.75', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(63, 2145, 'SANDIA RAYADA', '1.25', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(64, 2172, 'SANDIA GRANDE', '3', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(65, 2146, 'PIÑA MEDIANA', '1', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(66, 2173, 'PIÑA GRANDE                                                                                               ', '1.1', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(67, 2148, 'UVA LB', '2', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(68, 2149, 'FRESA GRUESA LB', '1.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(69, 2177, 'CARNE RES LOMO 2LB', '5.8', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(70, 2150, 'MORA LB', '1.23', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(71, 2839, 'FREJOL LARGO SUPERCITO', '0.75', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(72, 2151, 'GRANADILLA X4', '1', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(73, 2152, 'PERA X3', '1', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(74, 2153, 'MARACUYA X7', '1', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(75, 2154, 'CEBOLLA PERLA LB', '0.7', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(76, 2155, 'ESPINACA MAZO', '0.3', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(77, 2156, 'VAINITA LB', '0.7', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(78, 2157, 'AJO 1/2L', '0.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(79, 2174, 'AJO 1LB                                                                                                   ', '1', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(80, 2158, 'TOMATE DE ARBOL X7', '1', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(81, 2159, 'NARANJILLA X7', '1', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(82, 2175, 'FREJOL ROJO PACHACAMA LB                                                                                  ', '2', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(83, 2160, 'ARVEJA LB', '2', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(84, 2161, 'FREJOL ROJO SUPERCITO', '2', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(85, 2261, 'VICTORIA NORMAL PASTA DE HARINA', '1.22', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(86, 2162, 'HABA CERRANA', '2', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(87, 2329, 'PEPSI SABOR INTENSO', '0.26785714', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(88, 2163, 'COL MORADA X1', '0.6', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(89, 2164, 'APIO MAZO', '0.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(90, 2165, 'PEREJIL MAZO', '0.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(91, 2166, 'MANZANILLA MAZO', '0.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(92, 2167, 'AGUACATE CERRANO                                                                                          ', NULL, '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(93, 2176, 'LIMON X10', '1', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(94, 2169, 'PANELA                                                                                                    ', NULL, '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(95, 2341, 'BIZCOTELAS 75GR', '1.25', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(96, 2184, 'PATA RES 2LB                                                                                              ', '3.3', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(97, 2183, 'HIGADO RES 2LB                                                                                            ', '5.8', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(98, 2256, 'FUNDA BASURA FLORAL X20                                                                                   ', '0.47', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(99, 2182, 'CARNE MOLIDA 2LB', '2.4', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(100, 2181, 'HUESO RES PICADO 2LB                                                                                      ', '2.4', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(101, 2333, 'YOGURT TONI LIGHT DURAZNO 950G', '2.97', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(102, 2199, 'VELAS CALDERON                                                                                            ', '0.44642857142857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(103, 2185, 'QUESO SUPERCITO 1LB', '2.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(104, 2186, 'QUESO SUPERCITO 2LB', '4.8', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(105, 2187, 'QUESO SUPERCITO 3LB', '7.205', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(106, 2188, 'MANI QUEBRADO TARRINA', '1', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(107, 2189, 'SAL PRIETA TARRINA                                                                                        ', '1', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(108, 2192, 'TROPICAL 2L', '1.33928571', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(109, 2248, 'DEREZO DE MAYONESA 3700GR', '9.28571429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(110, 2197, 'COLCAFE CAPUCHINO VAINILLA 270GR', '6.67142', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(111, 2283, 'MINI HARINA X3                                                                                            ', '1.3', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(112, 2316, 'BLENDAX MULTIACCION 60CC', '0.74107143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(113, 2334, 'GRANUST NUECES DISP', '0.89285714', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(114, 2336, 'MONTBLANC ACRILICO', '6.055357', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(115, 2190, 'MANI MOLIDO 1/2L', '0.8', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(116, 2191, 'MANI MOLIDO 1LB', '1.6', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(117, 2193, 'JABON DEJA EN BARRA 350GR', '0.80357143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(118, 2203, 'REXONA ROLLON MEN ANTIBACTERIAL', '1.86607143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(119, 2194, 'DORITOS SABOR PARRILLADA', '0.40178571', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(120, 2282, 'ABA CERRANA', '2', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(121, 2195, 'RUFLES CREMA Y CEBOLLA 36GR', '0.35714286', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(122, 2196, 'DORITOS LEMON REMIX                                                                                       ', '1.1160714285714', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(123, 2311, 'FREJOL PANAMITO', '1', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(124, 2198, 'COLCAFE CAPUCHINO CARAMELO 18GR                                                                           ', '0.51785714285714', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(125, 2200, 'NARANJA X10', '1', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(126, 2201, 'POLLO LB', '1.6', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(127, 2204, 'NECTAR DURAZNO FACUNDO                                                                                    ', '2.1428571428571', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(128, 2205, 'DESODORANTE GILLETTE GEL SPORT                                                                            ', '4.9732142857143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(129, 2244, 'LECHE CHOCOLATADA TONI CHIQUI 135                                                                         ', '0.49107142857143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(130, 2245, 'LECHE  FRESA TONI  CHIQUI 135', '0.49107143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(131, 2247, 'DURAZNOS FACUNDO  400GR', '2.00892857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(132, 2251, 'REMOLACHA  1LB                                                                                            ', '0.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(133, 2252, 'CAFFE LATO MOCACHINO 285ML                                                                                ', '1.3392857142857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(134, 2253, 'CAFFE LATO CAPUCHINO 285ML                                                                                ', '1.3392857142857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(135, 2255, 'PRESTOBARBA ULTRAGRIP                                                                                     ', '1.13', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(136, 2257, 'NO_', '0.89285714', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(137, 2258, 'ACEITE PALMA DE ORO ECO 600ML                                                                             ', '0.89285714285714', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(138, 2276, 'PASA 1 LB SUPERCITO', '1.15', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(139, 2275, 'PASA 1/2 LB SUPERCITO', '0.6', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(140, 2268, 'REY LECHE  1L', '0.99', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(141, 2278, 'CLORO REY X10                                                                                             ', '1', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(142, 2277, 'CLORO REY X5                                                                                              ', '1', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(143, 2279, 'BRIOLLITO X 24                                                                                            ', '2.05', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(144, 2280, 'ARROZ QQ SUPERCITO', '32.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(145, 2281, 'GRAGEAS SUPERCITO', '0.67', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(146, 2285, 'CHOCOTIN', '0.91071429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(147, 2326, 'TOALLAS PAÑALIN MANZANILLA X 100', '2.14285714', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(148, 2286, 'TUMIX CAJA', '3.39285714', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(149, 2287, 'TUMIX FUNDA', '3.41071429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(150, 2313, 'TE ANIS', '0.99', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(151, 2288, 'JAZZ FUNDA', '2.17857143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(152, 2289, 'PLOP CHOCOLATE', '2.00892857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(153, 2290, 'PLOP FRESA', '2.00892857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(154, 2291, 'PLOP SANDIA', '2.09821429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(155, 2292, 'KATABOM CEREZA', '2.54464286', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(156, 2312, 'TE MANZANILLA PUSIQUI', '0.99', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(157, 2293, 'KATABOM SANDIA', '2.1875', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(158, 2337, 'COLCAFE PRIMIUN LIOFILIZADO FRASCO 100G', '6.25', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(159, 2294, 'KATABOOM FRESA', '2.54464286', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(160, 2295, 'JELLY CORAZONES', '0.66964286', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(161, 2296, 'CHOCOLATES CORAZON', '2.95', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(162, 2315, 'TE OREGANO', '0.99', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(163, 2297, 'TAFFI MENTA', '1.2271', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(164, 2314, 'TE HIERBA LUISA', '0.99', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(165, 2298, 'TAFFI LECHE', '1.22321429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(166, 2299, 'TOFEES MANJAR', '2.72321429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(167, 2300, 'TOFEES LICORES', '2.155556', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(168, 2301, 'TOFEES CAFE', '2.153214', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(169, 2302, 'TOFEES FRUTOS SECOS', '2.153214', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(170, 2303, 'TOFEE CHOLOTATE ESPECIAL', '2.153214', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(171, 2304, 'ZOOM ACIDO', '1.23', '00000001', 'NO DEFINIDA', '0', '0', '1', NULL, NULL),
(172, 2305, 'ZOOM  FRUTAS', '1.22321429', '00000001', 'NO DEFINIDA', '0', '1', '1', NULL, NULL),
(173, 2306, 'TAFFI TRIPLE SABOR', '1.224642', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(174, 2307, 'CONDELAC TUBITO', '0.53571429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(175, 2308, 'SUNNY DURAZNO 1000ML', '1.96428571', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(176, 2309, 'SUNNY MORA 1000ML', '1.96428571', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(177, 2310, 'TE VERDE PUSIQUI', '1.33928571', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(178, 2317, 'PAPEL HIGIENICO PRIMAVERAL X4', '0.625', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(179, 2318, 'TE CON MANZANA Y CANELA', '1.33928571', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(180, 2319, 'TE MENTA', '0.88392857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(181, 2320, 'SUPER CHIFLE FUNDA 320G', '1', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(182, 2321, 'SUPERCHIFLE VERDE 45G', '0.2', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(183, 2322, 'SUPER CHIFLE MADURO 45G', '0.2', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(184, 2338, 'COLCAFE TODO EN 1 LIGHT', '6.25', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(185, 2339, 'SNACKS KRYZPO ORIGINAL', '1.29464286', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(186, 2340, 'SNACKS KRYZPO QUESO', '1.29464286', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(187, 2342, 'BIZCOTELAS 150GR', '1.69642857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(188, 2343, 'M&M', '1.11607143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(189, 2344, 'BAMBINI MAGIG', '0.91964286', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(190, 2345, 'MAMA FANNY TORTILLAS', '2.1875', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(191, 2346, 'CUCHARITA BLANCA ALEGRIA', '0.53571429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(192, 2347, 'PLATO #7 ALEGRIA 25U', '0.49107143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(193, 2354, 'LUBRIDERM AVENA 200ML', '4.46428571', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(194, 2358, 'COLGATE MENTA PURA', '0.88392857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(195, 2363, 'DETER CICLON ULTRA LIMON 5KG', '11.11607143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(196, 2368, 'SINSARRIN', '1.559999', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(197, 2369, 'MELOSITAS 250GR', '1.50892857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(198, 2370, 'CHUPETE FUSION', '1.76785714', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(199, 2371, 'CHUPETE FRESA', '1.76785714', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(200, 2406, 'CHULETA SUPERCITO', '2.75', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(201, 2372, 'CHUPETE MOUTH PAINTER', '1.76785714', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(202, 2373, 'CHUPETE MANGO ACIDO', '2.90178571', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(203, 2374, 'CHOCOLATE ORIENT', '8.91964286', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(204, 2375, 'CHOCOLATE LOVE', '8.91964286', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(205, 2376, 'LEMON PIE', '8.91964286', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(206, 2377, 'TIRA BESITOS CORTADO', '0.22321429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(207, 2378, 'FUNDA HAY-HAY', '9.375', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(208, 2592, 'LECHUGA ORGANICA', '0.72', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(209, 2379, 'CHOCOLATE CAJA TRIXI', '0.227857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(210, 2384, 'CHIFLE SUPERCITO PEQUEÑO', '0.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(211, 2380, 'BESITOS SERTID', '1.33928571', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(212, 2381, 'BESITOS BLANCO', '3.125', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(213, 2382, 'BESITOS CUINDIVIDUAL', '1.60714286', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(214, 2383, 'BOMBON INVITE', '0.88392857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(215, 2385, 'CHIFLE SUPERCITO GRANDE', '1', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(216, 2386, 'ACEITE ALESOL 3.8L', '5.99', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(217, 2388, 'BIG MANZANA 300ML', '0.17857143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(218, 2389, 'OREO VAN EC 54G', '0.431785', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(219, 2390, 'OREO ROLLO 126G                                                                                           ', '0.89285714285714', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(220, 2396, 'MORT ESP TACO BOLA', '2.05', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(221, 2446, 'FREJOL SERRANO 1/2', '1', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(222, 2595, 'TAPIOKITA MANZANA 200GR', '0.99', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(223, 2447, 'ARVERJA 1/2', '1', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(224, 2448, 'AVA SERRANA 1/2', '1', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(225, 2449, 'SUNTEA MARACUYA SOBRE', '0.3', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(226, 2450, 'JUGOS YA SOBRE TAMARINDO                                                                                  ', '0.27', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(227, 2451, 'JUGOS YA SOBRE PIÑACOCO', '0.27', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(228, 2457, 'JUGOS YA SOBRE PIÑA                                                                                       ', '0.27', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(229, 2452, 'JUGOS YA SOBRE FRESA                                                                                      ', '0.27', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(230, 2453, 'JUGOS YA SOBRE NARANJA                                                                                    ', '0.27', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(231, 2454, 'JUGOS YA SOBRE DURAZNO', '0.27', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(232, 2455, 'JUGOS YA SOBRE MORA                                                                                       ', '0.27', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(233, 2456, 'JUGOS YA SOBRE LIMONADA                                                                                   ', '0.27', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(234, 2458, 'JUGOS YA SOBRE MANGO                                                                                      ', '0.27', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(235, 2459, 'JUGOS YA SOBRE NARANJILLA                                                                                 ', '0.27', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(236, 2460, 'JUGOS YA SOBRE MANDARINA                                                                                  ', '0.27', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(237, 2462, 'MANTECA LOS 3 CHANCHITOS 900G', '1.94', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(238, 2463, 'MANTECA LOS 3 CHANCHITOS 1LB', '0.68', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(239, 2464, 'MANTECA LOS 3 CHANCHITOS 3KG', '5.99', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(240, 2465, 'ACEITE PALMA DE ORO 900ML', '1.39', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(241, 2470, 'VASO DE 6OZ SURTIDO', '0.4375', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(242, 2466, 'TOP COMBI BEBE', '0.44642857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(243, 2468, 'CHIFLE MADURO SUPERCITO', '0.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(244, 2467, 'PALMA DE ORO 500ML', '0.95', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(245, 2469, 'CUCHARA PEQUEÑA OXFORD                                                                                    ', '0.40178571428571', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(246, 2479, 'HIDROXON 30VOL 60CC', '0.88392857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(247, 2471, 'VASO 7 ONZ BLANCO', '0.4375', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(248, 2472, 'PICA PAPA PLANO OXFORD', '0.28571429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(249, 2473, 'PICA PAPA REDONDO OXFORD', '0.58035714', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(250, 2474, 'TARRINA TRANSPARENTE REDONDA MEDIANA', '0.13392857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(251, 2480, 'SPRAY FLEX EXTRA FUERTE', '4.0625', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(252, 2475, 'BASE DE TORTA PLASTI', '0.16964286', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(253, 2478, 'HIDROXON 20VOL 60CC', '0.88392857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(254, 2476, 'BASE PARA TORTA 12', '0.17857143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(255, 2477, 'BASE PARA TORTA 13', '0.22321429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(256, 2481, 'SPRAY FLEX FUERTE', '4.0625', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(257, 2485, 'CREMA OXIGENADA VOL 30 60ML', '1.13392857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(258, 2516, 'SUAVITEL ROSAS Y CANELA 430ML', '1.07142857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(259, 2517, 'AJAX BICARBONATO NARANLIMON', '0.41964286', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(260, 2518, 'CUCHARA SOPERA OXFORD', '0.53571429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(261, 3071, 'ARROZ INTEGRAL SUPER EXTRA 2KG', '3.05', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(262, 2545, 'DETERGENTE CIERTO FLORAL 950GR', '2.66964286', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(263, 2574, 'PECHUGA SUPERCITO 1.5LB', '2.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(264, 2547, 'DETERGENTE GOL FLORAL 5KG', '8.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(265, 2575, 'POLLO ENTERO SUPERCITO GRANDE', '11.2', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(266, 2576, 'MENUDENCIA SUPERCITO 1LB', '0.9', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(267, 2587, 'CAJITA HUEVO DE CODORNIZ', '1.89', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(268, 2596, 'TAPIOKITA FRESA 200GR', '0.99', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(269, 2597, 'TAPIOKITA MORA 200GR                                                                                      ', '0.99', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(270, 2598, 'TAPIOKITA CEREZA 200GR                                                                                    ', '0.99', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(271, 2608, 'AGUA BELLA', '0.17857143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(272, 2609, 'FRUTARIS MANDARINA 355ML', '0.22321429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(273, 2624, 'FIDEO FINITO MI ABUELITA 100G', '0.3', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(274, 2625, 'SACO LAMINADO 25LB FLOR                                                                                   ', NULL, '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(275, 2626, 'SACO LAMINADO 10LB CONEJO                                                                                 ', NULL, '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(276, 2627, 'SACO LAMINADO 20LB CONEJO                                                                                 ', NULL, '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(277, 2628, 'PIOLA CONO                                                                                                ', NULL, '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(278, 2629, 'FUNDA AMARILLA HOTDOG 9X4                                                                                 ', '0.19642857142857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(279, 2630, 'FUNDA AMARILLA PARAISO 7X6', '0.44642857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(280, 2631, 'FUNDA AMARILLA PARAISO 6X5', '0.28571429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(281, 2632, 'FUNDAS NATURAL 2*8', '0.24107143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(282, 2641, 'ARROZ ROMINA 1LB', '0.52', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(283, 2642, 'ARROZ ROMINA 1KG', '1.1', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(284, 2651, 'LECHUGA GRANDE', '0.7', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(285, 2652, 'CILANTRO                                                                                                  ', '0.25', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(286, 2653, 'BROCOLI GRANDE', '0.7', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(287, 2654, 'GUINEO SUPERCITO', '0.05', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(288, 2657, 'LIMONES *50', '0.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(289, 2738, 'PLATANO SUPERCITO', '0.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(290, 2685, 'CESTA PARIS', '1.74107143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(291, 2728, 'FREJOL ROJO MAQUITA 500G', '2.00892857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(292, 2730, 'PANELA SUPERCITO', '0.99', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(293, 2756, 'DETERGENTE 123 350G                                                                                       ', NULL, '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(294, 2757, 'MIXTO FRUTAS', '1.87', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(295, 2785, 'VELAS IMPERIO', '0.88392857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(296, 2786, 'VELAS IMPERIO ECOLOGICA', '0.89285714', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(297, 2787, 'LEON AMARILLO', '0.88392857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(298, 2788, 'FOCO LAMP 9W                                                                                              ', '0.88392857142857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(299, 2789, 'CARAMELO KAUMAL SURT', '1.96428571', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(300, 2792, 'AGUA GALON PURISSIMA                                                                                      ', '0.66964285714286', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(301, 2805, 'FREJOL ROJO SUPERCITO 1/2LB', '1', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(302, 2812, '                                                                                                         ', NULL, '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(303, 2831, 'LIMON X5', NULL, '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(304, 3297, 'TOSTADAS MANAPAN NATURAL                                                                                  ', '0.95', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(305, 2832, 'CHOCLO SUPERCITO', '1', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(306, 2841, 'CARBON SUPERCITO', '1', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(307, 2833, 'YUCA SUPERCITO', '0.75', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(308, 2834, 'HABA CRIOLLA SUPERCITO', '2', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(309, 2835, 'MELON SUPERCITO', '0.6', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(310, 2836, 'ACHOCHA SUPERCITO', '0.85', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(311, 2837, 'SANDIA VERDE SUP', '1.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(312, 2838, 'HABA CRIOLLA 1/2', '1', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(313, 2840, 'HABICHUELA SUPERCITO 1/2', '1', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(314, 2850, 'PASTA DE ACHIOTE  VASO 130G                                                                               ', '0.75892857142857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(315, 2851, 'VASO OPAL 10 OZ', '0.74107143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(316, 2852, 'FUNDAS QUINTALERAS 25X40', '0.22321429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(317, 2853, 'FUNDA DE PAPEL #1 TITAN', '0.61830357', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(318, 2854, 'FUNDA DE PAPEL #2 TITAN', '0.61607143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(319, 2855, 'FUNDA DE PAPEL #12 TITAN', '1.875', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(320, 2856, 'FUNDA DE PAPEL #6 TITAN', '1.11607143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(321, 2857, 'REPOSTERO 5 OZ AMARILLO', '0.3125', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(322, 2858, 'REPOSTERO 7 OZ AMARILLO', '0.357142', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(323, 2871, 'TE DIGESTIVO                                                                                              ', '1.89', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(324, 2859, 'VASO DE 16 OZ', '0.88392857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(325, 2860, 'VASO 32 OZ', '3.08928571', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(326, 2861, 'FUNDA JUMBO BLANCA X25                                                                                    ', NULL, '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(327, 3068, 'TARRINA+TAPA', '0.08928571', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(328, 2950, 'ALBACORA LOMO SUPERCITO 1L', '3.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(329, 2924, 'MIMASKOT CACHORRO 450G                                                                                    ', '0.89285714285714', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(330, 3031, 'CHICLE METRO 80G', '0.858928', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(331, 3032, 'MALLA ZOO CHOC                                                                                            ', '0.58035714285714', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(332, 3033, 'CHOCOLATE MIX', '0.223214', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(333, 3044, 'FREJOL DE PALO SUPERCITO', '1', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(334, 3045, 'CONCHA EN TARRINA SUPERCITO', '5.8', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(335, 3046, 'CAMARON DE MAR SUPERCITO', '4.99', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(336, 3047, 'PESCADO PICUDO SUPERCITO', '5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(337, 3048, 'PICUDO PICADO SUPERCITO', '5.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(338, 3051, 'YUCA CASCARA SUPERCITO', '0.3', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(339, 3058, 'VASO OPAL 3.5 TRANSPARENTE                                                                                ', '0.60714285714286', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(340, 3060, 'VASO DE 1 ONZ OPAL BLANCO                                                                                 ', '0.39535714285714', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(341, 3061, 'VASO 1 ONZ OPAL                                                                                           ', '0.39535714285714', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(342, 3062, 'VASO OPAL 2 ONZ BLANCO                                                                                    ', '0.48107142857143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(343, 3063, 'FUNDA P7 SIN IMPRESION', '0.848214', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(344, 3069, 'VELAS EXPLOSIVAS', '0.625', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(345, 3070, 'VELAS NUMERO                                                                                              ', '0.44642857142857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(346, 3216, 'POLVO ROYAL SUPER LB                                                                                      ', '3.25', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(347, 3133, 'CHIFLES JULIAN 300G                                                                                       ', '0.99', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(348, 3160, 'ADEREZO MIL ISLAS NAT HEART', '3.03571429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(349, 3177, 'CHIFLES MADURO SUPERCITO', '0.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(350, 3171, 'FOSFORO DE MADERA FOSFORITO', '0.541071', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(351, 3172, 'FOSFOROS BARCELONA                                                                                        ', '0.49107142857143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(352, 3178, 'LENTEJA 1/2 SUPERCITO', '0.38392857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(353, 3226, 'SPRAY FUERZA Y VITAMINA 200ML                                                                             ', '4.1071428571429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(354, 3233, 'MASA DE YUCA                                                                                              ', '1.25', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(355, 3238, 'BLUE NUN GOLD EDITION', '12.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(356, 3240, 'LA CHAMIZA POLO  75CL', '10.70535714', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(357, 3241, 'TOCORNAL MERLOT 75CL', '6.6875', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(358, 3242, 'NAVARRO CORREA LOS ARB', '7.49107143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(359, 3243, 'GRAN VADUSH ESPUMANTE 750ML', '6.16071429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(360, 3244, 'ICELAMD VODKA 750ML', '6.69642857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(361, 3245, 'EL KARNAL TEQUILA 750ML', '14.27678571', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(362, 3247, 'ICELAND VODKA MANZANA 750ML', '6.24107143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(363, 3248, 'ICELAND VODKA BERRY 750ML', '6.24107143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(364, 3249, 'BLACK&WHITE 750ML', '15.17857143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(365, 3250, 'VAT 69 750ML', '12.1', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(366, 3298, 'TOSTADAS MANAPAN INTEGRALES                                                                               ', '0.95', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(367, 3308, 'ANIS CHIQUITO                                                                                             ', '0.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(368, 3319, 'POLLO SUPERCITO MEDIANO', '8.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(369, 3369, 'BICARBONATO SUPERCITO', '0.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(370, 3918, 'PAPI FRITS TOMATE                                                                                         ', '0.22321428571429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(371, 3370, 'CANELA SUPERCITO', '0.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(372, 3371, 'CIRUELA PASA 1/2                                                                                          ', '0.46', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(373, 3372, 'CIRUELA PASA SUPERCITO', '0.93', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(374, 3379, 'FUNDA JUMBO OXFORD VERDE                                                                                  ', '1.7857142857143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(375, 3380, 'FUNDA PARA BASURA 30X36                                                                                   ', '0.71428571428571', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(376, 3382, 'FUNDA CAMISETA GRANDE                                                                                     ', '1.8214285714286', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(377, 3383, 'COLORANTE VEGETAL SUPERCITO', '0.1', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(378, 3392, 'VINAGRE BLANCO DJ 4000CC                                                                                  ', '2.2053571428571', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(379, 3431, 'CAJONERITA', '6.47321429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(380, 3466, 'PAÑALES BABYSEC M X24                                                                                     ', '4.2589285714286', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(381, 3785, 'AJI NOMOTO SUPERCITO', '0.25', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(382, 3919, 'PAPI FRITS LIMON                                                                                          ', '0.22321428571429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(383, 3920, 'PAPI FRITS NATURAL                                                                                        ', '0.22321428571429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(384, 3934, 'RED LABEL 1L                                                                                              ', '22.232142857143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(385, 3574, 'BIZCOCHUELO TROZOS                                                                                        ', '1.15', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(386, 3575, 'BIZCOCHUELO X3                                                                                            ', '1.99', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(387, 3576, 'BIZCOCHUELO X2', '1.3', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(388, 3584, 'GELATINA JELLY CHUPS 1KG                                                                                  ', '2.6696428571429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(389, 3585, 'JELLY CHUPS FRUTITA                                                                                       ', '0.22321428571429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(390, 3586, 'CHICLE ACIDO MOLOTOV                                                                                      ', '2.5714285714286', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(391, 3603, 'LATITUD CERO 330ML', '1.83035714', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(392, 3604, 'LATITUD CERO APACHITA 330ML                                                                               ', '1.8303571428571', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(393, 3605, 'SOL CERVEZA 330ML                                                                                         ', '1.4732142857143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(394, 3619, 'VASO 12LTS GOLDERIE                                                                                       ', '1.4107142857143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(395, 3617, 'TARRINA TRANSPARENTE 1/4                                                                                  ', '2.5357142857143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(396, 3618, 'TARRINA TRANSPARENTE 1/5                                                                                  ', '2.5357142857143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(397, 3620, 'TAPA VASO 12LTS                                                                                           ', '1.0982142857143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(398, 3621, 'PALO CHUZO BAMBU X100 30CM', '1.17857143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(399, 3623, 'TARRINA 1LTR FOAN PLASTRO                                                                                 ', '2.6071428571429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(400, 3624, 'TARRINA 1/2 LTR FOAN PLASTRO                                                                              ', '2.375', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(401, 3625, ' VASO 6OZ TERMIX X25                                                                                      ', '0.65178571428571', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(402, 3637, 'CUCHARERA NEW                                                                                             ', '1.25', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(403, 3639, 'CORTINA LLANA GAMA                                                                                        ', '4.1071428571429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(404, 3658, 'BONOBOM CORAZON 270G                                                                                      ', '5.0892857142857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(405, 3666, 'ROLLO DE FUNDA CEBRA 23X28                                                                                ', '0.71428571428571', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(406, 3667, 'FUNDA POLIFAN 5X8                                                                                         ', '0.48214285714286', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(407, 3669, 'FUNDA POLIFAN 5X6                                                                                         ', '0.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(408, 3670, 'FUNDA POLIFAN 6X8                                                                                         ', '0.60714285714286', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(409, 3674, 'PASTA DE BIZCOCHUELO                                                                                      ', '2.75', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(410, 3685, 'SALSA DE TOMATE SUPERCITO', '0.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(411, 3686, 'MOSTAZA SUPERCITO', '0.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(412, 3690, 'ESPONJA ESPIRAL METALICA', '0.40178571', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(413, 3693, 'PH DENDIPEL  BLANCO 180MTR                                                                                ', '1.9285714285714', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(414, 3692, 'ESPONJA LAMINADA                                                                                          ', '0.41964285714286', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL);
INSERT INTO `productos` (`id`, `id_foraneo`, `NAME`, `PRICE`, `IDBRAND`, `MARCA`, `PESOITEM`, `stock`, `estado_del`, `created_at`, `updated_at`) VALUES
(415, 3784, 'DESODORANTE SPEED STICK 30G                                                                               ', '0.88392857142857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(416, 3821, 'FUNDA 7X15                                                                                                ', '1.0535714285714', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(417, 3834, 'MANTEL RECTANGULAR 6P                                                                                     ', '8.4821428571429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(418, 3839, 'PLATOS PERRO                                                                                              ', '1.6071428571429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(419, 3889, 'COMBO SUPERCITO', '7.89', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(420, 3892, 'CHIFLES LA SIN PAR 45G', '0.16071429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(421, 3931, 'APIO SUPERCITO                                                                                            ', '0.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(422, 3932, 'PEREJIL SUPERCITO                                                                                         ', '0.5', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(423, 3933, 'HIELO CUBO                                                                                                ', '2', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(424, 3954, 'SOMETING SPECIAL                                                                                          ', '22.232142857143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(425, 3968, 'BLENDY COOL BUBLE GUM                                                                                     ', '0.75892857142857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(426, 3969, 'BLENDY COOL FRESA                                                                                         ', '0.75892857142857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(427, 3982, 'SIX PACK CORONA                                                                                           ', '9.0625', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(428, 3983, 'SIX PACK STELLA                                                                                           ', '9.0625', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(429, 3998, 'ESPONJA LUMINUZ MIXTA                                                                                     ', '0.35714285714286', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(430, 3999, 'PEGAMENTO EPOXICO SUP GLUE                                                                                ', '0.22321428571429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(431, 4000, 'CLORO LEON 150G                                                                                           ', '0.13392857142857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(432, 4154, 'GUANTES  CALSICO NEGRO                                                                                    ', '1.3392857142857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(433, 4155, 'ALCOHOL ANTISEPTICO 100C                                                                                  ', '0.44642857142857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(434, 4159, 'ALCOHOL ANTISEPTICO 1L                                                                                    ', '2.4107142857143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(435, 4168, 'ALCOHOL                                                                                                   ', '2.5892857142857', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(436, 4169, 'ALCOHOL DE 500ML                                                                                          ', '2.1428571428571', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(437, 4170, 'ALCOHOL DE 1000ML                                                                                         ', '3.3482142857143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(438, 4212, 'VASO 12ONZ BLANCO', '0.80357143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(439, 4213, 'FUNDA DE PAPEL TITAN #5                                                                                   ', '1.2232142857143', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(440, 4214, 'PORTA HAMBURGUESA 5X5                                                                                     ', '0.91964285714286', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(441, 4215, 'R ESPUESTO PELICULA PLASTICA 100M                                                                         ', '2.0089285714286', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(442, 4233, 'COMBO LECHE VITA                                                                                          ', '1.6071428571429', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(443, 4242, 'CERVEZA LIGHT 330ML                                                                                       ', '7.0089285714286', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(444, 4261, 'DOWNY SUAVIZANTE  FLORAL 800ML                                                                            ', '4.1875', '00000001', 'NO DEFINIDA', '0', '2', '1', NULL, NULL),
(445, 935, 'SALSA BBQ 300GR', '1.81', '00000002', 'ILE', '300', '2', '1', NULL, NULL),
(446, 934, 'MOSTAZA 330G', '1.45', '00000002', 'ILE', '330', '2', '1', NULL, NULL),
(447, 933, 'SALSA DE TOMATE 320GR', '1.32', '00000002', 'ILE', '320', '2', '1', NULL, NULL),
(448, 932, 'AJO EN PASTA', '1.35', '00000002', 'ILE', '500', '2', '1', NULL, NULL),
(449, 931, 'ALIÑO COMPLETO', '1.17', '00000002', 'ILE', '500', '2', '1', NULL, NULL),
(450, 930, 'SALSA BBQ 220GR', '1.21', '00000002', 'ILE', '220', '2', '1', NULL, NULL),
(451, 929, 'ALIÑO COMPLETO', '0.48', '00000002', 'ILE', '215', '2', '1', NULL, NULL),
(452, 928, 'AJI PERUANO', '0.32', '00000002', 'ILE', '50', '2', '1', NULL, NULL),
(453, 927, 'AJO CONDIMENTO', '0.36', '00000002', 'ILE', '50', '2', '1', NULL, NULL),
(454, 926, 'PIMIENTA MOLIDA', '0.67', '00000002', 'ILE', '50', '2', '1', NULL, NULL),
(455, 925, 'COMINO MOLIDO', '0.45', '00000002', 'ILE', '50', '2', '1', NULL, NULL),
(456, 924, 'SABORA 50G', '0.34', '00000002', 'ILE', '50', '2', '1', NULL, NULL),
(457, 4288, 'SAZONADOR EN POLVO                                                                                        ', '0.40178571428571', '00000002', 'ILE', '0', '2', '1', NULL, NULL),
(458, 2847, 'CAFE ISTANTANEO CAYETANO 10G                                                                              ', '0.20535714285714', '00000002', 'ILE', '0', '2', '1', NULL, NULL),
(459, 2848, 'ANIS ESTRELLADO ILE 15G', '0.34', '00000002', 'ILE', '0', '2', '1', NULL, NULL),
(460, 2849, 'SASONADOR EN PASTA ILE 320G                                                                               ', '0.98214285714286', '00000002', 'ILE', '0', '2', '1', NULL, NULL),
(461, 3020, 'CURRY ILE SOBRE 50G                                                                                       ', '0.46428571428571', '00000002', 'ILE', '0', '2', '1', NULL, NULL),
(462, 3021, 'PANELA GRANULADA 500G', '1.2', '00000002', 'ILE', '0', '2', '1', NULL, NULL),
(463, 3023, 'CHIMICHURRI ILE BOTELLA 530G                                                                              ', '1.2767857142857', '00000002', 'ILE', '0', '2', '1', NULL, NULL),
(464, 3022, 'PANELA GRANULADA 250G                                                                                     ', '0.63', '00000002', 'ILE', '0', '2', '1', NULL, NULL),
(465, 3024, 'CHIMICHURRI ILE BOTELLA 320G                                                                              ', '0.80357142857143', '00000002', 'ILE', '0', '2', '1', NULL, NULL),
(466, 3025, 'CURRY ILE SOBRE 25G                                                                                       ', '0.22321428571429', '00000002', 'ILE', '0', '2', '1', NULL, NULL),
(467, 3026, 'CANELA CVASCARA ILE SOBRE 10G                                                                             ', '0.3', '00000002', 'ILE', '0', '2', '1', NULL, NULL),
(468, 3384, 'ALIÑO COMPLETO 430G                                                                                       ', '0.75892857142857', '00000002', 'ILE', '0', '2', '1', NULL, NULL),
(469, 3542, 'CURCUMA MOLIDA 50G', '0.4', '00000002', 'ILE', '0', '2', '1', NULL, NULL),
(470, 3543, 'SAZONADOR DE AJO Y CURCUMA 300G                                                                           ', '0.82142857142857', '00000002', 'ILE', '0', '2', '1', NULL, NULL),
(471, 4009, 'VINAGRE BLANCO ILE 100ML                                                                                  ', '0.35', '00000002', 'ILE', '0', '2', '1', NULL, NULL),
(472, 4010, 'VINAGRE BLANCO ILE 195ML                                                                                  ', '0.53571428571429', '00000002', 'ILE', '0', '2', '1', NULL, NULL),
(473, 4011, 'MEGA SAZON FUNDA 200G                                                                                     ', '0.88392857142857', '00000002', 'ILE', '0', '2', '1', NULL, NULL),
(474, 4012, 'MEGA SAZON 70G                                                                                            ', '0.33928571428571', '00000002', 'ILE', '0', '2', '1', NULL, NULL),
(475, 4140, 'PIMEINTA MOLIDA 250G                                                                                      ', '2.9910714285714', '00000002', 'ILE', '0', '2', '1', NULL, NULL),
(476, 4141, 'PIMEINTA DULCE 20G                                                                                        ', '0.42', '00000002', 'ILE', '0', '2', '1', NULL, NULL),
(477, 4166, 'PIMIENTA SOBRE 25G                                                                                        ', '0.30357142857143', '00000002', 'ILE', '0', '2', '1', NULL, NULL),
(478, 4167, 'ALIÑO COMPLETO 70G                                                                                        ', '0.20535714285714', '00000002', 'ILE', '0', '2', '1', NULL, NULL),
(479, 4260, 'AJO EN PASTA ILE 320G                                                                                     ', '0.89285714285714', '00000002', 'ILE', '0', '2', '1', NULL, NULL),
(480, 1265, 'GALLETA DE SAL', '1.55357143', '00000003', 'NESTLE', '380', '2', '1', NULL, NULL),
(481, 1264, 'GALLETA DE VAINILLA', '1.55357143', '00000003', 'NESTLE', '380', '2', '1', NULL, NULL),
(482, 1263, 'GALLETA DE VAINILLA ZOO', '1.71', '00000003', 'NESTLE', '380', '2', '1', NULL, NULL),
(483, 1262, 'GALAK SANDUCHE 87.5GR', '0.71', '00000003', 'NESTLE', '87.5', '2', '1', NULL, NULL),
(484, 1261, 'GALLETA  DE COCO', '1.16', '00000003', 'NESTLE', '206', '2', '1', NULL, NULL),
(485, 1260, 'GALLETA MARIA', '2.99', '00000003', 'NESTLE', '414', '2', '1', NULL, NULL),
(486, 1259, 'GALLETA MARIA', '0.77', '00000003', 'NESTLE', '172', '2', '1', NULL, NULL),
(487, 1258, 'TANGO BOMBON', '4.977', '00000003', 'NESTLE', '550', '2', '1', NULL, NULL),
(488, 1257, 'CHOCOLATE EN BARRA FAMILIAR', '1.28', '00000003', 'NESTLE', '100', '2', '1', NULL, NULL),
(489, 1256, 'CRUNCH TABLETA 100GR', '1.6', '00000003', 'NESTLE', '100', '2', '1', NULL, NULL),
(490, 1255, 'CRUNCH  23GR', '0.36', '00000003', 'NESTLE', '23', '2', '1', NULL, NULL),
(491, 1254, 'CHOCOLATE EN BARRA FAMILIAR', '2.12', '00000003', 'NESTLE', '200', '2', '1', NULL, NULL),
(492, 1253, 'GALLETAS DE AMOR LIMON', '0.8', '00000003', 'NESTLE', '100', '2', '1', NULL, NULL),
(493, 1252, 'GALLETAS DE AMOR VAINILLA', '0.81', '00000003', 'NESTLE', '100', '2', '1', NULL, NULL),
(494, 1251, 'GALLETAS DE AMOR FRESA', '0.8', '00000003', 'NESTLE', '100', '2', '1', NULL, NULL),
(495, 1250, 'GALLETAS DE AMOR NARANJA', '0.8', '00000003', 'NESTLE', '100', '2', '1', NULL, NULL),
(496, 1249, 'GALLETAS DE AMOR CHOCOLATE', '0.8', '00000003', 'NESTLE', '100', '2', '1', NULL, NULL),
(497, 1248, 'GALLETAS DE AMOR CLASICAS', '0.8', '00000003', 'NESTLE', '100', '2', '1', NULL, NULL),
(498, 1247, 'GALLETAS DE AMOR PEKE', '0.92', '00000003', 'NESTLE', '130', '2', '1', NULL, NULL),
(499, 1246, 'GALLETAS DE AMOR LIMON', '1.06', '00000003', 'NESTLE', '175', '2', '1', NULL, NULL),
(500, 1245, 'GALLETAS DE AMOR VAINILLA', '1.06', '00000003', 'NESTLE', '175', '2', '1', NULL, NULL),
(501, 1244, 'GALLETAS DE AMOR FRESA', '1.22', '00000003', 'NESTLE', '175', '2', '1', NULL, NULL),
(502, 1243, 'GALLETAS DE AMOR NARANJA', '1.06', '00000003', 'NESTLE', '175', '2', '1', NULL, NULL),
(503, 1242, 'GALLETAS DE AMOR CHOCOLATE', '1.06', '00000003', 'NESTLE', '175', '2', '1', NULL, NULL),
(504, 1241, 'GALLETAS DE AMOR CLASICAS', '1.22', '00000003', 'NESTLE', '175', '2', '1', NULL, NULL),
(505, 1240, 'MUECAS VAINILLA', '0.63', '00000003', 'NESTLE', '100', '2', '1', NULL, NULL),
(506, 1239, 'MUECAS CHOCOLATE', '0.63', '00000003', 'NESTLE', '100', '2', '1', NULL, NULL),
(507, 1238, 'GALLETA VAINILLA TACO', '0.49', '00000003', 'NESTLE', '135', '2', '1', NULL, NULL),
(508, 1237, 'GALLETA DE COCO', '3', '00000003', 'NESTLE', '540', '2', '1', NULL, NULL),
(509, 1236, 'GALLETA DE SAL TACO', '0.5', '00000003', 'NESTLE', '135', '2', '1', NULL, NULL),
(510, 1235, 'GALLETAS DE AMOR CLASICAS', '1.61', '00000003', 'NESTLE', '180', '2', '1', NULL, NULL),
(511, 1234, 'AMOR WALFER VAINILLA', '1.61', '00000003', 'NESTLE', '180', '2', '1', NULL, NULL),
(512, 1233, 'AMOR WALFER FRESA', '1.61', '00000003', 'NESTLE', '180', '2', '1', NULL, NULL),
(513, 1232, 'AMOR WALFER CHOCOLATE', '1.61', '00000003', 'NESTLE', '180', '2', '1', NULL, NULL),
(514, 1231, 'AMOR WALFER PEQUES', '1.71', '00000003', 'NESTLE', '204', '2', '1', NULL, NULL),
(515, 1230, 'CRUNCH 483GR', '7.64', '00000003', 'NESTLE', '483', '2', '1', NULL, NULL),
(516, 1229, 'TANGO CLASICO MININEGRO', '3.67', '00000003', 'NESTLE', '299', '2', '1', NULL, NULL),
(517, 1228, 'MILO CHOCOLATE', '7.13392857', '00000003', 'NESTLE', '400', '2', '1', NULL, NULL),
(518, 1227, 'MILO CHOCOLATE 200G', '4.00892857', '00000003', 'NESTLE', '200', '2', '1', NULL, NULL),
(519, 1226, 'TANGO CLASICO BLANCO', '7.17', '00000003', 'NESTLE', '700', '2', '1', NULL, NULL),
(520, 1225, 'TANGO CLASICO NEGRO', '6.57', '00000003', 'NESTLE', '700', '2', '1', NULL, NULL),
(521, 1224, 'MANICERO', '6.26', '00000003', 'NESTLE', '375', '2', '1', NULL, NULL),
(522, 1223, 'MANICERO', '0.36', '00000003', 'NESTLE', '25', '2', '1', NULL, NULL),
(523, 676, 'CALDO DE GALLINA MAGGI', '1.95', '00000003', 'NESTLE', '120', '2', '1', NULL, NULL),
(524, 674, 'LA VAQUITA 200GR', '1.9', '00000003', 'NESTLE', '200', '2', '1', NULL, NULL),
(525, 673, 'LA VAQUITA 400GR', '3.83', '00000003', 'NESTLE', '400', '2', '1', NULL, NULL),
(526, 672, 'LA VAQUITA 900GR', '8.61', '00000003', 'NESTLE', '900', '2', '1', NULL, NULL),
(527, 662, 'CHOCAPIC 90 GR', '1.06', '00000003', 'NESTLE', '90', '2', '1', NULL, NULL),
(528, 661, 'TRIX CONFLE', '1.06', '00000003', 'NESTLE', '90', '2', '1', NULL, NULL),
(529, 655, 'CERE AVENA DE NARANJILLA', '1.8', '00000003', 'NESTLE', '1000', '2', '1', NULL, NULL),
(530, 654, 'RICACAO', '1.52571429', '00000003', 'NESTLE', '150', '2', '1', NULL, NULL),
(531, 653, 'RICACAO ENERGY', '0.76', '00000003', 'NESTLE', '185', '2', '1', NULL, NULL),
(532, 652, 'GALAK 20GR', '0.36', '00000003', 'NESTLE', '20', '2', '1', NULL, NULL),
(533, 651, 'GALAK 90GR', '1.6', '00000003', 'NESTLE', '90', '2', '1', NULL, NULL),
(534, 649, 'CALDO DE GALLINA MAGGI CUBO', '0.3125', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(535, 648, 'GALAK 420GR', '7.68', '00000003', 'NESTLE', '420', '2', '1', NULL, NULL),
(536, 647, 'NESCAFE', '5.72', '00000003', 'NESTLE', '200', '2', '1', NULL, NULL),
(537, 644, 'CERE AVENA CON FRUTAS', '1.81', '00000003', 'NESTLE', '1000', '2', '1', NULL, NULL),
(538, 643, 'CERE AVENA DE LECHE', '2.3', '00000003', 'NESTLE', '1000', '2', '1', NULL, NULL),
(539, 642, 'CREMA DE LECHE 1LT', '4.4', '00000003', 'NESTLE', '1000', '2', '1', NULL, NULL),
(540, 641, 'NATURA DURAZNO', '2.08', '00000003', 'NESTLE', '1000', '2', '1', NULL, NULL),
(541, 640, 'NIDO 1 ETAPA FUNDA', '3.63', '00000003', 'NESTLE', '216', '2', '1', NULL, NULL),
(542, 639, 'LECHE SVELTTY ENTERA', '1.96', '00000003', 'NESTLE', '1000', '2', '1', NULL, NULL),
(543, 638, 'LECHE SVELTTY DESLACTOSADA', '1.97', '00000003', 'NESTLE', '1000', '2', '1', NULL, NULL),
(544, 637, 'LECHE SVELTTY DIGESTION', '1.97', '00000003', 'NESTLE', '1000', '2', '1', NULL, NULL),
(545, 636, 'TRES LECHE', '4.01', '00000003', 'NESTLE', '1000', '2', '1', NULL, NULL),
(546, 635, 'NIDO 3 ETAPA', '7.2', '00000003', 'NESTLE', '400', '2', '1', NULL, NULL),
(547, 634, 'NIDO 1 ETAPA TARRO', '7.5', '00000003', 'NESTLE', '400', '2', '1', NULL, NULL),
(548, 633, 'LA LECHERA SEMIDESCREMADA', '1.49', '00000003', 'NESTLE', '240', '2', '1', NULL, NULL),
(549, 632, 'LA LECHERA ENTERA', '1.31', '00000003', 'NESTLE', '240', '2', '1', NULL, NULL),
(550, 630, 'HUESITOS DURAZNO', '0.47321429', '00000003', 'NESTLE', '185', '2', '1', NULL, NULL),
(551, 629, 'HUESITOS MANZANA', '0.47321429', '00000003', 'NESTLE', '185', '2', '1', NULL, NULL),
(552, 628, 'HUESITOS UVA', '0.47321429', '00000003', 'NESTLE', '185', '2', '1', NULL, NULL),
(553, 622, 'LA VAQUITA 100GR', '0.96', '00000003', 'NESTLE', '100', '2', '1', NULL, NULL),
(554, 621, 'CREMA DE LECHE', '1.32', '00000003', 'NESTLE', '200', '2', '1', NULL, NULL),
(555, 620, 'NIDO 5 ETAPA', '7.2', '00000003', 'NESTLE', '400', '2', '1', NULL, NULL),
(556, 619, 'YOGU YOGU MORA', '0.71', '00000003', 'NESTLE', '200', '2', '1', NULL, NULL),
(557, 618, 'YOGU YOGU FRUTILLA', '0.8', '00000003', 'NESTLE', '200', '2', '1', NULL, NULL),
(558, 617, 'YOGU YOGU DURAZNO', '0.71', '00000003', 'NESTLE', '200', '2', '1', NULL, NULL),
(559, 616, 'NESQUIK VAINILLA', '0.67', '00000003', 'NESTLE', '200', '2', '1', NULL, NULL),
(560, 615, 'NESQUIK FRESA', '0.66', '00000003', 'NESTLE', '200', '2', '1', NULL, NULL),
(561, 614, 'NESQUIK CHOCOLATE', '0.66', '00000003', 'NESTLE', '200', '2', '1', NULL, NULL),
(562, 590, 'LECHE CONDESADA', '2.35', '00000003', 'NESTLE', '397', '2', '1', NULL, NULL),
(563, 589, 'LECHE CONDENSADA', '0.9375', '00000003', 'NESTLE', '100', '2', '1', NULL, NULL),
(564, 293, 'CERELAC 400GR', '5.23', '00000003', 'NESTLE', '400', '2', '1', NULL, NULL),
(565, 292, 'CERELAC 200GR', '2.63', '00000003', 'NESTLE', '200', '2', '1', NULL, NULL),
(566, 291, 'CHOCAPIC 30GR', '0.36', '00000003', 'NESTLE', '30', '2', '1', NULL, NULL),
(567, 259, 'TRIX CONFLE', '0.36', '00000003', 'NESTLE', '30', '2', '1', NULL, NULL),
(568, 258, 'NESTOGENO 2 CONFORTIS', '9.48', '00000003', 'NESTLE', '400', '2', '1', NULL, NULL),
(569, 257, 'NESTOGENO 1 CONFORTIS', '9.65', '00000003', 'NESTLE', '400', '2', '1', NULL, NULL),
(570, 3117, 'CHOCAPIP CEREAL 250G                                                                                      ', '2.4910714285714', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(571, 2324, 'NIDO CRECIMIENTO 1800G', '28.7', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(572, 2513, 'GALAK TUBITO 16G', '0.22321429', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(573, 2514, 'NAN 1 PRO FORMULA INFANTIL', '19.8', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(574, 2515, 'NESTLE BOMBONES SURTIDOS', '11.5', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(575, 2842, 'FITNEES FRUITS CEREAL 380G                                                                                ', '4.2410714285714', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(576, 2843, 'FITNESS CEREAL ORIGINAL 260G                                                                              ', '2.9375', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(577, 2844, 'LA LECHERA DESLACTOSADA 1L                                                                                ', '1.7589285714286', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(578, 3118, 'GALAK BOMBON 100G                                                                                         ', '2.0357142857143', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(579, 3119, 'NAN OPTIPRO 2 400G                                                                                        ', '19.59', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(580, 3120, 'NAN OPTIPRO CRECIM 3 800G                                                                                 ', '26.53', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(581, 3121, 'NATURA NARANJA 1L                                                                                         ', '1.9017857142857', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(582, 3122, 'NESTOGENO 0-12 M 135G', '2.89', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(583, 3123, 'PLATILLOS SURTIDOS 250G                                                                                   ', '4.4464285714286', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(584, 3124, 'TRIX 230G                                                                                                 ', '2.875', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(585, 3125, 'TRIX CEREAL 480G                                                                                          ', '5.0803571428571', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(586, 3377, 'GALLETAS COOKIES 40G                                                                                      ', '0.41071428571429', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(587, 3675, 'LA VAQUITA 1KG', '9.3', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(588, 3764, 'GALLETAS DAISY 100G                                                                                       ', '0.63392857142857', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(589, 3765, 'NESQUIK CEREAL 230G                                                                                       ', '3', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(590, 3766, 'NESQUIK CHOCOLATE 400G                                                                                    ', '3.2589285714286', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(591, 3767, 'CHOCOLATE NESTLE CLASSIC 100G                                                                             ', '1.4732142857143', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(592, 3768, 'NESTLE GALLETAS CHOCOLATE 340G                                                                            ', '1.6071428571429', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(593, 3769, 'GALLETA TACO CHOCOLATE 125G                                                                               ', '0.58035714285714', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(594, 3823, 'GALLETAS RICAS CAJA 268G', '1.69642857', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(595, 3824, 'GALLETAS RICAS DORE SAL 315G', '1.74107143', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(596, 3825, 'GALLETAS RICAS 67G                                                                                        ', '0.35714285714286', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(597, 4025, 'MILO ACTIVO LECHE CHOC 185ML                                                                              ', '0.625', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(598, 4163, 'GALLETAS DE AMOR MINI PEKES 40G                                                                           ', '0.35714285714286', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(599, 4164, 'GALLETAS DE AMOR MINI CHOCO 40G                                                                           ', '0.35714285714286', '00000003', 'NESTLE', '0', '2', '1', NULL, NULL),
(600, 677, 'LA SAZON 550GR', '2.9', '00000004', 'MAGGI', '550', '2', '1', NULL, NULL),
(601, 671, 'SOPA DE POLLO CON FIDEO', '0.67', '00000004', 'MAGGI', '60', '2', '1', NULL, NULL),
(602, 670, 'CALDO DE COSTILLA EN CUBO', '1.36', '00000004', 'MAGGI', '84', '2', '1', NULL, NULL),
(603, 669, 'MOSTAZA', '2.03', '00000004', 'MAGGI', '400', '2', '1', NULL, NULL),
(604, 668, 'MOZTASA', '0.9', '00000004', 'MAGGI', '200', '2', '1', NULL, NULL),
(605, 667, 'MOSTAZA', '10.29', '00000004', 'MAGGI', '4000', '2', '1', NULL, NULL),
(606, 666, 'LA SAZON 200GR', '1.15', '00000004', 'MAGGI', '200', '2', '1', NULL, NULL),
(607, 665, 'CALDO DE COSTILLA', '8.24', '00000004', 'MAGGI', '504', '2', '1', NULL, NULL),
(608, 664, 'MAYONESA', '5.08', '00000004', 'MAGGI', '900', '2', '1', NULL, NULL),
(609, 663, 'MAYONESA', '2.44', '00000004', 'MAGGI', '400', '2', '1', NULL, NULL),
(610, 660, 'LA SAZON 100GR', '0.64', '00000004', 'MAGGI', '100', '2', '1', NULL, NULL),
(611, 659, 'SALSA DE TOMATE 100GR', '0.57', '00000004', 'MAGGI', '1000', '2', '1', NULL, NULL),
(612, 658, 'SALSA DE TOMATE 30GR', '0.25', '00000004', 'MAGGI', '30', '2', '1', NULL, NULL),
(613, 657, 'SALSA DE TOMATE 550GR', '1.86', '00000004', 'MAGGI', '550', '2', '1', NULL, NULL),
(614, 656, 'SALSA DE TOMATE 200GR', '0.87', '00000004', 'MAGGI', '200', '2', '1', NULL, NULL),
(615, 650, 'LA SAZON', '16.94', '00000004', 'MAGGI', '4000', '2', '1', NULL, NULL),
(616, 646, 'MAYONESA', '1.24', '00000004', 'MAGGI', '240', '2', '1', NULL, NULL),
(617, 645, 'MOSTAZA', '0.56', '00000004', 'MAGGI', '100', '2', '1', NULL, NULL),
(618, 631, 'SOPA DE POLLO CON ARROZ', '0.67', '00000004', 'MAGGI', '60', '2', '1', NULL, NULL),
(619, 627, 'LA SAZON 1000GR', '5.03', '00000004', 'MAGGI', '1000', '2', '1', NULL, NULL),
(620, 626, 'CRIOLLITA SOBRE', '0.13392857', '00000004', 'MAGGI', '0', '2', '1', NULL, NULL),
(621, 625, 'CRIOLLITA', '1.03', '00000004', 'MAGGI', '60', '2', '1', NULL, NULL),
(622, 623, 'CREMA DE CHAMPIÑON', '1.06', '00000004', 'MAGGI', '70', '2', '1', NULL, NULL),
(623, 613, 'MAYONESA', '0.73', '00000004', 'MAGGI', '90', '2', '1', NULL, NULL),
(624, 612, 'LA SAZON 30GR', '0.25', '00000004', 'MAGGI', '30', '2', '1', NULL, NULL),
(625, 611, 'MOSTAZA 30G', '0.25', '00000004', 'MAGGI', '30', '2', '1', NULL, NULL),
(626, 610, 'MAYONESA 30G', '0.25', '00000004', 'MAGGI', '30', '2', '1', NULL, NULL),
(627, 3375, 'MAGGI CRIOLLITA 10 SOBRES                                                                                 ', '0.98214285714286', '00000004', 'MAGGI', '0', '2', '1', NULL, NULL),
(628, 3376, 'MAGGI SOPA DE POLLO LETRAS 60G                                                                            ', '0.60714285714286', '00000004', 'MAGGI', '0', '2', '1', NULL, NULL),
(629, 4062, 'MOSTAZA 240G                                                                                              ', '0.84821428571429', '00000004', 'MAGGI', '0', '2', '1', NULL, NULL),
(630, 4162, 'LA SAZON 240G                                                                                             ', '1.2053571428571', '00000004', 'MAGGI', '0', '2', '1', NULL, NULL),
(631, 247, 'COMPOTA PERA', '0.99', '00000005', 'GERBER', '113', '2', '1', NULL, NULL),
(632, 246, 'COMPOTA DURAZNO', '0.99', '00000005', 'GERBER', '113', '2', '1', NULL, NULL),
(633, 245, 'COMPOTA FRUTAS MIXTAS', '0.99', '00000005', 'GERBER', '113', '2', '1', NULL, NULL),
(634, 244, 'COMPOTA CIRUELA PASA', '0.99', '00000005', 'GERBER', '113', '2', '1', NULL, NULL),
(635, 243, 'COMPOTA PLATANO', '0.99', '00000005', 'GERBER', '113', '2', '1', NULL, NULL),
(636, 242, 'COMPOTA MANZANA', '0.99', '00000005', 'GERBER', '113', '2', '1', NULL, NULL),
(637, 675, 'NESCAFE', '0.84', '00000006', 'NESCAFE', '25', '2', '1', NULL, NULL),
(638, 624, 'NESCAFE', '0.23', '00000006', 'NESCAFE', '10', '2', '1', NULL, NULL),
(639, 1392, 'NESCAFE', '2.05', '00000006', 'NESCAFE', '50', '2', '1', NULL, NULL),
(640, 1393, 'NESCAFE', '4.15', '00000006', 'NESCAFE', '100', '2', '1', NULL, NULL),
(641, 1075, 'POLVO LAVA CLORO PLUS 500GR', '1.13', '00000007', 'LAVA', '500', '2', '1', NULL, NULL),
(642, 1074, 'POLVO LAVA DE LIMON 500GR', '1.13', '00000007', 'LAVA', '500', '2', '1', NULL, NULL),
(643, 1071, 'LAVA LIQUIDO VERDE LIMON 300ML', '1.03', '00000007', 'LAVA', '300', '2', '1', NULL, NULL),
(644, 1070, 'LAVA LIQUIDO BIBERONES', '2.59', '00000007', 'LAVA', '1000', '2', '1', NULL, NULL),
(645, 1069, 'LAVA LIQUIDO BIBERONES', '1.98', '00000007', 'LAVA', '600', '2', '1', NULL, NULL),
(646, 1068, 'LAVA LIQUIDO PEPINO SANDIA', '1.98', '00000007', 'LAVA', '600', '2', '1', NULL, NULL),
(647, 1064, 'LAVA AVENA 450GR', '1.43', '00000007', 'LAVA', '0', '2', '1', NULL, NULL),
(648, 1063, 'LAVA MANZANA 450G', '1.43', '00000007', 'LAVA', '450', '2', '1', NULL, NULL),
(649, 1062, 'LAVA LIMON 450GR', '1.43', '00000007', 'LAVA', '450', '2', '1', NULL, NULL),
(650, 1061, 'LAVA ROSADO 450GR', '1.43', '00000007', 'LAVA', '0', '2', '1', NULL, NULL),
(651, 1060, 'LAVA VERDE 450GR', '1.43', '00000007', 'LAVA', '450', '2', '1', NULL, NULL),
(652, 1059, 'LAVA AVENA 1000GR', '2.59', '00000007', 'LAVA', '1000', '2', '1', NULL, NULL),
(653, 1058, 'LAVA ANTIBACTERIAL 1000GR', '2.45631339', '00000007', 'LAVA', '1000', '2', '1', NULL, NULL),
(654, 1057, 'LAVA LIMON 1000GR', '2.59', '00000007', 'LAVA', '1000', '2', '1', NULL, NULL),
(655, 1056, 'LAVA AVENA', '1.43', '00000007', 'LAVA', '500', '2', '1', NULL, NULL),
(656, 1055, 'LAVA AVENA 250GR', '0.78', '00000007', 'LAVA', '250', '2', '1', NULL, NULL),
(657, 1054, 'LAVA MANDARINA 250GR', '0.78', '00000007', 'LAVA', '250', '2', '1', NULL, NULL),
(658, 1053, 'LAVA ANTIBACTERIAL 250GR', '0.78', '00000007', 'LAVA', '250', '2', '1', NULL, NULL),
(659, 1052, 'LAVA UVA 250GR', '0.78', '00000007', 'LAVA', '250', '2', '1', NULL, NULL),
(660, 1051, 'LAVA MANZANA 250GR', '0.78', '00000007', 'LAVA', '250', '2', '1', NULL, NULL),
(661, 1050, 'LAVA LIMON 250GR', '0.78', '00000007', 'LAVA', '250', '2', '1', NULL, NULL),
(662, 1049, 'LAVA ROSADO 1000GR', '2.59', '00000007', 'LAVA', '1000', '2', '1', NULL, NULL),
(663, 1048, 'LAVA VERDE 1000GR', '2.59', '00000007', 'LAVA', '1000', '2', '1', NULL, NULL),
(664, 1047, 'DISCO LAVA ROSADO', '0.22321429', '00000007', 'LAVA', '150', '2', '1', NULL, NULL),
(665, 96, 'LAVA EN BARRA ROSADO', '0.65', '00000007', 'LAVA', '300', '2', '1', NULL, NULL),
(666, 95, 'LAVA EN BARRA VERDE', '0.61607143', '00000007', 'LAVA', '300', '2', '1', NULL, NULL),
(667, 2539, 'LAVA ROSADO 250GR', '0.776785', '00000007', 'LAVA', '0', '2', '1', NULL, NULL),
(668, 2536, 'LAVA VERDE 250GR', '0.776785', '00000007', 'LAVA', '0', '2', '1', NULL, NULL),
(669, 2537, 'LAVA UVA 450GR', '1.41071429', '00000007', 'LAVA', '0', '2', '1', NULL, NULL),
(670, 2541, 'LAVA MANDARINA 1000GR', '2.57142857', '00000007', 'LAVA', '0', '2', '1', NULL, NULL),
(671, 2538, 'LAVA MANDARINA 450GR', '1.41071429', '00000007', 'LAVA', '0', '2', '1', NULL, NULL),
(672, 2540, 'LAVA ANTIBACTERIAL 450GR', '1.41071429', '00000007', 'LAVA', '0', '2', '1', NULL, NULL),
(673, 2542, 'LAVA UVA 1000GR', '2.58035714', '00000007', 'LAVA', '0', '2', '1', NULL, NULL),
(674, 2543, 'LAVA MANZANA 1000GR', '2.57142857', '00000007', 'LAVA', '0', '2', '1', NULL, NULL),
(675, 2774, 'LAVA LIQUIDO LIMON 600ML', '1.97321429', '00000007', 'LAVA', '0', '2', '1', NULL, NULL),
(676, 2773, 'LAVA LIQUIDO AVENA 600ML', '1.97321429', '00000007', 'LAVA', '0', '2', '1', NULL, NULL),
(677, 3970, 'LAVA VAJILLA VERDE DISCO 150G                                                                             ', '0.22321428571429', '00000007', 'LAVA', '0', '2', '1', NULL, NULL),
(678, 1090, 'DESINFECTANTE EL MACHO EUCALIPTO', '1.82', '00000008', 'EL MACHO', '950', '2', '1', NULL, NULL),
(679, 1089, 'DESINFECTANTE EL MACHO LAVANDA', '1.82', '00000008', 'EL MACHO', '950', '2', '1', NULL, NULL),
(680, 1088, 'DESINFECTANTE EL MACHO LIMON', '1.82', '00000008', 'EL MACHO', '950', '2', '1', NULL, NULL),
(681, 1087, 'DESINFECTANTE EL MACHO EUCALIPTO', '0.86', '00000008', 'EL MACHO', '500', '2', '1', NULL, NULL),
(682, 1086, 'DESINFECTANTE EL MACHO LAVANDA', '0.86', '00000008', 'EL MACHO', '500', '2', '1', NULL, NULL),
(683, 1085, 'DESINFECTANTE EL MACHO LIMON', '0.86', '00000008', 'EL MACHO', '500', '2', '1', NULL, NULL),
(684, 1080, 'DEJA EL MACHO LIMON 450GR', '0.86', '00000008', 'EL MACHO', '450', '2', '1', NULL, NULL),
(685, 1079, 'DEJA EL MACHO FLORAL 450GR', '0.86', '00000008', 'EL MACHO', '450', '2', '1', NULL, NULL),
(686, 1078, 'DEJA MACHO LIMON 180GR', '0.44', '00000008', 'EL MACHO', '180', '2', '1', NULL, NULL),
(687, 1077, 'DEJA EL MACHO FLORAL 900GR', '2.41', '00000008', 'EL MACHO', '900', '2', '1', NULL, NULL),
(688, 1076, 'DEJA MACHO FLORAL 180GR', '0.44', '00000008', 'EL MACHO', '180', '2', '1', NULL, NULL),
(689, 1066, 'CLORO EL MACHO SACHETON', '0.21', '00000008', 'EL MACHO', '250', '2', '1', NULL, NULL),
(690, 1065, 'CLORO EL MACHO SACHET', '0.13', '00000008', 'EL MACHO', '150', '2', '1', NULL, NULL),
(691, 94, 'JABON MACHO LIMON EN BARRA 480GR', '1', '00000008', 'EL MACHO', '480', '2', '1', NULL, NULL),
(692, 93, 'JABON MACHO LIMON EN BARRA 220GR', '0.48', '00000008', 'EL MACHO', '220', '2', '1', NULL, NULL),
(693, 85, 'JABON MACHO AZUL EN BARRA 220GR', '0.48', '00000008', 'EL MACHO', '220', '2', '1', NULL, NULL),
(694, 2544, 'JABON  EL MACHO BARRA AZUL 480GR', '0.99107143', '00000008', 'EL MACHO', '0', '2', '1', NULL, NULL),
(695, 2895, 'DETERGENTE EL MACHO 4000G                                                                                 ', '8.8214285714286', '00000008', 'EL MACHO', '0', '2', '1', NULL, NULL),
(696, 2896, 'DTERGENTE EL MACHO LIMON 900G                                                                             ', '2.1428571428571', '00000008', 'EL MACHO', '0', '2', '1', NULL, NULL),
(697, 1083, 'DEJA CIERTO FLORAL 360GR', '0.86', '00000009', 'CIERTO', '360', '2', '1', NULL, NULL),
(698, 1082, 'DEJA CIERTO BRISAS 1.9KG', '5.44', '00000009', 'CIERTO', '1900', '2', '1', NULL, NULL),
(699, 1081, 'DEJA CIERTO BRISAS 360GR', '0.86', '00000009', 'CIERTO', '0', '2', '1', NULL, NULL),
(700, 1073, 'SUAVIZANTE CIERTO CARICIAS', '1.08', '00000009', 'CIERTO', '500', '2', '1', NULL, NULL),
(701, 1072, 'DETERGENTE LIQUIDO CIERTO BEBE', '5.09', '00000009', 'CIERTO', '2000', '2', '1', NULL, NULL),
(702, 1067, 'DETERGENTE LIQUIDO CIERTO ULTRALAV 500ML', '1.51', '00000009', 'CIERTO', '500', '2', '1', NULL, NULL),
(703, 2546, 'DETERGENTE CIERTO  BRISAS FRE 950GR', '2.66964286', '00000009', 'CIERTO', '0', '2', '1', NULL, NULL),
(704, 2775, 'DETERGENTE CIERTO CREMOSO 500ML', '1.50892857', '00000009', 'CIERTO', '0', '2', '1', NULL, NULL),
(705, 2897, 'DETERGENTE CIERTO BEBE 500ML                                                                              ', '1.3392857142857', '00000009', 'CIERTO', '0', '2', '1', NULL, NULL),
(706, 2898, 'SUAVIZANTE CIERTO SOFTL 500ML', '0.98214286', '00000009', 'CIERTO', '0', '2', '1', NULL, NULL),
(707, 2899, 'SUAVIZANTE CIERTO SOFI PETALOS 500ML                                                                      ', '1.1', '00000009', 'CIERTO', '0', '2', '1', NULL, NULL),
(708, 1084, 'DEJA GOL 500GR', '0.86', '00000010', 'JAB. WILSON', '500', '2', '1', NULL, NULL),
(709, 98, 'EL ARRANCA GRASA 200GR', '0.44', '00000010', 'JAB. WILSON', '200', '2', '1', NULL, NULL),
(710, 142, 'CHOCOLATE MILKYWAY', '1.01', '00000011', 'MILKY WAY', '52.2', '2', '1', NULL, NULL),
(711, 143, 'CHOCOLATE SNIKERS', '1.01', '00000012', 'SNIKERS', '52.7', '2', '1', NULL, NULL),
(712, 848, 'PROFIT  MANZANA', '0.89', '00000013', 'PROFIT', '500', '2', '1', NULL, NULL),
(713, 847, 'PROFIT  MANZANA', '0.89', '00000013', 'PROFIT', '500', '2', '1', NULL, NULL),
(714, 1300, 'BOLIGRAFO NEGRO', '0.3', '00000014', 'BIC', '15', '2', '1', NULL, NULL),
(715, 1299, 'BOLIGRAFO  ROJO', '0.3', '00000014', 'BIC', '15', '2', '1', NULL, NULL),
(716, 1298, 'BOLIGRAFO AZUL', '0.3', '00000014', 'BIC', '15', '2', '1', NULL, NULL),
(717, 1297, 'BOLIGRAFO AZUL', '0.3', '00000014', 'BIC', '22', '2', '1', NULL, NULL),
(718, 508, 'BIC HOJA AMARILLA', '0.6', '00000014', 'BIC', '5', '2', '1', NULL, NULL),
(719, 181, 'AFEITADORA CONFORT 3', '0.69', '00000014', 'BIC', '200', '2', '1', NULL, NULL),
(720, 180, 'BIC CONFORT NORMAL', '0.88', '00000014', 'BIC', '36', '2', '1', NULL, NULL),
(721, 179, 'AFEITADORA BIC', '0.34', '00000014', 'BIC', '200', '2', '1', NULL, NULL),
(722, 178, 'BIC AMARILLA', '0.28', '00000014', 'BIC', '56', '2', '1', NULL, NULL),
(723, 177, 'FOSFORERA MINI BIC', '0.69', '00000014', 'BIC', '18', '2', '1', NULL, NULL),
(724, 2952, 'ENCENDEDOR MAXI BIC                                                                                       ', '0.94642857142857', '00000014', 'BIC', '0', '2', '1', NULL, NULL),
(725, 3719, 'CONFORT ROSADA                                                                                            ', '0.66964285714286', '00000014', 'BIC', '0', '2', '1', NULL, NULL),
(726, 3720, 'CONFORT 2MEN                                                                                              ', '2.4821428571429', '00000014', 'BIC', '0', '2', '1', NULL, NULL),
(727, 3721, 'CONFORT 2 WOMEN                                                                                           ', '2.4821428571429', '00000014', 'BIC', '0', '2', '1', NULL, NULL),
(728, 3722, 'CONFORT AZUL 3                                                                                            ', '2.0714285714286', '00000014', 'BIC', '0', '2', '1', NULL, NULL),
(729, 3723, 'CONFORT NEGRA 3                                                                                           ', '2.0714285714286', '00000014', 'BIC', '0', '2', '1', NULL, NULL),
(730, 3724, 'CONFORT FLEX 3                                                                                            ', '2.2321428571429', '00000014', 'BIC', '0', '2', '1', NULL, NULL),
(731, 3725, 'CONFORT 3 RASADA/LILA                                                                                     ', '2.1964285714286', '00000014', 'BIC', '0', '2', '1', NULL, NULL),
(732, 3812, 'AFEITADORA BIC ACQUA                                                                                      ', '0.75892857142857', '00000014', 'BIC', '0', '2', '1', NULL, NULL),
(733, 780, 'CEREAL FUNDA FRESA', '1.58', '00000015', 'MACDUGAL', '180', '2', '1', NULL, NULL),
(734, 779, 'CEREAL FUNDA LECHE COND', '1.58', '00000015', 'MACDUGAL', '180', '2', '1', NULL, NULL),
(735, 778, 'CEREAL FUNDA AZUCAR', '1.58', '00000015', 'MACDUGAL', '180', '2', '1', NULL, NULL),
(736, 777, 'PACK JUMBO CEREAL', '0.88392857', '00000015', 'MACDUGAL', '24', '2', '1', NULL, NULL),
(737, 776, 'MAGDOUGAL ARROZ FRESA 22G', '0.22321429', '00000015', 'MACDUGAL', '22', '2', '1', NULL, NULL),
(738, 2944, 'MACDOUGAL AZUCAR 22G                                                                                      ', '0.20535714285714', '00000015', 'MACDUGAL', '0', '2', '1', NULL, NULL),
(739, 2913, 'MACDOUGAL CF CHOCOLATE 180G', '1.57142857', '00000015', 'MACDUGAL', '0', '2', '1', NULL, NULL),
(740, 2914, 'MACDOUGAL CF PASAS 180G', '1.77678571', '00000015', 'MACDUGAL', '0', '2', '1', NULL, NULL),
(741, 2946, 'MACDOGUAL HOJUELAS CHOCO 22G                                                                              ', '0.20535714285714', '00000015', 'MACDUGAL', '0', '2', '1', NULL, NULL),
(742, 2945, 'MACDOUGAL ARROZ VAINILLA 22G                                                                              ', '0.20535714285714', '00000015', 'MACDUGAL', '0', '2', '1', NULL, NULL),
(743, 607, 'LONCHYS CAMARON', '0.71428571', '00000016', 'LONCHYS', '65', '2', '1', NULL, NULL),
(744, 606, 'LONCHYS CARNE', '0.71428571', '00000016', 'LONCHYS', '65', '2', '1', NULL, NULL),
(745, 605, 'LONCHYS POLLO', '0.71428571', '00000016', 'LONCHYS', '65', '2', '1', NULL, NULL),
(746, 1310, 'PACKS DE ALUMINIO C20', '0.77', '00000017', 'GOLDERY', '7', '2', '1', NULL, NULL),
(747, 1309, 'PACKS DE ALUMINIO C10', '0.56', '00000017', 'GOLDERY', '6', '2', '1', NULL, NULL),
(748, 1308, 'PAPEL FILM', '0.78', '00000017', 'GOLDERY', '30', '2', '1', NULL, NULL),
(749, 1307, 'LONCHERAS GOLDERY', '1.33', '00000017', 'GOLDERY', '25', '2', '1', NULL, NULL),
(750, 1306, 'PAVERA DE ALUMINIO RECTANGULAR', '1.26', '00000017', 'GOLDERY', '48', '2', '1', NULL, NULL),
(751, 1305, 'PAVERA DE ALUMINIO OVALADA', '1.1', '00000017', 'GOLDERY', '48', '2', '1', NULL, NULL),
(752, 1304, 'PAPEL ALUMINIO GOLDERY', '0.86', '00000017', 'GOLDERY', '1000', '2', '1', NULL, NULL),
(753, 609, 'CUCHILLO OXFORD', '0.6', '00000018', 'OXFORD', '50', '2', '1', NULL, NULL),
(754, 608, 'CUCHARA TENEDOR OXFORD', '0.57', '00000018', 'OXFORD', '50', '2', '1', NULL, NULL),
(755, 604, 'TENEDOR OXFORD', '0.58', '00000018', 'OXFORD', '50', '2', '1', NULL, NULL),
(756, 1389, 'CUCHARA GRANDE OXFORD', '0.57142857', '00000018', 'OXFORD', '50', '2', '1', NULL, NULL),
(757, 3381, 'CUCHARA TENEDOR                                                                                           ', '0.5', '00000018', 'OXFORD', '0', '2', '1', NULL, NULL),
(758, 3613, 'TENEDRO BLANCO OXFORD                                                                                     ', '0.49107142857143', '00000018', 'OXFORD', '0', '2', '1', NULL, NULL),
(759, 3614, 'CUCHILLO BLANCO OXFORD                                                                                    ', '0.50892857142857', '00000018', 'OXFORD', '0', '2', '1', NULL, NULL),
(760, 4211, 'PICA PAPAS PLANO X500                                                                                     ', '1.1517857142857', '00000018', 'OXFORD', '0', '2', '1', NULL, NULL),
(761, 1303, 'FUNDA DE BASURA FLORAL*20', '0.46', '00000019', 'PARAISO', '20', '2', '1', NULL, NULL),
(762, 1302, 'ROLLO DE FUNDAS 10*15', '2.06', '00000019', 'PARAISO', '100', '2', '1', NULL, NULL),
(763, 1044, 'ROLLO DE FUNDAS', '2.06', '00000019', 'PARAISO', '100', '2', '1', NULL, NULL),
(764, 290, 'FUNDA DE BASURA CHAMPION', '1.18', '00000019', 'PARAISO', '14', '2', '1', NULL, NULL),
(765, 1386, 'FUNDA DE BASURA PLASTIPOLI', '0.42', '00000020', 'HG', '20', '2', '1', NULL, NULL),
(766, 1387, 'FUNDAS JUMBO TRICOLOR', '2.17', '00000020', 'HG', '100', '2', '1', NULL, NULL),
(767, 4, 'FUNDA DE BASURA LA BURRITA', '2.47', '00000021', 'LA BURRITA', '10', '2', '1', NULL, NULL),
(768, 5, 'CINTA OPAL 80 YARDAS', '0.61', '00000022', 'KM TAPE', '80', '2', '1', NULL, NULL),
(769, 200, 'CINTA TRANSPARENTE 80 YARDAS', '0.61', '00000023', 'SEYER', '80', '2', '1', NULL, NULL),
(770, 1222, 'CINTA TRANSPARENTE 40 YARDAS', '0.44', '00000024', 'FANTAPE', '40', '2', '1', NULL, NULL),
(771, 1313, 'CINTA TRANSPARENTE ABRO 40 YARDAS', '0.44', '00000025', 'ABRO', '40', '2', '1', NULL, NULL),
(772, 1269, 'FUNDAS POLIFAN 9*14', '1.93', '00000026', 'INREPLAST', '100', '2', '1', NULL, NULL),
(773, 1268, 'FUNDAS POLIFAN 7*11', '1.16', '00000026', 'INREPLAST', '100', '2', '1', NULL, NULL),
(774, 1267, 'FUNDAS POLIFAN 5*8', '0.64', '00000026', 'INREPLAST', '100', '2', '1', NULL, NULL),
(775, 2591, 'FUNDAS POLIFAN 6X10', '0.9176', '00000026', 'INREPLAST', '0', '2', '1', NULL, NULL),
(776, 35, 'FUNDA GD JUMBO ROJA', '2.34', '00000027', 'GD PLAST', '100', '2', '1', NULL, NULL),
(777, 34, 'FUNDA GD JUMBO NARANJA', '2.34', '00000027', 'GD PLAST', '100', '2', '1', NULL, NULL),
(778, 33, 'FUNDA P7 DE COLOR', '1.32', '00000027', 'GD PLAST', '100', '2', '1', NULL, NULL),
(779, 32, 'FUNDA P5 DE COLOR', '1.08', '00000027', 'GD PLAST', '100', '2', '1', NULL, NULL),
(780, 31, 'FUNDA P2 DE COLOR', '0.58', '00000027', 'GD PLAST', '100', '2', '1', NULL, NULL),
(781, 14, 'FUNDAS JUMBO AZUL', '2.34', '00000027', 'GD PLAST', '100', '2', '1', NULL, NULL),
(782, 13, 'FUNDAS NATURAL 10*16', '1.04', '00000027', 'GD PLAST', '100', '2', '1', NULL, NULL),
(783, 12, 'FUNDAS NATURAL 7*15', '0.68', '00000027', 'GD PLAST', '100', '2', '1', NULL, NULL),
(784, 11, 'FUNDAS NATURAL 7*11', '0.51', '00000027', 'GD PLAST', '100', '2', '1', NULL, NULL),
(785, 10, 'FUNDAS NATURAL 6*10', '0.38', '00000027', 'GD PLAST', '100', '2', '1', NULL, NULL),
(786, 9, 'FUNDAS JUMBO AMARILLA', '2.34', '00000027', 'GD PLAST', '100', '2', '1', NULL, NULL),
(787, 8, 'FUNDAS NATURAL 5*8', '0.27', '00000027', 'GD PLAST', '100', '2', '1', NULL, NULL),
(788, 7, 'FUNDAS NATURAL 4*8', '0.21', '00000027', 'GD PLAST', '100', '2', '1', NULL, NULL),
(789, 6, 'BANDEJA P2', '5.59', '00000027', 'GD PLAST', '125', '2', '1', NULL, NULL),
(790, 1213, 'PALILLOS DE DIENTE BAMBU', '0.3', '00000028', 'CARICIA', '100', '2', '1', NULL, NULL),
(791, 1212, 'PALO CUADRADADO DE HELADOS', '0.86', '00000028', 'CARICIA', '150', '2', '1', NULL, NULL),
(792, 1211, 'PALO REDONDO DE HELADOS', '0.86', '00000028', 'CARICIA', '210', '2', '1', NULL, NULL),
(793, 1210, 'PALETA DE HELADO', '0.32', '00000028', 'CARICIA', '80', '2', '1', NULL, NULL),
(794, 1209, 'PALOS PARA PINCHO', '1.16', '00000029', 'FESTIVAL', '100', '2', '1', NULL, NULL),
(795, 2242, 'FESTIVAL CREMITAS 19GR', '0.44642857', '00000029', 'FESTIVAL', '19', '2', '1', NULL, NULL),
(796, 2784, 'FESTIVAL RECREO                                                                                           ', '1.72', '00000029', 'FESTIVAL', '0', '2', '1', NULL, NULL),
(797, 1186, 'SORBETE PAYASO', '0.3', '00000030', 'EMPACK', '100', '2', '1', NULL, NULL),
(798, 1390, 'PAPEL HIGIENICO INSTITUCIONAL', '1.31', '00000031', 'RENOVAPAPER', '180', '2', '1', NULL, NULL),
(799, 1335, 'TOALLA DE MANO DANNY', '1.59', '00000032', 'DANNY', '150', '2', '1', NULL, NULL),
(800, 1334, 'SERVILLETAS DOLLY', '0.23', '00000033', 'DOLLY', '75', '2', '1', NULL, NULL),
(801, 1293, 'NAIPES TUN HUANG', '0.39', '00000034', 'TUN HUANG', '32', '2', '1', NULL, NULL),
(802, 837, 'TARRINAS DE 500CC', '0.77', '00000035', 'PLASTI UTIL', '25', '2', '1', NULL, NULL),
(803, 836, 'PLATOS DESECHABLE COMPARTIDOS #10 1/4', '1.07', '00000035', 'PLASTI UTIL', '25', '2', '1', NULL, NULL),
(804, 835, 'PLATOS DESECHABLE #10 1/4', '1.08', '00000035', 'PLASTI UTIL', '25', '2', '1', NULL, NULL),
(805, 834, 'PLATOS DESECHABLE #6', '0.35714286', '00000035', 'PLASTI UTIL', '25', '2', '1', NULL, NULL),
(806, 833, 'PLATOS DESECHABLE #7', '0.48', '00000035', 'PLASTI UTIL', '25', '2', '1', NULL, NULL),
(807, 832, 'PLATOS DESECHABLE #8', '0.68', '00000035', 'PLASTI UTIL', '25', '2', '1', NULL, NULL),
(808, 831, 'PLATOS DESECHABLE #9', '0.72', '00000035', 'PLASTI UTIL', '25', '2', '1', NULL, NULL),
(809, 830, 'TARRINAS DE 650CC', '0.97', '00000035', 'PLASTI UTIL', '25', '2', '1', NULL, NULL),
(810, 829, 'VIANDAS AMARILLAS', '1.58', '00000035', 'PLASTI UTIL', '25', '2', '1', NULL, NULL),
(811, 828, 'CONTENEDOR 5*5', '0.99', '00000035', 'PLASTI UTIL', '25', '2', '1', NULL, NULL),
(812, 827, 'CHAROL REDONDO', '1.77', '00000035', 'PLASTI UTIL', '10', '2', '1', NULL, NULL),
(813, 826, 'CHAROL RECTANGULAR', '1.95', '00000035', 'PLASTI UTIL', '10', '2', '1', NULL, NULL),
(814, 825, 'PATOS DESECHABLE COMPARTIDOS #9', '0.99', '00000035', 'PLASTI UTIL', '25', '2', '1', NULL, NULL),
(815, 824, 'CONTENEDOR 8*8,55', '2.03', '00000035', 'PLASTI UTIL', '25', '2', '1', NULL, NULL),
(816, 823, 'CONTENEDOR 8*8,55 COMPARTIDOS', '2.03', '00000035', 'PLASTI UTIL', '25', '2', '1', NULL, NULL),
(817, 3922, 'FUNDA DE BASU LA CAPI 23X28                                                                               ', '3.75', '00000035', 'PLASTI UTIL', '0', '2', '1', NULL, NULL),
(818, 3921, 'FUNDA LA CAPI 30X36                                                                                       ', '7.2678571428571', '00000035', 'PLASTI UTIL', '0', '2', '1', NULL, NULL),
(819, 3056, 'COPA PARA VNO DE CRISTAL', '1.45535714', '00000035', 'PLASTI UTIL', '0', '2', '1', NULL, NULL),
(820, 3057, 'COPA PARA CHAMPANG DE CRISTAL                                                                             ', '1.3214285714286', '00000035', 'PLASTI UTIL', '0', '2', '1', NULL, NULL),
(821, 3134, 'PLATOS OVALADOS LLANOS MED                                                                                ', '0.89285714285714', '00000035', 'PLASTI UTIL', '0', '2', '1', NULL, NULL),
(822, 3135, 'PLATOS OVALADOS COMPAR MED                                                                                ', '1.1875', '00000035', 'PLASTI UTIL', '0', '2', '1', NULL, NULL),
(823, 3296, 'PLATO ROSADO #9                                                                                           ', '0.98214285714286', '00000035', 'PLASTI UTIL', '0', '2', '1', NULL, NULL),
(824, 3611, 'VASO 40CC PE', '1', '00000035', 'PLASTI UTIL', '0', '2', '1', NULL, NULL),
(825, 3612, 'TAPA VASO 40CC PE', '0.660714', '00000035', 'PLASTI UTIL', '0', '2', '1', NULL, NULL),
(826, 3615, 'FUNDA DE BASURA SUPER BAG 29X35', '1.7428', '00000035', 'PLASTI UTIL', '0', '2', '1', NULL, NULL),
(827, 3616, 'FUNDA LA CAPIRA 30X36', '2.10714286', '00000035', 'PLASTI UTIL', '0', '2', '1', NULL, NULL),
(828, 3923, 'FUNDA CAMISETA ROJA                                                                                       ', '0.44642857142857', '00000035', 'PLASTI UTIL', '0', '2', '1', NULL, NULL),
(829, 3924, 'FUNDA CAMISETA VERDE                                                                                      ', '0.44642857142857', '00000035', 'PLASTI UTIL', '0', '2', '1', NULL, NULL),
(830, 3925, 'FUNDA RECORTADA 5X10', '1.6875', '00000035', 'PLASTI UTIL', '0', '2', '1', NULL, NULL),
(831, 239, 'FUNDA DE BASURA POKER 23*28', '0.36', '00000036', 'POKER', '10', '2', '1', NULL, NULL),
(832, 1388, 'FUNDA DE BASURA POKER 30*36', '0.67', '00000036', 'POKER', '10', '2', '1', NULL, NULL),
(833, 1287, 'VASOS DE 2 OZ', '0.51785714', '00000037', 'VACAN', '50', '2', '1', NULL, NULL),
(834, 1286, 'TARRINAS DE 1L PLOMA', '1.35', '00000037', 'VACAN', '50', '2', '1', NULL, NULL),
(835, 1285, 'VASOS COLEROS 5 OZ', '0.37', '00000037', 'VACAN', '50', '2', '1', NULL, NULL),
(836, 1284, 'VASOS 14 OZ', '1.45535714', '00000037', 'VACAN', '50', '2', '1', NULL, NULL),
(837, 1283, 'VASOS DE 1 OZ', '0.43', '00000037', 'VACAN', '50', '2', '1', NULL, NULL),
(838, 1282, 'VASOS 10 OZ', '0.60714286', '00000037', 'VACAN', '50', '2', '1', NULL, NULL),
(839, 601, 'VASOS 7 OZ', '0.33035714', '00000037', 'VACAN', '50', '2', '1', NULL, NULL),
(840, 22, 'TARRINAS 1/2 PLOMA', '1.45', '00000037', 'VACAN', '50', '2', '1', NULL, NULL),
(841, 21, 'TARRINA TRANSPARENTE CUADRADA CON TAPA 4*4', '0.15', '00000037', 'VACAN', '50', '2', '1', NULL, NULL),
(842, 19, 'TARRINA DE 1L AMARILLA', '2.69', '00000037', 'VACAN', '50', '2', '1', NULL, NULL),
(843, 18, 'TAPAS TRANSPARENTE', '0.95', '00000037', 'VACAN', '50', '2', '1', NULL, NULL),
(844, 17, 'VASOS BLANCO 3,5 OZ', '0.66', '00000037', 'VACAN', '50', '2', '1', NULL, NULL),
(845, 16, 'VASOS OPAL 3,5 OZ', '0.580357', '00000037', 'VACAN', '50', '2', '1', NULL, NULL);
INSERT INTO `productos` (`id`, `id_foraneo`, `NAME`, `PRICE`, `IDBRAND`, `MARCA`, `PESOITEM`, `stock`, `estado_del`, `created_at`, `updated_at`) VALUES
(846, 15, 'TARRINA SHO BOWL TAPA DOMO', '0.08', '00000037', 'VACAN', '50', '2', '1', NULL, NULL),
(847, 1312, 'ATUN MANABI GIRASOL 160G', '1.22', '00000039', 'INEN', '160', '2', '1', NULL, NULL),
(848, 1208, 'AZUCAR LA TRONCAL 250G', '0.24', '00000039', 'INEN', '250', '2', '1', NULL, NULL),
(849, 1207, 'AZUCAR LA TRONCAL 5K', '4.58', '00000039', 'INEN', '5', '2', '1', NULL, NULL),
(850, 1206, 'AZUCAR LA TRONCAL 500', '0.46', '00000039', 'INEN', '500', '2', '1', NULL, NULL),
(851, 1205, 'AZUCAR LA TRONCAL 1K', '0.92', '00000039', 'INEN', '1', '2', '1', NULL, NULL),
(852, 1204, 'AZUCAR LA TRONCAL MORE 1K', '0.92', '00000039', 'INEN', '1', '2', '1', NULL, NULL),
(853, 1203, 'AZUCAR LA TRONCAL 2', '1.74', '00000039', 'INEN', '1', '2', '1', NULL, NULL),
(854, 1039, 'VITA LECHE SEMIDESC 1', '1.3', '00000039', 'INEN', '1', '2', '1', NULL, NULL),
(855, 1038, 'VITALECHE ENTERA 1', '1.23', '00000039', 'INEN', '1', '2', '1', NULL, NULL),
(856, 1037, 'VITA  LECHE AVENA  CANELA 200', '0.48', '00000039', 'INEN', '200', '2', '1', NULL, NULL),
(857, 1036, 'VITA LECHE ENTERA FUNDA1', '1.15', '00000039', 'INEN', '1', '2', '1', NULL, NULL),
(858, 1035, 'VITA LECHE FRUTILLA 200', '0.45', '00000039', 'INEN', '200', '2', '1', NULL, NULL),
(859, 1034, 'VITA LECHE VAINILLA 200', '0.45', '00000039', 'INEN', '200', '2', '1', NULL, NULL),
(860, 1033, 'VITA LECHE CHOCO 200', '0.45', '00000039', 'INEN', '200', '2', '1', NULL, NULL),
(861, 599, 'MAR Y SAL 2K', '0.68', '00000039', 'INEN', '2', '2', '1', NULL, NULL),
(862, 598, 'MAR Y SAL 1K', '0.42', '00000039', 'INEN', '1', '2', '1', NULL, NULL),
(863, 597, 'MAR Y SAL 500 G', '0.24', '00000039', 'INEN', '500', '2', '1', NULL, NULL),
(864, 147, 'FACUNDO MAIZ DULCE 425G', '1.64', '00000039', 'INEN', '425', '2', '1', NULL, NULL),
(865, 2593, 'VITA LECHE SEMIDESCREMADA 500ML', '0.55', '00000039', 'INEN', '0', '2', '1', NULL, NULL),
(866, 1295, 'ELITE PREMIUN ROLLO', '0.67', '00000040', 'ELITE', '38', '2', '1', NULL, NULL),
(867, 1294, 'PAPEL HIGIENICO ELITE MANZ', '0.8', '00000040', 'ELITE', '1', '2', '1', NULL, NULL),
(868, 593, 'TOALLAS ELITE MAXWIPE', '2.27', '00000040', 'ELITE', '1', '2', '1', NULL, NULL),
(869, 3000, 'SERVILLETAS ELITE NOVA EXTRA X75', '0.26785714', '00000040', 'ELITE', '0', '2', '1', NULL, NULL),
(870, 3593, 'PH ELITE EXTRA GRANDE X4                                                                                  ', '2.0803571428571', '00000040', 'ELITE', '0', '2', '1', NULL, NULL),
(871, 3594, 'PH ELITE GRANDE X4                                                                                        ', '1.4285714285714', '00000040', 'ELITE', '0', '2', '1', NULL, NULL),
(872, 3807, 'PH ELITE MEGAROLLO X4                                                                                     ', '2.2321428571429', '00000040', 'ELITE', '0', '2', '1', NULL, NULL),
(873, 3809, 'SERVILLETAS COCTEL X100                                                                                   ', '0.44642857142857', '00000040', 'ELITE', '0', '2', '1', NULL, NULL),
(874, 3810, 'SERVILLETAS COCTEL X200                                                                                   ', '0.83928571428571', '00000040', 'ELITE', '0', '2', '1', NULL, NULL),
(875, 3811, 'SERVILLETAS COCTEL X300                                                                                   ', '1.1160714285714', '00000040', 'ELITE', '0', '2', '1', NULL, NULL),
(876, 4207, 'TOALLAS ELITE DECO MAXIROLLO X2                                                                           ', '3.25', '00000040', 'ELITE', '0', '2', '1', NULL, NULL),
(877, 794, 'SPAGUETTI AMANCAY 400G', '0.73', '00000041', 'SUPERIOR', '400', '2', '1', NULL, NULL),
(878, 793, 'SPAGUETTI AMANCAY 200G', '0.45', '00000041', 'SUPERIOR', '200', '2', '1', NULL, NULL),
(879, 792, 'FIDEO AMANCAY LASO 100G', '0.22', '00000041', 'SUPERIOR', '100', '2', '1', NULL, NULL),
(880, 791, 'GALLETAS ANIVENTURAS 380G', '1.57', '00000041', 'SUPERIOR', '380', '2', '1', NULL, NULL),
(881, 790, 'GALLETAS CIRCUS MARACUYA', '0.97', '00000041', 'SUPERIOR', '336', '2', '1', NULL, NULL),
(882, 789, 'GALLETAS CIRCUS CHICLE', '0.99', '00000041', 'SUPERIOR', '336', '2', '1', NULL, NULL),
(883, 788, 'GALLETAS CIRCUS CHOCOLATE', '0.97', '00000041', 'SUPERIOR', '336', '2', '1', NULL, NULL),
(884, 787, 'GALLETAS CIRCUS FRESA', '0.97', '00000041', 'SUPERIOR', '336', '2', '1', NULL, NULL),
(885, 786, 'GALLETAS KRISPIZ', '1.65', '00000041', 'SUPERIOR', '228', '2', '1', NULL, NULL),
(886, 785, 'GALLETAS SALTICAS', '0.26785714', '00000041', 'SUPERIOR', '70', '2', '1', NULL, NULL),
(887, 1376, 'GALLETAS MIAS ORIGINAL 108G', '0.46428571', '00000041', 'SUPERIOR', '108', '2', '1', NULL, NULL),
(888, 1377, 'GALLETAS MIAS ORIGINAL 190G', '0.71', '00000041', 'SUPERIOR', '190', '2', '1', NULL, NULL),
(889, 1378, 'GALLETAS MIAS CHOCOLATE 108G', '0.48', '00000041', 'SUPERIOR', '108', '2', '1', NULL, NULL),
(890, 1379, 'GALLETAS MIAS CHOCOLATE 190G', '0.64', '00000041', 'SUPERIOR', '190', '2', '1', NULL, NULL),
(891, 1380, 'GALLETAS MIAS FRESA 108G', '0.48', '00000041', 'SUPERIOR', '108', '2', '1', NULL, NULL),
(892, 1381, 'GALLETAS MIAS VAINILLA 67G', '0.36', '00000041', 'SUPERIOR', '67', '2', '1', NULL, NULL),
(893, 1382, 'GALLETAS MIAS VAINILLA 190G', '0.64', '00000041', 'SUPERIOR', '190', '2', '1', NULL, NULL),
(894, 2758, 'GALLETAS KRISPIZ 38G', '0.22321429', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(895, 2759, 'ORBITA 500G', '3.5625', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(896, 2760, 'ORBITA 300G', '2.05357143', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(897, 2761, 'GALLETA CIRCUS CHOCOLATE X8', '0.66964286', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(898, 2762, 'GALLETA CIRCUS VAINILLA X8', '0.66964286', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(899, 2764, 'GALLETA CIRCUS FRESA X8', '0.66964286', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(900, 2765, 'GALLETAS CIRCUS VAINILLA', '0.96428571', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(901, 2766, 'AMANCAY TORNILLO 100GR', '0.23', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(902, 2767, 'AMANCAY MACARRON 100G', '0.23', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(903, 2770, 'AMANCAY CABE FINO 400G', '0.69', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(904, 2768, 'AMANCAY PLUMA CHICA 100G', '0.23', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(905, 2769, 'AMANCAY CABE FINO 100G', '0.23', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(906, 2771, 'GALLETA APETITAS VAINI 140G', '0.44642857', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(907, 3218, 'CIRCUS ALGON DE AZUCAR X8', '0.66964286', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(908, 3219, 'CIRCUS MARACUYA X8                                                                                        ', '0.66964285714286', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(909, 3220, 'CIRCUS CHICLE X8                                                                                          ', '0.66964285714286', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(910, 3221, 'CARAMELOS SURTIDOS FRUTAS                                                                                 ', '1.5982142857143', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(911, 3222, 'TOFFEE KREM MILK                                                                                          ', '1.5982142857143', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(912, 3223, 'TOFFE SURTIDOS                                                                                            ', '1.5982142857143', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(913, 3682, 'GALLETAS TUYAS COCO                                                                                       ', '1.2053571428571', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(914, 3683, 'GALLETAS TUYAS LECHE                                                                                      ', '1.2053571428571', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(915, 3684, 'GALLETAS TUYAS VAINILLA                                                                                   ', '1.2053571428571', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(916, 3867, 'GALLETAS MIAS CHOCOLATE 67G                                                                               ', '0.40178571428571', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(917, 3868, 'GALLETAS MIAS FRESA 190G', '0.66964286', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(918, 3869, 'GALLETAS MIAS 67G                                                                                         ', '0.40178571428571', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(919, 3870, 'GALLETAS MIAS ORIGINAL 67G                                                                                ', '0.40178571428571', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(920, 3871, 'GALLETAS MIAS VAINILLA 108G                                                                               ', '0.625', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(921, 3872, 'GALLETAS APETITAS CHOCO 40G                                                                               ', '0.22321428571429', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(922, 3873, 'GALLETAS APETITAS ANIS 40G                                                                                ', '0.22321428571429', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(923, 3874, 'CARAMELO KREN MILK                                                                                        ', '2.0982142857143', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(924, 4030, 'SALTICAS MINI ORIGINAL 35G                                                                                ', '0.22321428571429', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(925, 4031, 'SALTICAS CREMA Y CEBOLLA 35G                                                                              ', '0.22321428571429', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(926, 4032, 'SALTICAS TOCINO 35G                                                                                       ', '0.22321428571429', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(927, 4033, 'SILUET FRUTOS ROJOS                                                                                       ', '1.6517857142857', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(928, 4034, 'SILUET AJONJOLI                                                                                           ', '1.6517857142857', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(929, 4035, 'SILUET MANZANA                                                                                            ', '1.6517857142857', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(930, 4036, 'SILUET CHIA                                                                                               ', '1.6517857142857', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(931, 4037, 'SILUET LINAZA                                                                                             ', '1.6517857142857', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(932, 4038, 'SILUET MIEL                                                                                               ', '1.6517857142857', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(933, 4282, 'GALLETAS MIAS LIMON 190G', '0.71428571', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(934, 4283, 'GALLETAS MIAS NARANJA 67G                                                                                 ', '0.35714285714286', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(935, 4284, 'GALLETAS MIAS NARANJA 190G                                                                                ', '0.71428571428571', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(936, 4285, 'GALLETAS MIAS FRESA 67G                                                                                   ', '0.35714285714286', '00000041', 'SUPERIOR', '0', '2', '1', NULL, NULL),
(937, 1330, 'VIVE 100 BOROJO', '0.89285714', '00000042', 'VIVE', '365', '2', '1', NULL, NULL),
(938, 1329, 'VIVE 100 ORIGINAL', '0.92', '00000042', 'VIVE', '365', '2', '1', NULL, NULL),
(939, 1326, 'VIVE 100 MANZANA', '0.89285714', '00000042', 'VIVE', '365', '2', '1', NULL, NULL),
(940, 805, 'DESINF ESTREL EUC 450G', '1.25', '00000043', 'DIMABRU', '450', '2', '1', NULL, NULL),
(941, 804, 'DESINF ESTREL FLOR 450G', '1.29', '00000043', 'DIMABRU', '450', '2', '1', NULL, NULL),
(942, 803, 'PAÑO ESTRELLA PEQUE', '5.09', '00000043', 'DIMABRU', '1', '2', '1', NULL, NULL),
(943, 802, 'PAÑO ESTRELLA GRANDE', '3.65', '00000043', 'DIMABRU', '1', '2', '1', NULL, NULL),
(944, 800, 'CEPILLO SANITARIO ESTRELLA', '1.06', '00000043', 'DIMABRU', '12', '2', '1', NULL, NULL),
(945, 795, 'ESPONGA ESTR TEJI COLORES', '1.17', '00000043', 'DIMABRU', '1', '2', '1', NULL, NULL),
(946, 355, 'CEPILLO COLGATE TRIPLE ACCION', '2.53', '00000044', 'COLGATE', '2', '2', '1', NULL, NULL),
(947, 328, 'PASTA COLGATE 60G', '0.77678571', '00000044', 'COLGATE', '60', '2', '1', NULL, NULL),
(948, 289, 'CEPILLO COLGATE SLIM SOFT', '5.26785714', '00000044', 'COLGATE', '2', '2', '1', NULL, NULL),
(949, 271, 'COLGATE TRIPLE ACCION JUMBO', '2.41071429', '00000044', 'COLGATE', '150', '2', '1', NULL, NULL),
(950, 270, 'GOLGATE SMILES BARBIE BOG SPONGE 2-5', '2.21', '00000044', 'COLGATE', '75', '2', '1', NULL, NULL),
(951, 268, 'CEPILLO COLGATE LUMINOUS WHITE 360', '5.34821429', '00000044', 'COLGATE', '2', '2', '1', NULL, NULL),
(952, 267, 'COLGATE LUMINOUS WHITE', '4.92', '00000044', 'COLGATE', '125', '2', '1', NULL, NULL),
(953, 266, 'CEPILLO COLGATE EXTRA CLEAN', '2.05', '00000044', 'COLGATE', '2', '2', '1', NULL, NULL),
(954, 265, 'CEPILLO DENTAL COLGATE', '0.58035714', '00000044', 'COLGATE', '250', '2', '1', NULL, NULL),
(955, 264, 'COLGATE SMILES BARBIE 6+', '2.21', '00000044', 'COLGATE', '75', '2', '1', NULL, NULL),
(956, 263, 'COLGATE TRIPLE ACCION 75', '1.160535', '00000044', 'COLGATE', '75', '2', '1', NULL, NULL),
(957, 187, 'COLGATE TOTAL CLEANMINT', '2.97', '00000044', 'COLGATE', '75', '2', '1', NULL, NULL),
(958, 1504, 'ENJUAGUE BOCAL ICE 250 ML', '2.91', '00000044', 'COLGATE', '250', '2', '1', NULL, NULL),
(959, 1505, 'ENJUAGUE BOCAL KIDS 250 ML', '2.91', '00000044', 'COLGATE', '250', '2', '1', NULL, NULL),
(960, 1506, 'ENJUAGUE BOCAL SOFT MINT 250 ML', '2.91', '00000044', 'COLGATE', '250', '2', '1', NULL, NULL),
(961, 1540, 'HILO DENTAL COLGATE TOTAL', '2.71', '00000044', 'COLGATE', '25', '2', '1', NULL, NULL),
(962, 1541, 'HILO DENTAL COLGATE TOTAL MENTA', '2.71', '00000044', 'COLGATE', '25', '2', '1', NULL, NULL),
(963, 2357, 'COLGATE EXTRA BLANCURA', '0.9375', '00000044', 'COLGATE', '0', '2', '1', NULL, NULL),
(964, 2359, 'COLGATE TRIPLE ACCION PEQU', '0.44642857', '00000044', 'COLGATE', '0', '2', '1', NULL, NULL),
(965, 3050, 'COLGATE BLANCA  75ML                                                                                      ', '0.84821428571429', '00000044', 'COLGATE', '0', '2', '1', NULL, NULL),
(966, 3917, 'CEPILLO RABBIT NIÑOS                                                                                      ', '0.66071428571429', '00000044', 'COLGATE', '0', '2', '1', NULL, NULL),
(967, 3726, 'COLGATE SMILES MINIONS 75ML                                                                               ', '1.9464285714286', '00000044', 'COLGATE', '0', '2', '1', NULL, NULL),
(968, 3727, 'COLGATE LUMINUS WHITE 75ML                                                                                ', '2.6071428571429', '00000044', 'COLGATE', '0', '2', '1', NULL, NULL),
(969, 1373, 'ARROZ LIRA 2K', '2.25', '00000045', 'ARROCESA', '1', '2', '1', NULL, NULL),
(970, 1374, 'ARROZ LIRA 1K', '1.24', '00000045', 'ARROCESA', '1', '2', '1', NULL, NULL),
(971, 1375, 'ARROZ LIRA 1L', '0.53', '00000045', 'ARROCESA', '1', '2', '1', NULL, NULL),
(972, 870, 'DELI GOMIS CITRIC', '0.21', '00000046', 'NEYPLEX', '21', '2', '1', NULL, NULL),
(973, 869, 'DELI GOMIS GUSANITOS 21G', '0.21', '00000046', 'NEYPLEX', '21', '2', '1', NULL, NULL),
(974, 868, 'DELI GOMIS HUESITOS 21G', '0.21', '00000046', 'NEYPLEX', '21', '2', '1', NULL, NULL),
(975, 867, 'DELI GOMIS MORITA 21G', '0.21', '00000046', 'NEYPLEX', '21', '2', '1', NULL, NULL),
(976, 701, 'BONELLA  250G', '1.15', '00000047', 'UNILEVER', '250', '2', '1', NULL, NULL),
(977, 700, 'BONELLA 500G', '2.15', '00000047', 'UNILEVER', '500', '2', '1', NULL, NULL),
(978, 699, 'BONELLA SACHET  50G', '0.29', '00000047', 'UNILEVER', '50', '2', '1', NULL, NULL),
(979, 1839, 'REXONA DEO ROLLON BAMBOO                                                                                  ', '3.19', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(980, 1899, 'REXONACLINICAL WOMEN BPK 48G                                                                              ', '8.04', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(981, 1841, 'LUX JABON SUAVIDAD PETALOS                                                                                ', '1.94', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(982, 1842, 'LUX FRESCURA IRRESISTIBLE', '1.94', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(983, 1843, 'LUX TOQUE DE VAINILLA                                                                                     ', '1.94', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(984, 1844, 'REXONA AEROSOL V8                                                                                         ', '5.83', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(985, 1845, 'LUX DELICADESA FLORAL                                                                                     ', '1.94', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(986, 1846, 'DOVE ROLLON ORIGINAL 30ML', '1.08', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(987, 1903, 'DEJA POLVO B PRIM 100G                                                                                    ', '0.84', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(988, 1847, 'DOVE DEO ROLLON CUIDADO TOTAL 30ML', '1.08', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(989, 1848, 'SURF POLVO ROSAS LILAS 1K                                                                                 ', '2.45', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(990, 1850, 'REXONA CLINICAL SACHET CLEAN', '0.22321429', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(991, 1851, 'REXONA CLINICAL SACHET CLASIC', '0.22321429', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(992, 1852, 'REXONA AEROSOL BAMBO                                                                                      ', '5.83', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(993, 1853, 'DEJA BARRA ESTRELLA LIMON 250G                                                                            ', '0.44', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(994, 1854, 'DEJA LAVAPLATO FLORAL 250G                                                                                ', '0.44', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(995, 1855, 'DEJA BARRA FLORAL 350G                                                                                    ', '0.78', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(996, 1856, 'REXONA JABON ANTIBACTERIAL PROTECCION', '1.77678571', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(997, 1884, 'DOVE JAB LECHE DE COCO', '3.11', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(998, 1885, 'REXONA DEO ROLLON V8', '3.19', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(999, 1904, 'DEJA POLVO FLORAL BIC                                                                                     ', '0.84', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1000, 1886, 'SURF POLVO NARANJA                                                                                        ', '2.45', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1001, 1887, 'DOVE DEO STI AP RENOVADOR                                                                                 ', '4.38', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1002, 1888, 'DEJA POLVO TQ SUAV PRIMA BIC 720G', '1.67', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1003, 1889, 'DEJA POVO  LIMON BICARBONATO 720G', '1.67', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1004, 1892, 'DEJA POLVO FLORAL 2K                                                                                      ', '5.58', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1005, 1891, 'DEJA POLVO LIMON  BICARBONATO 2K                                                                          ', '5.39', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1006, 1893, 'DEJA POLVO  TQ ALOE VERA 5K', '12.49107143', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1007, 1894, 'DEJA SUAVIDAD PRIMAVERAL 5K', '11.59821429', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1008, 1895, 'DOVE SUPER  AC FACTOR NUTRI 50                                                                            ', '5.1', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1009, 1896, 'REXONA ANTIBACTERIAL AVENA                                                                                ', '1.94', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1010, 1897, 'DOVE SH OLEO MICELAR + AC                                                                                 ', '8.89', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1011, 1900, 'REXONA DEO ROLLON CLASIC 50ML', '2.23', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1012, 1901, 'REXONA DEO ROLLON CLEAN 50ML                                                                              ', '2.23', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1013, 1902, 'DEJA POLVO ANTIBACTERIAL 950G                                                                             ', '2.81', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1014, 1905, 'DEJA POLVO LIMON BIC 350+100G', '0.86', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1015, 1919, 'DEJA POLVO ANTIBACTERIA 340+100                                                                           ', '0.84', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1016, 1906, 'DEJA POLVO FLORAL BIC+ LIQU 300ML', '2.90178571', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1017, 1907, 'DEJA POLVO PRIMA BIC 1K+BABY 300ML', '2.94642857', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1018, 1908, 'DOVE JAB OLEO DE ARGAN                                                                                    ', '3.11', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1019, 1909, 'REXONA JAB ACTIVE 125G', '1.78517857', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1020, 1910, 'AXE AEROSOL BS DARK TEMP                                                                                  ', '6.22', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1021, 1911, 'REXONA DEO MEN ANTIBA+INVISI                                                                              ', '5.84', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1022, 1912, 'DOVE DEO AEROSOL RENOVADOR                                                                                ', '6.06', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1023, 1913, 'SURF DT PLVO MANZANILLA 1K', '2.45535714', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1024, 1914, 'DOVE ROLLON RENOVADOR                                                                                     ', '3.61', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1025, 1915, 'REXONA DEO STECK ACTR BAMBO                                                                               ', '3.4', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1026, 1916, 'REXONA DEO STECK AP COTON                                                                                 ', '3.4', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1027, 1917, 'REXONA DEO ROLLON COTON                                                                                   ', '1.87', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1028, 1918, 'REXONA STECK AP V8                                                                                        ', '3.4', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1029, 1920, 'REXONA DEO ROL MEN ANTIB', '1.87', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1030, 1944, 'DOVE SH OLEO NUTRICION                                                                                    ', '3.14', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1031, 1921, 'REXONA DEO STECK MEN ANTIB', '3.4', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1032, 1922, 'REXONA DEO CLINICAL MEN', '8.24107143', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1033, 1923, 'REXONA DEO STECK AP SPORTFAN                                                                              ', '3.4', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1034, 1924, 'REXONA DEO ROLLON BAMBOO 30ML                                                                             ', '1.08', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1035, 1925, 'REXONA TEENS DEO ROL ENERGY                                                                               ', '1.87', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1036, 1926, 'REXONA JAB BAMBO X3', '1.77678571', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1037, 1927, 'REXONA DEO STI MEN ANTIB FRESH', '3.4', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1038, 1929, 'DOVE JAB KARITE 90G                                                                                       ', '0.8', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1039, 1928, 'DOVE KARITE  BAR X3                                                                                       ', '3.11', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1040, 1930, 'DOVE JAB  EXFOLIACION SUAVE', '0.80357143', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1041, 1931, 'DOVE JAB ORIGINAL 90G', '0.80357143', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1042, 1932, 'DOVE DEO ROLLON CLEAR TONE                                                                                ', '1.94', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1043, 1933, 'DOVE DEO ROLLON ORIGINAL                                                                                  ', '1.94', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1044, 1934, 'DOVE DEO ROLLON INVISIBLE DRY ACLA                                                                        ', '1.94', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1045, 1935, 'DOVE DEO STOCK DERMO ACLARANT                                                                             ', '4.36', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1046, 1936, 'DOVE DEO STECK ORIGINAL                                                                                   ', '4.08', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1047, 1937, 'DOVE DEO STECK CLEAR TONE                                                                                 ', '4.08', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1048, 1938, 'DOVE DEO ROLLON CUIDADO TOTAL                                                                             ', '1.94', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1049, 1939, 'DOVE DEO ROLLON EXTRA FRESH                                                                               ', '1.94', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1050, 1941, 'REXONA EFICIENTE TALCO                                                                                    ', '2.26', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1051, 1942, 'REXONA DEO ROL WH ANTB+INVI', '1.87', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1052, 1943, 'PONS CRE ACLARANT  B3 SECA                                                                                ', '0.65', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1053, 1945, 'DOVE SH CONTROL CAIDA                                                                                     ', '3.14', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1054, 1946, 'DOVE SH RECUPERACION EXTREMA                                                                              ', '3.14', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1055, 1947, 'DOVE SH RECONSTRUCCION COMPLETA                                                                           ', '3.14', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1056, 1948, 'SURF POLVO MANZANILLA 440G                                                                                ', '0.85', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1057, 1949, 'DEJA 350G GRATIS OB                                                                                       ', NULL, '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1058, 1950, 'PONDS REJUVENESS SACH                                                                                     ', '0.65', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1059, 1951, 'SARTEN BONELLA', '4.46428571', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1060, 3278, 'SEDAL RIZOS DEFIN 190ML                                                                                   ', '2.5267857142857', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1061, 4223, 'JABON DOVE DELICIUS CARE 90G                                                                              ', '0.80357142857143', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1062, 2648, 'BONELLA 1KG', '4.401318', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1063, 3014, 'KNORR MACARRON 250G', '0.75', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1064, 3015, 'KNORR FIDEO SPAGHUETTI 250G', '0.75', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1065, 3016, 'KNORR TALLARIN 250G', '0.75', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1066, 3017, 'KNORR TORNILLO 250G', '0.75', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1067, 3270, 'DEJA JABON LIQUID BABY 300ML                                                                              ', '0.85714285714286', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1068, 3268, 'AXE  DEO ICE CHILL', '5.83928571', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1069, 3269, 'BONELLA POR RAMA 250G', '1.25', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1070, 3273, 'DOVE ACOND CONTROL CAIDA 400ML                                                                            ', '5.5535714285714', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1071, 3274, 'DOVE ACON OLEO MICELAR 400ML                                                                              ', '5.5535714285714', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1072, 3275, 'DOVE ACOND RECONSTRUC COMPLETA 400ML                                                                      ', '5.5535714285714', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1073, 3276, 'DOVE AER DERMO ACLARANT 150ML                                                                             ', '4.0357142857143', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1074, 3279, 'DOVE AERO INVISIBLE DRY 150ML                                                                             ', '4.1428571428571', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1075, 3280, 'DOVE AERO ORIGINAL 150ML                                                                                  ', '4.1428571428571', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1076, 3281, 'DOVE AERO CLEAR TONE 150ML                                                                                ', '4.142857', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1077, 3282, 'DOVE SHAM OLEO NUTRICION 400ML                                                                            ', '5.6964285714286', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1078, 3283, 'DOVE COMPLT 400ML+ AC400ML                                                                                ', '9.1071428571429', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1079, 3284, 'DOVE SHMP RECONSTRUC COMPLET 400ML                                                                        ', '5.6964285714286', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1080, 3285, 'LUX SUAVIDAD PETALOS 125G                                                                                 ', '0.57142857142857', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1081, 3286, 'LUX FRESCURA IRRESIST 125G                                                                                ', '0.57142857142857', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1082, 3287, 'LUX TOQUE DE VAINI 125G                                                                                   ', '0.57142857142857', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1083, 3288, 'LUX DELICAD FLORAL 125G                                                                                   ', '0.57142857142857', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1084, 3436, 'PONDS ACLARANT B3 GRASA 50G', '4.89771964', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1085, 3438, 'PONDS PEPINO 50G', '2.67841161', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1086, 3437, 'PONDS ACLARANT B3 SECA', '4.89771964', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1087, 3441, 'DOVE ACOND OLEO NURTICI 200ML                                                                             ', '3.2232142857143', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1088, 3442, 'DOVE ACONDIC RECUPER EXTREMA 200ML                                                                        ', '3.2232142857143', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1089, 3446, 'DOVE ACOND RECUPERAFION EXTRM 400ML                                                                       ', '5.6964285714286', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1090, 3447, 'DOVE CREMA DE PEINAR RECONSTR COMPLE 200ML                                                                ', '3.2053571428571', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1091, 3448, 'DOVE CREMA DE PEINAR OLEO NUTRIC 200ML                                                                    ', '3.2053571428571', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1092, 3449, 'DOVE CREMA DE PEINAR RECONTR EXTREM 200ML                                                                 ', '3.2053571428571', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1093, 3750, 'BONELLA POR RAMA SACHET 50G', '0.35', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1094, 3751, 'DOVE SUPER ACOND 12ML                                                                                     ', '0.22321428571429', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1095, 3752, 'SEDAL CREMA DE PEINAR KERAT 18ML                                                                          ', '0.22321428571429', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1096, 3753, 'SEDAL CR PEINAR LISO PERF 18ML                                                                            ', '0.22321428571429', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1097, 3754, 'SEDAL CR PEINAR RIZO DEF 18ML                                                                             ', '0.22321428571429', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1098, 3755, 'SEDAL SH CERAMIDAS 18ML', '0.22321429', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1099, 3758, 'DEJA LAVA PLATOS FLORAL 350G                                                                              ', '0.58035714285714', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1100, 3756, 'SEDAL SH DETOX 18ML', '0.22321429', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1101, 3757, 'SEDAL SH ANTICASPA 18ML                                                                                   ', '0.22321428571429', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1102, 3759, 'DEJA LIMON BICARBONARO 1KG                                                                                ', '2.9107142857143', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1103, 3760, 'DEJA POLVO SUAVIZANT ALOE VERA 1KG                                                                        ', '2.9107142857143', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1104, 3761, 'DOVE DEO DERMO ACLARANT 50ML                                                                              ', '1.9375', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1105, 3762, 'REXONA TEENS ENERGY AEROSOL                                                                               ', '2.9910714285714', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1106, 3763, 'SEDAL CR PEINAR LISO PERFECTO 300ML                                                                       ', '3.8125', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1107, 3770, 'DEJA FLORAL 200G                                                                                          ', '0.40178571428571', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1108, 3955, 'DETERGENTE DEJA LIMON 340G                                                                                ', '0.88392857142857', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1109, 3956, 'DEJA LIQUIDO SUAVIDAD PRIM 300ML                                                                          ', '0.89285714285714', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1110, 3957, 'DWJA LIQUIDO SUAVIDAD PRIM 900ML                                                                          ', '2.3214285714286', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1111, 3958, 'DEJA LIQUIDO  FLORAL 900ML                                                                                ', '2.3214285714286', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1112, 3959, 'DEJA LIQUIDO BABY 900ML                                                                                   ', '2.4821428571429', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1113, 3960, 'DEJA POLVO SUAVIDAD PRIM 340G                                                                             ', '0.88392857142857', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1114, 3961, 'AROMATEL SACHET 40ML                                                                                      ', '0.22321428571429', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1115, 3962, 'REXONA ROLLON SPORTFAN 50ML                                                                               ', '1.875', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1116, 4156, 'DEJA POLVO SUAVIZANTE 2KG                                                                                 ', '5.7232142857143', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1117, 4286, 'JABON REXONA ANTIBACTERIAL FRESH                                                                          ', '1.9821428571429', '00000047', 'UNILEVER', '0', '2', '1', NULL, NULL),
(1118, 1383, 'PULPA DE AJI ABANERO 105G', '0.75', '00000048', 'PROVEAGRO', '105', '2', '1', NULL, NULL),
(1119, 1384, 'SALSA DE AJI JALAPEÑO 105', '0.75', '00000048', 'PROVEAGRO', '105', '2', '1', NULL, NULL),
(1120, 1385, 'AJI MOLIDO DON JOAQUIN 105G', '0.75', '00000048', 'PROVEAGRO', '105', '2', '1', NULL, NULL),
(1121, 596, 'PROTECTORES LADYSOFT CLAS', '0.78', '00000049', 'LADYSOFT', '200', '2', '1', NULL, NULL),
(1122, 583, 'TOALLAS LADYSOFT DEL ALAS', '1.12', '00000049', 'LADYSOFT', '200', '2', '1', NULL, NULL),
(1123, 582, 'TOALLAS LADYSOFT NOR ALAS', '0.77', '00000049', 'LADYSOFT', '200', '2', '1', NULL, NULL),
(1124, 581, 'TOALLAS LADYSOFT NOCTURNAS', '1.42', '00000049', 'LADYSOFT', '200', '2', '1', NULL, NULL),
(1125, 1426, 'TOALLAS LADYSOFT NATURAL MANZ', '1.16', '00000049', 'LADYSOFT', '200', '2', '1', NULL, NULL),
(1126, 1598, 'PROTECTORES LADYSOFT CLASICOS', '3.38', '00000049', 'LADYSOFT', '100', '2', '1', NULL, NULL),
(1127, 1599, 'PROTECTORES LADYSOFT NORMAL *42', '4.07', '00000049', 'LADYSOFT', '42', '2', '1', NULL, NULL),
(1128, 3808, 'TOALLAS NOCTURNA DOBLE ALA X10                                                                            ', '1.5089285714286', '00000049', 'LADYSOFT', '0', '2', '1', NULL, NULL),
(1129, 1328, 'GEL EGO ATRACTION 90G', '0.89', '00000050', 'EGO', '90', '2', '1', NULL, NULL),
(1130, 1327, 'GEL EGO ATRACTION', '1.35', '00000050', 'EGO', '190', '2', '1', NULL, NULL),
(1131, 1321, 'GEL EGO POWER 90G', '0.89', '00000050', 'EGO', '90', '2', '1', NULL, NULL),
(1132, 1320, 'GEL EGO POWER 190G', '1.35', '00000050', 'EGO', '190', '2', '1', NULL, NULL),
(1133, 1653, 'EGO ATTRACTION 90 G', '0.84', '00000050', 'EGO', '90', '2', '1', NULL, NULL),
(1134, 1654, 'EGO  POWER 90 G', '0.84', '00000050', 'EGO', '90', '2', '1', NULL, NULL),
(1135, 1655, 'EGO ATTRACTION  190 G', '1.25', '00000050', 'EGO', '190', '2', '1', NULL, NULL),
(1136, 1656, 'EGO POWER 190 G', '1.25', '00000050', 'EGO', '190', '2', '1', NULL, NULL),
(1137, 1324, 'SUNTEA FRUTOS ROJOS', '0.3', '00000051', 'SUNTEA', '30', '2', '1', NULL, NULL),
(1138, 467, 'SUNTEA DURAZNO', '0.3', '00000051', 'SUNTEA', '30', '2', '1', NULL, NULL),
(1139, 466, 'SUNTEA LIMON', '0.3', '00000051', 'SUNTEA', '30', '2', '1', NULL, NULL),
(1140, 3010, 'SUNTEA MANZANA', '0.3125', '00000051', 'SUNTEA', '0', '2', '1', NULL, NULL),
(1141, 1325, 'CREMA SAVITAL COLAGENO', '3.27', '00000052', 'SAVITAL', '275', '2', '1', NULL, NULL),
(1142, 1323, 'CREMA SAVITAL KERATINA 275G', '3.27', '00000052', 'SAVITAL', '275', '2', '1', NULL, NULL),
(1143, 1322, 'SAVITAL KERATINA DE 550 ML', '4.05', '00000052', 'SAVITAL', '550', '2', '1', NULL, NULL),
(1144, 1648, 'SAVITAL  PLACENTA 550 ML', '4.05', '00000052', 'SAVITAL', '550', '2', '1', NULL, NULL),
(1145, 468, 'SAVITAL SHAMPOO BIOTINA 170G', '1.35', '00000052', 'SAVITAL', '170', '2', '1', NULL, NULL),
(1146, 1649, 'SAVITAL MULTIVITAMINA 550', '4.05', '00000052', 'SAVITAL', '550', '2', '1', NULL, NULL),
(1147, 1650, 'SAVITAL CREMA PLACENTA 275 ML', '3.06', '00000052', 'SAVITAL', '275', '2', '1', NULL, NULL),
(1148, 1651, 'SAVITAL CREMA COLAGENO 275 ML', '3.06', '00000052', 'SAVITAL', '275', '2', '1', NULL, NULL),
(1149, 1652, 'SAVITAL CREMA KERATINA 275 ML', '3.06', '00000052', 'SAVITAL', '275', '2', '1', NULL, NULL),
(1150, 3111, 'ACONDICIONADOR SAVITAL COLAGENO 530ML                                                                     ', '3.6964285714286', '00000052', 'SAVITAL', '0', '2', '1', NULL, NULL),
(1151, 3112, 'ACONDICIONADOR SAVITAL BIOTINA 530ML                                                                      ', '3.6964285714286', '00000052', 'SAVITAL', '0', '2', '1', NULL, NULL),
(1152, 3113, 'ACONDICIONADOR SAVITAL KERATINA 530ML                                                                     ', '3.6964285714286', '00000052', 'SAVITAL', '0', '2', '1', NULL, NULL),
(1153, 3114, 'ACONDICIONADOR SAVITAL MULTIV 530ML                                                                       ', '3.6964285714286', '00000052', 'SAVITAL', '0', '2', '1', NULL, NULL),
(1154, 3378, 'SAVITAL SHAMPOO COLAGENO 550ML                                                                            ', '3.9375', '00000052', 'SAVITAL', '0', '2', '1', NULL, NULL),
(1155, 3536, 'SAVITAL ACOND BIOTINA SACHET 22ML', '0.22321429', '00000052', 'SAVITAL', '0', '2', '1', NULL, NULL),
(1156, 3537, 'SAVITAL ACOND COLAGENO SACHET 22ML', '0.22321429', '00000052', 'SAVITAL', '0', '2', '1', NULL, NULL),
(1157, 3538, 'SAVITAL ACOND MULTIVITAMINA SACHET 22ML', '0.22321429', '00000052', 'SAVITAL', '0', '2', '1', NULL, NULL),
(1158, 3539, 'SAVITAL SH COLAGENO 22ML                                                                                  ', '0.22321428571429', '00000052', 'SAVITAL', '0', '2', '1', NULL, NULL),
(1159, 3588, 'SHAMPOO SAVITAL AGUACATE 550ML                                                                            ', '3.7946428571429', '00000052', 'SAVITAL', '0', '2', '1', NULL, NULL),
(1160, 3687, 'SHAMPOO SAVITAL BIOTINA 550ML                                                                             ', '3.7946428571429', '00000052', 'SAVITAL', '0', '2', '1', NULL, NULL),
(1161, 3688, 'CREMA DE PEINAR SAVITAL MULTIVIT 275ML                                                                    ', '2.8125', '00000052', 'SAVITAL', '0', '2', '1', NULL, NULL),
(1162, 3689, 'CREMA PARA PEINAR SAVILA BIOTINA 275ML                                                                    ', '2.8125', '00000052', 'SAVITAL', '0', '2', '1', NULL, NULL),
(1163, 1296, 'PAÑAL BABYSEC MEDIANO', '4.91', '00000053', 'BABYSEC', '4', '2', '1', NULL, NULL),
(1164, 595, 'TOALL HUM BABYSEC  ULT SEC', '4.61', '00000053', 'BABYSEC', '4', '2', '1', NULL, NULL),
(1165, 594, 'TOALL HUM BABYSEC ALOE  TRIP', '5.12', '00000053', 'BABYSEC', '4', '2', '1', NULL, NULL),
(1166, 262, 'PAÑAL BABYSEC RN', '3.49', '00000053', 'BABYSEC', '4', '2', '1', NULL, NULL),
(1167, 3455, 'PAÑAL BABY SEC VOY AL AGUA                                                                                ', '7.2767857142857', '00000053', 'BABYSEC', '0', '2', '1', NULL, NULL),
(1168, 807, 'TRAPEADOR MAGICO', '1.98', '00000054', 'ESTRELLA', '3', '2', '1', NULL, NULL),
(1169, 806, 'TRAPEADOR HURACAN', '1.67', '00000054', 'ESTRELLA', '3', '2', '1', NULL, NULL),
(1170, 801, 'CLORO ESTRELLA 500', '0.64', '00000054', 'ESTRELLA', '500', '2', '1', NULL, NULL),
(1171, 799, 'PALO ESCOBA', '0.79', '00000054', 'ESTRELLA', '2', '2', '1', NULL, NULL),
(1172, 798, 'PINZAS PLASTICAS ESTRELLA', '1.29', '00000054', 'ESTRELLA', '2', '2', '1', NULL, NULL),
(1173, 797, 'ESCOBA SUPREMA ESTRELLA', '1.85', '00000054', 'ESTRELLA', '2', '2', '1', NULL, NULL),
(1174, 796, 'CEPILLO ECONOMICO ESTRELLA', '0.6', '00000054', 'ESTRELLA', '3', '2', '1', NULL, NULL),
(1175, 688, 'DEJA BARRA ESTRELLA LIM 250', '0.44', '00000054', 'ESTRELLA', '250', '2', '1', NULL, NULL),
(1176, 687, 'DEJA BARRA ESTRELLA FLOR250', '0.44', '00000054', 'ESTRELLA', '250', '2', '1', NULL, NULL),
(1177, 1424, 'ESPONJA MIXTA ESTRELLA', '0.44', '00000054', 'ESTRELLA', '1', '2', '1', NULL, NULL),
(1178, 1425, 'ESCOBA ECONIMICA ESTRELLA', '1.3604', '00000054', 'ESTRELLA', '2', '2', '1', NULL, NULL),
(1179, 2590, 'ESTROPAJO ESTRELLA                                                                                        ', '0.22321428571429', '00000054', 'ESTRELLA', '0', '2', '1', NULL, NULL),
(1180, 2588, 'ESPONJA ESTRELLA                                                                                          ', '0.40178571428571', '00000054', 'ESTRELLA', '0', '2', '1', NULL, NULL),
(1181, 3553, 'DESINFECTANTE ESTRELLA EUCALIPTO 450ML                                                                    ', '0.98214285714286', '00000054', 'ESTRELLA', '0', '2', '1', NULL, NULL),
(1182, 3941, 'FIBRA ESTRELLA VD                                                                                         ', '0.4375', '00000054', 'ESTRELLA', '0', '2', '1', NULL, NULL),
(1183, 465, 'QUIPITOS', '0.17857143', '00000055', 'QUIPITOS', '11', '2', '1', NULL, NULL),
(1184, 698, 'SURF NARANJA 400 G', '0.87', '00000056', 'SURF', '400', '2', '1', NULL, NULL),
(1185, 697, 'SURF ROSAS LILAS 400', '0.87', '00000056', 'SURF', '400', '2', '1', NULL, NULL),
(1186, 696, 'SURF LIMON 400G', '0.87', '00000056', 'SURF', '400', '2', '1', NULL, NULL),
(1187, 695, 'SURF HORT FLORES 400G', '0.87', '00000056', 'SURF', '400', '2', '1', NULL, NULL),
(1188, 694, 'SURF NARANJA 180G', '0.43', '00000056', 'SURF', '180', '2', '1', NULL, NULL),
(1189, 693, 'SURF NARANJA 1 K', '2.45535714', '00000056', 'SURF', '1', '2', '1', NULL, NULL),
(1190, 692, 'SURF LIMON 180G', '0.43', '00000056', 'SURF', '180', '2', '1', NULL, NULL),
(1191, 691, 'SURF ROSAS LILAS 180', '0.43', '00000056', 'SURF', '180', '2', '1', NULL, NULL),
(1192, 690, 'SURF HORT FLORES 180G', '0.43', '00000056', 'SURF', '180', '2', '1', NULL, NULL),
(1193, 689, 'SURF LIMON 1K', '2.45535714', '00000056', 'SURF', '1', '2', '1', NULL, NULL),
(1194, 686, 'SURF ROSAS LILAS 1', '2.45535714', '00000056', 'SURF', '1', '2', '1', NULL, NULL),
(1195, 685, 'SURF  HORT FLORES 1K', '2.45535714', '00000056', 'SURF', '1', '2', '1', NULL, NULL),
(1196, 1849, 'SURF POLVO HORTENCIAS 1K                                                                                  ', '2.45', '00000056', 'SURF', '0', '2', '1', NULL, NULL),
(1197, 2649, 'SURF POLVO ROSAS LILAS 2KG', '4.125', '00000056', 'SURF', '0', '2', '1', NULL, NULL),
(1198, 2650, 'SURF POLVO NARANJA 2KG', '4.125', '00000056', 'SURF', '0', '2', '1', NULL, NULL),
(1199, 3439, 'SURF HORTENCIAS 440G                                                                                      ', '0.89285714285714', '00000056', 'SURF', '0', '2', '1', NULL, NULL),
(1200, 3440, 'SURF LIMON 440G                                                                                           ', '0.89285714285714', '00000056', 'SURF', '0', '2', '1', NULL, NULL),
(1201, 3443, 'SURF DT MANZANILLA 180G                                                                                   ', '0.4375', '00000056', 'SURF', '0', '2', '1', NULL, NULL),
(1202, 3444, 'SURF ROSAS Y LILAS 440G                                                                                   ', '0.89285714285714', '00000056', 'SURF', '0', '2', '1', NULL, NULL),
(1203, 3445, 'SURF POLVO NARANJA 440G                                                                                   ', '0.89285714285714', '00000056', 'SURF', '0', '2', '1', NULL, NULL),
(1204, 684, 'AROMATEL MANDARINA 425', '1.08', '00000057', 'AROMATEL', '425', '2', '1', NULL, NULL),
(1205, 683, 'AROMATEL MANDARINA 50', '0.21', '00000057', 'AROMATEL', '50', '2', '1', NULL, NULL),
(1206, 682, 'AROMATEL SACHET 50', '0.21', '00000057', 'AROMATEL', '50', '2', '1', NULL, NULL),
(1207, 681, 'AROMATEL FRUTOS ROJOS 425', '1.08', '00000057', 'AROMATEL', '425', '2', '1', NULL, NULL),
(1208, 680, 'AROMATEL FLORAL 425', '1.08', '00000057', 'AROMATEL', '425', '2', '1', NULL, NULL),
(1209, 679, 'AROMATEL MANZANA 425', '1.08', '00000057', 'AROMATEL', '425', '2', '1', NULL, NULL);
INSERT INTO `productos` (`id`, `id_foraneo`, `NAME`, `PRICE`, `IDBRAND`, `MARCA`, `PESOITEM`, `stock`, `estado_del`, `created_at`, `updated_at`) VALUES
(1210, 678, 'AROMATEL LAVANDA 425', '1.08', '00000057', 'AROMATEL', '425', '2', '1', NULL, NULL),
(1211, 1194, 'NUTRILECHE DESLACTOSADA900ML', '1.2', '00000059', 'NUTRI', '900', '2', '1', NULL, NULL),
(1212, 1193, 'NUTRILECHE DESCREMADA 900ML', '1.01', '00000059', 'NUTRI', '900', '2', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promocion_del_productos`
--

CREATE TABLE `promocion_del_productos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idProducto` bigint(20) NOT NULL,
  `descuento` int(11) DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estado_del` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_promociones`
--

CREATE TABLE `registro_promociones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idTipoPromocion` bigint(20) UNSIGNED NOT NULL,
  `descripcion` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descuento` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estado_del` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `publicado` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `registro_promociones`
--

INSERT INTO `registro_promociones` (`id`, `idTipoPromocion`, `descripcion`, `descuento`, `cantidad`, `fecha_inicio`, `fecha_fin`, `estado_del`, `publicado`, `created_at`, `updated_at`) VALUES
(1, 1, 'sena', 1, 1, '2020-07-10', '2020-07-11', '1', 1, '2020-07-10 18:55:21', '2020-07-10 18:58:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pagos`
--

CREATE TABLE `tipo_pagos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `identificador` int(11) NOT NULL,
  `descricion` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_pagos`
--

INSERT INTO `tipo_pagos` (`id`, `identificador`, `descricion`, `created_at`, `updated_at`) VALUES
(1, 1, 'TRANSFERENCIA', NULL, NULL),
(2, 2, 'EFECTIVO', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_promocions`
--

CREATE TABLE `tipo_promocions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descripcion` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_del` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `nome_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_promocions`
--

INSERT INTO `tipo_promocions` (`id`, `descripcion`, `estado_del`, `nome_token`, `created_at`, `updated_at`) VALUES
(1, 'NAVIDEÑA', '1', '2y10l5JQJdELfBUf5ismpfTGBSriYmcAyqPTLREVOYz04AvkKGnICNS', '2020-07-10 18:54:55', '2020-07-10 18:54:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuarios`
--

CREATE TABLE `tipo_usuarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cod` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_del` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `nome_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_usuarios`
--

INSERT INTO `tipo_usuarios` (`id`, `cod`, `descripcion`, `estado_del`, `nome_token`, `created_at`, `updated_at`) VALUES
(1, '001', 'Admin', '1', '2y10bQ7qVN8PMdDAEO13lHO3tudI3uqTDH2ed5U0Z6hlit1ZzJVSSra', NULL, NULL),
(2, '002', 'Farmaceutico', '1', '2y10FovrqSe5qhgRKhvC37YxWbwt6RuRZhBfemhWpbGwnEKuk1tjx4G', NULL, NULL),
(3, '003', 'Courier', '1', '2y10CcrTTpop5W8nzqrCL04vuaJXmFQD5oSiKSPU0aed7QyDSovq', NULL, NULL),
(4, '004', 'Cliente', '1', '2y10KE89W7uibkckKSWZyrB6JOXOgmrCGhRbFlv1RuiYe0sLRfhqqi', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacions`
--

CREATE TABLE `ubicacions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idusuario` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitud` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitud` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado_del` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `nome_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idtipo` bigint(20) NOT NULL DEFAULT 4,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cedula` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `celular` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password2` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_del` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `nome_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `idtipo`, `name`, `email`, `cedula`, `celular`, `email_verified_at`, `password`, `password2`, `estado_del`, `nome_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'admin@admin.com', '0000000000', '0000000000', NULL, '$2y$10$vR1zKMGldtwwiYuV9iYOV.1dM/IsZMxKulh5vAp9WEh2pPgEuN6X2', 'adminadmin', '1', '2y10gxl9OJeXTELrxjfdFcHWtuiqlDeRWfSDSaqkRjE3YiUTXyPpXMfMO', NULL, NULL, NULL),
(2, 3, 'courier', 'courier@courier.com', '0000000003', '0000000003', NULL, '$2y$10$sUyU.vupN1VYpL2A5ptKf.OcHkCCOt0HMNafRDJ7IimOMwO/pVQeW', 'courier', '1', '2y10gIAl55eXidIprkCVrLiIuuJyp93oAZ2GsPBMLrJ1pezOwpHigO', NULL, NULL, NULL),
(3, 4, 'client', 'client@client.com', '0000000004', '0000000004', NULL, '$2y$10$eLupuuh2NLPUvNy20rl5muHreu.mu49V9Q861hrFGmp8tJ650e2aG', 'client', '1', '2y10qiNq906zuyxo6g090Y3ug0fY3dYvVHTaduxxfAYltz1WZCmhsxm', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idestado` bigint(20) UNSIGNED NOT NULL,
  `idcliente` bigint(20) UNSIGNED NOT NULL,
  `idcourier` bigint(20) UNSIGNED DEFAULT NULL,
  `fecha` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_f` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtotal` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado_del` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `ubicacion_descripcion` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ubicacion_latitud` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ubicacion_longitud` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nome_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compras_idpromocionproducto_foreign` (`idPromocionProducto`),
  ADD KEY `compras_idregistros_foreign` (`idRegistros`),
  ADD KEY `compras_id_productos_foreign` (`id_Productos`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalle_ventas_idventa_foreign` (`idventa`),
  ADD KEY `detalle_ventas_idcliente_foreign` (`idcliente`),
  ADD KEY `detalle_ventas_idproducto_foreign` (`idproducto`);

--
-- Indices de la tabla `estado_ventas`
--
ALTER TABLE `estado_ventas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `kits`
--
ALTER TABLE `kits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kits_idproducto_foreign` (`idProducto`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordens`
--
ALTER TABLE `ordens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ordens_idusuario_foreign` (`idUsuario`),
  ADD KEY `ordens_idestado_foreign` (`idestado`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `promocion_del_productos`
--
ALTER TABLE `promocion_del_productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `registro_promociones`
--
ALTER TABLE `registro_promociones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `registro_promociones_idtipopromocion_foreign` (`idTipoPromocion`);

--
-- Indices de la tabla `tipo_pagos`
--
ALTER TABLE `tipo_pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_promocions`
--
ALTER TABLE `tipo_promocions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_usuarios`
--
ALTER TABLE `tipo_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ubicacions`
--
ALTER TABLE `ubicacions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ventas_idestado_foreign` (`idestado`),
  ADD KEY `ventas_idcliente_foreign` (`idcliente`),
  ADD KEY `ventas_idcourier_foreign` (`idcourier`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_ventas`
--
ALTER TABLE `estado_ventas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `kits`
--
ALTER TABLE `kits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `ordens`
--
ALTER TABLE `ordens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1213;

--
-- AUTO_INCREMENT de la tabla `promocion_del_productos`
--
ALTER TABLE `promocion_del_productos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registro_promociones`
--
ALTER TABLE `registro_promociones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipo_pagos`
--
ALTER TABLE `tipo_pagos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_promocions`
--
ALTER TABLE `tipo_promocions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipo_usuarios`
--
ALTER TABLE `tipo_usuarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ubicacions`
--
ALTER TABLE `ubicacions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_id_productos_foreign` FOREIGN KEY (`id_Productos`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `compras_idpromocionproducto_foreign` FOREIGN KEY (`idPromocionProducto`) REFERENCES `promocion_del_productos` (`id`),
  ADD CONSTRAINT `compras_idregistros_foreign` FOREIGN KEY (`idRegistros`) REFERENCES `registro_promociones` (`id`);

--
-- Filtros para la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD CONSTRAINT `detalle_ventas_idcliente_foreign` FOREIGN KEY (`idcliente`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `detalle_ventas_idproducto_foreign` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `detalle_ventas_idventa_foreign` FOREIGN KEY (`idventa`) REFERENCES `ventas` (`id`);

--
-- Filtros para la tabla `kits`
--
ALTER TABLE `kits`
  ADD CONSTRAINT `kits_idproducto_foreign` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `ordens`
--
ALTER TABLE `ordens`
  ADD CONSTRAINT `ordens_idestado_foreign` FOREIGN KEY (`idestado`) REFERENCES `estado_ventas` (`id`),
  ADD CONSTRAINT `ordens_idusuario_foreign` FOREIGN KEY (`idUsuario`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `registro_promociones`
--
ALTER TABLE `registro_promociones`
  ADD CONSTRAINT `registro_promociones_idtipopromocion_foreign` FOREIGN KEY (`idTipoPromocion`) REFERENCES `tipo_promocions` (`id`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_idcliente_foreign` FOREIGN KEY (`idcliente`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `ventas_idcourier_foreign` FOREIGN KEY (`idcourier`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `ventas_idestado_foreign` FOREIGN KEY (`idestado`) REFERENCES `estado_ventas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
