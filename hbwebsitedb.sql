-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 23, 2024 lúc 04:25 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `hbwebsite`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_cred`
--

CREATE TABLE `admin_cred` (
  `sr_no` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_pass` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_cred`
--

INSERT INTO `admin_cred` (`sr_no`, `admin_name`, `admin_pass`) VALUES
(1, 'admin', '123');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `booking_details`
--

CREATE TABLE `booking_details` (
  `sr_no` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `room_name` varchar(150) NOT NULL,
  `price` int(11) NOT NULL,
  `total_pay` int(11) NOT NULL,
  `room_no` varchar(100) NOT NULL,
  `user_name` varchar(150) NOT NULL,
  `phonenum` varchar(100) NOT NULL,
  `address` varchar(250) NOT NULL,
  `prepay` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `booking_details`
--

INSERT INTO `booking_details` (`sr_no`, `booking_id`, `room_name`, `price`, `total_pay`, `room_no`, `user_name`, `phonenum`, `address`, `prepay`) VALUES
(4, 4, 'Master Room', 1390000, 1390000, 'M405', 'Nguyễn Văn Admin', '0989344031', 'Ha Noi', 0),
(5, 5, 'Couple Room', 500000, 1000000, 'C501', 'Nguyễn Văn Admin', '0989344031', 'Ha Noi', 0),
(7, 7, 'Simple Room', 400000, 400000, 'S102', 'Nguyễn Văn Admin', '0989344031', 'Ha Noi', 200000),
(8, 8, 'Luxury Room', 900000, 900000, 'L301', 'Nguyễn Văn Admin', '0989344031', 'Ha Noi', 450000),
(9, 9, 'Double Room', 700000, 700000, 'D207', 'Vũ Phi Trường', '0325584984', 'Phúc Diễn-Từ Liêm-Hà Nội-Việt Nam', 0),
(10, 10, 'Master Room', 1390000, 2780000, 'M405', 'Vũ Phi Trường', '0325584984', 'Phúc Diễn-Từ Liêm-Hà Nội-Việt Nam', 1390000),
(20, 22, 'Couple Room', 500000, 500000, 'C501', 'Vũ Phi Trường', '0325584984', 'Phúc Diễn-Từ Liêm-Hà Nội-Việt Nam', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `booking_order`
--

CREATE TABLE `booking_order` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` int(11) NOT NULL,
  `arrival` int(11) NOT NULL DEFAULT 0,
  `refund` int(11) DEFAULT NULL,
  `booking_status` varchar(100) NOT NULL DEFAULT 'pending',
  `order_id` varchar(250) NOT NULL,
  `trans_id` varchar(250) DEFAULT NULL,
  `trans_amt` bigint(20) NOT NULL,
  `trans_status` varchar(250) NOT NULL DEFAULT 'pending',
  `trans_resp_msg` varchar(150) DEFAULT NULL,
  `datetime` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `booking_order`
--

