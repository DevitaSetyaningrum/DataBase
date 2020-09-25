

/*1.  Display VendorName, VendorGender, VendorPhoneNumber, EmployeeName, and Total Sales 
(obtained from the total number of sale done and ends with ‘ transaction(s)’) 
for each vendor whose name contains ‘r’.*/
SELECT 
	VendorName,
	v.Gender,
	v.PhoneNumber,
	EmployeeName,
	[Total Sales] = CAST(COUNT(*) AS VARCHAR) + ' transaction(s)' 
FROM
	Employee e JOIN	HeaderSalesTransaction hst ON e.EmployeeID = hst.EmployeeID
	JOIN Vendor v ON hst.VendorID = v.VendorID
WHERE
	VendorName LIKE '%[rR]%'
GROUP BY VendorName,v.Gender,v.PhoneNumber,EmployeeName,v.VendorID,e.EmployeeID


/*2.	Display ProductName, Sold Date (obtained from the SalesDate in ‘Mon dd, yyyy’ format), 
and Total Product Sold (obtained from the total product sold in that day) for each sale that 
occurred more than 6 months ago and the ProductName contains ‘Milk’.*/

SELECT
	ProductName, 
	[Sold Date] = CONVERT(VARCHAR(20),SalesDate,107),
	[Total Product Sold] = SUM(dst.Quantity)
FROM
	HeaderSalesTransaction hst JOIN DetailSalesTransaction dst ON hst.SalesID = dst.SalesID
	JOIN Product p ON dst.ProductID = p.ProductID
WHERE
	DATEDIFF(MONTH,SalesDate,GETDATE()) > 6 AND ProductName LIKE '%Milk%'
GROUP BY ProductName, CONVERT(VARCHAR(20),SalesDate,107), p.ProductID

/*3.	Display ProductName, Month Sold (obtained from the month name of SalesDate), 
Minimum Sold (obtained from the minimum quantity sold on that month and ends with ‘ product(s)’), 
Maximum Sold (obtained from the maximum quantity sold on that month and ends with ‘ product(s)’) 
for every product that is sold less than 9 months ago.*/

SELECT
	ProductName, 
	[Month Sold] = DATENAME(MONTH,SalesDate),
	[Minimum Sold] = CAST(MIN(Quantity) AS VARCHAR)+ ' product(s)', 
	[Maximum Sold] = CAST(MAX(Quantity) AS VARCHAR) + ' product(s)'
FROM 
	HeaderSalesTransaction hst JOIN DetailSalesTransaction dst ON hst.SalesID = dst.SalesID
	JOIN Product p ON dst.ProductID = p.ProductID
WHERE
	DATEDIFF(MONTH,SalesDate,GETDATE()) < 9
GROUP BY p.ProductName,DATENAME(MONTH,SalesDate),p.ProductID

/*4.	Display VendorName, Gender (obatained from the first character of VendorGender), 
Average Product Purchased (obtained from average of product quantity purchased per transaction done 
and ends with ‘ product(s)’), Total Product Purchased (obtained from the sum of all product quantity 
purchased and ends with ‘ product(s)’) for every vendor that purchased products less than or equals 
to 9 months ago. */
 
SELECT
	VendorName, 
	[Gender] = LEFT(Gender,1), 
	[Average Product Purchased] = CAST(AVG(Quantity) AS VARCHAR) + ' product(s)',
	[Total Product Purchased] = CAST(SUM(Quantity) AS VARCHAR) + ' product(s)'
FROM
	Vendor v JOIN HeaderSalesTransaction hst ON v.VendorID = hst.VendorID
	JOIN DetailSalesTransaction dst ON dst.SalesID = hst.SalesID
	JOIN Product p ON p.ProductID = dst.ProductID
WHERE
	DATEDIFF(MONTH,SalesDate,GETDATE()) <= 9
GROUP BY VendorName, LEFT(Gender,1), v.VendorID

/*5.	Display Name (obtained from the product’s first name) and Price (obtained by adding ‘Rp. ’ 
in front of the ProductPrice) for every product which has price above average of all product’s price.
(alias subquery)*/

SELECT
	[Name] = CASE CHARINDEX(' ',ProductName)
				WHEN 0 THEN 
					ProductName
				ELSE
					LEFT(ProductName,CHARINDEX(' ',ProductName)-1)
				END,
	[Price] = 'Rp. ' + CAST(Price AS VARCHAR) 
FROM
	Product,
	(
		SELECT
			AVG(Price) AS averageprice
		FROM
			Product
	) AS average
WHERE average.averageprice < Price

/*6.	Display EmployeeName, Phone Number (obtained by replacing Employee Phone Number’s 
first character into ‘+62’), VendorName, and SalesDate 
(obtained from SalesDate with ‘Mon dd, yy’ format) for every employee which has 
the minimum salary and did the transaction less than one year ago.
(alias subquery)*/

SELECT
	EmployeeName,
	[Phone Number] = STUFF(e.PhoneNumber,1,1,'+62'),
	VendorName,
	[SalesDate] = CONVERT(VARCHAR(20),SalesDate,7)
FROM
	Employee e JOIN HeaderSalesTransaction hst ON e.EmployeeID = hst.EmployeeID
	JOIN Vendor v ON v.VendorID = hst.VendorID,
	(
		SELECT
			MIN(Salary) as minsalary
		FROM
			Employee
	)AS minimum
