----------------------------------------------------------------
-- QUERY 1
-- List all stalls with their vendor name and city name
----------------------------------------------------------------

SELECT s.Stall_Name, s.Location, v.Vendor_Name, c.City_Name
FROM Stall s
JOIN Vendor v ON s.Vendor_ID = v.Vendor_ID
JOIN City c ON s.City_ID = c.City_ID
ORDER BY c.City_Name;

----------------------------------------------------------------
-- QUERY 2
-- Show all food categories
----------------------------------------------------------------

SELECT Category_ID, Category_Name, Description
FROM Food_Category;


----------------------------------------------------------------
-- QUERY 3
-- Find all stalls that have NEVER been inspected
----------------------------------------------------------------

SELECT s.Stall_Name, s.Location, v.Vendor_Name
FROM Stall s
JOIN Vendor v ON s.Vendor_ID = v.Vendor_ID
LEFT JOIN Inspection i ON s.Stall_ID = i.Stall_ID
WHERE i.Inspection_ID IS NULL;


----------------------------------------------------------------
-- QUERY 4
-- List all customers with their email and phone number
----------------------------------------------------------------

SELECT First_Name, Last_Name, Email, Phone, Registration_Date
FROM Customer
ORDER BY Registration_Date;


----------------------------------------------------------------
-- QUERY 5
-- Show average hygiene rating for each stall based on inspections
----------------------------------------------------------------

SELECT s.Stall_Name, s.Location,
       AVG(i.Hygiene_Rating) AS Avg_Hygiene_Rating,
       COUNT(i.Inspection_ID) AS Total_Inspections
FROM Stall s
LEFT JOIN Inspection i ON s.Stall_ID = i.Stall_ID
GROUP BY s.Stall_ID, s.Stall_Name, s.Location
ORDER BY Avg_Hygiene_Rating DESC;

----------------------------------------------------------------
-- QUERY 6
-- Find all vendors with more than 5 years of experience
----------------------------------------------------------------

SELECT Vendor_Name, Contact_No, Years_of_Experience, Average_Rating
FROM Vendor
WHERE Years_of_Experience > 5
ORDER BY Years_of_Experience DESC;


----------------------------------------------------------------
-- QUERY 7
-- Find food items that appear in menus of more than one stall
----------------------------------------------------------------

SELECT f.Food_Name, fc.Category_Name,
       COUNT(DISTINCT m.Stall_ID) AS Stall_Count
FROM Food_Item f
JOIN Menu_Item mi ON f.Food_ID = mi.Food_ID
JOIN Menu m ON mi.Menu_ID = m.Menu_ID
JOIN Food_Category fc ON f.Category_ID = fc.Category_ID
GROUP BY f.Food_ID, f.Food_Name, fc.Category_Name
HAVING COUNT(DISTINCT m.Stall_ID) > 1
ORDER BY Stall_Count DESC;


----------------------------------------------------------------
-- QUERY 8
-- Find all customers who registered after July 2025
----------------------------------------------------------------

SELECT First_Name, Last_Name, Email, Phone, Registration_Date
FROM Customer
WHERE Registration_Date > '2025-07-01'
ORDER BY Registration_Date;


----------------------------------------------------------------
-- QUERY 9
-- For each vendor show their license details and the
-- authority who issued it
----------------------------------------------------------------

SELECT v.Vendor_Name, v.Years_of_Experience,
       l.License_Type, l.Expiry_Date, l.Status,
       a.Name AS Issued_By, a.Department
FROM Vendor v
JOIN License l ON v.Vendor_ID = l.Vendor_ID
JOIN Authority a ON l.Authority_ID = a.Authority_ID
ORDER BY l.Status, v.Vendor_Name;


----------------------------------------------------------------
-- QUERY 10
-- List all stalls and their opening and closing times
----------------------------------------------------------------

SELECT Stall_Name, Location, Opening_Time, Closing_Time
FROM Stall
ORDER BY Opening_Time;


----------------------------------------------------------------
-- QUERY 11
-- Show each stall with total menu items and how many
-- are currently available vs unavailable
----------------------------------------------------------------

