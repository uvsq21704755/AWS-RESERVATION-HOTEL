drop table if exists Facture, Concerner, Offrir, Reservation, Client, Chambre, Categorie, Hotel, Service;
CREATE TABLE Client(
	ID_CLIENT int(10) NOT NULL,
	nom varchar(30) NOT NULL,
	prenom varchar(30) NOT NULL,
	N_tel varchar(14) NOT NULL,
	adr_mail varchar(30) NOT NULL,
	pays varchar(30) NOT NULL,
	mot_de_passe varchar(30) NOT NULL,
	fidelite int(30),
	PRIMARY KEY (ID_CLIENT)
);


CREATE TABLE Hotel(
	ID_HOTEL int(10) NOT NULL,
	nom varchar(30) NOT NULL,
	nom_prop varchar(30) NOT NULL,
	ville varchar(50) NOT NULL,
	N_tel varchar(14) NOT NULL,
	nb_etoile int(1) NOT NULL,
	PRIMARY KEY (ID_HOTEL)
);


CREATE TABLE Reservation(
	ID_RES int(10) NOT NULL,
	id_hotel int(10) NOT NULL,
	id_client int(10) NOT NULL,
	date_deb DATE NOT NULL,
	date_fin DATE NOT NULL,
	PRIMARY KEY (ID_RES),
	FOREIGN KEY (id_hotel) REFERENCES Hotel (ID_HOTEL) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (id_client) REFERENCES Client (ID_CLIENT) ON UPDATE CASCADE ON DELETE CASCADE
);



