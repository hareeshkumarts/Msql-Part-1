/* Prerequisites */
-- Use the Bank_Holidays and bank_inventory tables from Online_Day1_Inclass file to answer the below questions

# Question 1:
# 1) Increase the length of geo_location size of 30 characters in the bank_inventory table.

use Bank;

ALTER TABLE Bank_Inventory Modify Geo_Location varchar(30);

describe Bank_Inventory;

# Question 2:
# 2) Update  estimated_sale_price of bank_inventory table with an increase of 15%  when the quantity of product is more than 4.

Update bank_inventory set estimated_sale_price =  (estimated_sale_price*1.15) where quantity > 4;

select * from bank_inventory;

# Question 3:
# 3) Insert below record by increasing 10% of estimated_sale_price to the given estimated_sale_price 
		-- Product : DailCard
		-- Quantity: 2 
		-- price : 380.00 
		-- Puchase_cost : 8500.87
		-- estimated_sale_price: 9000.00
        
INSERT INTO bank_inventory VALUES('DailCard',2,380.00,8500.87,9000.00  + (9000.00*0.1),NULL); -- NULL for Geo Location
select * from bank_inventory;
 
# Question 4:
# 4) Delete the records from bank_inventory when the difference of estimated_sale_price and 
-- Purchase_cost is less than 5% of estimated_sale_price 

DELETE From Bank_Inventory where (estimated_sale_price - purchase_cost) <  (0.05* estimated_sale_price);

# Question 5:
# 5) Update the end time of bank holiday to 2020-03-20 11:59:59 for the holiday on 2020-03-20

describe Bank_Holidays;
UPDATE Bank_holidays set End_time = '2020-03-20 11:59:59' where holiday = '2020-03-20'; 
select * from bank_inventory;

# Use tables cricket_1 and cricket_2 from Online_Day2_InClass to answer the queries. 

CREATE TABLE IF NOT EXISTS cricket_1(
  Player_Id varchar(10),
  Player_Name varchar(20),
  Runs INTEGER ,
  Popularity INTEGER
);

INSERT INTO cricket_1 values('PL1','Virat',50,10);
INSERT INTO cricket_1 values('PL2','Rohit',41,7);
INSERT INTO cricket_1 values('PL3','Jadeja',33,6);
INSERT INTO cricket_1 values('PL4','Dhoni',35,15);
INSERT INTO cricket_1 values('PL5','Dhawan',45,12);
INSERT INTO cricket_1 values('PL6','Yadav',66,10);
INSERT INTO cricket_1 values('PL7','Raina',32,9);
INSERT INTO cricket_1 values('PL8','Binny',44,11);
INSERT INTO cricket_1 values('PL9','Rayudu',63,12);
INSERT INTO cricket_1 values('PL10','rahane',21,10);
INSERT INTO cricket_1 values('PL11','A.Patel',12,9);
INSERT INTO cricket_1 values('PL12','B.Kumar',30,7);

select * from cricket_1;

CREATE TABLE IF NOT EXISTS cricket_2(
  Player_Id varchar(10),
  Player_Name varchar(20),
  Runs INTEGER ,
  Charisma INTEGER
);

INSERT INTO cricket_2 values('PL1','Virat',50,55);
INSERT INTO cricket_2 values('PL2','Rohit',41,30);
INSERT INTO cricket_2 values('PL3','Jadeja',33,24);
INSERT INTO cricket_2 values('PL4','Dhoni',35,59);
INSERT INTO cricket_2 values('PL13','Yuraaj',33,50);
INSERT INTO cricket_2 values('PL6','Yadav',66,35);
INSERT INTO cricket_2 values('PL14','Tendulkar',74,80);
INSERT INTO cricket_2 values('PL8','Binny',44,32);
INSERT INTO cricket_2 values('PL9','Rayudu',63,39);
INSERT INTO cricket_2 values('PL15','Dravid',65,55);
INSERT INTO cricket_2 values('PL16','Yusuf',40,40);

select * from cricket_2;

# Question 6:

# Q6.Extract Player_Id and Player_name of those columns where charisma is null.

select Player_Id, Player_Name from cricket_2 where charisma is null;

# Question 7:

# Q7.Write MySQL query to extract Player_Id , Player_Name , charisma where charisma is greater than 25.

select Player_Id, Player_Name,charisma from cricket_2 where charisma > 25;

# Question 8:

# Q8.Write MySQL query to extract Player_Id , Player_Name who scored fifty and above

select Player_Id, Player_Name from cricket_1 where Runs >= 50;

# Question 9:

# Q9.Write MySQL query to extract Player_Id , Player_Name who have popularity in the range of 10 to 12.

SELECT  Player_id,Player_Name from cricket_1 where Popularity between 10 and 12; 


# Question 10:

# Q10.Write MySQL query to extract Player_id, Player_Name where the Runs and Charisma both are greater than 50.

select * from cricket_1;
select Player_Id,Player_Name from cricket_1 c1 JOIN cricket_2 c2 where c1.runs > 50 and c2.charisma > 50;
 