SELECT s.Stall_Name,
       COUNT(mi.Food_ID) AS Total_Menu_Items,
       SUM(CASE WHEN mi.Availability = TRUE THEN 1 ELSE 0 END) AS Available_Items,
       SUM(CASE WHEN mi.Availability = FALSE THEN 1 ELSE 0 END) AS Unavailable_Items
FROM Stall s
JOIN Menu m ON s.Stall_ID = m.Stall_ID
JOIN Menu_Item mi ON m.Menu_ID = mi.Menu_ID
GROUP BY s.Stall_ID, s.Stall_Name
ORDER BY Total_Menu_Items DESC;


----------------------------------------------------------------
-- QUERY 12
-- Find all food items that belong to the 'Chaat' category
----------------------------------------------------------------

SELECT f.Food_ID, f.Food_Name, f.Description
FROM Food_Item f
JOIN Food_Category fc ON f.Category_ID = fc.Category_ID
WHERE fc.Category_Name = 'Chaat';


----------------------------------------------------------------
-- QUERY 13
-- Rank stalls by their average customer review rating
----------------------------------------------------------------

SELECT s.Stall_Name, s.Location,
       ROUND(AVG(r.Rating), 2) AS Avg_Review_Rating,
       COUNT(r.Review_ID) AS Total_Reviews
FROM Stall s
JOIN Review r ON s.Stall_ID = r.Stall_ID
GROUP BY s.Stall_ID, s.Stall_Name, s.Location
ORDER BY Avg_Review_Rating DESC;


----------------------------------------------------------------
-- QUERY 14
-- Find all valid licenses
----------------------------------------------------------------

SELECT l.License_ID, v.Vendor_Name, l.License_Type,
       l.Issue_Date, l.Expiry_Date
FROM License l
JOIN Vendor v ON l.Vendor_ID = v.Vendor_ID
WHERE l.Status = 'Valid'
ORDER BY l.Expiry_Date;


----------------------------------------------------------------
-- QUERY 15
-- Find all stalls that had an inspection with hygiene rating
-- below 4.0 and show the remarks
----------------------------------------------------------------

SELECT s.Stall_Name, s.Location,
       i.Inspection_Date, i.Hygiene_Rating, i.Remarks,
       a.Name AS Inspected_By
FROM Inspection i
JOIN Stall s ON i.Stall_ID = s.Stall_ID
JOIN Authority a ON i.Authority_ID = a.Authority_ID
WHERE i.Hygiene_Rating < 4.0
ORDER BY i.Hygiene_Rating ASC;


----------------------------------------------------------------
-- QUERY 16
-- Count the number of food items in each food category
----------------------------------------------------------------

SELECT fc.Category_Name, COUNT(f.Food_ID) AS Total_Items
FROM Food_Category fc
LEFT JOIN Food_Item f ON fc.Category_ID = f.Category_ID
GROUP BY fc.Category_ID, fc.Category_Name
ORDER BY Total_Items DESC;


----------------------------------------------------------------
-- QUERY 17
-- Compare average customer review rating vs average hygiene
-- rating for each stall
----------------------------------------------------------------

SELECT s.Stall_Name,

       (
           SELECT AVG(r.Rating)
           FROM Review r
           WHERE r.Stall_ID = s.Stall_ID
       ) AS Avg_Customer_Rating,

       (
           SELECT AVG(i.Hygiene_Rating)
           FROM Inspection i
           WHERE i.Stall_ID = s.Stall_ID
       ) AS Avg_Hygiene_Rating

FROM Stall s
ORDER BY Avg_Customer_Rating DESC;

----------------------------------------------------------------
-- QUERY 18
-- List all cities with their state
----------------------------------------------------------------

SELECT City_ID, City_Name, State
FROM City
ORDER BY State, City_Name;


----------------------------------------------------------------
-- QUERY 19
-- Find all vendors whose license has expired or is suspended
----------------------------------------------------------------

SELECT v.Vendor_Name, v.Contact_No,
       l.License_Type, l.Expiry_Date, l.Status
