-- PRAGMA foreign_keys=OFF;
-- BEGIN TRANSACTION;
DROP TABLE IF EXISTS ClimateTypes;
CREATE TABLE ClimateTypes (
climate_type_id INT,
climate_type_name VARCHAR(255),
PRIMARY KEY (climate_type_id)
);
INSERT INTO ClimateTypes VALUES(0,'Тропический');
INSERT INTO ClimateTypes VALUES(1,'Умеренный');
INSERT INTO ClimateTypes VALUES(2,'Субтропический');

DROP TABLE IF EXISTS Allelopathy;
CREATE TABLE Allelopathy (
allelopathy_id INT,
allelopathy_description VARCHAR(255),
PRIMARY KEY (allelopathy_id)
);
INSERT INTO Allelopathy VALUES(0,'Нейтральная');
INSERT INTO Allelopathy VALUES(1,'Положительная');
INSERT INTO Allelopathy VALUES(2,'Отрицательная');

DROP TABLE IF EXISTS SunlightTolerance;
CREATE TABLE SunlightTolerance (
sunlight_tolerance_id INT,
sunlight_tolerance_description VARCHAR(255),
PRIMARY KEY (sunlight_tolerance_id)
);
INSERT INTO SunlightTolerance VALUES(0,'Да');
INSERT INTO SunlightTolerance VALUES(1,'Нет');
INSERT INTO SunlightTolerance VALUES(2,'Средне');

DROP TABLE IF EXISTS PlantTypes;
CREATE TABLE PlantTypes (
plant_type_id INT,
plant_type_description VARCHAR(255),
PRIMARY KEY (plant_type_id)
);
INSERT INTO PlantTypes VALUES(0,'Домашнее');
INSERT INTO PlantTypes VALUES(1,'Уличное');

DROP TABLE IF EXISTS PlantColors;
CREATE TABLE PlantColors (
plant_color_id INT,
plant_color_description VARCHAR(255),
PRIMARY KEY (plant_color_id)
);
INSERT INTO PlantColors VALUES(0,'Белый');
INSERT INTO PlantColors VALUES(1,'Жёлтый');
INSERT INTO PlantColors VALUES(3,'Жёлтый, зелёный, белый, красный, розовый, оранжевый');
INSERT INTO PlantColors VALUES(4,'Зелёный');
INSERT INTO PlantColors VALUES(6,'Зелёный Красный Голубой Белый');
INSERT INTO PlantColors VALUES(7,'Зелёный с белой каймой');
INSERT INTO PlantColors VALUES(8,'Зелёный с белыми или розовыми разводами');
INSERT INTO PlantColors VALUES(9,'Зелёный с красными прицветниками');
INSERT INTO PlantColors VALUES(10,'Зелёный с пятнами');
INSERT INTO PlantColors VALUES(11,'Зелёный с разноцветными прожилками');
INSERT INTO PlantColors VALUES(12,'Зелёный с серебристым оттенком');
INSERT INTO PlantColors VALUES(13,'Зелёный, белый');
INSERT INTO PlantColors VALUES(15,'Зелёный, белый, розовый');
INSERT INTO PlantColors VALUES(16,'Зелёный, белый, розовый, жёлтый');
INSERT INTO PlantColors VALUES(18,'Зелёный, белый, розовый, фиолетовый ');
INSERT INTO PlantColors VALUES(19,'Зелёный, жёлтый, белый');
INSERT INTO PlantColors VALUES(20,'Зеленый, желтый, красный, серебристый');
INSERT INTO PlantColors VALUES(21,'Зеленый, красный, бордовый, желтый, оранжевый, фиолетовый');
INSERT INTO PlantColors VALUES(22,'Красный');
INSERT INTO PlantColors VALUES(23,'Оранжевый');
INSERT INTO PlantColors VALUES(25,'Пёстрый');
INSERT INTO PlantColors VALUES(26,'Пурпурный');
INSERT INTO PlantColors VALUES(27,'Разноцветный');
INSERT INTO PlantColors VALUES(30,'Розовый');
INSERT INTO PlantColors VALUES(31,'Розовый, красный, фиолетовый или белый');
INSERT INTO PlantColors VALUES(32,'Синий');
INSERT INTO PlantColors VALUES(33,'Синий или белый');
INSERT INTO PlantColors VALUES(34,'Фиолетовый');

