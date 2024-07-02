
-- CREATE DATABASE kitmanagement2;

CREATE TABLE brand (
    kit_brand varchar(100) NOT NULL PRIMARY KEY,
	brand_address  varchar(250) NOT NULL,
    brand_telephone varchar(20)
);

CREATE TABLE kit (
    kit_id varchar(6) NOT NULL PRIMARY KEY,
    kit_Name varchar(100) NOT NULL,
    kit_brand varchar(100),
    FOREIGN KEY (kit_brand) REFERENCES BRAND(kit_brand)
);


CREATE TABLE coach (
	coach_id  varchar(6) NOT NULL PRIMARY KEY,
    coach_name varchar(250) NOT NULL,
    coach_type  varchar(250) NOT NULL,
    division_name varchar(250) NOT NULL
	-- FOREIGN KEY (division_name) REFERENCES division(division_name)
);

CREATE TABLE division (
    division_name varchar(250) NOT NULL PRIMARY KEY,
    training_ground varchar(250) NOT NULL,
    division_manager  varchar(6) NOT NULL,
    CONSTRAINT division_manager_fk FOREIGN KEY (division_manager)
    REFERENCES coach(coach_id) 
);

ALTER TABLE coach
ADD CONSTRAINT fk_coach_division
FOREIGN KEY (division_name) REFERENCES division(division_name);


CREATE TABLE player (
    player_id varchar(6) NOT NULL PRIMARY KEY,
    player_name varchar(250) NOT NULL,
    player_dob date NOT NULL,
    player_position varchar(50) NOT NULL,
    division_name varchar(250) NOT NULL,
    FOREIGN KEY (division_name) REFERENCES division(division_name)
);

CREATE TABLE assign(
    assign_date date NOT NULL,
    kit_id varchar(6) NOT NULL,
    player_id varchar(6) NOT NULL,
    assign_qty int NOT NULL,
    status varchar(50) NOT NULL,
    end_status varchar(50) NOT NULL,
    rem_qty int NOT NULL,
    PRIMARY KEY (assign_date, kit_id, player_id),
	FOREIGN KEY (kit_id) REFERENCES kit(kit_id),
    FOREIGN KEY (player_id) REFERENCES player(player_id)
);



-- INSERT INTO brand (kit_brand, brand_address, brand_telephone)
-- VALUES ('Nike', 'Manchester', '01922 768900');

--  INSERT INTO brand (kit_brand, brand_address, brand_telephone)
-- VALUES ('Puma', 'Wolverhampton', '07656 899700');

-- INSERT INTO brand (kit_brand, brand_address, brand_telephone)
-- VALUES ('Adidas', 'Birmingham', '08455 902101');



INSERT INTO brand (kit_brand, brand_address, brand_telephone) 
    WITH b AS ( 
        SELECT 'Nike', 'Manchester', '1922 768900' FROM dual UNION ALL 
        SELECT 'Puma', 'Wolverhampton', '07656 899700' FROM dual UNION ALL 
        SELECT 'Adidas', 'Birmingham', '08455 902101' FROM dual
  )
SELECT * FROM b;

SELECT * FROM brand;



INSERT INTO kit (kit_id, kit_name, kit_brand) 
    WITH k AS ( 
    	SELECT 'SCSN00', 'Socks', 'Nike' FROM dual UNION ALL
		SELECT 'NJSY18', 'Named numbered Jersey', 'Nike' FROM dual UNION ALL
		SELECT 'BOTS00', 'Boots', 'Puma' FROM dual UNION ALL
		SELECT 'GLVS00', 'Gloves', 'Adidas' FROM dual UNION ALL
		SELECT 'TJSY24', 'Numbered Trainers24',	'Nike' FROM dual UNION ALL
		SELECT 'SHNG00', 'Shinguards', 'Puma' FROM dual UNION ALL
		SELECT 'TJSY37', 'Numbered Trainers37',	'Adidas' FROM dual UNION ALL
		SELECT 'UJSY37', 'Unamed numbered  jersey37', 'Nike' FROM dual UNION ALL
		SELECT 'TJSY00', 'No numbered Trainers', 'Adidas' FROM dual UNION ALL
		SELECT 'UJSY00', 'Unamed No number jersey', 'Nike' FROM dual
  )
SELECT * FROM k;

SELECT * FROM Kit;

--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

-- Disable foreign key constraints
ALTER TABLE division DISABLE CONSTRAINT division_manager_fk;
ALTER TABLE coach DISABLE CONSTRAINT fk_coach_division;