CREATE TABLE Facture(
	ID_FACTURE int(10) NOT NULL,
	id_res int(10) NOT NULL,
	prix int(10) NOT NULL,
	date_fact varchar(10) NOT NULL,
	PRIMARY KEY (ID_FACTURE),
	FOREIGN KEY (id_res) REFERENCES Reservation (ID_RES) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Categorie(
	ID_CAT int(10) NOT NULL,
	type_cat varchar(30) NOT NULL,
	PRIMARY KEY (ID_CAT)
);



CREATE TABLE Chambre(
	ID_CHAMBRE int(10) NOT NULL,
	num_cle int(10) NOT NULL,
	id_cat int(10) NOT NULL,
	id_hotel int(10) NOT NULL,
	nb_lits int(1) NOT NULL,
	surface int(2) NOT NULL,
	N_tel varchar(14) NOT NULL,
	PRIMARY KEY (ID_CHAMBRE),
	FOREIGN KEY (id_cat) REFERENCES Categorie (ID_CAT) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (id_hotel) REFERENCES Hotel (ID_HOTEL) ON UPDATE CASCADE ON DELETE CASCADE
);



CREATE TABLE Service(
	CODE_SERVICE int(10) NOT NULL,
	nom_service varchar(50) NOT NULL,
	description varchar(100) NOT NULL,
	PRIMARY KEY (CODE_SERVICE)
);



CREATE TABLE Offrir(
	code_service int(10) NOT NULL,
	id_hotel int(10) NOT NULL,
	PRIMARY KEY (code_service,id_hotel),
	FOREIGN KEY (code_service) REFERENCES Service (CODE_SERVICE) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (id_hotel) REFERENCES Hotel (ID_HOTEL) ON UPDATE CASCADE ON DELETE CASCADE
);



CREATE TABLE Concerner(
	id_res int(10) NOT NULL,
	id_chambre int(10) NOT NULL,
	PRIMARY KEY (id_res,id_chambre),
	FOREIGN KEY (id_chambre) REFERENCES Chambre (ID_CHAMBRE) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (id_res) REFERENCES Reservation (ID_RES) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Commentaire(
	ID_Com int(10) NOT NULL,
	contenu varchar(150) NOT NULL,
	id_hotel int(10) NOT NULL,
	PRIMARY KEY (ID_Com),
	FOREIGN KEY (id_hotel) REFERENCES Hotel (ID_HOTEL) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO Commentaire values
  (1,"tres bon accueil",1),
  (2,"Parfait",1),
  (3,"hotel propre et les chambres sont très belles",1),
  (4,"Les chambres sont bien",1),
  (5,"Je ne suis pas satisfait",2),
  (6,"Chambre propre, cependant vitres sales, porte de salle de bain avec de nombreuses traces",2),
  (7,"hotel propre",3),
  (8,"Personnel très acceuillant",3),
  (9,"super hotel",3),
  (10,"Les chambres sont spacieuses",4),
  (11,"accueil chaleureux",4),
  (12,"Chambre pas propre",4),
  (13,"Hôtel simple à un prix raisonnable",5),
  (14,"Personel accueil sympathique",5),
  (15,"Hotel difficile à acceder pour les nouveaux venus",6),
  (16,"Les escaliers ne sont pas propre. Les murs en carton",6);




INSERT INTO Client values
  (1,"Prescott","James","02 95 64 08 36","morbi.quis@hotmail.couk","United States","ipsum",162),
  (2,"Raya","Friedmann","06 24 08 15 25","dui.fusce@google.edu","Spain","natoque",104),
  (3,"Graiden","Nieto","07 36 52 82 30","auctor.vitae@aol.org","United States","dui",69),
  (4,"Hyacinth","Cortes","07 84 56 32 88","penatibus.et@icloud.edu","France","Ut",40),
  (5,"Charde","Plamondon","08 83 88 66 20","nec.mauris.blandit@aol.couk","United States","et",72),
  (6,"Tiger","Adrichem","02 07 75 99 27","euismod.in@google.com","France","conubia",70),
  (7,"MacKenzie","Tremble","05 22 45 62 34","nec.enim@yahoo.edu","Belgium","Nunc",117),
  (8,"Ignatius","Langlais","06 22 55 84 84","risus.at.fringilla@aol.net","Spain","Nunc",59),
  (9,"Hakeem","Coleman","04 06 87 17 51","non@yahoo.couk","United States","Suspendisse",156),
  (10,"Benjamin","Soto","05 14 81 16 78","adipiscing.non.luctus@protonmail.edu","United States","iaculis",87),
  (11,"Tamekah","Jensen","04 82 25 25 17","nascetur.ridiculus@protonmail.org","United Kingdom","ligula.",25),
  (12,"Desirae","Fischer","06 33 84 21 96","nisi@aol.edu","Canada","tristique",67),
  (13,"William","Ramirez","08 61 46 55 43","sit.amet.risus@yahoo.org","Spain","lorem",64),
  (14,"Barclay","Janssens","07 25 93 77 17","proin.velit@yahoo.edu","Canada","feugiat",72),
  (15,"Iola","Pietsch","05 75 29 44 85","nulla@outlook.net","Canada","mi",77),
  (16,"Colorado","Santos","02 54 33 69 85","eleifend.egestas.sed@protonmail.com","Canada","Quisque",166),
  (17,"Amaya","Royer","02 40 35 07 16","sed.pharetra@outlook.net","Spain","auctor",49),
  (18,"Dale","Aakster","06 91 41 77 42","hendrerit@icloud.org","Germany","Aliquam",97),
  (19,"Jakeem","Sullivan","03 71 56 48 58","aliquet.libero.integer@yahoo.org","United States","Suspendisse",149),
  (20,"Ezra","Green","08 84 93 88 89","donec.feugiat@outlook.ca","France","urna.",64),
  (21,"Devin","Soler","04 63 76 14 17","ut.semper@hotmail.org","Spain","nec,",88),
  (22,"Lewis","Schmitt","03 48 77 30 76","ut.odio@hotmail.ca","United States","ornare,",27),
  (23,"Brady","Alvarez","09 82 46 24 08","sed.pede@aol.edu","Belgium","montes,",118),
  (24,"Blaze","Aguilar","08 58 43 29 14","eros.nam@protonmail.ca","Spain","eget",49),
  (25,"Brenna","Bezuindenhout","03 44 16 67 34","elit.fermentum@aol.edu","Spain","Mauris",20),
  (26,"Maile","Nieto","02 74 43 64 56","neque@icloud.com","Germany","ullamcorper",107),
  (27,"Gray","Rubio","05 31 64 11 81","quam@aol.ca","Germany","nec",120),
  (28,"Nomlanga","Lane","03 48 48 01 08","fringilla.cursus@outlook.edu","Germany","tellus",50),
  (29,"Maggy","Friedmann","07 31 84 14 41","eu.tellus.eu@hotmail.com","Spain","turpis",140),
  (30,"Gary","Rose","06 46 35 57 42","dictum@google.couk","Canada","varius.",7),
  (31,"Nayda","Monet","08 86 02 03 94","mauris@icloud.net","Belgium","mus.",35),
  (32,"Iola","Schultz","09 77 64 90 18","elit.pretium.et@icloud.couk","France","vitae",105),
  (33,"Vladimir","Rivera","07 26 45 31 70","tellus@google.org","France","sem",83),
  (34,"Jordan","Suarez","05 26 27 45 35","vivamus.nisi.mauris@protonmail.ca","United States","nunc.",99),
  (35,"Yoshio","Segal","08 18 52 42 85","faucibus.id@yahoo.edu","United States","tincidunt",119),
  (36,"Jamal","Jones","02 55 52 40 29","et@hotmail.couk","Spain","Phasellus",46),
  (37,"Jessamine","Chastain","08 16 95 23 01","duis.gravida@google.org","Canada","semper",87),
  (38,"Pamela","Navarro","06 76 75 25 49","montes.nascetur.ridiculus@icloud.org","United States","sapien",168),
  (39,"Kibo","Schuster","08 83 63 76 51","et.nunc.quisque@yahoo.org","Belgium","scelerisque",127),
  (40,"William","Jenkins","04 71 46 66 51","est@yahoo.com","Canada","eget",128),
  (41,"Rhona","Haak","09 53 46 75 87","ut@aol.couk","Spain","nec,",10),
  (42,"Abigail","Baardwijk","06 38 04 69 18","elit.fermentum.risus@google.org","France","Etiam",116),
  (43,"Orla","Martin","05 54 51 14 84","nisi.mauris.nulla@icloud.net","Belgium","accumsan",132),
  (44,"Natalie","Brugger","04 26 76 05 57","quam.elementum@protonmail.com","France","arcu.",55),
  (45,"Ruth","Ferrer","08 41 32 28 21","elit.aliquam@yahoo.net","Spain","fringilla",168),
  (46,"Jaime","Myers","05 35 29 52 20","et.magnis@aol.edu","Canada","sit",1),
  (47,"Joshua","Ferrer","07 73 28 84 87","donec@protonmail.edu","United States","et",117),
  (48,"Chelsea","Bellamy","04 19 23 10 95","pretium.et.rutrum@aol.com","Spain","Phasellus",57),
  (49,"Alma","Grün","07 61 13 85 42","rutrum.fusce@google.couk","Canada","lacinia",61),
  (50,"Cassady","Eikenboom","04 85 59 39 30","pretium.et@yahoo.org","United Kingdom","et",144),
  (51,"Yen","Jansen","07 55 43 31 44","tincidunt.tempus@aol.edu","United Kingdom","Nullam",85),
  (52,"Dolan","Van Alphen","07 35 74 78 75","aliquam.vulputate.ullamcorper@google.net","Spain","malesuada",155),
  (53,"Thor","Aarden","05 70 75 74 64","nunc.mauris@yahoo.edu","United Kingdom","vel",72),
  (54,"Halee","Serrano","04 94 88 35 19","convallis.dolor@yahoo.edu","United Kingdom","mauris",28),
  (55,"Tana","Vidal","06 84 76 11 32","libero@aol.couk","Germany","mollis.",84),
  (56,"Henry","Royer","02 93 68 51 93","non.ante.bibendum@hotmail.com","France","fermentum",72),
  (57,"Emmanuel","Arnold","06 71 47 24 27","fusce.dolor@hotmail.com","Canada","Donec",90),
  (58,"Jasper","Ford","02 56 47 83 43","molestie@protonmail.edu","Belgium","Proin",141),
  (59,"Raya","Butler","08 85 86 96 67","leo.vivamus@outlook.edu","France","magna",138),
  (60,"Josephine","Brisbois","09 67 67 41 93","lobortis@icloud.couk","Spain","semper",90),
  (61,"Carol","Roßmann","03 36 67 10 07","placerat@icloud.com","Belgium","vulputate",165),
  (62,"Kellie","Santana","06 81 83 28 27","magnis@aol.couk","France","lectus",80),
  (63,"Talon","Reid","09 86 56 12 73","nec@google.net","Germany","mi",25),
  (64,"Nola","Reyes","06 41 13 47 65","vel.est.tempor@protonmail.ca","United Kingdom","rhoncus.",38),
  (65,"Jacqueline","Offermans","03 41 11 75 18","mattis@outlook.ca","Belgium","nonummy",109),
  (66,"Carissa","Garrett","07 16 55 77 37","odio.tristique@yahoo.ca","Belgium","In",59),
  (67,"Cheryl","Reyes","03 52 87 13 11","tortor.dictum@icloud.edu","Belgium","a",30),
  (68,"Kaseem","Heeren","04 41 12 37 64","turpis.aliquam@protonmail.couk","Spain","leo,",41),
  (69,"Drake","Gibson","07 67 11 19 90","gravida@aol.com","Spain","aliquet,",46),
  (70,"Devin","Van Aalsburg","02 35 71 45 35","feugiat.lorem.ipsum@icloud.couk","United States","et",168),
  (71,"Judith","Langlais","08 20 77 50 68","ipsum.cursus@aol.ca","Canada","ac",9),
  (72,"Eugenia","Janssens","07 60 99 73 61","vivamus.non@aol.org","United Kingdom","sit",92),
  (73,"Forrest","Poirier","04 44 49 43 38","dis.parturient@protonmail.couk","France","vitae",76),
  (74,"Raymond","Peerenboom","05 60 70 52 17","nunc@aol.couk","United States","sapien",5),
  (75,"Larissa","Reyes","08 84 31 90 22","sagittis.semper.nam@icloud.net","Canada","mauris",127),
  (76,"Elmo","Nuñez","09 12 99 65 89","magna.ut.tincidunt@icloud.couk","Spain","purus.",98),
  (77,"Colleen","Tremblay","04 16 57 24 55","ligula.donec.luctus@outlook.org","Spain","turpis.",155),
  (78,"Maxwell","Grün","05 72 76 85 76","orci.lacus.vestibulum@icloud.ca","Germany","velit",113),
  (79,"Peter","Gomez","01 87 47 66 41","metus.aenean@outlook.couk","Canada","nibh.",130),
  (80,"Jesse","Nichols","04 12 42 83 60","mauris.quis.turpis@icloud.couk","Belgium","luctus",32),
  (81,"Connor","Adrichem","04 28 80 58 06","integer@hotmail.ca","United States","venenatis",149),
  (82,"Lois","Schinacher","08 71 58 31 59","auctor.nunc@protonmail.edu","Canada","auctor",36),
  (83,"Holmes","Fernandez","02 38 31 76 78","at.egestas@hotmail.org","Germany","mauris.",120),
  (84,"Wade","Ross","02 27 65 99 21","malesuada.malesuada@hotmail.net","France","gravida.",19),
  (85,"Alexandra","Graf","01 04 40 43 79","dignissim.maecenas.ornare@aol.ca","France","ante",18),
  (86,"Judah","Beaulieu","01 64 09 06 58","phasellus@outlook.net","Belgium","suscipit",144),
  (87,"Gareth","Carroll","03 22 79 89 46","nec.cursus@protonmail.ca","Canada","mus.",24),
  (88,"Kelsie","Royer","09 50 55 67 21","consectetuer.adipiscing@google.com","Belgium","adipiscing",138),
  (89,"Callum","Nguyen","02 06 85 22 50","elit@aol.ca","United States","euismod",55),
  (90,"Denton","Kraus","07 77 77 19 67","non.egestas@hotmail.edu","Belgium","Nulla",109),
  (91,"Howard","Boger","06 20 43 33 63","conubia.nostra@outlook.ca","Canada","mattis",3),
  (92,"Ruth","Morales","02 12 35 79 68","augue.scelerisque@protonmail.ca","France","elit,",161),
  (93,"Hiram","Strauß","07 77 48 20 16","nullam.nisl@google.couk","Belgium","sociis",162),
  (94,"Blaze","Lozano","02 53 58 86 61","arcu.curabitur.ut@hotmail.net","United States","tempor",1),
  (95,"Xantha","Torres","06 51 82 15 27","lacus.mauris@outlook.com","United Kingdom","per",161),
  (96,"Ivory","Geelen","06 81 01 42 76","tempor.erat@hotmail.com","Belgium","neque",124),
  (97,"Richard","Hartmann","01 30 73 16 09","non@outlook.ca","Belgium","nibh",125),
  (98,"Henry","Moreno","08 02 87 34 84","nisi.cum.sociis@hotmail.edu","Canada","lacus.",112),
  (99,"Pamela","Adrichem","02 74 27 55 41","eget@outlook.edu","United States","faucibus",52),
  (100,"Hyatt","Schultz","03 57 58 17 64","erat.volutpat.nulla@protonmail.edu","Canada","eu",125);



INSERT INTO Hotel VALUES
(1, 'Hyatt Regency', 'Kylian', 'Paris', '01 48 59 32 94',4),
(2, 'Explorers Hotel', 'Lassana', 'Marne-La-Vallée', '01 22 02 80 33', 3),
(3,'Best Western', 'Antoine', 'Paris', '01 28 00 35 01',5),
(4, 'Barrière Le Majestic', 'Frederic', 'Cannes', '01 09 89 67 22',1),
(5,'Disneyland', 'Alin', 'Monaco', '01 59 87 62 30', 2),
(6,'Le Club de Cavalière', 'Alvin', 'Versailles', '01 25 37 89 64', 4);



INSERT INTO Categorie VALUES
(1, 'Régulière'),
(2, 'Familiale'),
(3,'Suite'),
(4, 'Communicante'),
(5, 'Voisine'),
(6,'Adjacente');



INSERT INTO Chambre VALUES
(1,1,2,1,5,45,'11 00'),
(2,2,3,1,3,35,'11 01'),
(3,3,1,1,2,20,'11 02'),
(4,4,6,1,1,14,'11 03'),
(5,5,4,1,2,24,'11 04'),
(6,6,5,1,1,15,'11 05'),
(67,7,3,1,3,30,'11 06'),
(68,8,4,1,2,23,'11 07'),
(69,9,2,1,4,47,'11 08'),
(70,10,6,1,1,16,'11 09'),
(71,11,1,1,2,18,'11 10'),
(72,12,5,1,1,15,'11 11'),
(126,13,2,1,5,42,'11 12'),
(127,14,3,1,3,32,'11 13'),
(128,15,1,1,2,28,'11 14'),
(129,16,6,1,1,16,'11 15'),
(130,17,4,1,2,26,'11 16'),
(131,18,5,1,1,17,'11 17'),
(132,19,1,1,2,22,'11 18'),
(133,20,6,1,1,13,'11 19'),
(134,21,4,1,2,27,'11 20'),
(135,22,5,1,1,19,'11 21'),
(34,23,6,1,1,18,'11 22'),
(35,24,4,1,2,24,'11 23'),
(36,25,5,1,1,13,'11 24'),
(7,1,2,2,6,46,'12 00'),
(8,2,3,2,3,37,'12 01'),
(9,3,1,2,2,21,'12 02'),
(10,4,6,2,1,16,'12 03'),
(11,5,4,2,1,15,'12 04'),
(12,6,5,2,1,17,'12 05'),
(73,7,2,2,6,42,'12 06'),
(74,8,3,2,3,33,'12 07'),
(75,9,1,2,2,24,'12 08'),
(76,10,6,2,1,18,'12 09'),
(77,11,4,2,1,15,'12 10'),
(78,12,5,2,1,16,'12 11'),
(79,13,2,2,6,46,'12 12'),
(80,14,3,2,3,36,'12 13'),
(81,15,1,2,2,22,'12 14'),
(82,16,6,2,1,18,'12 15'),
(83,17,4,2,1,16,'12 16'),
(84,18,5,2,1,17,'12 17'),
(85,19,4,2,1,15,'12 18'),
(86,20,5,2,1,16,'12 19'),
(13,1,2,3,4,44,'13 00'),
(14,2,3,3,2,34,'13 01'),
(15,3,1,3,2,24,'13 02'),
(16,4,6,3,1,14,'13 03'),
(17,5,4,3,2,26,'13 04'),
(18,6,5,3,1,15,'13 05'),
(87,7,2,3,4,45,'13 06'),
(88,8,3,3,3,36,'13 07'),
(89,9,1,3,2,29,'13 08'),
(90,10,6,3,1,18,'13 09'),
(91,11,4,3,2,28,'13 10'),
(92,12,5,3,1,17,'13 11'),
(93,13,2,3,4,44,'13 12'),
(94,14,3,3,2,34,'13 13'),
(95,15,1,3,2,24,'13 14'),
(96,16,6,3,1,14,'13 15'),
(97,17,4,3,2,26,'13 16'),
(98,18,5,3,1,15,'13 17'),
(99,19,2,3,4,45,'13 18'),
(100,20,3,3,3,36,'13 19'),
(101,21,1,3,3,29,'13 20'),
(102,22,6,3,1,18,'13 21'),
(103,23,4,3,2,28,'13 22'),
(104,24,5,3,1,17,'13 23'),
(105,25,2,3,4,45,'13 24'),
(106,26,3,3,3,36,'13 25'),
(107,27,1,3,3,29,'13 26'),
(108,28,6,3,1,18,'13 27'),
(109,29,4,3,2,28,'13 28'),
(110,30,5,3,1,17,'13 29'),
(111,31,6,3,1,18,'13 30'),
(112,32,4,3,2,28,'13 31'),
(113,33,5,3,2,18,'13 32'),
(19,1,2,4,4,40,'14 00'),
(20,2,3,4,3,38,'14 01'),
(21,3,1,4,2,20,'14 02'),
(22,4,6,4,1,19,'14 03'),
(23,5,4,4,2,26,'14 04'),
(24,6,5,4,1,13,'14 05'),
(25,7,2,4,4,41,'14 06'),
(26,8,3,4,3,39,'14 07'),
(27,9,1,4,2,21,'14 08'),
(28,10,6,4,1,17,'14 09'),
(29,11,4,4,2,25,'14 10'),
(30,12,5,4,1,12,'14 11'),
(31,13,2,4,5,49,'14 12'),
(32,14,3,4,3,32,'14 13'),
(33,15,1,4,2,26,'14 14'),
(37,1,2,5,5,44,'15 00'),
(38,2,3,5,3,33,'15 01'),
(39,3,1,5,2,22,'15 02'),
(40,4,6,5,1,16,'15 03'),
(41,5,4,5,2,22,'15 04'),
(42,6,5,5,1,14,'15 05'),
(43,7,2,5,5,47,'15 06'),
(44,8,3,5,3,39,'15 07'),
(45,9,1,5,2,29,'15 08'),
(46,10,6,5,1,20,'15 09'),
(47,11,4,5,2,28,'15 10'),
(48,12,5,5,1,19,'15 11'),
(49,13,2,5,5,45,'15 12'),
(50,14,3,5,3,39,'15 13'),
(51,15,1,5,2,30,'15 14'),
(52,16,6,5,1,18,'15 15'),
(53,17,4,5,2,28,'15 16'),
(54,18,5,5,1,18,'15 17'),
(55,1,2,6,5,49,'16 00'),
(56,2,3,6,3,37,'16 01'),
(57,3,1,6,2,29,'16 02'),
(58,4,6,6,1,20,'16 03'),
(59,5,4,6,2,29,'16 04'),
(60,6,5,6,1,19,'16 05'),
(61,7,2,6,5,45,'16 06'),
(62,8,3,6,3,35,'16 07'),
(63,9,1,6,2,24,'16 08'),
(64,10,6,6,1,18,'16 09'),
(65,11,4,6,2,25,'16 10'),
(66,12,5,6,1,16,'16 11'),
(114,13,2,6,5,49,'16 12'),
(115,14,3,6,3,37,'16 13'),
(116,15,1,6,2,29,'16 14'),
(117,16,6,6,1,20,'16 15'),
(118,17,4,6,2,29,'16 16'),
(119,18,5,6,1,19,'16 17'),
(120,19,2,6,5,45,'16 18'),
(121,20,3,6,3,35,'16 19'),
(122,21,1,6,2,24,'16 20'),
(123,22,6,6,1,18,'16 21'),
(124,23,4,6,2,25,'16 22'),
(125,24,5,6,1,16,'16 23');



INSERT INTO Reservation VALUES
(1,6,60,"2022-07-04","2022-07-29"),
  (2,2,64,"2022-07-03","2022-07-27"),
  (3,5,7,"2022-07-08","2022-07-18"),
  (4,1,15,"2022-07-02","2022-07-27"),
  (5,4,12,"2022-07-08","2022-07-30"),
  (6,5,54,"2022-07-04","2022-07-21"),
  (7,3,5,"2022-07-02","2022-07-12"),
  (8,4,21,"2022-07-04","2022-07-19"),
  (9,4,51,"2022-07-02","2022-07-24"),
  (10,1,7,"2022-07-03","2022-07-16"),
  (11,6,34,"2022-07-04","2022-07-22"),
  (12,5,18,"2022-07-01","2022-07-20"),
  (13,2,9,"2022-07-07","2022-07-13"),
  (14,6,12,"2022-07-02","2022-07-28"),
  (15,1,2,"2022-07-01","2022-07-25"),
  (16,1,6,"2022-07-03","2022-07-26"),
  (17,4,21,"2022-07-03","2022-07-13"),
  (18,2,24,"2022-07-06","2022-07-18"),
  (19,2,52,"2022-07-07","2022-07-14"),
  (20,4,10,"2022-07-02","2022-07-17"),
  (21,1,60,"2022-07-08","2022-07-12"),
  (22,1,32,"2022-07-04","2022-07-21"),
  (23,3,23,"2022-07-04","2022-07-15"),
  (24,2,6,"2022-07-06","2022-07-16"),
  (25,2,21,"2022-07-03","2022-07-21"),
  (26,4,38,"2022-07-03","2022-07-26"),
  (27,1,69,"2022-07-01","2022-07-10"),
  (28,3,15,"2022-07-02","2022-07-11"),
  (29,5,23,"2022-07-05","2022-07-27"),
  (30,6,53,"2022-07-01","2022-07-22"),
  (31,5,46,"2022-07-02","2022-07-15"),
  (32,5,37,"2022-07-01","2022-07-25"),
  (33,5,35,"2022-07-02","2022-07-18"),
  (34,3,24,"2022-07-04","2022-07-30"),
  (35,5,10,"2022-07-02","2022-07-12"),
  (36,4,26,"2022-07-05","2022-07-28"),
  (37,4,61,"2022-07-04","2022-07-21"),
  (38,2,34,"2022-07-03","2022-07-10"),
  (39,2,5,"2022-07-05","2022-07-12"),
  (40,2,56,"2022-07-05","2022-07-15"),
  (41,3,42,"2022-07-07","2022-07-12"),
  (42,3,51,"2022-07-05","2022-07-29"),
  (43,3,68,"2022-07-06","2022-07-16"),
  (44,4,24,"2022-07-02","2022-07-26"),
  (45,2,2,"2022-07-06","2022-07-12"),
  (46,3,69,"2022-07-07","2022-07-14"),
  (47,4,56,"2022-07-02","2022-07-24"),
  (48,3,50,"2022-07-07","2022-07-15"),
  (49,3,58,"2022-07-05","2022-07-28"),
  (50,1,21,"2022-07-03","2022-07-24"),
  (51,3,46,"2022-07-07","2022-07-14"),
  (52,5,39,"2022-07-03","2022-07-30"),
  (53,3,57,"2022-07-05","2022-07-18"),
  (54,5,15,"2022-07-04","2022-07-19"),
  (55,2,11,"2022-07-07","2022-07-18"),
  (56,2,60,"2022-07-03","2022-07-29"),
  (57,3,4,"2022-07-03","2022-07-15"),
  (58,1,69,"2022-07-05","2022-07-18"),
  (59,2,44,"2022-07-08","2022-07-19"),
  (60,1,57,"2022-07-08","2022-07-19"),
  (61,3,60,"2022-07-05","2022-07-23"),
  (62,1,61,"2022-07-01","2022-07-15"),
  (63,4,46,"2022-07-04","2022-07-25"),
  (64,5,66,"2022-07-02","2022-07-29"),
  (65,3,5,"2022-07-07","2022-07-23"),
  (66,4,26,"2022-07-04","2022-07-18"),
  (67,3,8,"2022-07-02","2022-07-23"),
  (68,5,47,"2022-07-01","2022-07-28"),
  (69,4,41,"2022-07-06","2022-07-18"),
  (70,2,46,"2022-07-08","2022-07-16"),
  (71,5,36,"2022-07-07","2022-07-20"),
 (72,4,39,"2022-07-02","2022-07-15"),
  (73,2,15,"2022-07-06","2022-07-14"),
 (74,2,43,"2022-07-02","2022-07-27"),
 (75,4,35,"2022-07-04","2022-07-28"),
 (76,4,16,"2022-07-02","2022-07-23"),
 (77,3,8,"2022-07-07","2022-07-10"),
 (78,5,14,"2022-07-05","2022-07-20"),
 (79,6,50,"2022-07-05","2022-07-13"),
 (80,4,6,"2022-07-06","2022-07-16"),
 (81,6,63,"2022-07-03","2022-07-31"),
 (82,3,13,"2022-07-03","2022-07-28"),
 (83,4,56,"2022-07-06","2022-07-28"),
 (84,5,15,"2022-07-06","2022-07-28"),
 (85,5,36,"2022-07-02","2022-07-29");




INSERT INTO Service VALUES
(1,'La restauration' , 'La plupart des hotels presente pas ce service pour tous les repas ils offrent que le petit dejeuner '),
(2,'La WIFI' , 'Libre service accessible partout dans l hotel '),
(3,'Chambre avec climatisation et/ou chauffage' , 'Pour le bien etre des clients la temperature des chambre doit etre appropriée '),
(4,'Parking' , 'La possibilité de stationnement des vehicules des client est un element essentiel '),
(5,'Conciergerie' , 'Réservation de taxis, navettes de transfert vers les gares et aéroports... '),
(6,'Affaires pour le bain' , 'Sèche cheveux, gel douche, shampoing, serviette de bain… '),
(7,'Mini bar' , 'Petite armoire a boisson en dispositon de la clientele '),
(8,'Spa ' , ' Certains hôtels proposent possibilité de réserver un espace pour privatiser quelques heures de detente et va souvent de pair avec des soins du corps comme le gommage, des soins du visage, voire des massages.'),
(9,'Nécessaire bébé ' , 'Lit, chaise haute, etc. '),
(10,'Salle de fitness' , 'Les services proposés sont variés, allant de la salle de fitness de base avec les principales machines (appareils de cadio-training, vélos, tapis de course, haltères, poids), au coach sportif personnel, en passant par des cours collectifs. '),
(11,'Room service' , 'Service de chambre dans un hôtel qui permet de commander et de recevoir de la nourriture et des boissons dans sa chambre. '),
(12,'Piscine' , 'Accessible a partir de 10h00 a 18h00 '),
(13,'Services pour personnes à mobilité réduite' , 'Mise en place de dispositifs adaptés aux personnes en situation de handicap ( ascenseur adapté aux feuteuils roulants, WC adapté, douche de plein pied ...)'),
(14,'Loisir audiovisuel' , 'Une offre de chaine TV, une location de films ou bien un accès à un catalogue vidéo (Netflix  / YouTube) est indispensable dans l’offre hôtelière. '),
(15,'Guide touristique' , 'La plupart des clients ne connaissent pas les environs de l hotel et sont souvent interressees par decouvrir de bonnes adresses et de creer de beaux souvenirs, alors pourquoi pas les aider a trouver leur bonehur avec un cityguide '),
(16,'Service blanchisserie sur demande' , 'Assurer un traitement du linge adapté aux différents articles pour un linge au rendu irréprochable et toujours disponible.'),
(17,'Coffre-fort' , 'Possibilité de ranger vos affaires de valeurs en toute securité. '),
(18,'Baby-sitting' , 'Une equipe formée est a votre dispositon si vous voulez vous baladez en couple. '),
(19,'Bibliotheque' , 'Certains hôtels proposent un salon ou un bar-bibliothèque, avec une sélection de livres triés sur le volet ( Livres d art, biographies, anciens... ) '),
(20,'Animaux de compagnie acceptés' , 'Aucun voyage ne saurait être réussi sans votre fidèle compagnon à vos côtés : ce serait comme laisser un membre de votre famille derrière vous ');


INSERT INTO Offrir VALUES
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(8,1),
(9,1),
(10,1),
(11,1),
(12,1),
(13,1),
(14,1),
(15,1),
(1,2),
(2,2),
(3,2),
(4,2),
(5,2),
(6,2),
(7,2),
(8,2),
(9,2),
(10,2),
(1,3),
(2,3),
(3,3),
(4,3),
(5,3),
(6,3),
(7,3),
(8,3),
(9,3),
(10,3),
(11,3),
(12,3),
(13,3),
(14,3),
(15,3),
(16,3),
(17,3),
(18,3),
(19,3),
(20,3),
(1,4),
(2,4),
(1,5),
(2,5),
(3,5),
(4,5),
(5,5),
(1,6),
(2,6),
(3,6),
(4,6),
(5,6),
(6,6),
(7,6),
(8,6),
(9,6),
(10,6),
(11,6),
(12,6),
(13,6),
(14,6),
(15,6);

INSERT INTO Concerner VALUES
(1,69),
(2,71),
(83,71),
(3,34),
(4,36),
(5,35),
(6,70),
(7,72),
(82,6),
(8,3),
(9,5),
(10,1),
(61,4),
(11,85),
(12,77),
(13,81),
(14,81),
(84,12),
(15,9),
(16,73),
(17,80),
(85,76),
(18,10),
(19,8),
(20,11),
(62,11),
(21,107),
(71,108),
(22,106),
(23,113),
(24,111),
(25,91),
(72,93),
(26,95),
(27,102),
(28,100),
(29,89),
(30,99),
(73,96),
(63,90),
(67,90),
(31,23),
(32,20),
(33,21),
(74,19),
(34,28),
(35,28),
(36,28),
(37,27),
(38,33),
(75,32),
(39,31),
(40,30),
(64,29),
(68,29),
(76,29),
(41,53),
(42,53),
(43,50),
(44,42),
(45,47),
(46,39),
(47,38),
(77,40),
(48,41),
(49,54),
(50,54),
(65,43),
(78,49),
(69,49),
(51,119),
(52,116),
(79,121),
(53,62),
(54,120),
(55,122),
(56,124),
(80,65),
(57,118),
(58,117),
(59,115),
(60,66),
(81,64),
(66,62),
(70,60);

INSERT INTO Facture VALUES
(1,1,2600,'08/10/2020'),
(2,2,5200,'26/09/2019'),
(3,83,3200,'12/11/2020'),
(4,3,3800,'12/11/2020'),
(5,4,2800,'02/07/2019'),
(6,5,7600,'08/03/2020'),
(7,6,4400,'23/05/2020'),
(8,7,1400,'22/02/2018'),
(9,82,6800,'15/03/2020'),
(10,8,7600,'12/03/2020'),
(11,9,3800,'09/12/2020'),
(12,10,6200,'11/11/2019'),
(13,61,8600,'01/01/2019'),
(14,11,1800,'18/11/2020'),
(15,12,3000,'02/01/2019'),
(16,13,4200,'01/09/2020'),
(17,14,7650,'16/06/2019'),
(18,84,5400,'25/07/2020'),
(19,15,2850,'20/02/2020'),
(20,16,3300,'23/05/2020'),
(21,17,1800,'20/05/2018'),
(22,85,4050,'15/06/2020'),
(23,18,2750,'12/04/2020'),
(24,19,1950,'02/12/2020'),
(25,20,4800,'11/08/2019'),
(26,62,5700,'18/04/2020'),
(27,21,2400,'21/12/2019'),
(28,71,3300,'19/12/2020'),
(29,22,13200,'12/01/2019'),
(30,23,8700,'21/09/2020'),
(31,24,3000,'26/06/2019'),
(85,25,5400,'22/04/2020'),
(32,72,2400,'22/12/2020'),
(33,26,11100,'08/05/2020'),
(34,27,3300,'10/05/2018'),
(35,28,5400,'01/04/2020'),
(36,29,7200,'23/12/2019'),
(37,30,9600,'11/07/2019'),
(38,73,12300,'15/08/2020'),
(39,63,8400,'15/10/2020'),
(40,67,2700,'20/07/2019'),
(41,31,1650,'19/06/2020'),
(42,32,1150,'02/02/2020'),
(43,33,800,'13/09/2020'),
(44,74,500,'19/10/2019'),
(45,34,1000,'06/11/2019'),
(46,35,1200,'03/12/2020'),
(47,36,1250,'18/05/2020'),
(48,37,550,'21/03/2018'),
(49,38,500,'10/04/2020'),
(50,75,500,'10/08/2019'),
(51,39,150,'23/01/2020'),
(52,40,1350,'19/07/2019'),
(53,64,750,'28/08/2020'),
(54,68,1150,'19/11/2019'),
(55,76,3050,'19/10/2020'),
(56,41,2000,'04/01/2018'),
(57,42,1200,'31/03/2020'),
(58,43,960,'09/10/2020'),
(59,44,960,'25/08/2019'),
(60,45,880,'18/06/2020'),
(61,46,800,'18/12/2020'),
(62,47,1600,'09/11/2018'),
(63,77,1360,'12/12/2020'),
(64,48,2000,'04/04/2020'),
(65,49,720,'28/01/2019'),
(66,50,960,'10/05/2020'),
(67,65,1120,'14/12/2019'),
(68,78,3440,'04/01/2020'),
(69,69,800,'16/09/2019'),
(70,51,9000,'13/02/2020'),
(71,52,9600,'03/01/2019'),
(72,79,1600,'18/12/2020'),
(73,53,3200,'14/11/2020'),
(74,54,9000,'23/06/2019'),
(75,55,4400,'21/03/2020'),
(76,56,5200,'18/06/2020'),
(77,80,3600,'25/07/2019'),
(78,57,1600,'10/05/2018'),
(79,58,1800,'31/03/2020'),
(80,59,3200,'20/11/2020'),
(81,60,3400,'25/08/2019'),
(82,81,8600,'13/07/2020'),
(83,66,8000,'19/06/2020'),
(84,70,10200,'05/03/2020');




	