DROP TABLE IF EXISTS Plants;
CREATE TABLE Plants (
plant_id INT,
plant_name VARCHAR(255),
climate_type_id INT,
allelopathy_id INT,
is_famous BOOLEAN,
PRIMARY KEY (plant_id),
FOREIGN KEY (climate_type_id) REFERENCES ClimateTypes(climate_type_id),
FOREIGN KEY (allelopathy_id) REFERENCES Allelopathy(allelopathy_id)
);
INSERT INTO Plants VALUES(0,'Абутилон (комнатный клён)',0,0,'false');
INSERT INTO Plants VALUES(1,'Авокадо',0,0,'true');
INSERT INTO Plants VALUES(2,'Агапантус',1,0,'false');
INSERT INTO Plants VALUES(3,'Аглаонема',0,0,'false');
INSERT INTO Plants VALUES(4,'Азалия',1,0,'false');
INSERT INTO Plants VALUES(5,'Аир',1,0,'false');
INSERT INTO Plants VALUES(6,'Акалифа',0,0,'false');
INSERT INTO Plants VALUES(7,'Акка',2,0,'true');
INSERT INTO Plants VALUES(8,'Алламанда',0,0,'false');
INSERT INTO Plants VALUES(9,'Алоказия',0,0,'false');
INSERT INTO Plants VALUES(10,'Алоэ вера',0,0,'true');
INSERT INTO Plants VALUES(11,'Амариллис',1,0,'false');
INSERT INTO Plants VALUES(12,'Ананас',2,0,'true');
INSERT INTO Plants VALUES(13,'Антуриум','','','false');
INSERT INTO Plants VALUES(14,'Араукария',1,0,'false');
INSERT INTO Plants VALUES(15,'Арундинария',0,0,'false');
INSERT INTO Plants VALUES(16,'Аспарагус',0,0,'false');
INSERT INTO Plants VALUES(17,'Аспидистра',1,0,'false');
INSERT INTO Plants VALUES(18,'Аукуба',1,1,'false');
INSERT INTO Plants VALUES(19,'Афеландра',0,0,'false');
INSERT INTO Plants VALUES(20,'Афеландра',0,0,'false');
INSERT INTO Plants VALUES(21,'Ахименес',0,0,'false');
INSERT INTO Plants VALUES(22,'Базилик',1,1,'true');
INSERT INTO Plants VALUES(23,'Банан',0,0,'true');
INSERT INTO Plants VALUES(24,'Бегония',1,0,'true');
INSERT INTO Plants VALUES(25,'Бегония',1,0,'false');
INSERT INTO Plants VALUES(26,'Белопероне',0,0,'false');
INSERT INTO Plants VALUES(27,'Бересклет',1,1,'false');
INSERT INTO Plants VALUES(30,'Брейния',0,0,'false');
INSERT INTO Plants VALUES(31,'Броваллия',1,0,'false');
INSERT INTO Plants VALUES(32,'Брунфельсия',0,0,'false');
INSERT INTO Plants VALUES(33,'Бувардия',1,1,'false');
INSERT INTO Plants VALUES(34,'Бугенвилия',2,0,'false');
INSERT INTO Plants VALUES(35,'Будра',1,1,'false');
INSERT INTO Plants VALUES(36,'Валлота (Циртантус)',1,0,'false');
INSERT INTO Plants VALUES(37,'Вельтгеймия',2,0,'false');
INSERT INTO Plants VALUES(38,'Венерина мухоловка',0,0,'true');
INSERT INTO Plants VALUES(39,'Геликония',0,0,'false');
INSERT INTO Plants VALUES(40,'Гемиграфис',0,0,'false');
INSERT INTO Plants VALUES(41,'Геогенантус',0,0,'false');
INSERT INTO Plants VALUES(42,'Герань',1,2,'true');
INSERT INTO Plants VALUES(43,'Гибискус',0,0,'false');
INSERT INTO Plants VALUES(44,'Гинура',1,0,'false');
INSERT INTO Plants VALUES(45,'Гипоэстес',0,0,'false');
INSERT INTO Plants VALUES(46,'Гранат',2,0,'true');
INSERT INTO Plants VALUES(47,'Гревиллея',1,1,'false');
INSERT INTO Plants VALUES(48,'Дарлингтония',1,0,'false');
INSERT INTO Plants VALUES(49,'Диффенбахия',0,2,'false');
INSERT INTO Plants VALUES(50,'Драцена',1,0,'true');
INSERT INTO Plants VALUES(51,'Драцена',2,0,'true');
INSERT INTO Plants VALUES(52,'Жакаранда',2,0,'false');
INSERT INTO Plants VALUES(53,'Жасмин',1,0,'false');
INSERT INTO Plants VALUES(54,'Замиокулькас',0,0,'false');
INSERT INTO Plants VALUES(55,'Зефирантес',0,0,'false');
INSERT INTO Plants VALUES(56,'Иксора',0,0,'false');
INSERT INTO Plants VALUES(57,'Импатиенс (бальзамин) ',1,0,'false');
INSERT INTO Plants VALUES(58,'Ирезине',0,0,'false');
INSERT INTO Plants VALUES(59,'Кактус',2,0,'true');
INSERT INTO Plants VALUES(60,'Каладиум',0,0,'false');
INSERT INTO Plants VALUES(61,'Калатея',0,0,'false');
INSERT INTO Plants VALUES(62,'Калина',1,0,'true');
INSERT INTO Plants VALUES(63,'Каллизия',0,0,'false');
INSERT INTO Plants VALUES(64,'Камелия',0,0,'false');
INSERT INTO Plants VALUES(65,'Камнеломка',1,0,'false');
INSERT INTO Plants VALUES(66,'Кипарис',2,0,'false');
INSERT INTO Plants VALUES(67,'Кипарисовик',1,0,'false');
INSERT INTO Plants VALUES(68,'Клейера',1,0,'false');
INSERT INTO Plants VALUES(69,'Клюзия',0,0,'false');
INSERT INTO Plants VALUES(70,'Кодиеум',0,0,'false');
INSERT INTO Plants VALUES(71,'Кокколоба',0,0,'false');
INSERT INTO Plants VALUES(72,'Кокос',0,0,'true');
INSERT INTO Plants VALUES(73,'Колеус',0,0,'false');
INSERT INTO Plants VALUES(74,'Колокольчик',1,0,'true');
INSERT INTO Plants VALUES(75,'Кордилина',2,0,'false');
INSERT INTO Plants VALUES(76,'Кофейное дерево (кофе)',1,0,'true');
INSERT INTO Plants VALUES(77,'Крестовник',1,0,'true');
INSERT INTO Plants VALUES(78,'Кроссандра',0,0,'true');
INSERT INTO Plants VALUES(79,'Ктенанта',1,0,'false');
INSERT INTO Plants VALUES(80,'Лаванда',1,1,'true');
INSERT INTO Plants VALUES(81,'Лавр',2,1,'false');
INSERT INTO Plants VALUES(82,'Ледебурия',0,0,'false');
INSERT INTO Plants VALUES(83,'Леея',1,0,'false');
INSERT INTO Plants VALUES(84,'Лимон',0,0,'true');
INSERT INTO Plants VALUES(85,'Маранта',0,0,'false');
INSERT INTO Plants VALUES(86,'Мирт',1,0,'false');
INSERT INTO Plants VALUES(87,'Монстера',0,0,'false');
INSERT INTO Plants VALUES(88,'Мюленбекия',2,0,'false');
INSERT INTO Plants VALUES(89,'Нандина',1,0,'false');
INSERT INTO Plants VALUES(90,'Непентес',0,0,'false');
INSERT INTO Plants VALUES(91,'Нертера',2,0,'false');
INSERT INTO Plants VALUES(92,'Оплисменус',0,0,'false');
INSERT INTO Plants VALUES(93,'Орхидея',0,0,'true');
INSERT INTO Plants VALUES(94,'Осока',1,0,'true');
INSERT INTO Plants VALUES(95,'Офиопогон',0,0,'false');
INSERT INTO Plants VALUES(96,'Палисота',0,0,'false');
INSERT INTO Plants VALUES(97,'Панданус',0,0,'false');
INSERT INTO Plants VALUES(98,'Паслён',1,2,'false');
INSERT INTO Plants VALUES(99,'Пахира',0,0,'false');
INSERT INTO Plants VALUES(100,'Пеллиония',0,0,'false');
INSERT INTO Plants VALUES(101,'Пеперомия',0,0,'false');
INSERT INTO Plants VALUES(102,'Перец',2,0,'true');
INSERT INTO Plants VALUES(103,'Пизония',0,0,'false');
INSERT INTO Plants VALUES(104,'Пилея',0,0,'false');
INSERT INTO Plants VALUES(105,'Плектрантус',1,0,'false');
INSERT INTO Plants VALUES(106,'Плющ',1,0,'true');
INSERT INTO Plants VALUES(107,'Погонатерум',0,0,'false');
INSERT INTO Plants VALUES(108,'Полисциас',1,0,'false');
INSERT INTO Plants VALUES(109,'Псевдоэрантемум',0,0,'false');
INSERT INTO Plants VALUES(110,'Радермахера',0,0,'false');
INSERT INTO Plants VALUES(111,'Рео',0,0,'false');
INSERT INTO Plants VALUES(112,'Родея',0,0,'true');
INSERT INTO Plants VALUES(113,'Розмарин',1,0,'true');
INSERT INTO Plants VALUES(114,'Руэллия',0,0,'false');
INSERT INTO Plants VALUES(115,'Саговник поникающий (Цикас)',0,0,'false');
INSERT INTO Plants VALUES(116,'Сансевиерия',2,0,'false');
INSERT INTO Plants VALUES(117,'Сауроматум (Арум)',0,0,'false');
INSERT INTO Plants VALUES(118,'Селагинелла',0,0,'false');
INSERT INTO Plants VALUES(119,'Сеткрезия',1,0,'false');
INSERT INTO Plants VALUES(120,'Сидерасис',0,0,'false');
INSERT INTO Plants VALUES(121,'Сингониум',0,0,'false');
INSERT INTO Plants VALUES(122,'Солейролия',1,0,'false');
INSERT INTO Plants VALUES(123,'Спатифиллюм',0,0,'false');
INSERT INTO Plants VALUES(124,'Строманта',1,1,'false');
INSERT INTO Plants VALUES(125,'Сциндапсус',0,0,'false');
INSERT INTO Plants VALUES(126,'Тетрастигма',0,0,'false');
INSERT INTO Plants VALUES(127,'Традесканция',1,0,'false');
INSERT INTO Plants VALUES(128,'Фасикулярия двуцветная ',2,0,'false');
INSERT INTO Plants VALUES(129,'Фатсия',1,0,'false');
INSERT INTO Plants VALUES(130,'Фатсхедера',1,0,'false');
INSERT INTO Plants VALUES(131,'Фейхоа',2,0,'false');
INSERT INTO Plants VALUES(132,'Фикус',1,0,'true');
INSERT INTO Plants VALUES(133,'Фикус карика (инжир)',1,0,'true');
INSERT INTO Plants VALUES(134,'Фикус каучуконосный (эластичный)',0,0,'false');
INSERT INTO Plants VALUES(135,'Филодендрон',0,0,'false');
INSERT INTO Plants VALUES(136,'Фиттония',0,0,'false');
INSERT INTO Plants VALUES(137,'Хлорофитум',1,0,'false');
INSERT INTO Plants VALUES(138,'Хойя (восковой плющ)',0,0,'true');
INSERT INTO Plants VALUES(139,'Цианотис',0,0,'false');
INSERT INTO Plants VALUES(140,'Циперус',1,0,'false');
INSERT INTO Plants VALUES(141,'Циссус',0,0,'false');
INSERT INTO Plants VALUES(142,'Цитрусовые культуры',2,0,'true');
INSERT INTO Plants VALUES(143,'Шеффлера','','','false');
INSERT INTO Plants VALUES(144,'Энцефаляртос',2,0,'false');
INSERT INTO Plants VALUES(145,'Эпипремнум',0,0,'false');
INSERT INTO Plants VALUES(146,'Эписция',1,0,'false');