-- Insert data into division
INSERT INTO division (division_name, training_ground, division_manager)
WITH d AS (
  SELECT 'Senior', 'CarGT1', 'C200' FROM dual UNION ALL
  SELECT 'Academy CAT 1', 'CarGT2', 'C200' FROM dual UNION ALL
  SELECT 'Academy CAT 2', 'CarGT6', 'C001' FROM dual 
)
SELECT * FROM d;

-- Insert data into coach
INSERT INTO coach (coach_id, coach_name, coach_type, division_name)
WITH c AS ( 
  SELECT 'C200', 'E.Tenhag', 'Headcoach', 'Senior' FROM dual UNION ALL
  SELECT 'C202', 'R.Hartis', 'Goalkeeping Coach', 'Senior' FROM dual UNION ALL
  SELECT 'C100', 'M.Dempsey', 'Academy1 coach', 'Academy CAT 1' FROM dual UNION ALL
  SELECT 'C001', 'T.Binnion', 'Academy2 coach', 'Academy CAT 2' FROM dual 
)
SELECT * FROM c;

-- Enable foreign key constraints
ALTER TABLE division ENABLE CONSTRAINT division_manager_fk;
ALTER TABLE coach ENABLE CONSTRAINT fk_coach_division;

SELECT * FROM coach;
SELECT * FROM division;
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------

-- INSERT INTO coach (coach_id , coach_name, coach_type, division_name) 
--     WITH c AS ( 
--     	SELECT 'C200', 'E.Tenhag', 'Headcoach', 'Senior' FROM dual UNION ALL
-- 	    SELECT 'C202', 'R.Hartis', 'Goalkeeping Coach', 'Senior' FROM dual UNION ALL
-- 		SELECT 'C100', 'M.Dempsey', 'Academy1 coach', 'Academy CAT 1' FROM dual UNION ALL
-- 		SELECT 'C001', 'T.Binnion', 'Academy2 coach', 'Academy CAT 2' FROM dual 
--   )
-- SELECT * FROM c;



-- INSERT INTO division (division_name , training_ground, division_manager) 
--     WITH d AS ( 
--     	SELECT 'Senior', 'CarGT1', 'C200' FROM dual UNION ALL
-- 		SELECT 'Academy CAT 1', 'CarGT2', 'C200' FROM dual UNION ALL
-- 		SELECT 'Academy CAT 2', 'CarGT6', 'C001' FROM dual 
--   )
-- SELECT * FROM d;

-- INSERT INTO division(division_manager)
--     WITH d2 AS ( 
--     	SELECT 'C200' FROM dual UNION ALL
-- 		SELECT 'C200' FROM dual UNION ALL
-- 		SELECT 'C001' FROM dual 
--   )
-- SELECT * FROM d2;

-- INSERT INTO player (player_id , player_name, player_dob, player_position, division_name) 
--     WITH p AS ( 
--     	SELECT 'B18', 'Bruno', 08/09/1994, 'CAM', 'Senior' FROM dual UNION ALL
-- 	    SELECT 'A24', 'Onana', 02/04/1996, 'GK', 'Senior' FROM dual UNION ALL
-- 		SELECT 'M37', 'Mainoo', 19/04/2005, 'CM', 'Academy CAT 1' FROM dual UNION ALL
-- 		SELECT 'EW201', 'Ethan ', 20/01/2006, 'ST', 'Academy CAT 2' FROM dual 
--   )
-- SELECT * FROM p;

INSERT INTO player (player_id , player_name, player_dob, player_position, division_name) 
    WITH p AS ( 
    	SELECT 'B18', 'Bruno', DATE '1994-09-08', 'CAM', 'Senior' FROM dual UNION ALL
	    SELECT 'A24', 'Onana', DATE '1996-04-02', 'GK', 'Senior' FROM dual UNION ALL
		SELECT 'M37', 'Mainoo', DATE '2005-04-19', 'CM', 'Academy CAT 1' FROM dual UNION ALL
		SELECT 'EW201', 'Ethan ', DATE '2006-01-20', 'ST', 'Academy CAT 2' FROM dual 
  )
SELECT * FROM p;


SELECT * FROM player;

TRUNCATE TABLE player;

