/*Pada tanggal 5 November 2019, Vendor dengan Id "VEN001" membeli product dengan id "PRO001" sebanyak
10 buah dan "PRO010" sebanyak 5 buah dari Employee dengan id "EMP015"
*/

INSERT INTO HeaderSalesTransaction VALUES
('SAL017','EMP015','VEN010','2019-11-05')

INSERT INTO DetailSalesTransaction VALUES
('SAL017','PRO001',10),
('SAL017','PRO010',5)

UPDATE Product SET Stock = Stock-10 WHERE ProductID LIKE 'PRO001'
UPDATE Product SET Stock = Stock-5 WHERE ProductID LIKE 'PRO010'

/*Pada tanggal 20 November 2019, Vendor dengan Id "VEN005" membeli product dengan id "PRO007" sebanyak
 7 buah, "PRO011" sebanyak 2 buah, "PRO002" sebanyak 3 buah, "PRO017" sebanyak 5 buah, dan "PRO013"
 sebanyak 1 buah dari Employee dengan id "EMP007"
*/

INSERT INTO HeaderSalesTransaction VALUES
('SAL018','EMP007','VEN005','2019-11-20')

INSERT INTO DetailSalesTransaction VALUES
('SAL018','PRO007',7),
('SAL018','PRO011',2),
('SAL018','PRO002',3),
('SAL018','PRO017',5),
('SAL018','PRO013',1)

UPDATE Product SET Stock = Stock-7 WHERE ProductID LIKE 'PRO007'
UPDATE Product SET Stock = Stock-2 WHERE ProductID LIKE 'PRO011'
UPDATE Product SET Stock = Stock-3 WHERE ProductID LIKE 'PRO002'
UPDATE Product SET Stock = Stock-5 WHERE ProductID LIKE 'PRO017'
UPDATE Product SET Stock = Stock-1 WHERE ProductID LIKE 'PRO013'

/*Pada tanggal 30 November 2019, Employee dengan id "EMP009" membeli item dengan id "ITE006" sebanyak 
20 buah dari Vendor dengan id = "VEN011"
*/

INSERT INTO HeaderPurchaseTransaction VALUES
('PUR016','EMP009','VEN011','2019-11-20')

INSERT INTO DetailPurchaseTransaction VALUES
('PUR016','ITE006',20)

UPDATE Item SET Stock = Stock+20 WHERE ItemID LIKE 'ITE006'

/*Pada tanggal 2 Desember 2019, Employee dengan id "EMP011" membeli item dengan id "ITE010" sebanyak 
5 buah, "ITE015" sebanyak 10 buah, dan "ITE017" sebanyak 7 buah dari Vendor dengan id = "VEN004"
*/

INSERT INTO HeaderPurchaseTransaction VALUES
('PUR017','EMP011','VEN004','2019-12-02')

INSERT INTO DetailPurchaseTransaction VALUES
('PUR017','ITE010',5),
('PUR017','ITE015',10),
('PUR017','ITE017',7)

UPDATE Item SET Stock = Stock+5 WHERE ItemID LIKE 'ITE010'
UPDATE Item SET Stock = Stock+10 WHERE ItemID LIKE 'ITE015'
UPDATE Item SET Stock = Stock+7 WHERE ItemID LIKE 'ITE017'