DROP TABLE IF EXISTS PlantList;
CREATE TABLE PlantList (
record_id INT,
plant_id INT,
min_light INT,
max_light INT,
sunlight_tolerance_id INT,
min_humidity INT,
max_humidity INT,
min_temperature INT,
max_temperature INT,
plant_type_id INT,
is_fruitful BOOLEAN,
oxygen_production FLOAT,
area_covered FLOAT,
care_instructions INT,
plant_color_id INT,
PRIMARY KEY (record_id),
FOREIGN KEY (plant_id) REFERENCES Plants(plant_id),
FOREIGN KEY (sunlight_tolerance_id) REFERENCES SunlightTolerance(sunlight_tolerance_id),
FOREIGN KEY (plant_type_id) REFERENCES PlantTypes(plant_type_id),
FOREIGN KEY (plant_color_id) REFERENCES PlantColors(plant_color_id)
);
INSERT INTO PlantList VALUES(0,0,4,6,2,50,70,18,25,0,'false',6.0,3.0,5,27);
INSERT INTO PlantList VALUES(1,1,6,8,0,40,60,22,26,1,'true',5.0,4.0,7,4);
INSERT INTO PlantList VALUES(2,2,5,7,0,40,60,10,25,1,'false',7.0,4.0,10,33);
INSERT INTO PlantList VALUES(3,3,3,5,1,60,80,18,25,0,'false',6.0,2.0,7,4);
INSERT INTO PlantList VALUES(4,4,3,5,1,60,80,6,23,0,'false',4.0,2.0,3,31);
INSERT INTO PlantList VALUES(5,5,4,6,2,50,70,10,22,1,'false',5.0,3.0,10,4);
INSERT INTO PlantList VALUES(6,6,6,8,0,40,60,22,26,0,'false',5.0,2.0,7,4);
INSERT INTO PlantList VALUES(7,7,6,8,0,40,60,18,25,1,'true',6.0,3.0,7,4);
INSERT INTO PlantList VALUES(8,8,8,10,0,50,70,20,30,1,'false',5.0,5.0,15,1);
INSERT INTO PlantList VALUES(9,9,3,5,1,60,80,16,24,0,'false',4.0,1.0,3,30);
INSERT INTO PlantList VALUES(10,10,6,8,0,40,60,22,26,0,'false',5.0,2.0,7,4);
INSERT INTO PlantList VALUES(11,11,4,6,1,40,60,10,23,0,'false',4.0,2.0,7,27);
INSERT INTO PlantList VALUES(12,12,6,8,0,50,70,15,30,1,'true',3.0,5.0,7,4);
INSERT INTO PlantList VALUES(13,13,4,6,2,50,70,16,24,0,'false',7.0,3.0,'','');
INSERT INTO PlantList VALUES(14,14,4,6,2,50,70,15,25,0,'false',6.0,4.0,7,4);
INSERT INTO PlantList VALUES(15,15,3,5,1,60,80,16,24,0,'false',4.0,1.0,3,4);
INSERT INTO PlantList VALUES(16,16,6,8,0,40,60,22,26,0,'false',5.0,2.0,7,4);
INSERT INTO PlantList VALUES(17,17,4,6,2,50,70,16,24,0,'false',7.0,3.0,5,4);
INSERT INTO PlantList VALUES(18,18,7,9,0,30,50,20,25,1,'false',6.0,2.0,10,34);
INSERT INTO PlantList VALUES(19,19,4,6,1,60,80,18,25,0,'false',5.0,2.0,3,3);
INSERT INTO PlantList VALUES(20,20,4,6,2,50,70,16,24,0,'false',7.0,3.0,5,1);
INSERT INTO PlantList VALUES(21,21,3,5,1,60,80,16,24,0,'false',4.0,1.0,3,27);
INSERT INTO PlantList VALUES(22,22,6,8,2,40,60,18,24,0,'false',5.0,1.0,7,4);
INSERT INTO PlantList VALUES(23,23,6,8,0,50,70,20,30,0,'true',7.0,3.0,7,20);
INSERT INTO PlantList VALUES(24,24,3,5,1,50,70,15,25,0,'false',4.0,1.0,3,27);
INSERT INTO PlantList VALUES(25,25,4,6,2,50,70,16,24,0,'false',7.0,3.0,5,27);
INSERT INTO PlantList VALUES(26,26,4,6,2,50,70,18,25,0,'false',6.0,2.0,7,27);
INSERT INTO PlantList VALUES(27,27,4,6,2,30,50,10,25,0,'false',6.0,2.0,5,21);
INSERT INTO PlantList VALUES(28,27,4,6,2,40,60,15,25,0,'false',4.0,2.0,10,8);
INSERT INTO PlantList VALUES(29,27,6,8,0,30,50,18,27,0,'false',5.0,3.0,7,12);
INSERT INTO PlantList VALUES(30,30,4,6,1,60,80,18,25,0,'false',6.0,2.0,7,4);
INSERT INTO PlantList VALUES(31,31,3,5,1,60,80,16,24,0,'false',5.0,1.0,3,32);
INSERT INTO PlantList VALUES(32,32,4,6,2,50,70,16,24,0,'false',7.0,3.0,5,34);
INSERT INTO PlantList VALUES(33,33,6,8,0,40,60,20,25,1,'false',6.0,2.0,10,30);
INSERT INTO PlantList VALUES(34,34,8,10,0,30,50,15,30,1,'false',8.0,4.0,15,27);
INSERT INTO PlantList VALUES(35,35,3,5,2,40,60,10,20,1,'false',5.0,1.0,14,4);
INSERT INTO PlantList VALUES(36,36,4,6,1,50,70,15,25,0,'false',4.0,2.0,7,22);
INSERT INTO PlantList VALUES(37,37,3,5,1,40,60,10,30,0,'false',3.0,2.0,30,30);
INSERT INTO PlantList VALUES(38,38,4,6,1,70,90,7,10,0,'false',3.0,1.0,5,4);
INSERT INTO PlantList VALUES(39,39,4,6,1,70,90,18,27,1,'false',6.0,4.0,7,27);
INSERT INTO PlantList VALUES(40,40,6,8,0,40,60,22,26,0,'false',5.0,2.0,7,4);
INSERT INTO PlantList VALUES(41,41,3,5,1,60,80,18,24,0,'false',4.0,1.0,7,4);
INSERT INTO PlantList VALUES(42,42,4,6,2,50,70,16,24,0,'false',7.0,3.0,5,30);
INSERT INTO PlantList VALUES(43,43,5,7,2,50,70,18,25,0,'true',6.0,3.0,5,22);
INSERT INTO PlantList VALUES(44,44,4,6,2,50,70,16,24,0,'false',7.0,3.0,5,4);
INSERT INTO PlantList VALUES(45,45,3,5,1,60,80,16,24,0,'false',4.0,1.0,3,30);
INSERT INTO PlantList VALUES(46,46,6,10,0,40,60,5,35,1,'true',7.0,5.0,7,22);
INSERT INTO PlantList VALUES(47,47,7,9,0,30,50,20,25,1,'false',6.0,2.0,10,34);
INSERT INTO PlantList VALUES(48,48,4,6,1,70,90,10,20,1,'false',6.0,4.0,3,22);
INSERT INTO PlantList VALUES(49,49,3,5,1,60,80,18,25,0,'false',5.0,2.0,7,4);
INSERT INTO PlantList VALUES(50,50,4,6,2,50,70,16,24,0,'false',7.0,3.0,5,4);
INSERT INTO PlantList VALUES(51,51,3,5,1,50,70,18,22,0,'false',6.0,4.0,7,4);
INSERT INTO PlantList VALUES(52,52,8,10,0,30,50,15,30,1,'false',8.0,5.0,15,32);
INSERT INTO PlantList VALUES(53,53,4,6,2,50,70,16,24,0,'false',7.0,3.0,5,0);
INSERT INTO PlantList VALUES(54,54,3,5,2,30,50,16,24,0,'false',4.0,2.0,7,4);
INSERT INTO PlantList VALUES(55,55,3,5,1,60,80,16,24,0,'false',4.0,1.0,3,30);
INSERT INTO PlantList VALUES(56,56,6,8,0,40,60,22,26,0,'false',5.0,2.0,7,23);
INSERT INTO PlantList VALUES(57,57,4,6,2,50,70,16,24,0,'false',7.0,2.0,5,27);
INSERT INTO PlantList VALUES(58,58,4,6,1,50,70,18,25,0,'false',5.0,2.0,5,22);
INSERT INTO PlantList VALUES(59,59,8,10,0,20,40,10,30,0,'false',3.0,1.0,30,4);
INSERT INTO PlantList VALUES(60,60,3,5,1,60,80,16,24,0,'false',4.0,1.0,3,27);
INSERT INTO PlantList VALUES(61,61,2,4,1,70,90,18,23,0,'false',6.0,2.0,4,27);
INSERT INTO PlantList VALUES(62,62,4,6,2,50,70,-20,25,1,'true',6.0,4.0,7,22);
INSERT INTO PlantList VALUES(63,63,4,6,2,40,60,15,25,0,'false',5.0,1.0,10,4);
INSERT INTO PlantList VALUES(64,64,3,5,1,60,80,8,25,0,'false',4.0,3.0,3,30);
INSERT INTO PlantList VALUES(65,65,4,6,2,40,60,10,20,1,'false',4.0,1.0,7,0);
INSERT INTO PlantList VALUES(66,66,6,8,0,30,50,5,25,1,'false',6.0,3.0,10,4);
INSERT INTO PlantList VALUES(67,67,4,6,2,50,70,16,24,0,'false',7.0,2.0,5,4);
INSERT INTO PlantList VALUES(68,68,4,6,2,50,70,10,24,0,'false',6.0,3.0,5,4);
INSERT INTO PlantList VALUES(69,69,6,8,0,40,60,18,26,0,'true',5.0,2.0,7,4);
INSERT INTO PlantList VALUES(70,70,4,6,2,50,70,16,22,0,'false',7.0,3.0,5,25);
INSERT INTO PlantList VALUES(71,71,3,5,1,60,80,16,24,0,'true',4.0,1.0,3,4);
INSERT INTO PlantList VALUES(72,72,6,8,0,70,90,22,32,1,'true',8.0,10.0,3,4);
INSERT INTO PlantList VALUES(73,73,4,6,1,50,70,18,24,0,'false',6.0,2.0,3,27);
INSERT INTO PlantList VALUES(74,74,3,5,1,60,80,15,25,0,'false',4.0,1.0,3,32);
INSERT INTO PlantList VALUES(75,75,5,7,2,40,60,15,25,0,'false',7.0,3.0,5,4);
INSERT INTO PlantList VALUES(76,76,4,6,2,50,70,16,24,0,'false',7.0,3.0,5,4);
INSERT INTO PlantList VALUES(77,77,3,5,1,30,50,10,20,0,'false',4.0,1.0,7,1);
INSERT INTO PlantList VALUES(78,78,4,6,2,50,70,16,24,0,'false',7.0,3.0,5,23);
INSERT INTO PlantList VALUES(79,79,4,6,2,50,70,16,24,0,'false',6.0,3.0,5,4);
INSERT INTO PlantList VALUES(80,80,7,9,0,30,50,20,25,1,'false',6.0,2.0,10,34);
INSERT INTO PlantList VALUES(81,81,6,8,0,40,60,10,30,1,'true',7.0,4.0,10,4);
INSERT INTO PlantList VALUES(82,82,3,5,1,40,60,15,25,0,'false',5.0,2.0,7,10);
INSERT INTO PlantList VALUES(83,83,4,6,2,50,70,16,24,0,'false',7.0,3.0,5,4);
INSERT INTO PlantList VALUES(84,84,6,8,0,40,60,22,26,0,'true',5.0,2.0,7,1);
INSERT INTO PlantList VALUES(85,85,2,4,1,60,80,18,25,0,'false',6.0,2.0,3,27);
INSERT INTO PlantList VALUES(86,86,4,6,2,50,70,16,24,0,'false',7.0,3.0,5,4);
INSERT INTO PlantList VALUES(87,87,3,5,1,60,80,16,24,0,'false',4.0,1.0,3,4);
INSERT INTO PlantList VALUES(88,88,4,6,2,30,50,10,30,0,'false',3.0,1.0,30,4);
INSERT INTO PlantList VALUES(89,89,4,6,2,40,60,10,25,1,'true',6.0,3.0,7,22);
INSERT INTO PlantList VALUES(90,90,3,5,1,60,80,16,24,0,'false',4.0,2.0,3,27);
INSERT INTO PlantList VALUES(91,91,4,6,2,50,70,16,24,0,'true',5.0,1.0,5,23);
INSERT INTO PlantList VALUES(92,92,3,5,1,60,80,18,24,0,'false',4.0,1.0,5,4);
INSERT INTO PlantList VALUES(93,93,3,5,1,60,80,16,24,0,'false',4.0,1.0,3,30);
INSERT INTO PlantList VALUES(94,94,4,8,0,40,80,10,30,1,'false',6.0,2.0,10,4);
INSERT INTO PlantList VALUES(95,95,3,6,2,50,70,16,24,0,'false',5.0,1.0,7,4);
INSERT INTO PlantList VALUES(96,96,4,6,2,50,70,18,24,0,'true',4.0,2.0,5,6);
INSERT INTO PlantList VALUES(97,97,4,6,2,50,70,18,25,0,'true',6.0,4.0,7,4);
INSERT INTO PlantList VALUES(98,98,6,8,0,40,60,15,25,1,'true',5.0,2.0,10,4);
INSERT INTO PlantList VALUES(99,99,3,5,1,60,80,16,24,0,'true',4.0,3.0,3,4);
INSERT INTO PlantList VALUES(100,100,3,5,1,60,80,16,24,0,'false',4.0,1.0,3,30);
INSERT INTO PlantList VALUES(101,101,3,5,1,50,70,18,25,0,'false',4.0,1.0,7,4);
INSERT INTO PlantList VALUES(102,102,6,8,0,60,80,20,30,1,'true',6.0,2.0,3,22);
INSERT INTO PlantList VALUES(103,103,4,6,2,70,90,22,27,1,'false',7.0,4.0,10,34);
INSERT INTO PlantList VALUES(104,104,3,5,1,50,70,18,25,0,'false',4.0,1.0,5,4);
INSERT INTO PlantList VALUES(105,105,4,6,2,40,60,16,24,0,'false',6.0,2.0,7,4);
INSERT INTO PlantList VALUES(106,106,3,5,1,50,80,10,30,0,'false',7.0,3.0,10,4);
INSERT INTO PlantList VALUES(107,107,4,6,1,60,80,18,26,0,'false',5.0,1.0,7,4);
INSERT INTO PlantList VALUES(108,108,3,6,2,40,60,18,24,0,'false',5.0,4.0,7,4);
INSERT INTO PlantList VALUES(109,109,4,7,0,50,70,16,24,0,'false',6.0,3.0,5,22);
INSERT INTO PlantList VALUES(110,110,4,6,1,60,80,18,25,0,'false',6.0,2.0,7,1);
INSERT INTO PlantList VALUES(111,111,6,8,0,40,60,22,26,0,'false',5.0,2.0,7,4);
INSERT INTO PlantList VALUES(112,112,3,5,1,50,70,16,24,0,'false',4.0,1.0,3,30);
INSERT INTO PlantList VALUES(113,113,7,9,0,30,50,20,25,1,'false',6.0,2.0,10,4);
INSERT INTO PlantList VALUES(114,114,4,6,2,50,70,18,25,0,'false',6.0,2.0,7,34);
INSERT INTO PlantList VALUES(115,115,3,5,1,40,60,16,24,0,'false',5.0,3.0,10,4);
INSERT INTO PlantList VALUES(116,116,2,4,0,30,50,15,27,0,'false',8.0,1.0,14,4);
INSERT INTO PlantList VALUES(117,117,3,5,1,60,80,10,25,0,'false',4.0,2.0,7,26);
INSERT INTO PlantList VALUES(118,118,2,4,1,70,90,15,25,0,'false',5.0,1.0,3,4);
INSERT INTO PlantList VALUES(119,119,6,8,0,40,60,18,24,1,'false',6.0,2.0,10,30);
INSERT INTO PlantList VALUES(120,120,2,4,1,60,80,14,24,0,'false',5.0,1.0,5,4);
INSERT INTO PlantList VALUES(121,121,3,5,1,60,80,18,25,0,'false',6.0,2.0,7,15);
INSERT INTO PlantList VALUES(122,122,2,4,1,70,90,15,22,0,'false',5.0,1.0,5,4);
INSERT INTO PlantList VALUES(123,123,3,5,1,60,80,16,24,0,'false',4.0,1.0,3,13);
INSERT INTO PlantList VALUES(124,124,4,6,2,50,70,16,24,0,'false',7.0,3.0,5,18);
INSERT INTO PlantList VALUES(125,125,6,8,0,40,60,22,26,0,'false',5.0,2.0,7,19);
INSERT INTO PlantList VALUES(126,126,3,5,1,60,80,18,25,0,'false',6.0,4.0,3,4);
INSERT INTO PlantList VALUES(127,127,4,6,2,50,70,15,25,0,'false',7.0,2.0,5,32);
INSERT INTO PlantList VALUES(128,128,3,5,2,40,60,3,27,0,'false',2.0,7.0,6,9);
INSERT INTO PlantList VALUES(129,129,4,6,2,50,70,16,24,0,'false',7.0,3.0,5,4);
INSERT INTO PlantList VALUES(130,130,4,6,2,50,70,16,24,0,'false',7.0,3.0,5,7);
INSERT INTO PlantList VALUES(131,131,6,8,0,40,60,-11,30,1,'true',5.0,2.0,10,4);
INSERT INTO PlantList VALUES(132,132,4,6,2,50,70,16,24,0,'false',7.0,3.0,5,4);
INSERT INTO PlantList VALUES(133,133,4,6,2,50,70,16,24,1,'true',7.0,4.0,5,4);
INSERT INTO PlantList VALUES(134,134,3,5,1,50,70,15,27,0,'false',6.0,3.0,7,4);
INSERT INTO PlantList VALUES(135,135,3,5,1,60,80,16,24,0,'false',4.0,2.0,3,15);
INSERT INTO PlantList VALUES(136,136,3,5,1,60,80,16,24,0,'false',4.0,1.0,3,11);
INSERT INTO PlantList VALUES(137,137,4,6,2,50,70,10,30,0,'false',7.0,1.0,5,13);
INSERT INTO PlantList VALUES(138,138,3,5,1,60,80,16,24,0,'false',4.0,1.0,3,16);
INSERT INTO PlantList VALUES(139,139,4,6,2,50,70,18,25,0,'false',6.0,2.0,7,32);
INSERT INTO PlantList VALUES(140,140,3,5,1,60,80,15,25,0,'false',5.0,2.0,5,4);
INSERT INTO PlantList VALUES(141,141,3,5,1,60,80,16,24,0,'false',4.0,1.0,3,27);
INSERT INTO PlantList VALUES(142,142,7,9,0,60,80,15,30,1,'true',8.0,5.0,3,4);
INSERT INTO PlantList VALUES(143,143,4,6,2,50,70,16,24,0,'false',7.0,3.0,5,'');
INSERT INTO PlantList VALUES(144,144,6,8,0,30,50,10,25,0,'false',3.0,2.0,30,4);
INSERT INTO PlantList VALUES(145,145,3,5,1,60,80,16,24,0,'false',4.0,1.0,3,4);
INSERT INTO PlantList VALUES(146,146,4,6,2,50,70,18,22,0,'false',5.0,1.0,7,22);