-- INSERT INTO player (player_id, player_name, player_dob, player_position, division_name) 
-- WITH p AS ( 
--   SELECT 'B18', 'Bruno', TO_DATE('08/09/1994', 'DD/MM/YYYY') , 'CAM', 'Senior'FROM dual UNION ALL
--   SELECT 'A24', 'Onana', TO_DATE('02/04/1996', 'DD/MM/YYYY'), 'GK', 'Senior' FROM dual UNION ALL
--   SELECT 'M37', 'Mainoo', TO_DATE('19/04/2005', 'DD/MM/YYYY'), 'CM', 'Academy CAT 1' FROM dual UNION ALL
--   SELECT 'EW201', 'Ethan', TO_DATE('20/01/2006', 'DD/MM/YYYY'), 'ST', 'Academy CAT 2' FROM dual 
-- )
-- SELECT * FROM p;


INSERT INTO assign (assign_date, kit_id, player_id, assign_qty, status, end_status, rem_qty)
WITH assignment_data AS (
  SELECT DATE '2024-01-14' AS assign_date, 'SCSN00' AS kit_id, 'B18' AS player_id, 2 AS assign_qty, 'Active' AS status, 'Active' AS end_status, 2 AS rem_qty FROM dual UNION ALL
  SELECT DATE '2024-01-14', 'NJSY18', 'B18', 2, 'Active', 'Shared', 1 FROM dual UNION ALL
  SELECT DATE '2024-01-14', 'BOTS00', 'B18', 1, 'Active', 'Active', 1 FROM dual UNION ALL
  SELECT DATE '2024-01-14', 'GLVS00', 'A24', 2, 'Active', 'Damaged', 0 FROM dual UNION ALL
  SELECT DATE '2024-01-14', 'TJSY24', 'A24', 2, 'Active', 'Active', 2 FROM dual UNION ALL
  SELECT DATE '2024-01-14', 'SHNG00', 'A24', 1, 'Active', 'Active', 2 FROM dual UNION ALL
  SELECT DATE '2024-01-15', 'GLVS00', 'A24', 2, 'Active', 'Active', 2 FROM dual UNION ALL
  SELECT DATE '2024-01-29', 'TJSY37', 'M37', 2, 'Active', 'Active', 2 FROM dual UNION ALL
  SELECT DATE '2024-01-30', 'UJSY37', 'M37', 1, 'Active', 'Active', 1 FROM dual UNION ALL
  SELECT DATE '2024-02-01', 'TJSY00', 'EW201', 2, 'Active', 'Active', 2 FROM dual UNION ALL
  SELECT DATE '2024-02-01', 'UJSY00', 'EW201', 2, 'Active', 'Active', 2 FROM dual
)
SELECT * FROM assignment_data;


SELECT * FROM assign;


-- INSERT INTO assign (assign_date, kit_id, player_id, assign_qty, status, end_status, rem_qty)
-- WITH assignment_data2 AS (
--   SELECT DATE '2024-01-14' AS assign_date, 'SCSN00' AS kit_id, 'B18' AS player_id, 2 AS assign_qty, 'Active' AS status, 'Active' AS end_status, 2 AS rem_qty FROM dual UNION ALL
--   SELECT DATE '2024-01-14', 'NJSY18', 'B18', 2, 'Active', 'Shared', 1 FROM dual UNION ALL
--   SELECT DATE '2024-01-14', 'BOTS00', 'B18', 1, 'Active', 'Active', 1 FROM dual UNION ALL
--   SELECT DATE '2024-01-14', 'GLVS00', 'A24', 2, 'Active', 'Damaged', 0 FROM dual UNION ALL
--   SELECT DATE '2024-01-14', 'TJSY24', 'A24', 2, 'Active', 'Active', 2 FROM dual UNION ALL
--   SELECT DATE '2024-01-14', 'SHNG00', 'A24', 1, 'Active', 'Active', 2 FROM dual UNION ALL
--   SELECT DATE '2024-01-15', 'GLVS00', 'A24', 2, 'Active', 'Active', 2 FROM dual UNION ALL
--   SELECT DATE '2024-01-29', 'TJSY37', 'M37', 2, 'Active', 'Active', 2 FROM dual UNION ALL
--   SELECT DATE '2024-01-30', 'UJSY37', 'M37', 1, 'Active', 'Active', 1 FROM dual UNION ALL
--   SELECT DATE '2024-02-01', 'TJSY00', 'EW201', 2, 'Active', 'Active', 2 FROM dual UNION ALL
--   SELECT DATE '2024-02-01', 'UJSY00', 'EW201', 2, 'Active', 'Active', 2 FROM dual
-- )
-- SELECT * FROM assignment_data2;


