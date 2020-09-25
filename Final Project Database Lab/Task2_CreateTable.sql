 CREATE DATABASE Marvest_Qoon

USE Marvest_Qoon

CREATE TABLE Employee(
	EmployeeID VARCHAR (6) NOT NULL,
	EmployeeName VARCHAR (50) NOT NULL,
	Gender VARCHAR(10),
	EmployeeAddress VARCHAR(50),
	PhoneNumber VARCHAR(12),
	Salary INT,
	PRIMARY KEY (EmployeeID),
	CONSTRAINT constraintEmployeeID CHECK (EmployeeId LIKE 'EMP[0-9][0-9][0-9]'),
	CONSTRAINT constraintEmployeeGender CHECK (Gender in ('Female','Male')),
	CONSTRAINT constraintEmployeePhoneNumber CHECK (LEN(PhoneNumber) = 12 AND PhoneNumber NOT LIKE '%[a-zA-Z]%')
 )

CREATE TABLE Vendor(
	VendorID VARCHAR(6) NOT NULL,
	VendorName VARCHAR(50),
	Gender VARCHAR(50),
	VendorAddress VARCHAR(50),
	PhoneNumber VARCHAR(12),
	PRIMARY KEY(VendorID),
	CONSTRAINT constraintVendorID CHECK(VendorId LIKE 'VEN[0-9][0-9][0-9]'),
	CONSTRAINT constraintVendorGender CHECK (Gender IN ('Female','Male')),
	CONSTRAINT constraintVendorPhoneNumber CHECK (LEN(PhoneNumber) = 12 AND PhoneNumber NOT LIKE '%[a-zA-Z]%')
)

CREATE TABLE Item (
	ItemID VARCHAR (6) NOT NULL,
	ItemName VARCHAR(50),
	Price INT,
	Stock INT,
	PRIMARY KEY(ItemID),
	CONSTRAINT constraintItemID CHECK (ItemID LIKE 'ITE[0-9][0-9][0-9]')
 )

CREATE TABLE Product(
	ProductID VARCHAR(6) NOT NULL,
	ProductName VARCHAR(50),
	Price INT,
	Stock INT,
	PRIMARY KEY(ProductID),
	CONSTRAINT constraintProductID CHECK(ProductID LIKE 'PRO[0-9][0-9][0-9]'),
)

CREATE TABLE HeaderPurchaseTransaction (
	PurchaseID VARCHAR(6) NOT NULL, --PK
	EmployeeID VARCHAR(6) NOT NULL, --FK
	VendorID VARCHAR(6) NOT NULL, --FK
	PurchaseDate DATE,
	PRIMARY KEY (PurchaseID),
	FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
	FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID),
	CONSTRAINT constraintPurchaseID CHECK (PurchaseID LIKE 'PUR[0-9][0-9][0-9]'),
	CONSTRAINT constraintPurchaseDate CHECK (DATENAME(WEEKDAY,PurchaseDate) NOT LIKE 'Sunday')
)

CREATE TABLE DetailPurchaseTransaction(
	PurchaseID VARCHAR(6) NOT NULL,
	ItemID VARCHAR(6) NOT NULL,
	Quantity INT,
	PRIMARY KEY (PurchaseID,ItemID),
	FOREIGN KEY (PurchaseID) REFERENCES HeaderPurchaseTransaction(PurchaseID),
	FOREIGN KEY (ItemID) REFERENCES Item(ItemID)
)


CREATE TABLE HeaderSalesTransaction(
	SalesID VARCHAR(6) NOT NULL,
	EmployeeID VARCHAR(6) NOT NULL,
	VendorID VARCHAR(6) NOT NULL,
	SalesDate DATE,
	PRIMARY KEY (SalesID),
	FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
	FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID),
	CONSTRAINT constraintSalesTransactionID CHECK (SalesID LIKE 'SAL[0-9][0-9][0-9]'),
	CONSTRAINT constraintSalesDate CHECK (DATENAME(WEEKDAY,SalesDate) NOT LIKE 'Sunday')
)

CREATE TABLE DetailSalesTransaction(
	SalesID VARCHAR(6) NOT NULL,
	ProductID VARCHAR(6) NOT NULL,
	Quantity INT,
	PRIMARY KEY (SalesID,ProductID),
	FOREIGN KEY (SalesID) REFERENCES HeaderSalesTransaction(SalesID),
	FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
)

CREATE TABLE Recipe(	
	ProductID VARCHAR(6) NOT NULL,
	ItemID VARCHAR(6) NOT NULL,
	Quantity INT,
	PRIMARY KEY(ProductID,ItemID),
	FOREIGN KEY(ProductID) REFERENCES Product(ProductID),
	FOREIGN KEY(ItemID) REFERENCES Item(ItemID),
)