FROM Vendor v
JOIN License l ON v.Vendor_ID = l.Vendor_ID
WHERE l.Status IN ('Expired', 'Suspended')
ORDER BY l.Status;


----------------------------------------------------------------
-- QUERY 20
-- List all food items available in a specific stall
-- (e.g., Ravi Pani Puri - Stall_ID = 1)
----------------------------------------------------------------

SELECT s.Stall_Name, f.Food_Name, fc.Category_Name,
       mi.Price, mi.Availability
FROM Stall s
JOIN Menu m ON s.Stall_ID = m.Stall_ID
JOIN Menu_Item mi ON m.Menu_ID = mi.Menu_ID
JOIN Food_Item f ON mi.Food_ID = f.Food_ID
JOIN Food_Category fc ON f.Category_ID = fc.Category_ID
WHERE s.Stall_ID = 1;


----------------------------------------------------------------
-- QUERY 21
-- Find the total number of stalls in each city
----------------------------------------------------------------

SELECT c.City_Name, COUNT(s.Stall_ID) AS Total_Stalls
FROM City c
LEFT JOIN Stall s ON c.City_ID = s.City_ID
GROUP BY c.City_ID, c.City_Name
ORDER BY Total_Stalls DESC;


----------------------------------------------------------------
-- QUERY 22
-- Find customers who gave a rating of 5 and show which stall
-- they reviewed
----------------------------------------------------------------

SELECT cu.First_Name, cu.Last_Name,
       s.Stall_Name, r.Rating, r.Comment, r.Review_Date
FROM Review r
JOIN Customer cu ON r.Customer_ID = cu.Customer_ID
JOIN Stall s ON r.Stall_ID = s.Stall_ID
WHERE r.Rating = 5
ORDER BY r.Review_Date;


----------------------------------------------------------------
-- QUERY 23
-- Find all stalls in Gujarat with their opening and closing times
----------------------------------------------------------------

SELECT s.Stall_Name, s.Location,
       s.Opening_Time, s.Closing_Time, c.City_Name
FROM Stall s
JOIN City c ON s.City_ID = c.City_ID
WHERE c.State = 'Gujarat'
ORDER BY c.City_Name, s.Opening_Time;


----------------------------------------------------------------
-- QUERY 24
-- List authorities and how many inspections each has conducted
----------------------------------------------------------------

SELECT a.Name, a.Department, a.Role,
       COUNT(i.Inspection_ID) AS Inspections_Done
FROM Authority a
LEFT JOIN Inspection i ON a.Authority_ID = i.Authority_ID
GROUP BY a.Authority_ID, a.Name, a.Department, a.Role
ORDER BY Inspections_Done DESC;


----------------------------------------------------------------
-- QUERY 25
-- Full stall report: stall name, city, vendor, total menu items,
-- average review rating, average hygiene rating, license status
----------------------------------------------------------------

SELECT s.Stall_Name,
       c.City_Name,
       v.Vendor_Name,

       (
           SELECT COUNT(mi.Food_ID)
           FROM Menu m
           JOIN Menu_Item mi ON m.Menu_ID = mi.Menu_ID
           WHERE m.Stall_ID = s.Stall_ID
       ) AS Menu_Items,

       (
           SELECT AVG(r.Rating)
           FROM Review r
           WHERE r.Stall_ID = s.Stall_ID
       ) AS Avg_Review,

       (
           SELECT AVG(i.Hygiene_Rating)
           FROM Inspection i
           WHERE i.Stall_ID = s.Stall_ID
       ) AS Avg_Hygiene,

       (
           SELECT COUNT(*)
           FROM Review r
           WHERE r.Stall_ID = s.Stall_ID
       ) AS Total_Reviews,

       (
           SELECT COUNT(*)
           FROM Inspection i
           WHERE i.Stall_ID = s.Stall_ID
       ) AS Total_Inspections,

       l.Status AS License_Status

FROM Stall s
JOIN City c ON s.City_ID = c.City_ID
JOIN Vendor v ON s.Vendor_ID = v.Vendor_ID
LEFT JOIN License l ON v.Vendor_ID = l.Vendor_ID