DROP TABLE IF EXISTS MainTable;
CREATE TABLE MainTable(
  "Номер строки",
  plant_name TEXT,
  min_light INT,
  max_light INT,
  sunlight_tolerance_description TEXT,
  min_humidity INT,
  max_humidity INT,
  min_temperature INT,
  max_temperature INT,
  plant_type_description TEXT,
  is_fruitful NUM,
  oxygen_production REAL,
  area_covered REAL,
  care_instructions INT,
  plant_color_description TEXT,
  climate_type_name TEXT,
  allelopathy_description TEXT,
  is_famous NUM
);
INSERT INTO MainTable VALUES(1,'Абутилон (комнатный клён)',4,6,'Средне',50,70,18,25,'Домашнее','false',6.0,3.0,5,'Разноцветный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(2,'Авокадо',6,8,'Да',40,60,22,26,'Уличное','true',5.0,4.0,7,'Зелёный','Тропический','Нейтральная','true');
INSERT INTO MainTable VALUES(3,'Агапантус',5,7,'Да',40,60,10,25,'Уличное','false',7.0,4.0,10,'Синий или белый','Умеренный','Нейтральная','false');
INSERT INTO MainTable VALUES(4,'Аглаонема',3,5,'Нет',60,80,18,25,'Домашнее','false',6.0,2.0,7,'Зелёный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(5,'Азалия',3,5,'Нет',60,80,6,23,'Домашнее','false',4.0,2.0,3,'Розовый, красный, фиолетовый или белый','Умеренный','Нейтральная','false');
INSERT INTO MainTable VALUES(6,'Аир',4,6,'Средне',50,70,10,22,'Уличное','false',5.0,3.0,10,'Зелёный','Умеренный','Нейтральная','false');
INSERT INTO MainTable VALUES(7,'Акалифа',6,8,'Да',40,60,22,26,'Домашнее','false',5.0,2.0,7,'Зелёный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(8,'Акка',6,8,'Да',40,60,18,25,'Уличное','true',6.0,3.0,7,'Зелёный','Субтропический','Нейтральная','true');
INSERT INTO MainTable VALUES(9,'Алламанда',8,10,'Да',50,70,20,30,'Уличное','false',5.0,5.0,15,'Жёлтый','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(10,'Алоказия',3,5,'Нет',60,80,16,24,'Домашнее','false',4.0,1.0,3,'Розовый','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(11,'Алоэ вера',6,8,'Да',40,60,22,26,'Домашнее','false',5.0,2.0,7,'Зелёный','Тропический','Нейтральная','true');
INSERT INTO MainTable VALUES(12,'Амариллис',4,6,'Нет',40,60,10,23,'Домашнее','false',4.0,2.0,7,'Разноцветный','Умеренный','Нейтральная','false');
INSERT INTO MainTable VALUES(13,'Ананас',6,8,'Да',50,70,15,30,'Уличное','true',3.0,5.0,7,'Зелёный','Субтропический','Нейтральная','true');
INSERT INTO MainTable VALUES(14,'Араукария',4,6,'Средне',50,70,15,25,'Домашнее','false',6.0,4.0,7,'Зелёный','Умеренный','Нейтральная','false');
INSERT INTO MainTable VALUES(15,'Арундинария',3,5,'Нет',60,80,16,24,'Домашнее','false',4.0,1.0,3,'Зелёный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(16,'Аспарагус',6,8,'Да',40,60,22,26,'Домашнее','false',5.0,2.0,7,'Зелёный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(17,'Аспидистра',4,6,'Средне',50,70,16,24,'Домашнее','false',7.0,3.0,5,'Зелёный','Умеренный','Нейтральная','false');
INSERT INTO MainTable VALUES(18,'Аукуба',7,9,'Да',30,50,20,25,'Уличное','false',6.0,2.0,10,'Фиолетовый','Умеренный','Положительная','false');
INSERT INTO MainTable VALUES(19,'Афеландра',4,6,'Нет',60,80,18,25,'Домашнее','false',5.0,2.0,3,'Жёлтый, зелёный, белый, красный, розовый, оранжевый','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(20,'Афеландра',4,6,'Средне',50,70,16,24,'Домашнее','false',7.0,3.0,5,'Жёлтый','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(21,'Ахименес',3,5,'Нет',60,80,16,24,'Домашнее','false',4.0,1.0,3,'Разноцветный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(22,'Базилик',6,8,'Средне',40,60,18,24,'Домашнее','false',5.0,1.0,7,'Зелёный','Умеренный','Положительная','true');
INSERT INTO MainTable VALUES(23,'Банан',6,8,'Да',50,70,20,30,'Домашнее','true',7.0,3.0,7,'Зеленый, желтый, красный, серебристый','Тропический','Нейтральная','true');
INSERT INTO MainTable VALUES(24,'Бегония',3,5,'Нет',50,70,15,25,'Домашнее','false',4.0,1.0,3,'Разноцветный','Умеренный','Нейтральная','true');
INSERT INTO MainTable VALUES(25,'Бегония',4,6,'Средне',50,70,16,24,'Домашнее','false',7.0,3.0,5,'Разноцветный','Умеренный','Нейтральная','false');
INSERT INTO MainTable VALUES(26,'Белопероне',4,6,'Средне',50,70,18,25,'Домашнее','false',6.0,2.0,7,'Разноцветный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(27,'Бересклет',4,6,'Средне',30,50,10,25,'Домашнее','false',6.0,2.0,5,'Зеленый, красный, бордовый, желтый, оранжевый, фиолетовый','Умеренный','Положительная','false');
INSERT INTO MainTable VALUES(28,'Бересклет',4,6,'Средне',40,60,15,25,'Домашнее','false',4.0,2.0,10,'Зелёный с белыми или розовыми разводами','Умеренный','Положительная','false');
INSERT INTO MainTable VALUES(29,'Бересклет',6,8,'Да',30,50,18,27,'Домашнее','false',5.0,3.0,7,'Зелёный с серебристым оттенком','Умеренный','Положительная','false');
INSERT INTO MainTable VALUES(30,'Брейния',4,6,'Нет',60,80,18,25,'Домашнее','false',6.0,2.0,7,'Зелёный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(31,'Броваллия',3,5,'Нет',60,80,16,24,'Домашнее','false',5.0,1.0,3,'Синий','Умеренный','Нейтральная','false');
INSERT INTO MainTable VALUES(32,'Брунфельсия',4,6,'Средне',50,70,16,24,'Домашнее','false',7.0,3.0,5,'Фиолетовый','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(33,'Бувардия',6,8,'Да',40,60,20,25,'Уличное','false',6.0,2.0,10,'Розовый','Умеренный','Положительная','false');
INSERT INTO MainTable VALUES(34,'Бугенвилия',8,10,'Да',30,50,15,30,'Уличное','false',8.0,4.0,15,'Разноцветный','Субтропический','Нейтральная','false');
INSERT INTO MainTable VALUES(35,'Будра',3,5,'Средне',40,60,10,20,'Уличное','false',5.0,1.0,14,'Зелёный','Умеренный','Положительная','false');
INSERT INTO MainTable VALUES(36,'Валлота (Циртантус)',4,6,'Нет',50,70,15,25,'Домашнее','false',4.0,2.0,7,'Красный','Умеренный','Нейтральная','false');
INSERT INTO MainTable VALUES(37,'Вельтгеймия',3,5,'Нет',40,60,10,30,'Домашнее','false',3.0,2.0,30,'Розовый','Субтропический','Нейтральная','false');
INSERT INTO MainTable VALUES(38,'Венерина мухоловка',4,6,'Нет',70,90,7,10,'Домашнее','false',3.0,1.0,5,'Зелёный','Тропический','Нейтральная','true');
INSERT INTO MainTable VALUES(39,'Геликония',4,6,'Нет',70,90,18,27,'Уличное','false',6.0,4.0,7,'Разноцветный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(40,'Гемиграфис',6,8,'Да',40,60,22,26,'Домашнее','false',5.0,2.0,7,'Зелёный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(41,'Геогенантус',3,5,'Нет',60,80,18,24,'Домашнее','false',4.0,1.0,7,'Зелёный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(42,'Герань',4,6,'Средне',50,70,16,24,'Домашнее','false',7.0,3.0,5,'Розовый','Умеренный','Отрицательная','true');
INSERT INTO MainTable VALUES(43,'Гибискус',5,7,'Средне',50,70,18,25,'Домашнее','true',6.0,3.0,5,'Красный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(44,'Гинура',4,6,'Средне',50,70,16,24,'Домашнее','false',7.0,3.0,5,'Зелёный','Умеренный','Нейтральная','false');
INSERT INTO MainTable VALUES(45,'Гипоэстес',3,5,'Нет',60,80,16,24,'Домашнее','false',4.0,1.0,3,'Розовый','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(46,'Гранат',6,10,'Да',40,60,5,35,'Уличное','true',7.0,5.0,7,'Красный','Субтропический','Нейтральная','true');
INSERT INTO MainTable VALUES(47,'Гревиллея',7,9,'Да',30,50,20,25,'Уличное','false',6.0,2.0,10,'Фиолетовый','Умеренный','Положительная','false');
INSERT INTO MainTable VALUES(48,'Дарлингтония',4,6,'Нет',70,90,10,20,'Уличное','false',6.0,4.0,3,'Красный','Умеренный','Нейтральная','false');
INSERT INTO MainTable VALUES(49,'Диффенбахия',3,5,'Нет',60,80,18,25,'Домашнее','false',5.0,2.0,7,'Зелёный','Тропический','Отрицательная','false');
INSERT INTO MainTable VALUES(50,'Драцена',4,6,'Средне',50,70,16,24,'Домашнее','false',7.0,3.0,5,'Зелёный','Умеренный','Нейтральная','true');
INSERT INTO MainTable VALUES(51,'Драцена',3,5,'Нет',50,70,18,22,'Домашнее','false',6.0,4.0,7,'Зелёный','Субтропический','Нейтральная','true');
INSERT INTO MainTable VALUES(52,'Жакаранда',8,10,'Да',30,50,15,30,'Уличное','false',8.0,5.0,15,'Синий','Субтропический','Нейтральная','false');
INSERT INTO MainTable VALUES(53,'Жасмин',4,6,'Средне',50,70,16,24,'Домашнее','false',7.0,3.0,5,'Белый','Умеренный','Нейтральная','false');
INSERT INTO MainTable VALUES(54,'Замиокулькас',3,5,'Средне',30,50,16,24,'Домашнее','false',4.0,2.0,7,'Зелёный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(55,'Зефирантес',3,5,'Нет',60,80,16,24,'Домашнее','false',4.0,1.0,3,'Розовый','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(56,'Иксора',6,8,'Да',40,60,22,26,'Домашнее','false',5.0,2.0,7,'Оранжевый','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(57,'Импатиенс (бальзамин) ',4,6,'Средне',50,70,16,24,'Домашнее','false',7.0,2.0,5,'Разноцветный','Умеренный','Нейтральная','false');
INSERT INTO MainTable VALUES(58,'Ирезине',4,6,'Нет',50,70,18,25,'Домашнее','false',5.0,2.0,5,'Красный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(59,'Кактус',8,10,'Да',20,40,10,30,'Домашнее','false',3.0,1.0,30,'Зелёный','Субтропический','Нейтральная','true');
INSERT INTO MainTable VALUES(60,'Каладиум',3,5,'Нет',60,80,16,24,'Домашнее','false',4.0,1.0,3,'Разноцветный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(61,'Калатея',2,4,'Нет',70,90,18,23,'Домашнее','false',6.0,2.0,4,'Разноцветный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(62,'Калина',4,6,'Средне',50,70,-20,25,'Уличное','true',6.0,4.0,7,'Красный','Умеренный','Нейтральная','true');
INSERT INTO MainTable VALUES(63,'Каллизия',4,6,'Средне',40,60,15,25,'Домашнее','false',5.0,1.0,10,'Зелёный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(64,'Камелия',3,5,'Нет',60,80,8,25,'Домашнее','false',4.0,3.0,3,'Розовый','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(65,'Камнеломка',4,6,'Средне',40,60,10,20,'Уличное','false',4.0,1.0,7,'Белый','Умеренный','Нейтральная','false');
INSERT INTO MainTable VALUES(66,'Кипарис',6,8,'Да',30,50,5,25,'Уличное','false',6.0,3.0,10,'Зелёный','Субтропический','Нейтральная','false');
INSERT INTO MainTable VALUES(67,'Кипарисовик',4,6,'Средне',50,70,16,24,'Домашнее','false',7.0,2.0,5,'Зелёный','Умеренный','Нейтральная','false');
INSERT INTO MainTable VALUES(68,'Клейера',4,6,'Средне',50,70,10,24,'Домашнее','false',6.0,3.0,5,'Зелёный','Умеренный','Нейтральная','false');
INSERT INTO MainTable VALUES(69,'Клюзия',6,8,'Да',40,60,18,26,'Домашнее','true',5.0,2.0,7,'Зелёный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(70,'Кодиеум',4,6,'Средне',50,70,16,22,'Домашнее','false',7.0,3.0,5,'Пёстрый','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(71,'Кокколоба',3,5,'Нет',60,80,16,24,'Домашнее','true',4.0,1.0,3,'Зелёный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(72,'Кокос',6,8,'Да',70,90,22,32,'Уличное','true',8.0,10.0,3,'Зелёный','Тропический','Нейтральная','true');
INSERT INTO MainTable VALUES(73,'Колеус',4,6,'Нет',50,70,18,24,'Домашнее','false',6.0,2.0,3,'Разноцветный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(74,'Колокольчик',3,5,'Нет',60,80,15,25,'Домашнее','false',4.0,1.0,3,'Синий','Умеренный','Нейтральная','true');
INSERT INTO MainTable VALUES(75,'Кордилина',5,7,'Средне',40,60,15,25,'Домашнее','false',7.0,3.0,5,'Зелёный','Субтропический','Нейтральная','false');
INSERT INTO MainTable VALUES(76,'Кофейное дерево (кофе)',4,6,'Средне',50,70,16,24,'Домашнее','false',7.0,3.0,5,'Зелёный','Умеренный','Нейтральная','true');
INSERT INTO MainTable VALUES(77,'Крестовник',3,5,'Нет',30,50,10,20,'Домашнее','false',4.0,1.0,7,'Жёлтый','Умеренный','Нейтральная','true');
INSERT INTO MainTable VALUES(78,'Кроссандра',4,6,'Средне',50,70,16,24,'Домашнее','false',7.0,3.0,5,'Оранжевый','Тропический','Нейтральная','true');
INSERT INTO MainTable VALUES(79,'Ктенанта',4,6,'Средне',50,70,16,24,'Домашнее','false',6.0,3.0,5,'Зелёный','Умеренный','Нейтральная','false');
INSERT INTO MainTable VALUES(80,'Лаванда',7,9,'Да',30,50,20,25,'Уличное','false',6.0,2.0,10,'Фиолетовый','Умеренный','Положительная','true');
INSERT INTO MainTable VALUES(81,'Лавр',6,8,'Да',40,60,10,30,'Уличное','true',7.0,4.0,10,'Зелёный','Субтропический','Положительная','false');
INSERT INTO MainTable VALUES(82,'Ледебурия',3,5,'Нет',40,60,15,25,'Домашнее','false',5.0,2.0,7,'Зелёный с пятнами','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(83,'Леея',4,6,'Средне',50,70,16,24,'Домашнее','false',7.0,3.0,5,'Зелёный','Умеренный','Нейтральная','false');
INSERT INTO MainTable VALUES(84,'Лимон',6,8,'Да',40,60,22,26,'Домашнее','true',5.0,2.0,7,'Жёлтый','Тропический','Нейтральная','true');
INSERT INTO MainTable VALUES(85,'Маранта',2,4,'Нет',60,80,18,25,'Домашнее','false',6.0,2.0,3,'Разноцветный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(86,'Мирт',4,6,'Средне',50,70,16,24,'Домашнее','false',7.0,3.0,5,'Зелёный','Умеренный','Нейтральная','false');
INSERT INTO MainTable VALUES(87,'Монстера',3,5,'Нет',60,80,16,24,'Домашнее','false',4.0,1.0,3,'Зелёный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(88,'Мюленбекия',4,6,'Средне',30,50,10,30,'Домашнее','false',3.0,1.0,30,'Зелёный','Субтропический','Нейтральная','false');
INSERT INTO MainTable VALUES(89,'Нандина',4,6,'Средне',40,60,10,25,'Уличное','true',6.0,3.0,7,'Красный','Умеренный','Нейтральная','false');
INSERT INTO MainTable VALUES(90,'Непентес',3,5,'Нет',60,80,16,24,'Домашнее','false',4.0,2.0,3,'Разноцветный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(91,'Нертера',4,6,'Средне',50,70,16,24,'Домашнее','true',5.0,1.0,5,'Оранжевый','Субтропический','Нейтральная','false');
INSERT INTO MainTable VALUES(92,'Оплисменус',3,5,'Нет',60,80,18,24,'Домашнее','false',4.0,1.0,5,'Зелёный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(93,'Орхидея',3,5,'Нет',60,80,16,24,'Домашнее','false',4.0,1.0,3,'Розовый','Тропический','Нейтральная','true');
INSERT INTO MainTable VALUES(94,'Осока',4,8,'Да',40,80,10,30,'Уличное','false',6.0,2.0,10,'Зелёный','Умеренный','Нейтральная','true');
INSERT INTO MainTable VALUES(95,'Офиопогон',3,6,'Средне',50,70,16,24,'Домашнее','false',5.0,1.0,7,'Зелёный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(96,'Палисота',4,6,'Средне',50,70,18,24,'Домашнее','true',4.0,2.0,5,'Зелёный Красный Голубой Белый','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(97,'Панданус',4,6,'Средне',50,70,18,25,'Домашнее','true',6.0,4.0,7,'Зелёный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(98,'Паслён',6,8,'Да',40,60,15,25,'Уличное','true',5.0,2.0,10,'Зелёный','Умеренный','Отрицательная','false');
INSERT INTO MainTable VALUES(99,'Пахира',3,5,'Нет',60,80,16,24,'Домашнее','true',4.0,3.0,3,'Зелёный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(100,'Пеллиония',3,5,'Нет',60,80,16,24,'Домашнее','false',4.0,1.0,3,'Розовый','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(101,'Пеперомия',3,5,'Нет',50,70,18,25,'Домашнее','false',4.0,1.0,7,'Зелёный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(102,'Перец',6,8,'Да',60,80,20,30,'Уличное','true',6.0,2.0,3,'Красный','Субтропический','Нейтральная','true');
INSERT INTO MainTable VALUES(103,'Пизония',4,6,'Средне',70,90,22,27,'Уличное','false',7.0,4.0,10,'Фиолетовый','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(104,'Пилея',3,5,'Нет',50,70,18,25,'Домашнее','false',4.0,1.0,5,'Зелёный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(105,'Плектрантус',4,6,'Средне',40,60,16,24,'Домашнее','false',6.0,2.0,7,'Зелёный','Умеренный','Нейтральная','false');
INSERT INTO MainTable VALUES(106,'Плющ',3,5,'Нет',50,80,10,30,'Домашнее','false',7.0,3.0,10,'Зелёный','Умеренный','Нейтральная','true');
INSERT INTO MainTable VALUES(107,'Погонатерум',4,6,'Нет',60,80,18,26,'Домашнее','false',5.0,1.0,7,'Зелёный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(108,'Полисциас',3,6,'Средне',40,60,18,24,'Домашнее','false',5.0,4.0,7,'Зелёный','Умеренный','Нейтральная','false');
INSERT INTO MainTable VALUES(109,'Псевдоэрантемум',4,7,'Да',50,70,16,24,'Домашнее','false',6.0,3.0,5,'Красный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(110,'Радермахера',4,6,'Нет',60,80,18,25,'Домашнее','false',6.0,2.0,7,'Жёлтый','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(111,'Рео',6,8,'Да',40,60,22,26,'Домашнее','false',5.0,2.0,7,'Зелёный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(112,'Родея',3,5,'Нет',50,70,16,24,'Домашнее','false',4.0,1.0,3,'Розовый','Тропический','Нейтральная','true');
INSERT INTO MainTable VALUES(113,'Розмарин',7,9,'Да',30,50,20,25,'Уличное','false',6.0,2.0,10,'Зелёный','Умеренный','Нейтральная','true');
INSERT INTO MainTable VALUES(114,'Руэллия',4,6,'Средне',50,70,18,25,'Домашнее','false',6.0,2.0,7,'Фиолетовый','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(115,'Саговник поникающий (Цикас)',3,5,'Нет',40,60,16,24,'Домашнее','false',5.0,3.0,10,'Зелёный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(116,'Сансевиерия',2,4,'Да',30,50,15,27,'Домашнее','false',8.0,1.0,14,'Зелёный','Субтропический','Нейтральная','false');
INSERT INTO MainTable VALUES(117,'Сауроматум (Арум)',3,5,'Нет',60,80,10,25,'Домашнее','false',4.0,2.0,7,'Пурпурный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(118,'Селагинелла',2,4,'Нет',70,90,15,25,'Домашнее','false',5.0,1.0,3,'Зелёный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(119,'Сеткрезия',6,8,'Да',40,60,18,24,'Уличное','false',6.0,2.0,10,'Розовый','Умеренный','Нейтральная','false');
INSERT INTO MainTable VALUES(120,'Сидерасис',2,4,'Нет',60,80,14,24,'Домашнее','false',5.0,1.0,5,'Зелёный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(121,'Сингониум',3,5,'Нет',60,80,18,25,'Домашнее','false',6.0,2.0,7,'Зелёный, белый, розовый','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(122,'Солейролия',2,4,'Нет',70,90,15,22,'Домашнее','false',5.0,1.0,5,'Зелёный','Умеренный','Нейтральная','false');
INSERT INTO MainTable VALUES(123,'Спатифиллюм',3,5,'Нет',60,80,16,24,'Домашнее','false',4.0,1.0,3,'Зелёный, белый','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(124,'Строманта',4,6,'Средне',50,70,16,24,'Домашнее','false',7.0,3.0,5,'Зелёный, белый, розовый, фиолетовый ','Умеренный','Положительная','false');
INSERT INTO MainTable VALUES(125,'Сциндапсус',6,8,'Да',40,60,22,26,'Домашнее','false',5.0,2.0,7,'Зелёный, жёлтый, белый','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(126,'Тетрастигма',3,5,'Нет',60,80,18,25,'Домашнее','false',6.0,4.0,3,'Зелёный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(127,'Традесканция',4,6,'Средне',50,70,15,25,'Домашнее','false',7.0,2.0,5,'Синий','Умеренный','Нейтральная','false');
INSERT INTO MainTable VALUES(128,'Фасикулярия двуцветная ',3,5,'Средне',40,60,3,27,'Домашнее','false',2.0,7.0,6,'Зелёный с красными прицветниками','Субтропический','Нейтральная','false');
INSERT INTO MainTable VALUES(129,'Фатсия',4,6,'Средне',50,70,16,24,'Домашнее','false',7.0,3.0,5,'Зелёный','Умеренный','Нейтральная','false');
INSERT INTO MainTable VALUES(130,'Фатсхедера',4,6,'Средне',50,70,16,24,'Домашнее','false',7.0,3.0,5,'Зелёный с белой каймой','Умеренный','Нейтральная','false');
INSERT INTO MainTable VALUES(131,'Фейхоа',6,8,'Да',40,60,-11,30,'Уличное','true',5.0,2.0,10,'Зелёный','Субтропический','Нейтральная','false');
INSERT INTO MainTable VALUES(132,'Фикус',4,6,'Средне',50,70,16,24,'Домашнее','false',7.0,3.0,5,'Зелёный','Умеренный','Нейтральная','true');
INSERT INTO MainTable VALUES(133,'Фикус карика (инжир)',4,6,'Средне',50,70,16,24,'Уличное','true',7.0,4.0,5,'Зелёный','Умеренный','Нейтральная','true');
INSERT INTO MainTable VALUES(134,'Фикус каучуконосный (эластичный)',3,5,'Нет',50,70,15,27,'Домашнее','false',6.0,3.0,7,'Зелёный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(135,'Филодендрон',3,5,'Нет',60,80,16,24,'Домашнее','false',4.0,2.0,3,'Зелёный, белый, розовый','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(136,'Фиттония',3,5,'Нет',60,80,16,24,'Домашнее','false',4.0,1.0,3,'Зелёный с разноцветными прожилками','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(137,'Хлорофитум',4,6,'Средне',50,70,10,30,'Домашнее','false',7.0,1.0,5,'Зелёный, белый','Умеренный','Нейтральная','false');
INSERT INTO MainTable VALUES(138,'Хойя (восковой плющ)',3,5,'Нет',60,80,16,24,'Домашнее','false',4.0,1.0,3,'Зелёный, белый, розовый, жёлтый','Тропический','Нейтральная','true');
INSERT INTO MainTable VALUES(139,'Цианотис',4,6,'Средне',50,70,18,25,'Домашнее','false',6.0,2.0,7,'Синий','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(140,'Циперус',3,5,'Нет',60,80,15,25,'Домашнее','false',5.0,2.0,5,'Зелёный','Умеренный','Нейтральная','false');
INSERT INTO MainTable VALUES(141,'Циссус',3,5,'Нет',60,80,16,24,'Домашнее','false',4.0,1.0,3,'Разноцветный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(142,'Цитрусовые культуры',7,9,'Да',60,80,15,30,'Уличное','true',8.0,5.0,3,'Зелёный','Субтропический','Нейтральная','true');
INSERT INTO MainTable VALUES(143,'Энцефаляртос',6,8,'Да',30,50,10,25,'Домашнее','false',3.0,2.0,30,'Зелёный','Субтропический','Нейтральная','false');
INSERT INTO MainTable VALUES(144,'Эпипремнум',3,5,'Нет',60,80,16,24,'Домашнее','false',4.0,1.0,3,'Зелёный','Тропический','Нейтральная','false');
INSERT INTO MainTable VALUES(145,'Эписция',4,6,'Средне',50,70,18,22,'Домашнее','false',5.0,1.0,7,'Красный','Умеренный','Нейтральная','false');
COMMIT;
