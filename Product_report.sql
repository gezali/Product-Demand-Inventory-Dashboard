
create database test_env
use test_env

select * from [dbo].[Products]
select * from [dbo].[Test+Environment+Inventory+Dataset]

----------------------------------------------------------------------
select distinct [Order_Date_DD_MM_YYYY] from [dbo].[Test+Environment+Inventory+Dataset]

----------------------------------------------------------------------
select a.Product_ID,a.Order_Date_DD_MM_YYYY,a.Demand,
b.Product_Name,b.Unit_Price ,a.Availability
from [dbo].[Test+Environment+Inventory+Dataset] as a left join 
[dbo].[Products] as b on a.Product_ID = b.Product_ID

---------------------------------------------------------------------------
select *  into New_table from (select a.Product_ID,a.Order_Date_DD_MM_YYYY,a.Demand,
b.Product_Name,b.Unit_Price,a.Availability
from [dbo].[Test+Environment+Inventory+Dataset] as a left join 
[dbo].[Products] as b on a.Product_ID = b.Product_ID) x 

---------------------------------------------------------------
select * from New_table
drop table New_table

---------------------------------------------
create database PROD
use PROD

select * from [dbo].[Prod+Env+Inventory+Dataset]
select * from [dbo].[Products]

select distinct [Order_Date_DD_MM_YYYY] from [dbo].[Prod+Env+Inventory+Dataset]
where [Order_Date_DD_MM_YYYY] is null or [Order_Date_DD_MM_YYYY] = ''

select distinct Product_ID from [dbo].[Prod+Env+Inventory+Dataset] 
order by Product_ID
-- where [Order_Date_DD_MM_YYYY] is null or [Order_Date_DD_MM_YYYY] = ''
-- pro id 21 is 7 and 22 is 11 
update [dbo].[Prod+Env+Inventory+Dataset]
set Product_ID = 7 
where Product_ID = 21

update [dbo].[Prod+Env+Inventory+Dataset]
set Product_ID = 11
where Product_ID = 22

select distinct [Availability] from [dbo].[Prod+Env+Inventory+Dataset] 
select distinct [Demand] from [dbo].[Prod+Env+Inventory+Dataset] 

---------------------------------------------------

select a.[Product_ID],a.[Order_Date_DD_MM_YYYY],
a.[Availability],a.[Demand],b.[Product_Name],
b.[Unit_Price] from [dbo].[Prod+Env+Inventory+Dataset] as  a 
left join [dbo].[Products] as b on a.Product_ID =
b.[Product_ID] 

-------------------------------------------------------------
select * into new_table from  (select a.[Product_ID],a.[Order_Date_DD_MM_YYYY],
a.[Availability],a.[Demand],b.[Product_Name],
b.[Unit_Price] from [dbo].[Prod+Env+Inventory+Dataset] as  a 
left join [dbo].[Products] as b on a.Product_ID =
b.[Product_ID]) y

select * from new_table