WHERE Salary = minimum.minsalary AND DATEDIFF(DAY,SalesDate,GETDATE()) < 365

/*7.	Display VendorName, Gender (obtained from the first character of VendorGender), 
and Phone Number (obtained by replacing Vendor Phone Number’s first character with ‘+62’) 
for every vendor who has the most total purchase transaction done from at least a year ago.
(alias subquery)*/

SELECT
	VendorName, 
	[Gender] = LEFT(Gender,1), 
	[Phone Number] = STUFF(PhoneNumber,1,1,'+62')
FROM
	Vendor v,
	(
		SELECT [maxtotalpt] = MAX(countTransact.totalpt)
		FROM 
			(
				SELECT VendorID,[totalpt] = COUNT(*)
				FROM HeaderSalesTransaction
				WHERE DATEDIFF(DAY,SalesDate,GETDATE()) >= 365
				GROUP BY(VendorID)
			) AS countTransact
	)AS maxtotal,
	(
		SELECT VendorID,[totalpt] = COUNT(*)
		FROM HeaderSalesTransaction
		WHERE DATEDIFF(DAY,SalesDate,GETDATE()) >= 365
		GROUP BY(VendorID)
	)AS countTransact
WHERE countTransact.VendorID LIKE v.VendorID AND countTransact.totalpt = maxtotal.maxtotalpt

/*8.	Display Product (obtained from last word of ProductName), 
Selling Price (obtained by adding ‘Rp. ’ in front of ProductPrice), 
Production Price (obtained by adding ‘Rp. ’ in front of the cost needed to produce the product), 
and Different Item Needed (obtained from the total of distinct item type in to produce the product) 
for every product that has selling price lower than production price.
(alias subquery)*/


SELECT DISTINCT
	[Product] = CASE CHARINDEX(' ',REVERSE(ProductName)) 
					WHEN 0 THEN
						ProductName
					ELSE
						RIGHT(ProductName,CHARINDEX(' ',REVERSE(ProductName))-1)
					END,
	[Selling Price] = 'Rp. ' + CAST(p.Price AS VARCHAR), 
	[Production Price] = 'Rp. ' + CAST(PP.[Production Price] AS VARCHAR),
	[Different Item Needed] = PP.[Different Item Needed]
FROM 
	Product p JOIN Recipe r ON p.ProductID = r.ProductID
	JOIN Item i ON i.ItemID = r.ItemID,
	(
		SELECT
			[ProductID] = p.ProductID,
			[Production Price] = SUM(Quantity * i.Price),
			[Different Item Needed] = COUNT(DISTINCT r.ItemID)
		FROM 
			Product p JOIN Recipe r ON p.ProductID = r.ProductID
			JOIN Item i ON i.ItemID = r.ItemID
		GROUP BY p.ProductID
	) AS PP
WHERE p.ProductID = PP.ProductID AND p.Price < PP.[Production Price]

/*9.	Create a view named ‘Sales Report’ to display EmployeeName, 
Phone Number (obtained by replacing EmployeePhoneNumber first character with ‘+62’), 
Total Sales (obtained from the count of sales transaction), 
and Total Product Sold (obtained from the sum of all product sold) 
for every transaction that occurred on 2017.*/

CREATE VIEW [Sales Report] AS
SELECT
	EmployeeName,
	[PhoneNumber] = STUFF(PhoneNumber,1,1,'+62'),
	[Total Sales] = COUNT(DISTINCT hst.SalesID),
	[Total Product Sold] = SUM(Quantity)
FROM
	Employee e JOIN HeaderSalesTransaction hst ON e.EmployeeID = hst.EmployeeID
	JOIN DetailSalesTransaction dst ON dst.SalesID = hst.SalesID
WHERE DATENAME(YEAR,SalesDate) = 2017
GROUP BY e.EmployeeID, EmployeeName, STUFF(PhoneNumber,1,1,'+62')

SELECT * FROM [Sales Report] 

/*10.	Create a view named ‘Expense Report’ to display Year 
(obtained from the year of PurchaseDate), and total expense 
(obtained by adding ‘Rp. ’ in front of the total money spent on that year) 
for every year that has higher expense than average of all expenses.*/

CREATE VIEW [Expense Report] AS
SELECT
	[Year] = DATENAME(YEAR,PurchaseDate),
	[Total Expense] = 'Rp. ' + CAST(SUM(Price*Quantity) AS VARCHAR)
FROM 
	HeaderPurchaseTransaction hpt JOIN DetailPurchaseTransaction dpt ON hpt.PurchaseID = dpt.PurchaseID
	JOIN Item i ON dpt.ItemID = i.ItemID,
	(
		SELECT
			[Average Expense] = AVG(Price*Quantity)
		FROM
			HeaderPurchaseTransaction hpt JOIN DetailPurchaseTransaction dpt ON hpt.PurchaseID = dpt.PurchaseID
			JOIN Item i ON dpt.ItemID = i.ItemID
	)avg_expense
WHERE Price*Quantity > avg_expense.[Average Expense]
GROUP BY DATENAME(YEAR,PurchaseDate)

SELECT * FROM [Expense Report]