-- Question1: Retrieve all records from the brand table.
SELECT * FROM brand;

-- Question2: Retrieve the kitid and kitname details of kits along with their respective brands information.
SELECT K.kit_id, k.kit_name, b.*
FROM kit k
JOIN brand b ON k.kit_brand = b.kit_brand;


-- Query with INNER SELECT:
-- - Question3: Retrieve the player details along with their assigned kits and quantity and the corresponding brand.
SELECT a.assign_date, a.kit_id, a.assign_qty, a.player_id, p.player_name, k.kit_name, b.kit_brand
FROM assign a
INNER JOIN player p ON a.player_id = p.player_id
INNER JOIN kit k ON a.kit_id = k.kit_id
INNER JOIN brand b ON k.kit_brand = b.kit_brand;

-- Query with CTE:
-- Question4: Retrieve the names of coaches along with the divisions they manage using a Common Table Expression (CTE).

WITH CoachDivision AS (
  SELECT c.coach_name, c.division_name
  FROM coach c
)
SELECT * FROM CoachDivision;

-- Query with JOIN:
-- Question5: Retrieve the player names and their assigned kits' names along with the brand names.

SELECT p.player_name, k.kit_name, b.kit_brand
FROM player p
JOIN assign a ON p.player_id = a.player_id
JOIN kit k ON a.kit_id = k.kit_id
JOIN brand b ON k.kit_brand = b.kit_brand;

-- Query with INNER SELECT:
-- Question6: Retrieve the details of coaches along with the divisions they manage

SELECT c.coach_id, c.coach_name, c.division_name, d.training_ground
FROM coach c
INNER JOIN division d ON c.division_name = d.division_name;

-- QUESTION 7 - Checking to see the kit that has the most assigned qty and the players or player it was assigned to plus the brand that supplies it and their address
    
WITH KitAssignments AS ( 
  SELECT k.kit_id, k.kit_name, b.kit_brand, b.brand_address, a.player_id, 
         p.player_name, p.division_name, SUM(a.assign_qty) AS total_assign_qty
  FROM kit k
  JOIN
    brand b ON k.kit_brand = b.kit_brand
  JOIN
    assign a ON k.kit_id = a.kit_id
  JOIN
    player p ON a.player_id = p.player_id
  GROUP BY
    k.kit_id, k.kit_name, b.kit_brand, b.brand_address, a.player_id, p.player_name, p.division_name
)

SELECT kit_id, kit_name, kit_brand, brand_address, total_assign_qty, player_id, player_name, division_name
FROM KitAssignments   
WHERE
  total_assign_qty = (SELECT MAX(total_assign_qty) FROM KitAssignments);

-- the WITH clause, also known as a Common Table Expression (CTE), 
-- is used to create a temporary result set that you can reference 
-- within the context of a larger query. It's particularly useful 
-- for breaking down complex queries into smaller, more manageable parts.

WITH KitAssignments2 AS ( 
  SELECT k.kit_id, k.kit_name, b.kit_brand, b.brand_address, a.player_id, p.player_name, p.division_name, SUM(a.assign_qty) AS total_assign_qty
  FROM kit k
  JOIN
    brand b ON k.kit_brand = b.kit_brand
  JOIN
    assign a ON k.kit_id = a.kit_id
  JOIN
    player p ON a.player_id = p.player_id
  GROUP BY
    k.kit_id, k.kit_name, b.kit_brand, b.brand_address, a.player_id, p.player_name, p.division_name
)
SELECT
   kit_id,
   kit_name,
   kit_brand,
   player_id,
   player_name,
   division_name,
   total_assign_qty
FROM
   KitAssignments2;

-- QUESTION 8 -- using a nested query to see kits damaged and the coaach incharge of the player

SELECT p.player_id, p.player_name, p.division_name, d.division_manager, c.coach_name, c.coach_type
FROM player p
JOIN
    division d ON p.division_name = d.division_name
JOIN
    coach c ON d.division_manager = c.coach_id
WHERE p.player_id IN (
        SELECT player_id
        FROM   assign
        WHERE end_status = 'Shared'
    );

SELECT kit_id, assign_date, player_id, end_status , rem_qty
FROM assign
WHERE end_status = 'Damaged'
  AND kit_id IN (SELECT kit_id FROM assign WHERE end_status = 'Damaged');

-- QUESTION 9 ---  using and prototype
SELECT *
FROM your_table
WHERE column1 = 'value1' AND column2 = 'value2';