INSERT INTO `booking_order` (`booking_id`, `user_id`, `room_id`, `check_in`, `check_out`, `arrival`, `refund`, `booking_status`, `order_id`, `trans_id`, `trans_amt`, `trans_status`, `trans_resp_msg`, `datetime`) VALUES
(4, 2, 4, '2024-05-22', 2024, 1, NULL, 'checked out', 'ORD_2508031', '14425598', 1390000, '00', 'Thanh toan tien phong thanh cong', '2024-05-22'),
(5, 2, 5, '2024-05-22', 2024, 0, 1, 'cancelled', 'ORD_22668907', '14425648', 1000000, '00', 'Thanh toan tien phong thanh cong', '2024-05-22'),
(7, 2, 1, '2024-05-22', 2024, 1, NULL, 'checked out', 'ORD_29592938', '14425662', 400000, '00', 'Thanh toan tien phong thanh cong', '2024-05-22'),
(8, 2, 3, '2024-05-23', 2024, 1, NULL, 'checked out', 'ORD_28670693', '14425682', 900000, '00', 'Thanh toan tien phong thanh cong', '2024-05-23'),
(9, 1, 2, '2024-05-23', 2024, 1, NULL, 'full payment', 'ORD_11491614', '14425705', 700000, '00', 'Thanh toan tien phong thanh cong', '2024-05-23'),
(10, 1, 4, '2024-05-23', 2024, 0, 0, 'cancelled', 'ORD_16701359', '14425706', 2780000, '00', 'Thanh toan tien phong thanh cong', '2024-05-23'),
(22, 1, 5, '2024-05-23', 2024, 0, NULL, 'booked', 'ORD_19214796', '14425756', 500000, '00', 'Thanh toan tien phong thanh cong', '2024-05-23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carousel`
--

CREATE TABLE `carousel` (
  `sr_no` int(11) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `carousel`
--

INSERT INTO `carousel` (`sr_no`, `image`) VALUES
(1, 'IMG_19707.png'),
(2, 'IMG_13695.png'),
(3, 'IMG_42410.png'),
(4, 'IMG_68074.png'),
(5, 'IMG_90145.png'),
(6, 'IMG_88905.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact_details`
--

CREATE TABLE `contact_details` (
  `sr_no` int(11) NOT NULL,
  `address` varchar(300) NOT NULL,
  `gmap` varchar(500) NOT NULL,
  `pn1` varchar(30) NOT NULL,
  `pn2` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `tw` varchar(100) NOT NULL,
  `insta` varchar(100) NOT NULL,
  `fb` varchar(100) NOT NULL,
  `iframe` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `contact_details`
--

INSERT INTO `contact_details` (`sr_no`, `address`, `gmap`, `pn1`, `pn2`, `email`, `tw`, `insta`, `fb`, `iframe`) VALUES
(1, 'Thành phố Hạ Long, Quảng Ninh, Việt Nam', 'https://maps.app.goo.gl/2U89fWNHo1bLsaww9', '0987654321', '099887766', 'skyhotel@gmail.com', 'https://www.twitter.com/', 'https://www.instagram.com/', 'https://www.facebook.com/', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d119318.67920811434!2d107.1496281!3d20.843465300000002!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314a5796518cee87:0x55c6b0bcc85478db!2zVuG7i25oIEjhuqEgTG9uZw!5e0!3m2!1svi!2s!4v171396913');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `facilities`
--

CREATE TABLE `facilities` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `facilities`
--

INSERT INTO `facilities` (`id`, `name`, `icon`, `description`) VALUES
(1, 'Wifi', 'IMG_59502.svg', 'SkyHotel cung cấp dịch vụ WiFi miễn phí, tốc độ cao, giúp bạn kết nối dễ dàng và thuận tiện trong suốt kỳ nghỉ.'),
(2, 'Air Conditional', 'IMG_89983.svg', 'Tất cả các phòng tại SkyHotel đều được trang bị máy lạnh hiện đại, mang lại không gian mát mẻ và thoải mái, giúp bạn thư giãn tối đa.'),
(3, 'Massage', 'IMG_44646.svg', 'SkyHotel cung cấp dịch vụ massage chuyên nghiệp, giúp quý khách thư giãn, giảm căng thẳng và tái tạo năng lượng sau những ngày dài mệt mỏi.'),
(4, 'Tivi', 'IMG_75305.svg', 'Mỗi phòng tại SkyHotel đều được trang bị tivi màn hình phẳng, mang đến nhiều kênh giải trí phong phú, giúp quý khách thư giãn thoải mái.'),
(5, 'Swimming Pool', 'IMG_41238.svg', 'Hồ bơi ngoài trời tại SkyHotel là nơi lý tưởng để thư giãn, bơi lội và tận hưởng không gian thoáng đãng, sạch sẽ, phù hợp cho mọi lứa tuổi.'),
(6, 'Gym', 'IMG_93157.svg', 'Phòng gym tại SkyHotel được trang bị đầy đủ thiết bị tập luyện tiên tiến, phục vụ nhu cầu rèn luyện sức khỏe và giữ gìn vóc dáng của quý khách.'),
(7, 'Heater', 'IMG_78937.svg', 'Để đảm bảo quý khách luôn cảm thấy ấm áp trong mùa đông, SkyHotel trang bị máy sưởi hiện đại trong tất cả các phòng, tạo không gian ấm cúng.'),
(8, 'Sauna Room', 'IMG_75185.svg', 'SkyHotel có dịch vụ xông hơi giúp quý khách thư giãn, thải độc cơ thể, và cải thiện tuần hoàn máu, mang lại cảm giác sảng khoái sau mỗi lần sử dụng.'),
(9, 'Coffee', 'IMG_55379.svg', 'Quán cà phê tại SkyHotel mang đến không gian thư giãn với nhiều loại đồ uống thơm ngon, là nơi lý tưởng để gặp gỡ và trò chuyện.'),
(10, 'Radio', 'IMG_40833.svg', 'Mỗi phòng tại SkyHotel đều được trang bị radio, mang đến những giây phút thư giãn với âm nhạc và thông tin cập nhật, tạo không gian ấm cúng, dễ chịu.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `features`
--

CREATE TABLE `features` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `features`
--

INSERT INTO `features` (`id`, `name`) VALUES
(1, 'Ban công'),
(2, 'Nhà bếp'),
(3, 'Giường cỡ lớn'),
(4, 'Phòng ngủ'),
(5, 'Phòng khách'),
(6, 'Phòng tắm');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `review_rating`
--

CREATE TABLE `review_rating` (
  `sr_no` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `review` varchar(500) NOT NULL,
  `seen` int(11) NOT NULL DEFAULT 0,
  `datetime` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `area` double NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `adult` int(11) NOT NULL,
  `children` int(11) NOT NULL,
  `description` varchar(500) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `removed` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `area`, `price`, `quantity`, `adult`, `children`, `description`, `status`, `removed`) VALUES
(1, 'Simple Room', 50, 400000, 10, 3, 1, 'Phòng Simple tại SkyHotel mang đến một không gian ấm áp và tiện nghi cho du khách đi một mình hoặc cặp đôi tìm kiếm sự thuận tiện với mức giá phải chăng mà vẫn đảm bảo chất lượng. Với thiết kế tối giản nhưng vẫn sang trọng, phòng này được trang bị đầy đủ tiện nghi cần thiết để bạn có một kỳ nghỉ thoải mái. Hãy thư giãn trong giấc ngủ sâu trên chiếc giường êm ái, xem những chương trình yêu thích trên TV màn hình phẳng, và làm mới bản thân trong phòng tắm hiện đại kèm theo. Cho dù bạn đến đây với', 1, 0),
(2, 'Double Room', 100, 700000, 7, 5, 3, 'Phòng đôi tại SkyHotel mang đến không gian rộng rãi và thoải mái cho các cặp đôi hoặc bạn bè đi du lịch cùng nhau. Với thiết kế hiện đại nhưng vẫn ấm áp, phòng này có hai giường thoải mái, đảm bảo giấc ngủ ngon cho cả hai khách. Tận hưởng tiện nghi như TV màn hình phẳng, phòng tắm riêng tiện nghi, và không gian lưu trữ đồ đạc rộng rãi. Cho dù bạn đến để nghỉ dưỡng lãng mạn hay du lịch cùng bạn bè, phòng đôi mang đến sự thoải mái và tiện lợi hoàn hảo cho một kỳ nghỉ tại SkyHotel đáng nhớ.', 1, 0),
(3, 'Luxury Room', 80, 900000, 5, 4, 2, 'Phòng Luxury tại SkyHotel là biểu tượng của sự sang trọng và tiện nghi đỉnh cao. Với không gian rộng lớn và thiết kế đẳng cấp, phòng này mang đến trải nghiệm lưu trú đích thực cho những du khách khắt khe nhất. Bên cạnh các tiện ích cao cấp như giường lớn và thoải mái, phòng tắm sang trọng với bồn tắm Jacuzzi và dịch vụ phòng VIP cũng được cung cấp để làm hài lòng mọi yêu cầu của khách hàng. Dù bạn đến để nghỉ ngơi hay công tác, phòng Luxury tại SkyHotel sẽ làm cho mỗi chuyến đi trở nên đặc biệt', 1, 0),
(4, 'Master Room', 150, 1390000, 5, 10, 5, 'Phòng Master Room tại SkyHotel là sự kết hợp hoàn hảo giữa sang trọng và tiện nghi cao cấp. Với diện tích rộng rãi, phòng được trang bị một giường king-size thoải mái, khu vực tiếp khách riêng biệt, và ban công với tầm nhìn tuyệt đẹp ra toàn cảnh thành phố. Nội thất hiện đại và tinh tế cùng với các tiện ích như TV màn hình phẳng, máy pha cà phê, minibar, và két an toàn. Phòng tắm được thiết kế sang trọng với bồn tắm Jacuzzi, vòi sen riêng biệt và các sản phẩm vệ sinh cao cấp. Phòng Master Room h', 1, 0),
(5, 'Couple Room', 60, 500000, 7, 2, 1, 'Phòng Couple tại SkyHotel được thiết kế đặc biệt cho các cặp đôi, mang đến không gian lãng mạn và ấm cúng. Phòng có giường đôi thoải mái, nội thất tinh tế với gam màu nhẹ nhàng tạo cảm giác thư giãn. Tiện nghi hiện đại bao gồm TV màn hình phẳng, minibar, và máy pha cà phê. Phòng tắm riêng được trang bị vòi sen hiện đại và các sản phẩm vệ sinh cao cấp. Đặc biệt, phòng Couple còn có ban công hoặc cửa sổ lớn với tầm nhìn đẹp, lý tưởng cho những buổi tối thư giãn cùng nhau. SkyHotel cam kết mang đến', 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `room_facilities`
--

CREATE TABLE `room_facilities` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `facilities_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `room_facilities`
--

INSERT INTO `room_facilities` (`id`, `room_id`, `facilities_id`) VALUES
(28, 2, 1),
(29, 2, 2),
(30, 2, 3),
(31, 2, 4),
(32, 2, 7),
(33, 2, 8),
(34, 2, 9),
(41, 3, 1),
(42, 3, 2),
(43, 3, 4),
(44, 3, 5),
(45, 3, 7),
(46, 3, 8),
(47, 3, 9),
(48, 3, 10),
(61, 4, 1),
(62, 4, 2),
(63, 4, 3),
(64, 4, 4),
(65, 4, 5),
(66, 4, 6),
(67, 4, 7),
(68, 4, 8),
(69, 4, 9),
(70, 4, 10),
(71, 5, 1),
(72, 5, 2),
(73, 5, 4),
(74, 5, 5),
(75, 5, 7),
(76, 5, 8),
(77, 5, 9),
(78, 5, 10),
(79, 1, 1),
(80, 1, 2),
(81, 1, 4),
(82, 1, 7),
(83, 1, 8),
(84, 1, 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `room_features`
--

CREATE TABLE `room_features` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `features_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `room_features`
--

INSERT INTO `room_features` (`id`, `room_id`, `features_id`) VALUES
(15, 2, 1),
(16, 2, 3),
(17, 2, 4),
(18, 2, 6),
(21, 3, 1),
(22, 3, 2),
(23, 3, 3),
(24, 3, 4),
(25, 3, 5),
(26, 3, 6),
(34, 4, 1),
(35, 4, 2),
(36, 4, 3),
(37, 4, 4),
(38, 4, 5),
(39, 4, 6),
(40, 5, 1),
(41, 5, 3),
(42, 5, 4),
(43, 5, 5),
(44, 5, 6),
(45, 1, 1),
(46, 1, 4),
(47, 1, 5),
(48, 1, 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `room_images`
--

CREATE TABLE `room_images` (
  `sr_no` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `thumb` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `room_images`
--

INSERT INTO `room_images` (`sr_no`, `room_id`, `image`, `thumb`) VALUES
(1, 1, 'IMG_27318.png', 1),
(2, 1, 'IMG_13071.png', 0),
(3, 1, 'IMG_79467.jpg', 0),
(6, 2, 'IMG_68857.png', 0),
(7, 3, 'IMG_45251.png', 1),
(8, 3, 'IMG_36425.png', 0),
(9, 3, 'IMG_55172.png', 0),
(10, 3, 'IMG_93036.png', 0),
(11, 2, 'IMG_25959.png', 1),
(13, 2, 'IMG_95235.jpg', 0),
(14, 4, 'IMG_94254.png', 1),
(15, 4, 'IMG_52576.png', 0),
(16, 4, 'IMG_90532.png', 0),
(17, 4, 'IMG_50618.png', 0),
(18, 4, 'IMG_32802.png', 0),
(19, 5, 'IMG_30044.png', 0),
(20, 5, 'IMG_38243.png', 1),
(21, 5, 'IMG_54733.png', 0),
(22, 5, 'IMG_90721.jpg', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `room_numbers`
--

CREATE TABLE `room_numbers` (
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `room_no` varchar(100) NOT NULL,
  `room_status` varchar(100) NOT NULL DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `room_numbers`
--

INSERT INTO `room_numbers` (`id`, `type_id`, `room_no`, `room_status`) VALUES
(1, 1, 'S101', 'Available'),
(2, 1, 'S102', 'Available'),
(3, 1, 'S103', 'Available'),
(4, 1, 'S104', 'Available'),
(5, 1, 'S105', 'Available'),
(6, 1, 'S106', 'Available'),
(7, 1, 'S107', 'Available'),
(8, 1, 'S108', 'Available'),
(9, 1, 'S109', 'Available'),
(10, 1, 'S110', 'Available'),
(11, 2, 'D201', 'Available'),
(12, 2, 'D202', 'Available'),
(13, 2, 'D203', 'Available'),
(14, 2, 'D204', 'Available'),
(15, 2, 'D205', 'Available'),
(16, 2, 'D206', 'Available'),
(17, 2, 'D207', 'Checked In'),
(18, 3, 'L301', 'Available'),
(19, 3, 'L302', 'Available'),
(20, 3, 'L303', 'Available'),
(21, 3, 'L304', 'Available'),
(22, 3, 'L305', 'Available'),
(23, 4, 'M401', 'Available'),
(24, 4, 'M402', 'Available'),
(25, 4, 'M403', 'Available'),
(26, 4, 'M404', 'Available'),
(27, 4, 'M405', 'Available'),
(28, 5, 'C502', 'Available'),
(29, 5, 'C503', 'Available'),
(30, 5, 'C504', 'Available'),
(31, 5, 'C505', 'Available'),
(32, 5, 'C506', 'Available'),
(33, 5, 'C507', 'Available'),
(34, 5, 'C501', 'Booked');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings` (
  `sr_no` int(11) NOT NULL,
  `site_title` varchar(500) NOT NULL,
  `site_about` varchar(500) NOT NULL,
  `shutdown` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`sr_no`, `site_title`, `site_about`, `shutdown`) VALUES
(1, 'SkyHotel', 'Đến với SkyHotel, bạn sẽ được trải nghiệm dịch vụ nghỉ dưỡng đẳng cấp giữa lòng thành phố. Với thiết kế sang trọng, tiện nghi hiện đại và đội ngũ nhân viên chuyên nghiệp, SkyHotel cam kết mang đến cho quý khách kỳ nghỉ thoải mái và đáng nhớ. Chúng tôi luôn nỗ lực không ngừng để đáp ứng mọi nhu cầu của bạn.', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `team_details`
--

CREATE TABLE `team_details` (
  `sr_no` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `picture` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `team_details`
--

INSERT INTO `team_details` (`sr_no`, `name`, `picture`) VALUES
(1, 'Justin Bieber', 'IMG_80638.jpg'),
(2, 'Cristiano Ronaldo', 'IMG_16309.jpg'),
(3, 'Mical Jackson', 'IMG_44257.jpg'),
(4, 'Lionel Messi', 'IMG_59038.jpg'),
(5, 'Jame Lake', 'IMG_37222.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_cred`
--

CREATE TABLE `user_cred` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phonenum` varchar(100) NOT NULL,
  `cccd` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `profile` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `is_verified` int(11) NOT NULL DEFAULT 0,
  `token` varchar(250) DEFAULT NULL,
  `t_exprie` date DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `datentime` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user_cred`
--

INSERT INTO `user_cred` (`id`, `name`, `address`, `email`, `phonenum`, `cccd`, `dob`, `profile`, `password`, `is_verified`, `token`, `t_exprie`, `status`, `datentime`) VALUES
(1, 'Vũ Phi Trường', 'Phúc Diễn-Từ Liêm-Hà Nội-Việt Nam', 'pexuanmike@gmail.com', '0325584984', '098412412454', '2002-05-21', 'IMG_72151.jpeg', '$2y$10$h6LwVL.2M0hFtsJdznYu9eYptEshiaNMV8U4Hqz4M4Pt5AOTuAd3O', 1, '9cd8aa00016e27f9999de820f7f20b3e', NULL, 1, '2024-05-21'),
(2, 'Nguyễn Văn Admin', 'Ha Noi', 'sontungktp@gmail.com', '0989344031', '03320207942', '2002-05-22', 'IMG_95695.jpeg', '$2y$10$wPFwK4d5a1ag5UdvKdZNgedqCe5jHbsN2YlESz2O.nN85hkb2p3M2', 1, '0c31aedc55cae30beac29b6bc22c4970', NULL, 1, '2024-05-22'),
(3, 'Vũ Văn Admin', 'Hải Phòng', 'admin@gmail.com', '06541421414', '041242155231', '2002-05-22', 'IMG_22985.jpeg', '$2y$10$6ehuVu6RlIHh7cNXc6QA/.lAqVD3iPkRvlclNvHQSSYrcVqI79gmW', 1, '0b75e52496e3be735b0f7d652921f52f', NULL, 1, '2024-05-22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_queries`
--

CREATE TABLE `user_queries` (
  `sr_no` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(500) NOT NULL,
  `message` varchar(500) NOT NULL,
  `seen` int(11) NOT NULL DEFAULT 0,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user_queries`
--

INSERT INTO `user_queries` (`sr_no`, `name`, `email`, `subject`, `message`, `seen`, `date`) VALUES
(2, 'Vũ Văn Admin', 'Admin@gmail.com', 'Đánh giá dịch vụ', 'Tôi rất hài lòng với dịch vụ tại SkyHotel. Mọi thứ từ quá trình đặt phòng, check-in đến các tiện nghi trong phòng đều tuyệt vời. Đặc biệt, dịch vụ WiFi miễn phí và tốc độ cao rất hữu ích cho chuyến công tác của tôi. Cảm ơn SkyHotel vì trải nghiệm tuyệt vời này!', 0, '2024-05-21'),
(3, 'Mical Jackson', 'micaljackson@gmail.com', 'Đánh giá dịch vụ gym', 'Phòng gym tại SkyHotel thật sự rất ấn tượng. Thiết bị hiện đại và không gian thoáng đãng giúp tôi có những buổi tập luyện hiệu quả. Tôi rất đánh giá cao việc khách sạn đầu tư vào cơ sở vật chất chất lượng cao như vậy. Chắc chắn tôi sẽ quay lại trong lần sau.', 1, '2024-05-21'),
(4, 'Mical Jackson', 'micaljackson@gmail.com', 'Đánh giá nhân viên', 'Nhân viên tại SkyHotel rất thân thiện và chuyên nghiệp. Họ luôn sẵn sàng giúp đỡ và giải đáp mọi thắc mắc của tôi. Đặc biệt, nhân viên lễ tân đã hỗ trợ tôi rất nhiệt tình trong việc tìm địa điểm tham quan. Tôi cảm thấy rất hài lòng với dịch vụ của các bạn.', 1, '2024-05-21'),
(5, 'Vũ Phi Trường', 'pexuanmike@gmail.com', 'Phản hồi về dịch vụ', 'Tôi rất thất vọng với dịch vụ tại SkyHotel. Phòng không được dọn sạch sẽ khi tôi nhận phòng, và tiện nghi như khăn tắm và đồ vệ sinh cá nhân không được bổ sung đầy đủ. Hy vọng khách sạn sẽ cải thiện quy trình dọn dẹp và kiểm tra phòng trước khi giao cho khách.', 0, '2024-05-21'),
(6, 'Sơn tùng MTP', 'sontungmtp@gmail.com', 'Phản hồi về nhân viên', 'Nhân viên tại SkyHotel cần được đào tạo lại về thái độ phục vụ. Tôi đã gặp phải sự thiếu nhiệt tình và thậm chí là thô lỗ từ một số nhân viên lễ tân. Điều này làm giảm đáng kể trải nghiệm của tôi tại khách sạn. Mong rằng khách sạn sẽ chú trọng hơn đến việc cải thiện chất lượng phục vụ khách hàng.', 1, '2024-05-21');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin_cred`
--
ALTER TABLE `admin_cred`
  ADD PRIMARY KEY (`sr_no`);

--
-- Chỉ mục cho bảng `booking_details`
--
ALTER TABLE `booking_details`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Chỉ mục cho bảng `booking_order`
--
ALTER TABLE `booking_order`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `carousel`
--
ALTER TABLE `carousel`
  ADD PRIMARY KEY (`sr_no`);

--
-- Chỉ mục cho bảng `contact_details`
--
ALTER TABLE `contact_details`
  ADD PRIMARY KEY (`sr_no`);

--
-- Chỉ mục cho bảng `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `review_rating`
--
ALTER TABLE `review_rating`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `room_facilities`
--
ALTER TABLE `room_facilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facilities_id` (`facilities_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Chỉ mục cho bảng `room_features`
--
ALTER TABLE `room_features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `features_id` (`features_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Chỉ mục cho bảng `room_images`
--
ALTER TABLE `room_images`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `room_id` (`room_id`);

--
-- Chỉ mục cho bảng `room_numbers`
--
ALTER TABLE `room_numbers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`);

--
-- Chỉ mục cho bảng `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`sr_no`);

--
-- Chỉ mục cho bảng `team_details`
--
ALTER TABLE `team_details`
  ADD PRIMARY KEY (`sr_no`);

--
-- Chỉ mục cho bảng `user_cred`
--
ALTER TABLE `user_cred`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user_queries`
--
ALTER TABLE `user_queries`
  ADD PRIMARY KEY (`sr_no`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin_cred`
--
ALTER TABLE `admin_cred`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `booking_details`
--
ALTER TABLE `booking_details`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `booking_order`
--
ALTER TABLE `booking_order`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `carousel`
--
ALTER TABLE `carousel`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `contact_details`
--
ALTER TABLE `contact_details`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `features`
--
ALTER TABLE `features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `review_rating`
--
ALTER TABLE `review_rating`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `room_facilities`
--
ALTER TABLE `room_facilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT cho bảng `room_features`
--
ALTER TABLE `room_features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `room_images`
--
ALTER TABLE `room_images`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `room_numbers`
--
ALTER TABLE `room_numbers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `settings`
--
ALTER TABLE `settings`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `team_details`
--
ALTER TABLE `team_details`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `user_cred`
--
ALTER TABLE `user_cred`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `user_queries`
--
ALTER TABLE `user_queries`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `booking_details`
--
ALTER TABLE `booking_details`
  ADD CONSTRAINT `booking_details_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking_order` (`booking_id`);

--
-- Các ràng buộc cho bảng `booking_order`
--
ALTER TABLE `booking_order`
  ADD CONSTRAINT `booking_order_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `booking_order_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_cred` (`id`);

--
-- Các ràng buộc cho bảng `review_rating`
--
ALTER TABLE `review_rating`
  ADD CONSTRAINT `review_rating_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking_order` (`booking_id`),
  ADD CONSTRAINT `review_rating_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `review_rating_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user_cred` (`id`);

--
-- Các ràng buộc cho bảng `room_facilities`
--
ALTER TABLE `room_facilities`
  ADD CONSTRAINT `room_facilities_ibfk_1` FOREIGN KEY (`facilities_id`) REFERENCES `facilities` (`id`),
  ADD CONSTRAINT `room_facilities_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Các ràng buộc cho bảng `room_features`
--
ALTER TABLE `room_features`
  ADD CONSTRAINT `room_features_ibfk_1` FOREIGN KEY (`features_id`) REFERENCES `features` (`id`),
  ADD CONSTRAINT `room_features_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Các ràng buộc cho bảng `room_images`
--
ALTER TABLE `room_images`
  ADD CONSTRAINT `room_images_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Các ràng buộc cho bảng `room_numbers`
--
ALTER TABLE `room_numbers`
  ADD CONSTRAINT `room_numbers_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `rooms` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
