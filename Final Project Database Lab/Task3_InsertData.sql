INSERT INTO Employee VALUES
('EMP001','Anang','Male','Jl. Rawa Belong no.30','081212392910',2000000),
('EMP002','Ben','Male','Jl. Singkalang no.104','083002878290',3500000),
('EMP003','Chika','Female','Jl. Pisang no.2','082138923901',2740000),
('EMP004','Danang','Male','Jl. Syahdan no.5','080218392903',5000000),
('EMP005','Ely','Female','Jl. Diponegoro no.12','081247892019',3000000),
('EMP006','Felicia','Female','Jl. Sasak no.19','081219478267',3100000),
('EMP007','Gratianus','Male','Jl. Orange no.160','082378293718',6150000),
('EMP008','Hermanto','Male','Jl. Anggrek no.31','081310283920',12000000),
('EMP009','Irene','Female','Jl. Angkasa Pura no.50','081520391829',6000000),
('EMP010','Juceplin','Female','Jl. Gajah Mada no.100','081823713891',4500000),
('EMP011','Kalista','Female','Jl.Johor no.54','082138029302',15000000),
('EMP012','Leonardo','Male','Jl. Imam Bonjol no.70','081512393902',10400000),
('EMP013','Meidie','Male','Jl. Deli no.47','081684092839',5000000),
('EMP014','Ningsi','Female','Jl. Anggur no.150','081221329402',7500000),
('EMP015','Olivia','Female','Jl. Panglima Polem no.104','081201393892',2000000)

INSERT INTO Vendor VALUES
('VEN001','Pricellia','Female','Jl. Pattimura no.320','081623890183'),
('VEN002','Queeny','Female','Jl. Lesmani no.123','084329301092'),
('VEN003','Russelino','Male','Jl. Bosvania no.12','085238290192'),
('VEN004','Stevanus Julianto','Male','Jl. Buntu no.23','081738293789'),
('VEN005','Tania Werdana','Female','Jl. Keluarga no.45','081823902093'),
('VEN006','Udin','Male','Jl. Sudirman no.20','081728398298'),
('VEN007','Verrel Cristanto','Male','Jl. Pelangi no.39','081893093892'),
('VEN008','Wilbert William','Male','Jl. Quantum no.556','081904829302'),
('VEN009','Xelen','Male','Jl. Singkalak no.76','081940293902'),
('VEN010','Yuhana Panjaitan','Female','Jl. Sudirman no. 231','082038912392'),
('VEN011','Zaky Hermansya','Male','Jl. Sibunda no.332','081839290293'),
('VEN012','Aurel','Female','Jl. Salak no.321','081920329302'),
('VEN013','Brily','Male','Jl. Kemanggisan no.56','081738293892'),
('VEN014','Calvin','Male','Jl. Anggrek no.67','088947829821'),
('VEN015','Denny','Male','Jl. Beruang no.678','087822849902')

INSERT INTO Item VALUES
('ITE001','Egg',3000,100),
('ITE002','Milk',20000,50),
('ITE003','Tomato',1000,50),
('ITE004','Onion',5000,50),
('ITE005','Oil',20000,100),
('ITE006','Potato',10000,75),
('ITE007','Cucumber',3000,25),
('ITE008','Fish',50000,55),
('ITE009','Cabbage',5000,50),
('ITE010','Carrot',2500,52),
('ITE011','Flour',10000,72),
('ITE012','Corn',10000,24),
('ITE013','Rice',10000,53),
('ITE014','Mushroom',30000,42),
('ITE015','Seaweed',50000,25),
('ITE016','Strawberry',20000,150),
('ITE017','Chocolate',10000,200)

INSERT INTO Product VALUES
 ('PRO001','Omelet',15000,30),
 ('PRO002','Ice Cream',7000,25),
 ('PRO003','Strawberry Milk',17000,27),
 ('PRO004','Chocolate Milk',20000,20),
 ('PRO005','Cheese',20000,20),
 ('PRO006','Butter',5000,30),
 ('PRO007','French Fries',20000,50),
 ('PRO008','Ketchup',15000,15),
 ('PRO009','Grilled Fish',65000,15),
 ('PRO010','Sashimi',25000,20),
 ('PRO011','Sushi',25000,15),
 ('PRO012','Salad',50000,7),
 ('PRO013','Noodle',5000,15),
 ('PRO014','Bread',45000,25),
 ('PRO015','Pickles',5000,10),
 ('PRO016','Pop Corn',50000,10),
 ('PRO017','Mushroom Rice',35000,10)

INSERT INTO Recipe VALUES
('PRO001','ITE001',2),
('PRO001','ITE002',1),
('PRO001','ITE005',1),
('PRO002','ITE001',2),
('PRO002','ITE002',3),
('PRO003','ITE002',1),
('PRO003','ITE016',5),
('PRO004','ITE002',1),
('PRO004','ITE017',4),
('PRO005','ITE002',3),
('PRO006','ITE002',2),
('PRO007','ITE005',1),
('PRO007','ITE006',5),
('PRO008','ITE003',6),
('PRO008','ITE004',4),
('PRO009','ITE008',1),
('PRO010','ITE008',1),
('PRO011','ITE008',1),
('PRO011','ITE013',1),
('PRO011','ITE015',1),
('PRO012','ITE003',1),
('PRO012','ITE007',2),
('PRO012','ITE009',1),
('PRO012','ITE010',1),
('PRO012','ITE014',3),
('PRO013','ITE011',1),
('PRO014','ITE011',1),
('PRO015','ITE004',4),
('PRO015','ITE007',5),
('PRO015','ITE010',5),
('PRO016','ITE012',3),
('PRO017','ITE013',3),
('PRO017','ITE014',1)

