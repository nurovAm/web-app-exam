-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: std-mysql    Database: std_2320_exam
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('347d78ffec37');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `publisher_year` int(11) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `short_desc` text NOT NULL,
  `author` varchar(255) NOT NULL,
  `size` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (39,'Война и мир',2022,'Русская Классика','Великий роман-эпопея Льва Толстого чудесным образом, как огромная мозаика, сложен из тысяч картин — батальных, бальных, любовных, бытовых, политических, философских, портретных, пейзажных, психологических… Все он неслучайны, уместны, своевременны: за сюжетными ответвлениями, ходами, пересечениями стоят предопределение и авторская воля. Ритм романа, увлекающий читателя, сверен с пульсом живой истории: он то заторможен, как реформаторская деятельность Сперанского; то стремителен, как комета 1812 года; то спокоен, как Кутузов в Филях; то методичен, как народная дубина; то необратим, как бегство французов по Смоленской дороге… Все эти картины, сплетаясь, образуют самое знаменитое в мире произведение классической русской литературы — «Война и мир» остается наиболее издаваемым романом во всех странах.                \n            ','Лев Толстой',992),(40,'Десять негритят',1990,'Классика','Десять никак не связанных между собой людей в особняке на уединенном острове… Кто вызвал их сюда таинственным приглашением? Зачем кто-то убивает их, одного за другим, самыми невероятными способами? Почему все происходящее так тесно переплетено с веселым детским стишком?\n\nРоман «Десять негритят» – один из величайших детективных произведений в истории. Выпущенный общим тиражом более 100 000 000 экземпляров, он занимает пятое место в списке бестселлеров художественной литературы всех времен – и безусловное первое место среди романов самой Агаты Кристи.\n\nАгата Кристи – самый публикуемый автор всех времен и народов после Шекспира. Тиражи ее книг уступают только тиражам его произведений и Библии. В мире продано больше миллиарда книг Кристи на английском языке и столько же – на других языках. Она автор восьмидесяти детективных романов и сборников рассказов, двадцати пьес, двух книг воспоминаний и шести психологических романов, написанных под псевдонимом Мэри Уэстмакотт. Ее персонажи Эркюль Пуаро и мисс Марпл навсегда стали образцовыми героями остросюжетного жанра.','Агата Кристи',900),(41,'Благословение небожителей. Том 3',2023,'СЗКЭО',' Близится Праздник середины осени, а вместе с ним — роскошный пир и Состязание фонарей в небесных чертогах. Отправляясь на торжество, Се Лянь не подозревает, что окажется в центре внимания. По возвращении в мир смертных он принимается за работу, ведь теперь нужно прокормить сразу три лишних рта! К несчастью, на задании, которое получил принц, он вновь сталкивается с озлобленным духом младенца, однако Хуа Чэн успевает прийти на выручку. После всей неразберихи герои решают отдохнуть — но не тут-то было! На пороге храма Водяных Каштанов возникает Ши Цинсюань в сопровождении Мин И. Оказывается, Повелителя Ветра уже довольно давно преследует одна тварь: божок-пустозвон. Се Лянь соглашается помочь и расправиться с ним, и тут дело принимает совсем дурной оборот...\n\n','Мосян Тунсю',996),(42,'Унесенные ветром',2023,'Русская классика','\"Унесенные ветром\" – история о молодой южанке, дочери состоятельного владельца плантаций в Джорджии, чья беззаботная юность прекращается с началом Гражданской войны. В один миг девушке пришлось повзрослеть: мать умерла, отец болен, а родное поместье разграбили янки. Эта книга стала самой любимой для нескольких поколений женщин, и ничего равного ей не создано по сей день. Проходят годы и годы, а \"Унесенные ветром\" не стареют, и теперь уже новым читательницам предстоит смеяться и плакать, любить и страдать, бороться и надеяться вместе с великолепной Скарлетт О’Хара...\n','Маргаретт Митчелл',704),(43,'Зеленая миля',2022,'АСТ','                  Стивен Кинг приглашает читателей в жуткий мир тюремного блока смертников, откуда уходят, чтобы не вернуться, приоткрывает дверь последнего пристанища тех, кто преступил не только человеческий, но и Божий закон. По эту сторону электрического стула нет более смертоносного местечка! Ничто из того, что вы читали раньше, не сравнится с самым дерзким из ужасных опытов Стивена Кинга - с историей, что начинается на Дороге Смерти и уходит в глубины самых чудовищных тайн человеческой души...\n\n            ','Стивен Кинг',384),(44,'Весь Шерлок Холмс',2019,'АСТ',' Артур Конан Дойл (1859–1930) – английский писатель, отдавший дань практически всем литературным жанрам, но наиболее известный как автор детективных, историко-приключенческих и фантастических произведений. И, конечно же, как создатель знаменитого тандема – Шерлока Холмса и доктора Уотсона. Книги о гениальном сыщике и его простоватом напарнике переведены практически на все языки мира, Холмс и Уотсон стали героями бесчисленных литературных подражаний, экранизаций и театральных постановок. Прошло уже больше ста лет с того момента, как был напечатан первый рассказ, а читатели всего мира по-прежнему с упоением погружаются в мир туманных лондонских улиц, зловещих болот и вересковых пустошей. В настоящем издании представлено полное собрание рассказов и повестей о великом сыщике с Бейкер-стрит.\n','Артур Конан Дойл',1392),(45,' Ойкумена',2004,'Игорь Николаев','Если в три слова, то: Сапковский + Darkest Dungeon\nЕсли не в три, то перед вами фэнтезийное попаданчество, однако не классическое, а почти что \"деконструкция\" жанра (в хорошем смысле, а не как обычно).\nОбычная городская девушка (возрастом в районе 17-18 лет) из нашей реальности \"попадает\" в мир условного Ренессанса (XIV-XV вв. + немного Нового времени). Нет у нее ни особых знаний, ни удивительных талантов, даже порох она придумать не смогла.\nА дальше я процитирую одну из рецензий:\n\"Разных раскладов больших и малых вокруг будет много. Очень разных и политических, и экономических, и магических, а где расклады там и интриги… и что характерно, влиять это будет на всех жителей мира, включая Елену.\nСмакования чернухи не будет это не темное фентази. Но вот обыденной средневековой жестокости и нормального средневекового же сверхнасилия в книге более чем. И с благородством большой напряг – это не высокое фентази - но при этом изредка будет случаться. Как в жизни\"','Игорь Николаев',500),(46,'Нам всем пора повзрослеть. Как перестать жаловаться, обижаться и сделать свою жизнь счастливой',2023,'Феникс',' Бывали ли у вас когда-нибудь мысли, что вы не контролируете ситуацию?\nА может, вы ловили ощущение, что ведете себя как ребенок, но ничего не могли с этим поделать?\nЧто за странная история с этим взрослением? Как получается, что можно быть взрослым по возрасту, но не взрослым по поведению?\nПонимать свои чувства, эмоции, поведение, научиться ими управлять и в результате стать автором своей жизни, а проще говоря, повзрослеть — задача каждого, кто хочет жить счастливо.\nАвтор этой книги, семейный психолог Анастасия Сагирова, раскладывает по полочкам причины инфантилизма и, опираясь на личный и клиентский опыт, пошагово объясняет, как любой из нас сможет пройти путь к своей новой, взрослой жизни.','Анастасия Сагирова',158),(47,'Почему у женщин при социализме секс лучше. Аргументы в пользу экономической независимости',2020,'Альпина Паблишер','Профессор Пенсильванского университета, автор семи книг Кристен Годси объясняет, почему триумф капитализма в странах первого и второго мира не стал выходом для большинства женщин. Она мастерски развенчивает устойчивые мифы о том, что в условиях свободного рынка у женщин больше возможностей достичь карьерных высот и экономической независимости, внутреннего равновесия и личного счастья. На множестве примеров Кристен Годси показывает, как, дискриминируя женщин, капитализм во всем обделяет их — от физических радостей до интеллектуальной самореализации — и использует в интересах процветания тех, кто уже находится на вершине экономической пирамиды. Несмотря на крах и идейную дискредитацию социализма в странах Восточной Европы, Годси убеждена, что многие элементы социалистической экономики способны обеспечить женщине условия для развития и полноправного труда, здоровое распределение сил между работой и семьей и в конечном итоге гармоничные и насыщенные сексуальные отношения.','Кристен Годси',229);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_category`
--

DROP TABLE IF EXISTS `books_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `books_category_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `books_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_category`
--

LOCK TABLES `books_category` WRITE;
/*!40000 ALTER TABLE `books_category` DISABLE KEYS */;
INSERT INTO `books_category` VALUES (74,39,4),(75,39,5),(76,39,6),(77,39,8),(78,40,9),(79,41,1),(80,41,5),(81,42,4),(82,42,6),(83,43,8),(84,43,10),(85,44,4),(86,45,1),(87,45,12),(88,45,13),(89,47,11);
/*!40000 ALTER TABLE `books_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_collection`
--

DROP TABLE IF EXISTS `books_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `collection_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  KEY `collection_id` (`collection_id`),
  CONSTRAINT `books_collection_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `books_collection_ibfk_2` FOREIGN KEY (`collection_id`) REFERENCES `collection` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_collection`
--

LOCK TABLES `books_collection` WRITE;
/*!40000 ALTER TABLE `books_collection` DISABLE KEYS */;
INSERT INTO `books_collection` VALUES (9,39,12),(10,40,11),(11,41,10),(12,47,13);
/*!40000 ALTER TABLE `books_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Приключения'),(2,'Ужасы'),(3,'Комедия'),(4,'Классика'),(5,'Любовные романы'),(6,'Исторические'),(7,'Детская литература'),(8,'Драма'),(9,'Трагедия'),(10,'Бестселлер'),(11,'Обучение'),(12,'Путешествия'),(13,'Научная фантастика'),(14,'Энциклопедии');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `collection_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
INSERT INTO `collection` VALUES (10,'my love',3),(11,'Нестареющая классика ',7),(12,'Читать не хочется, но надо',7),(13,'обучение',3),(14,'Моя подборка',7);
/*!40000 ALTER TABLE `collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cover`
--

DROP TABLE IF EXISTS `cover`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cover` (
  `id` varchar(100) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `mime_type` varchar(100) NOT NULL,
  `md5_hash` varchar(100) NOT NULL,
  `book_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `md5_hash` (`md5_hash`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `cover_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cover`
--

LOCK TABLES `cover` WRITE;
/*!40000 ALTER TABLE `cover` DISABLE KEYS */;
INSERT INTO `cover` VALUES ('03b55489-44c3-4680-a45c-9f463fd4d70b','photo_2024-06-15_23-49-26.jpg','image/jpeg','b1bdab8775a5c072494ae07e7391fbd1',45),('439e8030-f53c-4482-aee6-c609f2dad86b','jpg','image/jpeg','3ca1bb5e96adf9bc7b2c7c6028fac34c',42),('53ae5115-f74b-4177-84f5-bfcd3cca99da','photo_2024-06-10_20-43-26.jpg','image/jpeg','32ea89b7f8713a2d5864238ba94be8cf',41),('70112790-d980-4b43-986a-1ddf53aeb4b7','photo_2024-06-15_23-53-12.jpg','image/jpeg','805768af9e180e853dab3d002055305f',47),('7120b425-f85a-437a-af96-9c3a8d8931c3','photo_2024-06-15_23-50-39.jpg','image/jpeg','54d05fdcef0c4b0616bfe51beae4d2b3',46),('9dc7ff25-6611-43e1-904c-cff95be43e38','jpg','image/jpeg','dfba86b05050337b62b08f20455e4ec5',40),('db646231-d084-458f-8d1e-765f6860d3da','photo_2024-06-15_23-40-13.jpg','image/jpeg','2cff66a77bdc15600f0fe47d8916049a',43),('f045a589-784e-4aaf-a53f-1b4cf46fb587','jpg','image/jpeg','3ee4c3c6e5dfae5b1504735ed598c660',39),('fca88ad4-664f-4d17-8cbb-c4fe50e8712e','photo_2024-06-15_23-45-04.jpg','image/jpeg','f288f5cb1975e75c410310bf7295264b',44);
/*!40000 ALTER TABLE `cover` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `text` text NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (19,39,5,5,'Отличная книга','2024-06-15 23:28:40'),(20,39,7,3,'Прекарсно освежает в жаркий летний день ','2024-06-15 23:28:40'),(21,39,6,4,'Прекрасно воздействует как на физическое развитие, так и на интелектуальное','2024-06-15 23:28:40'),(22,40,6,5,'&lt;script&gt;alert(\'XSS\');&lt;/script&gt;\n<b>Bold Text</b>','2024-06-15 23:28:40'),(23,41,6,4,'Неплохая логопедическая разминка','2024-06-15 23:28:40'),(24,40,7,5,'Spoiler alert!!! В конце все умрут ','2024-06-15 23:28:40'),(25,41,7,4,'От одного описание роллов захотелось ','2024-06-15 23:28:40'),(26,43,7,5,'Босс, я устал!','2024-06-15 23:28:40'),(27,42,7,3,'Самая русская классика, которая только может быть','2024-06-15 23:28:40'),(28,42,6,5,'Прекрасная книга','2024-06-15 23:28:40'),(29,43,6,5,'Захотелось Coffey','2024-06-15 23:28:40'),(30,44,6,5,'Все части в одном томе, прекрасно','2024-06-15 23:28:40'),(31,45,6,2,'Дельфин и русалка...','2024-06-15 23:28:40'),(32,45,7,5,'Не знала, что он еще и книги пишет','2024-06-15 23:28:40'),(33,44,7,4,'Элементрано, Ватсон','2024-06-15 23:28:40'),(34,46,7,1,'О нееееееттттт','2024-06-15 23:28:40'),(35,41,3,1,'Очень крутая книга. Мне нравится!!!','2024-06-15 23:28:40'),(36,47,7,5,'Жаль нельзя попасть в СССР, проверить','2024-06-15 23:28:40');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Администратор','Суперпользователь, имеет полный доступ к системе, в том числе к созданию и удалению книг'),(2,'Модератор','может редактировать данные книг и производить модерацию рецензий'),(3,'Пользователь','может оставлять рецензии');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `login` varchar(100) NOT NULL,
  `password_hash` varchar(200) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Амир','Нуров','Тахирович','amir','scrypt:32768:8:1$eQrvvOJVfasukNb0$4219d0b04c11ceeb7d47bbf223ee52916b6b8f69a9a477dbd737fb0bc54f39d7d5a8514449199b24041f9c3fc5fc442f67c7194e497b5e95338221f845fa6888',1),(2,'moder','moder','modr','moder','scrypt:32768:8:1$FtN2IATTeWThWSG8$2f0b56707b1c1233cccf1c0ce379f6f521963a30314b952c255a6498cbcfc66d09a05f0d0c330e1a1beeb9bf25e930a7b6b671bd682f60616ab89666380cc871',2),(3,'user','user','user','user','scrypt:32768:8:1$Ayz82wukeW2NcxD4$683464216a55736a2c938b6a5b1833ebcfc066fa5598510d5e42c6b78b02cab1c4ffe137364735077c605a56b3d1f3140b9d286fac048597d1c6f5ff3659bac2',3),(4,'user1','user1','user1','user1','scrypt:32768:8:1$JCrTQ96qK1UBu6Am$289f0a6f0ca933e5b18ea6d123c01a5a438c0fb8525f4aba3ea1de0234ce92813b149d8e316e1acb73d3249ffeb06ef393f2ecfcdb25548f1e8c8ae02eb52dcf',3),(5,'diana','diana','diana','diana_admin','scrypt:32768:8:1$2U52Nl3R6nyZPtl6$bf55b9bfe9793327677c463944d6cd668bd4a72c79f6e59ed6baf301ae7001aca687ab7ee71948c219bed186f2ec3c7204f96d41c916f94a269df23493323274',1),(6,'diana','diana','diana','diana_moder','scrypt:32768:8:1$2U52Nl3R6nyZPtl6$bf55b9bfe9793327677c463944d6cd668bd4a72c79f6e59ed6baf301ae7001aca687ab7ee71948c219bed186f2ec3c7204f96d41c916f94a269df23493323274',2),(7,'diana','diana','diana','diana_user','scrypt:32768:8:1$2U52Nl3R6nyZPtl6$bf55b9bfe9793327677c463944d6cd668bd4a72c79f6e59ed6baf301ae7001aca687ab7ee71948c219bed186f2ec3c7204f96d41c916f94a269df23493323274',3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-15 23:56:57
