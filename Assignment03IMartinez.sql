--*************************************************************************--
-- Title: Assignment03
-- Author: IMartinez
-- Desc: This file demonstrates how to select data from a database
-- Change Log: When,Who,What
-- 2020-04-20,IMartinez,Created File
--**************************************************************************--
Use Northwind;
go

/********************************* Questions and Answers *********************************/
-- Data Request: 0301
-- Date: 1/1/2020
-- From: Jane Encharge CEO
-- Request: I want a list of customer companies and their contact people
-- Needed By: ASAP
Select * From Customers;
go
Select CompanyName, ContactName From Customers; -- Choose columns
go


-- Data Request: 0302
-- Date: 1/2/2020
-- From: Jane Encharge CEO
-- Request: I want a list of customer companies and their contact people,
--   but only the ones in US and Canada
-- Needed By: ASAP
Select c.CompanyName, c.ContactName
From Customers As c;
go
Select c.CompanyName, c.ContactName, c.Country
From Customers As c
Where c.Country = 'USA' Or c.Country = 'Canada'; -- Filter
go

Select c.CompanyName, c.ContactName, c.Country
From Customers As c
Where c.Country = 'USA' Or c.Country = 'Canada'
Order By c.Country, c.CompanyName; -- Sort (to match assignment image)
go


-- Data Request: 0303
-- Date: 1/2/2020
-- From: Jane Encharge CEO
-- Request: I want a list of products, their standard price and their 
--   categories. Order the results by Category Name 
--   and then Product Name, in alphabetical order
-- Needed By: ASAP
Select c.CategoryName, p.ProductName, p.UnitPrice As [Standard Price]
From Products As p
Join Categories As c -- Join to get category name
 On p.CategoryID = c.CategoryID;
go
Select c.CategoryName, p.ProductName, p.UnitPrice As [Standard Price]
From Products As p
Join Categories As c
 On p.CategoryID = c.CategoryID
Order By c.CategoryName; -- Sort
go

Select c.CategoryName, p.ProductName, p.UnitPrice As [Standard Price]
From Products As p
Join Categories As c
 On p.CategoryID = c.CategoryID
Group By c.CategoryName, p.ProductName, p.UnitPrice
Order By c.CategoryName; -- Alphabetical order
go


-- Data Request: 0304
-- Date: 1/3/2020
-- From: Jane Encharge CEO
-- Request: I want a list of how many customers we have in the US
-- Needed By: ASAP
Select * From Customers;
go
Select Count(c.Country) As [Count], c.Country
From Customers As c
Group By c.Country; -- Get unique countries
go

Select Count(Country) As [Count], c.Country -- Enter Count column.
From Customers As c
Where c.Country = 'USA' -- Filter
Group By c.Country;
go


-- Data Request: 0305
-- Date: 1/4/2020
-- From: Jane Encharge CEO
-- Request: I want a list of how many customers we have in the US and Canada, with subtotals for each
-- Needed By: ASAP
Select Count(c.Country) As [Count], c.Country
From Customers As c
Group By c.Country;
go

Select Count(c.Country) As [Count], c.Country
From Customers As c
Where c.Country = 'USA' Or c.Country = 'Canada' -- New filter
Group By c.Country;
go
/***************************************************************************************/