INSERT INTO HeaderSalesTransaction VALUES
('SAL001','EMP010','VEN001','2017-05-19'),
('SAL002','EMP010','VEN001','2018-07-03'),
('SAL003','EMP009','VEN002','2018-07-23'),
('SAL004','EMP008','VEN003','2019-04-30'),
('SAL005','EMP007','VEN004','2019-05-03'),
('SAL006','EMP006','VEN005','2019-04-13'),
('SAL007','EMP005','VEN006','2019-04-15'),
('SAL008','EMP004','VEN007','2019-03-23'),
('SAL009','EMP003','VEN008','2019-08-08'),
('SAL010','EMP002','VEN009','2017-09-12'),
('SAL011','EMP001','VEN010','2019-10-17'),
('SAL012','EMP015','VEN011','2019-07-23'),
('SAL013','EMP014','VEN012','2019-01-03'),
('SAL014','EMP013','VEN013','2018-12-21'),
('SAL015','EMP012','VEN014','2017-02-01'),
('SAL016','EMP011','VEN015','2019-03-02')

INSERT INTO DetailSalesTransaction VALUES
('SAL001','PRO001',5),
('SAL001','PRO003',3),
('SAL002','PRO002',1),
('SAL002','PRO003',2),
('SAL002','PRO005',5),
('SAL002','PRO006',3),
('SAL003','PRO005',10),
('SAL003','PRO012',2),
('SAL003','PRO016',2),
('SAL004','PRO009',5),
('SAL005','PRO002',4),
('SAL005','PRO017',1),
('SAL006','PRO013',3),
('SAL007','PRO013',5),
('SAL007','PRO011',3),
('SAL007','PRO014',2),
('SAL007','PRO015',1),
('SAL008','PRO008',8),
('SAL008','PRO010',4),
('SAL009','PRO004',5),
('SAL010','PRO007',12),
('SAL011','PRO001',6),
('SAL011','PRO003',10),
('SAL011','PRO009',4),
('SAL011','PRO011',5),
('SAL012','PRO010',6),
('SAL013','PRO004',8),
('SAL013','PRO014',7),
('SAL013','PRO016',3),
('SAL014','PRO008',2),
('SAL014','PRO017',4),
('SAL015','PRO007',5),
('SAL015','PRO010',5),
('SAL016','PRO008',3)

INSERT INTO HeaderPurchaseTransaction VALUES
('PUR001','EMP001','VEN015','2017-05-22'),
('PUR002','EMP002','VEN014','2018-12-31'),
('PUR003','EMP003','VEN010','2018-07-20'),
('PUR004','EMP004','VEN001','2019-05-31'),
('PUR005','EMP005','VEN002','2017-05-10'),
('PUR006','EMP006','VEN007','2018-11-23'),
('PUR007','EMP007','VEN005','2019-07-17'),
('PUR008','EMP008','VEN003','2019-03-30'),
('PUR009','EMP009','VEN011','2019-02-02'),
('PUR010','EMP010','VEN012','2019-08-06'),
('PUR011','EMP011','VEN008','2018-12-10'),
('PUR012','EMP012','VEN009','2019-02-28'),
('PUR013','EMP013','VEN006','2017-06-30'),
('PUR014','EMP014','VEN004','2018-09-10'),
('PUR015','EMP015','VEN013','2019-10-02')

INSERT INTO DetailPurchaseTransaction VALUES
('PUR001','ITE009',25),
('PUR001','ITE010',30),
('PUR002','ITE001',14),
('PUR002','ITE006',22),
('PUR003','ITE009',9),
('PUR003','ITE002',37),
('PUR004','ITE003',25),
('PUR004','ITE007',25),
('PUR005','ITE008',27),
('PUR006','ITE012',13),
('PUR006','ITE009',16),
('PUR006','ITE013',27),
('PUR007','ITE015',9),
('PUR007','ITE017',114),
('PUR008','ITE016',25),
('PUR009','ITE014',17),
('PUR009','ITE004',30),
('PUR009','ITE005',65),
('PUR010','ITE011',42),
('PUR010','ITE001',86),
('PUR010','ITE002',13),
('PUR011','ITE003',25),
('PUR012','ITE004',20),
('PUR012','ITE005',35),
('PUR012','ITE006',33),
('PUR013','ITE006',20),
('PUR013','ITE008',27),
('PUR013','ITE010',22),
('PUR014','ITE011',30),
('PUR014','ITE012',11),
('PUR014','ITE013',26),
('PUR014','ITE014',25),
('PUR015','ITE015',16),
('PUR015','ITE016',125),
('PUR015','ITE017',86)