ORDER BY Avg_Review DESC;

----------------------------------------------------------------
-- QUERY 26
-- Find stalls that have never received any customer review
-- using NOT EXISTS (correlated subquery)
----------------------------------------------------------------

SELECT s.Stall_Name, s.Location,
       v.Vendor_Name, c.City_Name
FROM Stall s
JOIN Vendor v ON s.Vendor_ID = v.Vendor_ID
JOIN City   c ON s.City_ID   = c.City_ID
WHERE NOT EXISTS (
    SELECT 1
    FROM Review r
    WHERE r.Stall_ID = s.Stall_ID
)
ORDER BY c.City_Name, s.Stall_Name;

----------------------------------------------------------------
-- QUERY 27
-- Find vendors whose average rating is higher than overall average rating
----------------------------------------------------------------

SELECT v.Vendor_Name,
       v.Years_of_Experience,
       (
           SELECT AVG(r.Rating)
           FROM Review r
           JOIN Stall s ON r.Stall_ID = s.Stall_ID
           WHERE s.Vendor_ID = v.Vendor_ID
       ) AS Vendor_Avg_Rating
FROM Vendor v
WHERE (
    SELECT AVG(r.Rating)
    FROM Review r
    JOIN Stall s ON r.Stall_ID = s.Stall_ID
    WHERE s.Vendor_ID = v.Vendor_ID
) > (
    SELECT AVG(Rating) FROM Review
)
ORDER BY Vendor_Avg_Rating DESC;

----------------------------------------------------------------
-- QUERY 28
-- Rank stalls within their city based on average customer rating
----------------------------------------------------------------

SELECT s1.Stall_Name,
       c.City_Name,

       ROUND((
           SELECT AVG(r.Rating)
           FROM Review r
           WHERE r.Stall_ID = s1.Stall_ID
       ), 2) AS Avg_Rating,

       (
           SELECT COUNT(*) + 1
           FROM Stall s2
           WHERE s2.City_ID = s1.City_ID
             AND (
                 SELECT AVG(r2.Rating)
                 FROM Review r2
                 WHERE r2.Stall_ID = s2.Stall_ID
             ) > (
                 SELECT AVG(r3.Rating)
                 FROM Review r3
                 WHERE r3.Stall_ID = s1.Stall_ID
             )
       ) AS City_Rank

FROM Stall s1
JOIN City c ON s1.City_ID = c.City_ID

ORDER BY c.City_Name, City_Rank;

----------------------------------------------------------------
-- QUERY 29
-- Compare with previous inspection using subquery
----------------------------------------------------------------

SELECT s.Stall_Name,
       i1.Inspection_Date,
       i1.Hygiene_Rating AS Current_Rating,
       (
           SELECT i2.Hygiene_Rating
           FROM Inspection i2
           WHERE i2.Stall_ID = i1.Stall_ID
             AND i2.Inspection_Date < i1.Inspection_Date
           ORDER BY i2.Inspection_Date DESC
           LIMIT 1
       ) AS Previous_Rating
FROM Inspection i1
JOIN Stall s ON i1.Stall_ID = s.Stall_ID
ORDER BY s.Stall_Name, i1.Inspection_Date;

----------------------------------------------------------------
-- QUERY 30
-- Trust Score calculation
----------------------------------------------------------------

SELECT 
s.Stall_Name,
ROUND(
0.4 * COALESCE(AVG(i.Hygiene_Rating),0) +
0.3 * COALESCE(AVG(r.Rating),0) +
0.2 * (COUNT(DISTINCT i.Inspection_ID)/5.0) +
0.1 * (v.Years_of_Experience/10.0)
,2) AS Trust_Score
FROM Stall s
JOIN Vendor v ON s.Vendor_ID = v.Vendor_ID
LEFT JOIN Inspection i ON s.Stall_ID = i.Stall_ID
LEFT JOIN Review r ON s.Stall_ID = r.Stall_ID
GROUP BY s.Stall_ID, s.Stall_Name, v.Years_of_Experience
ORDER BY Trust_Score DESC;

