-- --------------------------------------------------------
-- 호스트:                          j8a105.p.ssafy.io
-- 서버 버전:                        10.11.2-MariaDB-1:10.11.2+maria~ubu2204 - mariadb.org binary distribution
-- 서버 OS:                        debian-linux-gnu
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- dimong 데이터베이스 구조 내보내기
DROP DATABASE IF EXISTS `dimong`;
CREATE DATABASE IF NOT EXISTS `dimong` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `dimong`;

-- 테이블 dimong.BADGES 구조 내보내기
DROP TABLE IF EXISTS `BADGES`;
CREATE TABLE IF NOT EXISTS `BADGES` (
  `badge_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `badge_image_url` varchar(255) DEFAULT NULL,
  `badge_name` varchar(255) DEFAULT NULL,
  `dinosaur_id` bigint(20) DEFAULT NULL,
  `is_collected` bit(1) DEFAULT b'0',
  PRIMARY KEY (`badge_id`),
  KEY `FKtg6tp2q3cgrk0li2u9wih9sl7` (`dinosaur_id`),
  CONSTRAINT `FKtg6tp2q3cgrk0li2u9wih9sl7` FOREIGN KEY (`dinosaur_id`) REFERENCES `DINOSAURS` (`dinosaur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 dimong.BADGES:~30 rows (대략적) 내보내기
DELETE FROM `BADGES`;
/*!40000 ALTER TABLE `BADGES` DISABLE KEYS */;
INSERT INTO `BADGES` (`badge_id`, `badge_image_url`, `badge_name`, `dinosaur_id`, `is_collected`) VALUES
	(1, 'https://picsum.photos/50/50', '티라노사우르스', 1, b'0'),
	(2, 'https://picsum.photos/50/50', '벨로시랩터', 2, b'0'),
	(3, 'https://picsum.photos/50/50', '이구아노돈', 3, b'0'),
	(4, 'https://picsum.photos/50/50', '안킬로사우루스', 4, b'0'),
	(5, 'https://picsum.photos/50/50', '파키케팔로사우루스', 5, b'0'),
	(6, 'https://picsum.photos/50/50', '모사사우루스', 6, b'0'),
	(7, 'https://picsum.photos/50/50', '인시시보사우루스', 7, b'0'),
	(8, 'https://picsum.photos/50/50', '노도사우루스', 8, b'0'),
	(9, 'https://picsum.photos/50/50', '오비랍토르', 9, b'0'),
	(10, 'https://picsum.photos/50/50', '스피노사우루스', 10, b'0'),
	(11, 'https://picsum.photos/50/50', '브라키오사우루스', 11, b'0'),
	(12, 'https://picsum.photos/50/50', '딜로포사우루스', 12, b'0'),
	(13, 'https://picsum.photos/50/50', '친타오사우루스', 13, b'0'),
	(14, 'https://picsum.photos/50/50', '기가노토사우루스', 14, b'0'),
	(15, 'https://picsum.photos/50/50', '사우로파가낙스', 15, b'0'),
	(16, 'https://picsum.photos/50/50', '파라사우롤로푸스', 16, b'0'),
	(17, 'https://picsum.photos/50/50', '아르헨티노사우루스', 17, b'0'),
	(18, 'https://picsum.photos/50/50', '오우라노사우루스', 18, b'0'),
	(19, 'https://picsum.photos/50/50', '케찰코아틀루스', 19, b'0'),
	(20, 'https://picsum.photos/50/50', '스테고사우루스', 20, b'0'),
	(21, 'https://picsum.photos/50/50', '다센트루루스', 21, b'0'),
	(22, 'https://picsum.photos/50/50', '디모르포돈', 22, b'0'),
	(23, 'https://picsum.photos/50/50', '프테라노돈', 23, b'0'),
	(24, 'https://picsum.photos/50/50', '람베오사우루스', 24, b'0'),
	(25, 'https://picsum.photos/50/50', '알로사우루스', 25, b'0'),
	(26, 'https://picsum.photos/50/50', '카스모사우루스', 26, b'0'),
	(27, 'https://picsum.photos/50/50', '엘라스모사우루스', 27, b'0'),
	(28, 'https://picsum.photos/50/50', '콤프소그나투스', 28, b'0'),
	(29, 'https://picsum.photos/50/50', '켄트로사우루스', 29, b'0'),
	(30, 'https://picsum.photos/50/50', '트리케라톱스', 30, b'0');
/*!40000 ALTER TABLE `BADGES` ENABLE KEYS */;

-- 테이블 dimong.DINOSAURS 구조 내보내기
DROP TABLE IF EXISTS `DINOSAURS`;
CREATE TABLE IF NOT EXISTS `DINOSAURS` (
  `dinosaur_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dinosaur_aggression` int(11) DEFAULT NULL,
  `dinosaur_audio_url` varchar(2000) DEFAULT NULL,
  `dinosaur_characteristic` varchar(2000) NOT NULL,
  `dinosaur_habitat` varchar(255) NOT NULL,
  `dinosaur_image_url` varchar(2000) DEFAULT NULL,
  `dinosaur_intellect` int(11) DEFAULT NULL,
  `dinosaur_length` varchar(255) NOT NULL,
  `dinosaur_name` varchar(255) NOT NULL,
  `dinosaur_nickname` varchar(255) NOT NULL,
  `dinosaur_taste` varchar(255) NOT NULL,
  `dinosaur_weight` varchar(255) NOT NULL,
  `geologic_age` varchar(255) NOT NULL,
  `isCollected` bit(1) NOT NULL,
  `is_collected` bit(1) DEFAULT NULL,
  PRIMARY KEY (`dinosaur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 dimong.DINOSAURS:~30 rows (대략적) 내보내기
DELETE FROM `DINOSAURS`;
/*!40000 ALTER TABLE `DINOSAURS` DISABLE KEYS */;
INSERT INTO `DINOSAURS` (`dinosaur_id`, `dinosaur_aggression`, `dinosaur_audio_url`, `dinosaur_characteristic`, `dinosaur_habitat`, `dinosaur_image_url`, `dinosaur_intellect`, `dinosaur_length`, `dinosaur_name`, `dinosaur_nickname`, `dinosaur_taste`, `dinosaur_weight`, `geologic_age`, `isCollected`, `is_collected`) VALUES
	(1, 5, 'https://j8a105.p.ssafy.io/static/detail/%ED%8B%B0%EB%9D%BC%EB%85%B8%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.wav', '강력한 턱에 60개의 이빨을 지니고, 각 이빨은 최대 20cm의 길이를 가졌으며, 무는 힘은 사자보다 15배 강합니다. 트리케라톱스와 에드몬토 사우루스 화석 뼈에 발견된 깨물린 흔적들은 티라노사우루스가 뼈를 꿰뚫 먹을 수 있다는 것을 보여줍니다. 화석화된 티라노사우루스의 대변 분석 결과는 먹이의 뼈를 소화하지 않고 그대로 삼켰다는 것을 알려줍니다. 후각이 좋기 때문에, 죽은 동물의 사체를 찾아 먹기도 하였습니다,  티라노사우루스 무리의 화석이 발견된 적이 없어, 혼자서 사냥을 했을 것으로 추측하고 있습니다.', '북아메리카', 'https://storage.googleapis.com/dimong-be.appspot.com/dinosaur_image/%ED%8B%B0%EB%9D%BC%EB%85%B8%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.png', 3, '10-13m', '티라노사우루스', '폭군 도마뱀', '육식', '5,400-6,800kg', '백악기', b'0', b'1'),
	(2, 3, 'https://j8a105.p.ssafy.io/static/detail/%EB%B2%A8%EB%A1%9C%EC%8B%9C%EB%9E%A9%ED%84%B0.wav', '몸집은 작지만 빠른 속도와 민첩성으로 무리를 지어 몸집이 더 큰 먹잇감을 사냥하였습니다.  날카로운 발톱을 물론, 잘 발달된 뒷다리와 강하고 긴 꼬리를 가지고 있습니다.  또한 긴 꼬리를 길고 납작한 막대기가 지지하고 있어, 빠른 속도를 가지고 있습니다. 고비 사막에서 처음 발견되었으며, 머리가 길어 날카로운 이빨을 많이 가지고 있습니다. 커다란 앞발과 그 앞발에 있는 강력한 무기인 \'낫\' 형태의 두번째 발톱은 사냥감을 베어낼 수 있는 무기로 사용되었습니다.', '몽골, 중국', 'https://storage.googleapis.com/dimong-be.appspot.com/dinosaur_image/%EB%B2%A8%EB%A1%9C%EC%8B%9C%EB%9E%A9%ED%84%B0.png', 4, '1.5-2m', '벨로시랩터', '빠른 약탈자', '육식', '10-15kg', '백악기', b'0', b'1'),
	(3, 3, 'https://j8a105.p.ssafy.io/static/detail/%EC%9D%B4%EA%B5%AC%EC%95%84%EB%85%B8%EB%8F%88.wav', '이구아나의 이빨처럼 생긴 이빨을 가지고 있습니다. 비교적 작은 머리와 주둥이의 제일 끝에는 부리가 있습니다. 뒷발이 잘 발달되어 있고, 이족보행과 사족보행을 하였습니다. 육중한 꼬리는 이구아나돈이 걸을 때 균형을 잡아주는 역할을 하였습니다. 처음에는 코뿔이라고 생각되었던 것이 엄지손가락 끝에 달린 무기로 밝혀졌습니다. 이 삐죽 나온 무기는 포식자에 대항하는 방어용 무기로 사용되었을 것입니다.', '유라시아', 'https://storage.googleapis.com/dimong-be.appspot.com/dinosaur_image/%EC%9D%B4%EA%B5%AC%EC%95%84%EB%85%B8%EB%8F%88.png', 3, '10m', '이구아노돈', '이구아나의 이빨', '초식', '4,000-5,000kg', '백악기', b'0', b'1'),
	(4, 4, 'https://j8a105.p.ssafy.io/static/detail/%EC%95%88%ED%82%AC%EB%A1%9C%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.wav', '외피에 골편(뼛조각)이 있는 가장 큰 공룡 중 하나로, 두개골부터 꼬리까지 골편이 이어져있습니다. 또한 몸체가 납작해 각도상 포식자가 온전한 힘으로 물기가 어려웠고, 꼬리에 곤봉이 있어 든든한 방어 능력이 있었습니다. 부리 모양의 주둥이로 작물 식물을 주로 섭취하였으며, 매우 큰 소화기관을 가지고 있었습니다.', '북아메리카 서부', 'https://storage.googleapis.com/dimong-be.appspot.com/dinosaur_image/%EC%95%88%ED%82%AC%EB%A1%9C%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.png', 2, '7m', '안킬로사우루스', '포식자의 왕', '초식', '6,000kg', '백악기', b'0', b'1'),
	(5, 2, 'https://j8a105.p.ssafy.io/static/detail/%ED%8C%8C%ED%82%A4%EC%BC%80%ED%8C%94%EB%A1%9C%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.wav', '머리가 꽤나 크며, 두개골에 최대 25cm 두께의 두꺼운 돔을 가지고 있습니다.  두개골의 두께가 이만큼 두꺼운 대신 그 반동으로 뇌의 크기는 달걀만 했을 것으로 추정된다. 시력이 좋고 양안시를 가졌습니다. 두개골에 대해 두 가지 시각이 있는데, 먼저, 목 뒤에 강력한 근육이 충격을 흡수하여, 두개골이 포식자들을 들이받는데 사용했다고 보는 시각이 있습니다. 이에 반하여, 두께에 비해 깨지기 쉽기 때문에, 짝짓기때 수컷이 암컷 앞에 과시하는 용도였다는 시각도 있습니다.', '북아메리카', 'https://storage.googleapis.com/dimong-be.appspot.com/dinosaur_image/%ED%8C%8C%ED%82%A4%EC%BC%80%ED%8C%94%EB%A1%9C%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.png', 3, '4-5m', '파키케팔로사우루스', '두개골 도마뱀', '초식', '450kg', '백악기', b'0', b'1'),
	(6, 4, 'https://j8a105.p.ssafy.io/static/detail/%EB%AA%A8%EC%82%AC%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.wav', '거대한 덩치, 강력한 하악골, 그리고 단단한 이빨을 가지고 있어 생태계에서 높은 지위를 가졌을 것입니다. 후각은 약했지만 뛰어난 시력을 가진 포식자였습니다. 추정되는 먹이는 암모나이트, 상어, 장경룡 그리고 다른 모사사우루스가 있습니다. 장경룡의 한 종류로 잘못 알고 있는 경우가 있는데, 실제로는 뱀과에 가까우며, 왕도마뱀과 뱀등과 유사한 점이 많습니다.', '전 세계 바다', 'https://storage.googleapis.com/dimong-be.appspot.com/dinosaur_image/%EB%AA%A8%EC%82%AC%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.png', 2, '10-13m', '모사사우루스', '상어도마뱀', '육식', '6,000kg', '백악기', b'0', b'1'),
	(7, 1, 'https://j8a105.p.ssafy.io/static/detail/%EC%9D%B8%EC%8B%9C%EC%8B%9C%EB%B3%B4%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.wav', '깃털과 부리를 가지고 있는 새를 많이 닮은 공룡입니다. 앞발과 꼬리는 깃털을 가지고 있었으며, 타조와 같이 긴 뒷다리를 가지고 있었습니다. 부리의 앞니가 발달했으며, 작은 머리와 꼬리를 가지고 있습니다. 몸체가 작아, 외부의 공격에 빠르게 돌, 나무, 숲으로 몸을 숨겨 생존했으리라 예상됩니다.', '동아시아(중국)', 'https://storage.googleapis.com/dimong-be.appspot.com/dinosaur_image/%EC%9D%B8%EC%8B%9C%EC%8B%9C%EB%B3%B4%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.png', 3, '1-1.25m', '인시시보사우루스', '거대한 가시 도마뱀', '잡식', '6-7kg', '백악기', b'0', b'0'),
	(8, 2, 'https://j8a105.p.ssafy.io/static/detail/%EB%85%B8%EB%8F%84%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.wav', '단단한 피부로 둘러쌓인 육중한 몸으로 마치 탱크처럼 걸어다녔습니다. 짧은 다리 네개와 다섯 개의 발가락을 가졌습니다. 안킬로사우르스와 먼 친척이기도 한 노도사우르스의 꼬리엔 곤봉이 없고 길고 뻣뻣했습니다. 좁고 뾰족한 주둥이와 작은 이빨로 부드러운 식물을 먹었답니다. 등과 옆구리에 단단한 피부와 가시로 덮여있어 육식 공룡으로부터 자신을 보호할 수 있었습니다.\r\n', '북아메리카', 'https://storage.googleapis.com/dimong-be.appspot.com/dinosaur_image/%EB%85%B8%EB%8F%84%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.png', 2, '4.5-5.5m', '노도사우루스', '노르딕 도마뱀', '초식', '1,300kg', '백악기', b'0', b'1'),
	(9, 1, 'https://j8a105.p.ssafy.io/static/detail/%EC%98%A4%EB%B9%84%EB%9E%8D%ED%86%A0%EB%A5%B4.wav', '짧은 돔 형태의 머리와 이빨이 없는 부리, 독특한 볏을 가지고 있습니다. 짧고 높은 주둥이에 크게 휜 턱과 넓은 부리, 그리고 턱근육을 가지고 있어 무는 힘이 매우 강했을 것으로 추정하며, 도마뱀을 먹이로 했습니다. 오비랍토르의 공룡알과 둥지는 공룡이 알을 낳는다는 것을 보여준 최초의 증거였으며, 알의 크기는 핫도그 빵 정도의 크기입니다. 알을 훔쳐먹다가 화석이 된 것으로 추정하여 알도둑이라는 뜻의 이름을 가지게 되었습니다.', '유라시아', 'https://storage.googleapis.com/dimong-be.appspot.com/dinosaur_image/%EC%98%A4%EB%B9%84%EB%9E%8D%ED%86%A0%EB%A5%B4.png', 3, '1.8-2m', '오비랍토르', '알도둑', '육식', '25-35kg', '백악기', b'0', b'1'),
	(10, 5, 'https://j8a105.p.ssafy.io/static/detail/%EC%8A%A4%ED%94%BC%EB%85%B8%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.wav', '두개골이 악어의 두개골처럼 생겼고, 물고기를 먹이로 하였습니다. 주둥이가 악어와 비슷하게 길고 평평하며, 주둥이 안으로는 날카로운 이빨을 가지고 있습니다.  악어와 비슷한 생김새로 물고기를 주로 잡아먹거나 죽은 동물을 먹었을 것으로 추측하고 있습니다.\r\n등 위로 최대 1.5m가 넘는 길이의 가시 같은 돛 모양의 돌기를 가지고 있습니다. 이 돌기로 몸집을 더 크고 무서워보이게 하고 체온 조절을 했을 뿐만 아니라, 가시들 사이 연결된 피부 색깔로 의사소통을 하였습니다. 북아프리카 지역에서 발견된 화석은 부채 모양의 돛을 가지고 있기도 합니다.', '아프리카', 'https://storage.googleapis.com/dimong-be.appspot.com/dinosaur_image/%EC%8A%A4%ED%94%BC%EB%85%B8%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.png', 2, '12-17m', '스피노사우루스', '가시 도마뱀', '육식', '12,000-20,000kg', '백악기 ', b'0', b'1'),
	(11, 2, 'https://j8a105.p.ssafy.io/static/detail/%EB%B8%8C%EB%9D%BC%ED%82%A4%EC%98%A4%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.wav', '앞다리가 뒷다리보다 훨씬 길어, 팔도마뱀의 뜻인 이름이 지어졌습니다. 주로 먹었던 식물은 당시에 살았던 은행나무, 나무 고사리, 커다란 소철, 그리고 다양한 침엽수가 있습니다. 커다란 몸집을 잘 유지하기 위해, 하루에 200~400kg 정도나 되는 먹이를 먹었을 것입니다. 긴 목이 어떻게 움직이는지에 대해서는 논쟁 중이며, 아직까지는 정확하게 결론나지 않았습니다.', '북아메리카', 'https://storage.googleapis.com/dimong-be.appspot.com/dinosaur_image/%EB%B8%8C%EB%9D%BC%ED%82%A4%EC%98%A4%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.png', 2, '9-13m', '브라키오사우루스', '팔 도마뱀', '초식', '25,000-29,000kg', '쥐라기', b'0', b'1'),
	(12, 3, 'https://j8a105.p.ssafy.io/static/detail/%EB%94%9C%EB%A1%9C%ED%8F%AC%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.wav', '머리 위에 V자 모양의 볏을 가지고 있습니다. 볏은 동료에게 신호를 보내는 수단이나 짝을 유혹하는 수단으로 추정하고 있습니다. 같은 장소에서 두마리의 화석이 발견된 것으로 보아, 일부 기간 동안은 무리생활을 했습니다. 첫번째 앞 발가락은 마치 엄지 발가락처럼 움직여 먹이를 쥐거나 잡을 수 있었습니다. 턱에는 칼날 같은 이빨이 많으며, 이와 유사한 공룡이 중국 전기 쥐라기 지층에서 발견되었는데, 아직 그 공룡이 딜로포사우루스인지는 논쟁중입니다.', '북아메리카', 'https://storage.googleapis.com/dimong-be.appspot.com/dinosaur_image/%EB%94%9C%EB%A1%9C%ED%8F%AC%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.png', 2, '1.8m', '딜로포사우루스', '볏이 두 개인 도마뱀', '육식', '400-500kg', '쥐라기', b'0', b'1'),
	(13, 2, 'https://j8a105.p.ssafy.io/static/detail/%EC%B9%9C%ED%83%80%EC%98%A4%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.wav', '머리 위에 유니콘의 뿔처럼 생긴 돌기를 가지고 있습니다. 이 돌기는 특이하게 무기로 사용되지않았습니다. 대신에 암컷을 유혹하거나 동료에게 신호를 보내는 도구로 추정하고 있습니다. 콧구멍에서부터 연결되는 관이 있는데, 이 것으로 소리를 냈을 것으로 추정하고 있습니다. 돌기에 비어있는 공간이 있어 무게를 최소화했습니다. 초식공룡으로서 빠른 다리 이와에는 포식자에게 대응할 수 있는 방어수단은 따로 없었으며, 무리생활을 했습니다.', '중국', 'https://storage.googleapis.com/dimong-be.appspot.com/dinosaur_image/%EC%B9%9C%ED%83%80%EC%98%A4%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.png', 2, '3.6m', '친타오사우루스', '친타오 도마뱀', '초식', '3,000-5,000kg', '백악기', b'0', b'0'),
	(14, 3, 'https://j8a105.p.ssafy.io/static/detail/%EA%B8%B0%EA%B0%80%EB%85%B8%ED%86%A0%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.wav', '티라노사우루스 렉스보다 더 키가 크고 길지만 날씬한 몸무게를 가지고 있었습니다. 이족보행을 하는 것은 같지만 티라노와 달리 3개의 손가락을 가지고 있었습니다. 주둥이에는 14~20cm의 단검 같은 이빨을 가지고 있었지만 무는 힘은 티라노사우루스의 3분의1 정도였습니다. 다리뼈의 비율로 보아 빠르게 달리진 못했을 것입니다. 무리를 이루어 사냥을 했을 것으로 추정하며, 남미에서 함께 서식했던 아르헨티노사우루스를 사냥했을 수도 있습니다.', '남아메리카', 'https://storage.googleapis.com/dimong-be.appspot.com/dinosaur_image/%EA%B8%B0%EA%B0%80%EB%85%B8%ED%86%A0%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.png', 2, '12-13m', '기가노토사우루스', '거대한 남부 도마뱀', '육식', '4,200-14,000kg', '백악기', b'0', b'1'),
	(15, 5, 'https://j8a105.p.ssafy.io/static/detail/%EC%82%AC%EC%9A%B0%EB%A1%9C%ED%8C%8C%EA%B0%80%EB%82%99%EC%8A%A4.wav', '알로사우르스와 비슷하게 생겼지만 사우로파가낙스가 더 큰 몸집을 가졌습니다. 사냥 방식에 대해서는 여러가지 학설이 있습니다.  몸집이 커서 작고 빠른 사냥감을 직접 사냥하기보다, 남은 음식을 처리하는 스캐빈저 였다고 하는 학설이 있습니다. 또 반대로 몸무게가 티라노사우르스보다 적기 때문에 알로사우르스처럼 직접 먹잇감을 사냥했다고 하는 학설도 있습니다. 화석이 많이 발견되지 않아서 행동에 대해 많은 것이 알려져 있지 않은 공룡입니다.', '북아메리카', 'https://storage.googleapis.com/dimong-be.appspot.com/dinosaur_image/%EC%82%AC%EC%9A%B0%EB%A1%9C%ED%8C%8C%EA%B0%80%EB%82%99%EC%8A%A4.png', 2, '10-13m', '사우로파가낙스', '도마뱀을 잡아먹는 지배자', '육식', '3,000-4,500kg', '쥐라기', b'0', b'0'),
	(16, 1, 'https://j8a105.p.ssafy.io/static/detail/%ED%8C%8C%EB%9D%BC%EC%82%AC%EC%9A%B0%EB%A1%A4%EB%A1%9C%ED%91%B8%EC%8A%A4.wav', '1.6에서 2미터의 긴 두개골 및 볏이 있고 오리 주둥이를 가지고 있습니다. 가장 진화한 초식공룡 중 하나로, 빠르게 이동 시에는 이족 보행을 했을 것으로 추측하고 있습니다. 볏은 속이 비워져 있으며, 코와 연결되어 있습니다.  트롬본 같은 소리를 내어 육식 공룡의 습격을 멀리 떨어져 있는 같은 무리에게 위험을 알려주거나, 종족간의 의사소통을 했을 것으로 추정하고 있습니다.', '북아메리카', 'https://storage.googleapis.com/dimong-be.appspot.com/dinosaur_image/%ED%8C%8C%EB%9D%BC%EC%82%AC%EC%9A%B0%EB%A1%A4%EB%A1%9C%ED%91%B8%EC%8A%A4.png', 2, '9-10m', '파라사우롤로푸스', '파라나 강의 도마뱀', '초식', '2,500-3,600kg', '백악기', b'0', b'0'),
	(17, 2, 'https://j8a105.p.ssafy.io/static/detail/%EC%95%84%EB%A5%B4%ED%97%A8%ED%8B%B0%EB%85%B8%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.wav', '온전한 화석이 없어 정확한 크기는 추정하기 어렵지만, 지금까지 발견된 동물 중 가장 큰 육상 동물 중 하나로 꼽힙니다.  살아 있는 동안에는 성장을 계속 했으며, 긴 목으로 바닥을 쓸거나 높이 있는 풀을 섭취하였습니다. 무리 생활을 하고, 긴 꼬리는 긴 목이 움직이는 동안 무게 중심을 유지하는 역할을 하였습니다. 새끼 공룡이 성인이 될 때까지는 약 15년 정도 걸렸으며, 이 기간동안은 포식자에게 취약하였습니다.', '아르헨티나', 'https://storage.googleapis.com/dimong-be.appspot.com/dinosaur_image/%EC%95%84%EB%A5%B4%ED%97%A8%ED%8B%B0%EB%85%B8%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.png', 2, '30-35m', '아르헨티노사우루스', '거대한 목의 공룡', '초식', '60,000-75,000kg', '백악기', b'0', b'1'),
	(18, 2, 'https://j8a105.p.ssafy.io/static/detail/%EC%98%A4%EC%9A%B0%EB%9D%BC%EB%85%B8%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.wav', '주둥이에 오리같은 부리로 강가의 식물들을 먹는데 유리하였습니다. 등뼈 위에 커다란 돛모양의 척추 돌기로 체온을 조절하였습니다. 앞다리가 뒷다리에 비해 훨씬 짧은데, 낮은 키의 식물을 먹기 편하도록 몸을 앞으로 수그리는데 적합한 체형이었습니다. 5개의 앞발가락 중 3개는 체중을 지탱하는 역할을 담당하였습니다.', '서아프리카', 'https://storage.googleapis.com/dimong-be.appspot.com/dinosaur_image/%EC%98%A4%EC%9A%B0%EB%9D%BC%EB%85%B8%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.png', 2, '6m', '오우라노사우루스', '용감한 도마뱀', '초식', '1,000kg', '백악기', b'0', b'0'),
	(19, 3, 'https://j8a105.p.ssafy.io/static/detail/%EC%BC%80%EC%B0%B0%EC%BD%94%EC%95%84%ED%8B%80%EB%A3%A8%EC%8A%A4.wav', '긴 목, 가늘고 긴 부리 그리고 원숭이 크기의 날개를 가지고 있습니다. 날개를 가지고 있음에도 대부분의 시간은 지상에서 걸어 다니며 긴 부리로  물고기나 작은 동물을 사냥했습니다. 지금까지 살았던 조류 중에서 가장 큰 날개폭을 가진것으로 알려져 있습니다. 최대 날개폭이 12미터로 경비행기 만큼이나 큽니다.', '북아메리카', 'https://storage.googleapis.com/dimong-be.appspot.com/dinosaur_image/%EC%BC%80%EC%B0%B0%EC%BD%94%EC%95%84%ED%8B%80%EB%A3%A8%EC%8A%A4.png', 2, '10-15m', '케찰코아틀루스', '날개를 가진 큰 뱀', '육식', '250kg', '백악기', b'0', b'1'),
	(20, 3, 'https://j8a105.p.ssafy.io/static/detail/%EC%8A%A4%ED%85%8C%EA%B3%A0%EC%82%AC%EC%9A%B0%EB%A5%B4%EC%8A%A4.wav', '목부터 꼬리까지 한쌍으로 커다란 골판과 꼬리 끝에 커다란 골침을 가지고 있었습니다. 골판은 포식자로부터 방어해줄 뿐만 아니라, 몸체의 온도를 조절하는 기능을 가지고 있었습니다. 커다란 골반은 가장 큰 골판을 가지고 있었고, 꼬리와 뒷다리의 큰 근육을 지탱하는 역할을 했습니다. 뒷다리가 앞다리보다 발달하여 머리가 항상 지면쪽으로 향해있었습니다. 이러한 다리 구조로 빨리 뛸 수는 없었겠지만, 꼬리의 골침으로 포식자에게 대응했을 것으로 보입니다. 몸 크기에 비해 뇌 크기가 매우 작은 공룡으로 손꼽힙니다.', '북아메리카', 'https://storage.googleapis.com/dimong-be.appspot.com/dinosaur_image/%EC%8A%A4%ED%85%8C%EA%B3%A0%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.png', 2, '9m', '스테고사우루스', '지붕 도마뱀', '초식', '2,000-5,000kg', '쥐라기', b'0', b'1'),
	(21, 2, 'https://j8a105.p.ssafy.io/static/detail/%EB%8B%A4%EC%84%BC%ED%8A%B8%EB%A3%A8%EB%A3%A8%EC%8A%A4.wav', '등에 있는 골편이 2열로 위치하고 있으며 꼬리 부분엔 가시가 2열로 위치하고 있습니다. 뒷다리 보다 비교적 짧은 앞다리를 가지고 있지만 다른 검룡류 보다는 긴 편에 속합니다. 배와 등판이 넓은 공룡입니다.앞다리와 뒷다리의 차이 때문에 빨리 뛰진 못했지만, 무시무시한 골창이 있어 육식공룡에 대항할 수 있었습니다.', '유럽', 'https://storage.googleapis.com/dimong-be.appspot.com/dinosaur_image/%EB%8B%A4%EC%BC%84%ED%8A%B8%EB%A3%A8%EB%A3%A8%EC%8A%A4.png', 2, '4m', '다센트루루스', '길쭉한 공룡', '초식', '1,400-2,000kg', '쥐라기', b'0', b'1'),
	(22, 1, 'https://j8a105.p.ssafy.io/static/detail/%EB%94%94%EB%AA%A8%EB%A5%B4%ED%8F%AC%EB%8F%88.wav', '왕부리과새중에서 가장 잘알려진 투칸 처럼 큰 입을 가졌습니다. 쥬라기에 살았던 익룡이지만 몸에 비해 날개가 짧아서 제대로 된 비행은 어려웠습니다. 또한 몸의 무게중심이 낮고 상대적으로 커다란 발톱을 가지고 있음을 고려하면 나무를 타는 능력이 탁월했을 것으로 보이며, 한때 두 다리로 걸어다녔을 것이라는 추정까지 나올 정도로 발달한 뒷다리와 골반뼈를 이용해 현생 고양이나 담비처럼 도약하듯 땅 위를 뛰어다니면서 사냥감을 쫓았을 가능성이 높다고 합니다.', '유럽, 북아메리카', 'https://storage.googleapis.com/dimong-be.appspot.com/dinosaur_image/%EB%94%94%EB%AA%A8%EB%A5%B4%ED%8F%AC%EB%8F%88.png', 2, '1m', '디모르포돈', '두 가지 모양의 이빨', '육식', '2kg', '쥐라기', b'0', b'1'),
	(23, 1, 'https://j8a105.p.ssafy.io/static/detail/%ED%94%84%ED%85%8C%EB%9D%BC%EB%85%B8%EB%8F%88.wav', '긴 목과 부리에 비해 상대적으로 작은 몸통을 가지고 있으나 날개를 활짝 피면, 수컷은 5~6m, 암컷은 그보다 작은 4m 정도에 이릅니다. 이빨이 없는 부리를 가지고 있으며, 갈고리 모양의 앞발은 절벽에 매달리기 좋습니다. 이전에는 수면 위에서 활강하며, 물을 갈라 사냥하는 것으로 많이 묘사되었지만, 실제로는 다리가 매우 부실하는 등, 신체구조상 해당 가설이 불가능하다고 판명되었습니다. 대신에 낮은 고도에서 물에 뛰어드는 사냥 방식의 가설이 주목받고 있습니다.', '아메리카 연안', 'https://storage.googleapis.com/dimong-be.appspot.com/dinosaur_image/%ED%94%84%ED%85%8C%EB%9D%BC%EB%85%B8%EB%8F%88.png', 2, '1.8m', '프테라노돈', '고대 날쥐', '어식', '20-40kg', '백악기', b'0', b'1'),
	(24, 1, 'https://j8a105.p.ssafy.io/static/detail/%EB%9E%8C%EB%B2%A0%EC%98%A4%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.wav', '도끼모양의 볏을 가지고 있으며, 각 개체에 따라 조금씩 모양이 다른데, 이러한 변화는 성장하면서 나타나는 특징으로 확인되었습니다. 자랄수록 부리는 더 길고 좁아지며, 볏은 더 높아지고 정교해집니다. 대부분의 원시적인 초식공룡과 비교해, 턱에 여러 열의 치열이 발달하였고, 이빨 위에 다른 이빨이 포개져 있습니다. 이러한 특징으로 턱한쪽에만 최대 360개의 이빨이 존재하였고, 총 이빨 수 는 1400개가 넘었습니다.', '북아메리카', 'https://storage.googleapis.com/dimong-be.appspot.com/dinosaur_image/%EB%9E%8C%EB%B2%A0%EC%98%A4%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.png', 2, '9-15m', '람베오사우루스', '람베의 도마뱀', '초식', '3,000-8,500kg', '백악기', b'0', b'0'),
	(25, 4, 'https://j8a105.p.ssafy.io/static/detail/%EC%95%8C%EB%A1%9C%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.wav', '머리 위쪽에 특이한 볏이 있는데, 크고 뾰족한 것, 작고 둥근 것 두가지로 나누어집니다. 15cm나 되는 뾰족하고 예리한 발톱으로 최고의 포식자 중 하나였습니다. 뒷다리에 비해 앞다리가 짧지만 발달된 꼬리로 중심을 잡았을 것입니다. 숲속에서 숨어있다가 느린 용각류나 조각류 공룡을 주로 사냥하였습니다.', '북아메리카', 'https://storage.googleapis.com/dimong-be.appspot.com/dinosaur_image/%EC%95%8C%EB%A1%9C%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.png', 2, '3.5m', '알로사우루스', '다른 도마뱀', '육식', '1,700kg', '쥐라기', b'0', b'1'),
	(26, 3, 'https://j8a105.p.ssafy.io/static/detail/%EC%B9%B4%EC%8A%A4%EB%AA%A8%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.wav', '발견된 공룡 중에 가장 큰 머리를 가진 공룡이에요. 그 큰 몸집을 가진 공룡이라서, 여러 마리가 모여서 같이 살았을 가능성이 있어요. 머리에는 작은 코뿔리 하나와 눈 위에 중간 크기의 뿔이 하나씩 있어요. 그리고 종류에 따라서 뿔과 프릴의 모양이 조금씩 다를 수 있어요. 50cm 정도 큰 프릴은 방어할 용도보다는 자랑할 용도로 사용했을 거예요. 프릴 가장자리에는 작은 뿔들이 달려있고, 큰 구멍들이 있어요. 현재 우리가 아는 코뿔소와 비슷한 모습이지만, 훨씬 큰 생물이에요.', '북아메리카', 'https://storage.googleapis.com/dimong-be.appspot.com/dinosaur_image/%EC%B9%B4%EC%8A%A4%EB%AA%A8%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.png', 2, '5m', '카스모사우루스', '갈라진 도마뱀', '초식', '1,300kg', '백악기', b'0', b'1'),
	(27, 1, 'https://j8a105.p.ssafy.io/static/detail/%EC%97%98%EB%9D%BC%EC%8A%A4%EB%AA%A8%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.wav', '몸길이의 70%를 차지하는 긴 목이 특징으로, 목뼈의 개수는 무려 72개, 목 길이만 7m 이상입니다. 척추 동물 중에서는 이만큼 많은 목뼈를 가진 동물이 없는데, 각각의 뼈마디가 꺾이는 각도가 매우 제한적이며, 위아래로도 잘 꺾이지 않았을 것입니다. 실제로는 발견된 화석이 거의 없으며, 유사한 공룡인 스틱소사우루스를 참고하여 모습이 그려져있다. 목구멍에 들어갈만한 적당한 크기의 어류나 두족류, 작은 해양 파충류 따위를 주로 잡아먹었을 것으로 추정됩니다.', '북아메리카 서부', 'https://storage.googleapis.com/dimong-be.appspot.com/dinosaur_image/%EC%97%98%EB%9D%BC%EC%8A%A4%EB%AA%A8%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.png', 2, '14m', '엘라스모사우루스', '헤라클레스의 뱀', '육식', '2,200kg', '백악기', b'0', b'1'),
	(28, 1, 'https://j8a105.p.ssafy.io/static/detail/%EC%BD%A4%ED%94%84%EC%86%8C%EA%B7%B8%EB%82%98%ED%88%AC%EC%8A%A4.wav', '가장 작은 공룡 중 하나로 머리에서 꼬리 끝까지의 길이가 약 1m이며, 뼈는 작고 섬세했습니다. 조용한 호숫가에서 살아, 온전한 화석이 발견되고 있습니다. 가늘고 긴 뒷다리와 뼈속이 비어 유연한 꼬리를 가지고 있어 빠르게 뛸 수 있습니다. 소화기관에서 소화가 덜 된 도마뱀이 발견된 점으로 보아, 도마뱀을 먹이로 추정하고 있습니다.\r\n', '독일, 프랑스', 'https://storage.googleapis.com/dimong-be.appspot.com/dinosaur_image/%EC%BD%A4%ED%94%84%EC%86%8C%EA%B7%B8%EB%82%98%ED%88%AC%EC%8A%A4.png', 3, '0.8-1.3m', '콤프소그나투스', '우아한 턱', '육식', '2-3.5kg', '쥐라기', b'0', b'1'),
	(29, 3, 'https://j8a105.p.ssafy.io/static/detail/%EC%BC%84%ED%8A%B8%EB%A1%9C%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.wav', '한 쌍의 골창을 목부터 꼬리 끝까지 이어서 가지고 있습니다. 특히 긴 어깨의 골창과, 휘두를 수 있는 꼬리의 골창으로 포식자에 대항했을 것입니다. 사족 보행을 했지만, 앞다리와 뒷다리의 차이가 커서 머리를 밑으로 향한 채 이동하였습니다. 이러한 특징은, 고사리와 같이 키 작은 식물을 주식으로 삼았다는 것을 암시합니다.\r\n', '아프리카', 'https://storage.googleapis.com/dimong-be.appspot.com/dinosaur_image/%EC%BC%84%ED%8A%B8%EB%A1%9C%EC%82%AC%EC%9A%B0%EB%A3%A8%EC%8A%A4.png', 2, '4-5m', '켄트로사우루스', '뾰족한 도마뱀', '초식', '1,000-1,500kg', '쥐라기', b'0', b'1'),
	(30, 4, 'https://j8a105.p.ssafy.io/static/detail/%ED%8A%B8%EB%A6%AC%EC%BC%80%EB%9D%BC%ED%86%B1%EC%8A%A4.wav', '3개의 뿔, 앵무새 같은 부리, 그리고 목을 보호할 수 있는 프릴을 가지고 있습니다. 뿔은 포식자로부터 정면으로 방어하기 위한 수단으로 사용되었습니다, 실제로 티라노사우루스의 이빨 자국에 의한 상처 치유 흔적이 있는 뿔 화석이 1997년 수집된 적이 있습니다. 티라노사우루스와 만났지만, 뿔로 방어하고 살아남았으리라 추측해볼 수 있습니다. 뿔은 또한 트리케라톱스 수컷이 서로 경쟁을 하는데 있어서도 사용되었습니다.\r\n', '북아메리카', 'https://storage.googleapis.com/dimong-be.appspot.com/dinosaur_image/%ED%8A%B8%EB%A6%AC%EC%BC%80%EB%9D%BC%ED%86%B1%EC%8A%A4.png', 2, '7.9-9m', '트리케라톱스', '세 뿔 얼굴', '초식', '6,000-12,000kg', '백악기', b'0', b'1');
/*!40000 ALTER TABLE `DINOSAURS` ENABLE KEYS */;

-- 테이블 dimong.DRAWINGS 구조 내보내기
DROP TABLE IF EXISTS `DRAWINGS`;
CREATE TABLE IF NOT EXISTS `DRAWINGS` (
  `drawing_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `drawing_image_url` varchar(255) NOT NULL,
  `drawing_type` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `similar_dinosaur_id_1` bigint(20) DEFAULT NULL,
  `similar_dinosaur_id_2` bigint(20) DEFAULT NULL,
  `similar_dinosaur_id_3` bigint(20) DEFAULT NULL,
  `badge_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`drawing_id`),
  KEY `FK641uqf9ffvu85im00i1o449ry` (`similar_dinosaur_id_1`),
  KEY `FKm0mjbf2p8jtmxx8m8qvochvbh` (`similar_dinosaur_id_2`),
  KEY `FKcnikqim4634207s5c01ys54rg` (`similar_dinosaur_id_3`),
  KEY `FKelklwx2wq8mk4i5abdnlsiql2` (`user_id`),
  KEY `FKbh25t9elr6grecba5pm1lv08n` (`badge_id`),
  CONSTRAINT `FK641uqf9ffvu85im00i1o449ry` FOREIGN KEY (`similar_dinosaur_id_1`) REFERENCES `DINOSAURS` (`dinosaur_id`),
  CONSTRAINT `FKbh25t9elr6grecba5pm1lv08n` FOREIGN KEY (`badge_id`) REFERENCES `BADGES` (`badge_id`),
  CONSTRAINT `FKcnikqim4634207s5c01ys54rg` FOREIGN KEY (`similar_dinosaur_id_3`) REFERENCES `DINOSAURS` (`dinosaur_id`),
  CONSTRAINT `FKelklwx2wq8mk4i5abdnlsiql2` FOREIGN KEY (`user_id`) REFERENCES `USERS` (`user_id`),
  CONSTRAINT `FKm0mjbf2p8jtmxx8m8qvochvbh` FOREIGN KEY (`similar_dinosaur_id_2`) REFERENCES `DINOSAURS` (`dinosaur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 dimong.DRAWINGS:~39 rows (대략적) 내보내기
DELETE FROM `DRAWINGS`;
/*!40000 ALTER TABLE `DRAWINGS` DISABLE KEYS */;
INSERT INTO `DRAWINGS` (`drawing_id`, `created_at`, `updated_at`, `drawing_image_url`, `drawing_type`, `user_id`, `similar_dinosaur_id_1`, `similar_dinosaur_id_2`, `similar_dinosaur_id_3`, `badge_id`) VALUES
	(1, '2023-03-29 22:40:38.808465', '2023-03-29 22:40:38.808465', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2F%22test.jpg%22?generation=1680097238577558&alt=media', 'FREE', 1, 1, 2, 3, NULL),
	(2, '2023-03-29 22:41:55.270220', '2023-03-29 22:41:55.270220', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2F%22test.jpg%22?generation=1680097315034732&alt=media', 'FREE', 1, 1, 2, 3, NULL),
	(3, '2023-03-29 22:43:05.663198', '2023-03-29 22:43:05.663198', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2F%22test.jpg%22?generation=1680097385563284&alt=media', 'FREE', 1, 1, 2, 3, NULL),
	(4, '2023-03-31 03:39:43.449404', '2023-03-31 03:39:43.449404', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2Ffree%2F3fba37a2-73fd-4fde-9ad2-ca8f87016da4?generation=1680233983303138&alt=media', 'FREE', 1, 1, 2, 3, NULL),
	(5, '2023-03-31 03:41:00.439948', '2023-03-31 03:41:00.439948', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2Ffree%2Fb7e506f5-baea-4c5b-9c9d-03c9ab90c5d4?generation=1680234060329901&alt=media', 'FREE', 1, 1, 2, 3, NULL),
	(6, '2023-03-31 03:41:05.393058', '2023-03-31 03:41:05.393058', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2Ffree%2Ff57b45b6-5d72-425c-aedc-852c8e30fa77?generation=1680234065282476&alt=media', 'FREE', 1, 2, 3, 4, NULL),
	(7, '2023-03-31 04:36:28.766236', '2023-03-31 04:36:28.766236', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2Ffree%2F9d584482-5679-47f3-95c4-0f4dadccdbcc?generation=1680237388724948&alt=media', 'FREE', 1, 1, 2, 3, NULL),
	(8, '2023-04-03 02:58:56.970053', '2023-04-03 02:58:56.970053', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2F24a47410-22b2-418c-b05b-ee7b02d922d0?generation=1680458335803311&alt=media', 'FREE', 1, 1, 2, 3, NULL),
	(9, '2023-04-03 02:32:07.571651', '2023-04-03 02:32:07.571651', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2Ffree%2F21474dc9-b407-405d-98e1-374fd00c658f?generation=1680489127485181&alt=media', 'FREE', 1, 1, 2, 3, NULL),
	(10, '2023-04-03 03:55:53.739209', '2023-04-03 03:55:53.739209', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2Ffree%2F86bb25b4-90ef-467f-81e2-c8ad8a853d86?generation=1680494153714541&alt=media', 'FREE', 1, 1, 2, 3, NULL),
	(11, '2023-04-03 08:04:15.144357', '2023-04-03 08:04:15.144357', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2Fe4f49144-2a44-49a0-989a-7695fda8ef22?generation=1680509055065732&alt=media', 'FREE', 1, 1, 25, 30, 1),
	(12, '2023-04-03 08:08:31.746029', '2023-04-03 08:08:31.746029', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2F1f1296dc-f79c-4d68-beed-4a83ce3b0977?generation=1680509311694616&alt=media', 'FREE', 1, 1, 25, 30, 1),
	(13, '2023-04-04 00:03:22.362568', '2023-04-04 00:03:22.362568', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2Ff5fed6fb-6e86-4060-b579-86c9555f45a2?generation=1680566602305471&alt=media', 'FREE', 1, 5, 30, 12, 5),
	(14, '2023-04-04 00:03:49.058615', '2023-04-04 00:03:49.058615', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2F4516c933-a3e4-4095-bad6-e7a29e4a1554?generation=1680566629012322&alt=media', 'FREE', 1, 1, 5, 3, 1),
	(15, '2023-04-04 00:31:58.407072', '2023-04-04 00:31:58.407072', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2F5ed4eba3-c176-4899-973f-50b66d37d468?generation=1680568318359132&alt=media', 'FREE', 1, 3, 7, 6, 3),
	(16, '2023-04-04 00:45:07.937338', '2023-04-04 00:45:07.937338', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2F6c68ad96-d13c-4445-8e7f-e8e5d935043c?generation=1680569107890666&alt=media', 'FREE', 1, 1, 25, 6, 1),
	(17, '2023-04-04 01:07:44.903656', '2023-04-04 01:07:44.903656', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2Fff7714c9-6e44-4f00-9ca8-a8bb2ff2b9b1?generation=1680570464830843&alt=media', 'FREE', 1, 3, 1, 5, 3),
	(18, '2023-04-04 01:24:08.157307', '2023-04-04 01:24:08.157307', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2F0a3bc59b-4425-450e-82d7-3d29475fae44?generation=1680571448105966&alt=media', 'FREE', 1, 2, 17, 3, 2),
	(19, '2023-04-04 01:27:06.715504', '2023-04-04 01:27:06.715504', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2Fa7ba620a-43c2-4920-b655-df3f911c7a10?generation=1680571626659337&alt=media', 'FREE', 1, 2, 17, 3, 2),
	(22, '2023-04-04 02:03:16.550693', '2023-04-04 02:03:16.550693', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2F0510522a-45bb-4358-bb8d-3a70ec0c0473?generation=1680573796508124&alt=media', 'FREE', 1, 1, 30, 25, 1),
	(23, '2023-04-04 02:19:43.246826', '2023-04-04 02:19:43.246826', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2F696f1581-2246-490e-9d69-50e7c18bebf1?generation=1680574783198619&alt=media', 'FREE', 1, 1, 25, 6, 1),
	(24, '2023-04-04 02:28:46.664120', '2023-04-04 02:28:46.664120', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2Fefdc513d-46bc-4be5-ae8f-09767d0caed4?generation=1680575326616105&alt=media', 'FREE', 1, 6, 10, 2, 6),
	(25, '2023-04-04 04:05:35.439093', '2023-04-04 04:05:35.439093', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2F21fa274a-ae07-49d7-9d98-eaa1e20a4de5?generation=1680581135350420&alt=media', 'FREE', 1, 1, 5, 3, 1),
	(26, '2023-04-04 04:14:18.659271', '2023-04-04 04:14:18.659271', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2F61b069d3-ca85-4dcd-b4b5-8985b68ba1be?generation=1680581658600916&alt=media', 'FREE', 1, 1, 3, 4, 1),
	(27, '2023-04-04 04:34:08.570452', '2023-04-04 04:34:08.570452', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2F1e89300c-c4ee-4ca6-a4c6-401a82a685d8?generation=1680582848512415&alt=media', 'FREE', 1, 7, 13, 16, 7),
	(28, '2023-04-04 04:35:05.948332', '2023-04-04 04:35:05.948332', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2Feb8f6562-f44e-41f7-9b73-1948125bd87f?generation=1680582905893980&alt=media', 'FREE', 1, 7, 13, 16, 7),
	(29, '2023-04-04 04:36:02.194275', '2023-04-04 04:36:02.194275', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2F8a5ac6e4-8b24-4dc1-b347-b2e564221d95?generation=1680582962143391&alt=media', 'FREE', 1, NULL, NULL, NULL, NULL),
	(30, '2023-04-04 04:37:09.348320', '2023-04-04 04:37:09.348320', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2Fb83088d8-60db-442f-8995-fdd5b2213577?generation=1680583029295288&alt=media', 'FREE', 1, 7, 13, 16, 7),
	(31, '2023-04-04 05:08:16.719694', '2023-04-04 05:08:16.719694', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2F90c8ce90-831b-4e8a-9abb-ea242fad98b2?generation=1680584896665675&alt=media', 'FREE', 1, 19, 22, 23, 19),
	(32, '2023-04-04 05:17:23.810658', '2023-04-04 05:17:23.810658', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2F6f0eb03a-457d-4083-9481-4f9bc3e0c0d2?generation=1680585443763106&alt=media', 'FREE', 1, 27, 6, 17, 27),
	(33, '2023-04-04 05:18:24.225397', '2023-04-04 05:18:24.225397', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2Ffcfcbf36-61f5-4fb1-af21-b7e5c9651fa9?generation=1680585504178395&alt=media', 'FREE', 1, 30, 12, 20, 30),
	(34, '2023-04-04 05:19:29.420928', '2023-04-04 05:19:29.420928', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2F091c0474-7301-4449-8943-0982eee3cfe0?generation=1680585569374638&alt=media', 'FREE', 1, 17, 25, 11, 17),
	(35, '2023-04-04 05:23:30.692118', '2023-04-04 05:23:30.692118', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2Fdb76a1da-c9ed-4995-bc49-cd0103f78985?generation=1680585810646710&alt=media', 'FREE', 1, 19, 23, 22, 19),
	(36, '2023-04-04 06:49:37.536540', '2023-04-04 06:49:37.536540', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2F80ba1d74-b582-4817-8b7b-febb4c95b642?generation=1680590977488286&alt=media', 'FREE', 1, 2, 10, 9, 2),
	(37, '2023-04-04 07:17:52.925449', '2023-04-04 07:17:52.925449', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2F93b9bc8a-7737-427a-a7f9-3820f052fd1a?generation=1680592672879933&alt=media', 'FREE', 1, 29, 6, 22, 29),
	(38, '2023-04-04 07:57:45.251050', '2023-04-04 07:57:45.251050', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2F4f28ce90-712a-4d2f-9ad2-3b694507fcdc?generation=1680595065202033&alt=media', 'FREE', 1, 4, 3, 8, 4),
	(39, '2023-04-04 08:03:46.399277', '2023-04-04 08:03:46.399277', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2F6efe5c27-e43b-4141-8f2f-f829527a8036?generation=1680595426348136&alt=media', 'FREE', 1, 7, 13, 16, 7),
	(40, '2023-04-04 08:05:25.580066', '2023-04-04 08:05:25.580066', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2F9ab10fc5-8519-4ba5-a53a-735e9399af54?generation=1680595525522135&alt=media', 'FREE', 1, 7, 13, 16, 7),
	(41, '2023-04-04 08:07:09.600422', '2023-04-04 08:07:09.600422', 'https://storage.googleapis.com/download/storage/v1/b/dimong-be.appspot.com/o/user_drawing%2F194ca21b-21a4-4948-a40b-0b0094f8b0d6?generation=1680595629546100&alt=media', 'FREE', 1, 7, 13, 16, 7);
/*!40000 ALTER TABLE `DRAWINGS` ENABLE KEYS */;

-- 테이블 dimong.USERS 구조 내보내기
DROP TABLE IF EXISTS `USERS`;
CREATE TABLE IF NOT EXISTS `USERS` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `provider_access_token` varchar(255) DEFAULT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
  `provider_type` varchar(255) DEFAULT NULL,
  `user_nickname` varchar(255) DEFAULT NULL,
  `user_profile_image` varchar(255) DEFAULT NULL,
  `user_role` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UKtldrioqws7dwdl022jof3l6fk` (`provider_type`,`provider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 dimong.USERS:~3 rows (대략적) 내보내기
DELETE FROM `USERS`;
/*!40000 ALTER TABLE `USERS` DISABLE KEYS */;
INSERT INTO `USERS` (`user_id`, `created_at`, `updated_at`, `is_deleted`, `provider_access_token`, `provider_id`, `provider_type`, `user_nickname`, `user_profile_image`, `user_role`) VALUES
	(1, '2023-03-27 06:19:16.000000', '2023-03-27 06:19:18.000000', b'0', NULL, NULL, NULL, 'khj6354', NULL, 'USER'),
	(2, NULL, NULL, b'0', NULL, NULL, NULL, 'aaaaa', NULL, 'USER'),
	(3, '2023-04-03 14:17:56.000000', NULL, b'0', NULL, NULL, NULL, 'test3', NULL, 'USER');
/*!40000 ALTER TABLE `USERS` ENABLE KEYS */;

-- 테이블 dimong.USER_BADGES 구조 내보내기
DROP TABLE IF EXISTS `USER_BADGES`;
CREATE TABLE IF NOT EXISTS `USER_BADGES` (
  `user_badge_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `badge_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`user_badge_id`),
  UNIQUE KEY `UKs752cderucycfw6qykmrn909c` (`user_id`,`badge_id`),
  KEY `FK11p5mu94870dlkuy2wpv1tkdy` (`badge_id`),
  CONSTRAINT `FK11p5mu94870dlkuy2wpv1tkdy` FOREIGN KEY (`badge_id`) REFERENCES `BADGES` (`badge_id`),
  CONSTRAINT `FK1qa89nllsi06g6at24liym6qg` FOREIGN KEY (`user_id`) REFERENCES `USERS` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 dimong.USER_BADGES:~17 rows (대략적) 내보내기
DELETE FROM `USER_BADGES`;
/*!40000 ALTER TABLE `USER_BADGES` DISABLE KEYS */;
INSERT INTO `USER_BADGES` (`user_badge_id`, `badge_id`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '2023-04-03 02:58:54.622254', '2023-04-03 02:58:54.622254'),
	(2, 2, 1, '2023-04-03 13:27:51.000000', NULL),
	(3, 1, 2, '2023-04-03 14:09:37.000000', NULL),
	(4, 3, 2, '2023-04-03 14:09:53.000000', NULL),
	(5, 1, 3, '2023-04-03 14:18:18.000000', NULL),
	(6, 2, 3, '2023-04-03 14:18:37.000000', NULL),
	(7, 4, 3, '2023-04-03 14:18:36.000000', NULL),
	(8, 3, 1, '2023-04-03 05:51:15.451785', '2023-04-03 05:51:15.451785'),
	(9, 5, 1, '2023-04-04 00:03:20.863054', '2023-04-04 00:03:20.863054'),
	(10, 6, 1, '2023-04-04 02:28:45.911510', '2023-04-04 02:28:45.911510'),
	(11, 7, 1, '2023-04-04 04:34:07.897804', '2023-04-04 04:34:07.897804'),
	(12, 19, 1, '2023-04-04 05:08:15.895310', '2023-04-04 05:08:15.895310'),
	(13, 27, 1, '2023-04-04 05:17:23.005876', '2023-04-04 05:17:23.005876'),
	(14, 30, 1, '2023-04-04 05:18:23.444494', '2023-04-04 05:18:23.444494'),
	(15, 17, 1, '2023-04-04 05:19:28.672864', '2023-04-04 05:19:28.672864'),
	(16, 29, 1, '2023-04-04 07:17:52.173423', '2023-04-04 07:17:52.173423'),
	(17, 4, 1, '2023-04-04 07:57:44.316371', '2023-04-04 07:57:44.316371');
/*!40000 ALTER TABLE `USER_BADGES` ENABLE KEYS */;

-- 테이블 dimong.USER_DINOSAURS 구조 내보내기
DROP TABLE IF EXISTS `USER_DINOSAURS`;
CREATE TABLE IF NOT EXISTS `USER_DINOSAURS` (
  `user_dinosaur_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dinosaur_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_dinosaur_id`),
  UNIQUE KEY `UKnonaesoqn8k16vpn0d7hmrki` (`user_id`,`dinosaur_id`),
  KEY `FK735myyh7h773rdaas38qc22aq` (`dinosaur_id`),
  CONSTRAINT `FK68b81t3v4svpbssye9lje8kbj` FOREIGN KEY (`user_id`) REFERENCES `USERS` (`user_id`),
  CONSTRAINT `FK735myyh7h773rdaas38qc22aq` FOREIGN KEY (`dinosaur_id`) REFERENCES `DINOSAURS` (`dinosaur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 dimong.USER_DINOSAURS:~27 rows (대략적) 내보내기
DELETE FROM `USER_DINOSAURS`;
/*!40000 ALTER TABLE `USER_DINOSAURS` DISABLE KEYS */;


-- 테이블 dimong.USER_REFRESH_TOKEN 구조 내보내기
DROP TABLE IF EXISTS `USER_REFRESH_TOKEN`;
CREATE TABLE IF NOT EXISTS `USER_REFRESH_TOKEN` (
  `refresh_token_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `refresh_token` varchar(256) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`refresh_token_id`),
  KEY `FKs6gx8nvtn7fggutqnnbqq4wbd` (`user_id`),
  CONSTRAINT `FKs6gx8nvtn7fggutqnnbqq4wbd` FOREIGN KEY (`user_id`) REFERENCES `USERS` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 dimong.USER_REFRESH_TOKEN:~0 rows (대략적) 내보내기
DELETE FROM `USER_REFRESH_TOKEN`;
/*!40000 ALTER TABLE `USER_REFRESH_TOKEN` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REFRESH_TOKEN` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
