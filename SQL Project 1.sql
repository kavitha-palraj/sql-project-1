
Project-1

USE AdventureWorks2017
/* 1. Get all the details from the person table including emailID, phone number and Phone number type */
SELECT 
P.FirstName,
P.LastName,
E.EmailAddress,
PH.PhoneNumber,
PHT.Name
FROM Person.Person P
INNER JOIN Person.EmailAddress E on P.BusinessEntityID = E.BusinessEntityID
INNER JOIN Person.PersonPhone PH on PH.BusinessEntityID = E.BusinessEntityID
INNER JOIN Person.PhoneNumberType PHT on PHT.PhoneNumberTypeID = PH.PhoneNumberTypeID

/*2. Get the details of the sales header order made in May 2011 */
select *from Sales.SalesOrderHeader where month(OrderDate) = '05' AND Year(OrderDate) = '2011';

/* 3. Get the details of the sales details order made in month of May 2011 */
select *
from Sales.SalesOrderdetail SO
INNER JOIN Sales.SalesOrderHeader SH ON SO.SalesOrderID = SH.SalesOrderID
where month(OrderDate) = '05' AND Year(OrderDate) = '2011';

/* 4. Get Total Sales made in May 2011 */
select sum(LineTotal) as Total_sales 
from Sales.SalesOrderdetail SO
INNER JOIN Sales.SalesOrderHeader SH ON SO.SalesOrderID = SH.SalesOrderID
where month(OrderDate) = '05' AND Year(OrderDate) = '2011';

/* 5. Get the total sales made in the year 2011 by month order by increasing sales */

select sum(LineTotal) as Total_sales , month(OrderDate) as SalesMonth
from Sales.SalesOrderdetail SO
INNER JOIN Sales.SalesOrderHeader SH ON SO.SalesOrderID = SH.SalesOrderID
Group by month(OrderDate)
ORDER BY Total_sales;

/* 6. Get the total sales made to the customer with FirstName='	Gustavo' and LastName='Achong'.
Since the given customer do not have any sales records. Tried with a diffrent customer*/

SELECT
 P.FirstName,P.LastName,sum(SD.LineTotal) TotalSales from person.person P 
INNER JOIN sales.PersonCreditCard CD ON P.BusinessEntityID = CD.BusinessEntityID  
INNER JOIN Sales.SalesOrderHeader SH ON SH.creditcardID = CD.creditcardID
INNER JOIN sales.SalesOrderDetail SD ON SD.SalesOrderID = SH.SalesOrderID
where  P.FirstName in('Guastov','Terri','Michael') and P.LastName In ('Achong' ,'Duffy','Sullivan')
group by P.BusinessEntityID,P.FirstName,P.LastName;
