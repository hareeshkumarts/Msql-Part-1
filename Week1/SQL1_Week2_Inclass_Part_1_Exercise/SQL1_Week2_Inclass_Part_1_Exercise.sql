USE bank;
-- --------------------------------------------------------
# Datasets Used: cricket_1.csv, cricket_2.csv
-- cricket_1 is the table for cricket test match 1.
-- cricket_2 is the table for cricket test match 2.
-- --------------------------------------------------------

# Q1. Find all the players who were present in the test match 1 as well as in the test match 2.

SELECT distinct c1.Player_Name from cricket_1 c1 INNER JOIN cricket_2 c2 on c1.Player_Id = c2.Player_Id;
 
# Q2. Write a query to extract the player details player_id, runs and player_name from the table “cricket_1” who
#  scored runs more than 50

SELECT Player_Id,runs,Player_Name from cricket_1 where runs > 50;

# Q3. Write a query to extract all the columns from cricket_1 where player_name starts with ‘y’ and ends with ‘v’.

SELECT * FROM cricket_1 where Player_Name like 'y%v';

# Q4. Write a query to extract all the columns from cricket_1 where player_name does not end with ‘t’.

SELECT * FROM cricket_1 where Player_Name NOT like '%t';
 
-- --------------------------------------------------------
# Dataset Used: cric_combined.csv 
-- --------------------------------------------------------

# Q5. Write a MySQL query to add a column PC_Ratio to the table that contains the divsion ratio 
# of popularity to charisma .(Hint :- Popularity divide by Charisma)

ALTER TABLE cric_combined ADD COLUMN PC_RATIO DOUBLE(6,2);
UPDATE cric_combined set PC_RATIO = (cric_combined.popularity/cric_combined.Charisma);

# Q6. Write a MySQL query to find the top 5 players having the highest popularity to charisma ratio.

SELECT Player_Name,PC_Ratio from cric_combined order by PC_Ratio DESC,Player_Name LIMIT 5;

# Q7. Write a MySQL query to find the player_ID and the name of the player that contains the character “D” in it.

SELECT Player_Id,Player_Name from cric_combined where Player_Name like '%d%';

# Q8. Extract Player_Id  and PC_Ratio where the PC_Ratio is between 0.12 and 0.25.

SELECT Player_Id,PC_Ratio from cric_combined where PC_Ratio between 0.12 and 0.25;

-- --------------------------------------------------------
# Dataset Used: new_cricket.csv
-- --------------------------------------------------------
# Q9. Extract the Player_Id and Player_name of the players where the charisma value is null
SELECT Player_Id,Player_Name from new_cricket where charisma is NULL;
 
# Q10. Write a MySQL query to display all the NULL values  in the column Charisma imputed with 0.

SELECT Charisma,if(Charisma is NULL,0,charisma) charisma from new_cricket;
 
# Q11. Separate all Player_Id into single numeric ids (example PL1 to be converted as 1, PL2 as 2 , ... PL12 as 12 ).
 
 select Player_Id,substr(Player_Id,3) from new_cricket;
 
# Q12. Write a MySQL query to extract Player_Id , Player_Name and charisma where the charisma is greater than 25.

SELECT Player_Id,Player_Name,Charisma from new_cricket where charisma > 25;

-- --------------------------------------------------------
# Dataset Used: churn1.csv 
-- --------------------------------------------------------

# Q13. Write a query to display the rounding of lowest integer value of monthlyservicecharges and rounding of higher integer value of totalamount 
# for those paymentmethod is through Electronic check mode.

SELECT floor(monthlyservicecharges), ceil(totalamount)  from churn_details where PaymentMethod = 'Electronic Check';

# Q14. Rename the table churn1 to “Churn_Details”.

RENAME TABLE churn1 to Churn_Details;

# Q15. Write a query to create a display a column new_Amount that contains the sum of TotalAmount and MonthlyServiceCharges.

Alter Table churn_details Add Column new_Amount decimal(12,2);
update  churn_details set new_Amount = TotalAmount + MonthlyServiceCharges;

# Q16. Rename column new_Amount to Amount.
Alter table churn_details Rename column new_Amount to Amount;

-- Alter table churn_details change new_Amount amount decimal(12,2);

# Q17. Drop the column “Amount” from the table “Churn_Details”.

Alter table churn_details drop column Amount; 

# Q18. Write a query to extract the customerID, InternetConnection and gender 
# from the table “Churn_Details ” where the value of the column “InternetConnection” has ‘i’ 
# at the second position.

select CustomerID,InternetConnection,gender from churn_details where InternetConnection like '_i%';

# Q19. Find the records where the tenure is 6x, where x is any number.

select * from churn_details where tenure like '6_';

# Q20. Write a query to display the player names in capital letter and arrange in alphabatical order along with the charisma, display 0 for whom the charisma value is NULL.

SELECT upper(Player_Name),IF(charisma IS NULL,0,charisma) charisma from new_cricket order by Player_Name,Charisma;
