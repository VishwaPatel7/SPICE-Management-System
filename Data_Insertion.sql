-- 1. CITY

INSERT INTO City (City_ID, City_Name, State) VALUES (1, 'Ahmedabad',
'Gujarat'),
(2, 'Surat', 'Gujarat'),
(3, 'Vadodara', 'Gujarat'),
(4, 'Rajkot', 'Gujarat'),
(5, 'Gandhinagar', 'Gujarat'),
(6, 'Mumbai', 'Maharashtra'),
(7, 'Pune', 'Maharashtra'),
(8, 'Jaipur', 'Rajasthan');

-- 2. VENDOR

INSERT INTO Vendor (Vendor_ID, Vendor_Name, Contact_No,
Years_of_Experience,

Average_Rating) VALUES

(1, 'Ravi Sharma', '9898989898', 10, 4.5),

(2, 'Dosa King', '9797979797', 8, 4.2),

(3, 'Pav Bhaji House','9696969696', 5, 3.9),

(4, 'Chaat Wala', '9595959595', 12, 4.7),

(5, 'Juice Corner', '9494949494', 3, 3.5),

(6, 'Burger Point', '9383838383', 6, 4.1),

(7, 'Sandwich Hub', '9272727272', 4, 3.8),

(8, 'Tea Stall', '9161616161', 7, 4.3);

-- 3. STALL

INSERT INTO Stall (Stall_ID, Stall_Name, Location, Opening_Time,
Closing_Time, Vendor_ID, City_ID) VALUES

(1, 'Ravi Pani Puri', 'Navrangpura, CG Road', '10:00:00', '22:00:00', 1,
1),

(2, 'Dosa Corner', 'Adajan Patiya', '08:00:00', '21:00:00', 2, 2),

(3, 'Pav Bhaji Stall', 'Alkapuri Circle', '17:00:00', '23:00:00', 3, 3),

(4, 'Chaat Chowk', 'Sadar Bazar', '12:00:00', '22:30:00', 4, 4),

(5, 'Fresh Juice Bar', 'Sector 21, Gandhinagar', '09:00:00', '20:00:00',
5, 5),

(6, 'Ravi Snacks', 'Law Garden', '16:00:00', '23:30:00', 1, 1),

(7, 'Burger Stop', 'Mumbai Central', '11:00:00', '23:00:00', 6, 6),

(8, 'Tea Junction', 'Pune Station', '06:00:00', '22:00:00', 8, 7);

-- 4. FOOD CATEGORY

INSERT INTO Food_Category (Category_ID, Category_Name, Description)
VALUES (1, 'Snacks', 'Light street snacks and finger food'),
(2, 'South Indian', 'Dosa, Idli, and related items'),
(3, 'Fast Food', 'Pav Bhaji, Burger, Sandwich'),
(4, 'Beverages', 'Fresh juices, lassi, and drinks'),
(5, 'Chaat', 'Spicy Indian chaat varieties'),
(6, 'Desserts', 'Sweet dishes'),
(7, 'Bakery', 'Bread and baked items'),
(8, 'Street Drinks', 'Local beverages');

-- 5. FOOD ITEM

INSERT INTO Food_Item (Food_ID, Food_Name, Description, Category_ID)
VALUES

(1, 'Pani Puri', 'Hollow puri filled with spiced water', 1),
(2, 'Masala Dosa', 'Crispy dosa with spiced potato filling', 2),
(3, 'Plain Dosa', 'Thin crispy rice crepe', 2),
(4, 'Pav Bhaji', 'Spiced mashed vegetables with bread', 3),
(5, 'Vada Pav', 'Fried potato dumpling in a bread bun', 3),
(6, 'Mango Juice', 'Fresh squeezed mango juice', 4),
(7, 'Sugarcane Juice', 'Fresh sugarcane extract', 4),
(8, 'Sev Puri', 'Crispy puri topped with chutneys and sev', 5),
(9, 'Bhel Puri', 'Puffed rice mixed with chutneys', 5),
(10, 'Idli Sambhar', 'Steamed rice cakes with lentil soup', 2);

-- 6. MENU

INSERT INTO Menu (Menu_ID, Stall_ID) VALUES (1, 1),

(2, 2),

(3, 3),

(4, 4),

(5, 5),

(6, 6),

(7, 7),

(8, 8);

-- 7. MENU_ITEM

INSERT INTO Menu_Item (Menu_ID, Food_ID, Price, Availability) VALUES (1,
1, 30, TRUE), -- Ravi Pani Puri → Pani Puri

(1, 8, 40, TRUE), -- Ravi Pani Puri → Sev Puri (1, 9, 35, TRUE), -- Ravi
Pani Puri → Bhel Puri

(2, 2, 80, TRUE), -- Dosa Corner → Masala Dosa (2, 3, 60, TRUE), -- Dosa
Corner → Plain Dosa (2, 10, 70, TRUE), -- Dosa Corner → Idli Sambhar (3,
4, 90, TRUE), -- Pav Bhaji Stall→ Pav Bhaji

(3, 5, 40, TRUE), -- Pav Bhaji Stall→ Vada Pav (4, 8, 45, TRUE), --
Chaat Chowk → Sev Puri

(4, 9, 40, FALSE), -- Chaat Chowk → Bhel Puri (unavailable) (5, 6, 60,
TRUE), -- Fresh Juice Bar→ Mango Juice

(5, 7, 30, TRUE); -- Fresh Juice Bar→ Sugarcane Juice

-- 8. CUSTOMER

INSERT INTO Customer (Customer_ID, First_Name, Last_Name, Email, Phone,
Registration_Date) VALUES

(1, 'Amit', 'Shah', 'amit.shah@gmail.com', '9111111111', '2025-01-10'),

(2, 'Riya', 'Patel', 'riya.patel@gmail.com', '9222222222',
'2025-02-14'),

(3, 'Karan', 'Mehta', 'karan.mehta@gmail.com', '9333333333',
'2025-03-05'),

(4, 'Pooja', 'Desai', 'pooja.desai@gmail.com', '9444444444',
'2025-05-20'),

(5, 'Nikhil', 'Joshi', 'nikhil.joshi@gmail.com', '9555555555',
'2025-07-01'),

(6, 'Sneha', 'Trivedi', 'sneha.t@gmail.com', '9666666666',
'2025-09-15'),

(7, 'Rahul', 'Kapoor', 'rahul@gmail.com', '9777777777', '2025-10-10'),

(8, 'Anjali', 'Sharma', 'anjali@gmail.com', '9888888888', '2025-10-12');

-- 9. REVIEW

INSERT INTO Review (Review_ID, Rating, Comment, Review_Date,
Customer_ID, Stall_ID) VALUES

(1, 5, 'Best pani puri in Ahmedabad!', '2025-08-10', 1, 1),

(2, 4, 'Dosa was crispy and fresh.', '2025-08-12', 2, 2),

(3, 3, 'Pav bhaji was okay, bit oily.', '2025-08-15', 3, 3),

(4, 5, 'Amazing chaat, will come again.', '2025-09-01', 4, 4),

(5, 4, 'Juice was refreshing.', '2025-09-10', 5, 5),

(6, 2, 'Waited too long, service slow.', '2025-09-20', 6, 2),

(7, 5, 'Sev puri is heavenly!', '2025-10-01', 1, 6),

(8, 4, 'Good variety on the menu.', '2025-10-05', 3, 1);

-- 10. AUTHORITY

INSERT INTO Authority (Authority_ID, Name, Department, Contact, Role)
VALUES

(1, 'Suresh Verma', 'Municipal Health Dept', '9000000001', 'Senior
Inspector'),
(2, 'Anita Nair', 'Food Safety Authority', '9000000002', 'Food
Auditor'),
(3, 'Deepak Pandya', 'Municipal Corporation', '9000000003', 'License
Officer'),
(4, 'Rajesh Kumar', 'Health Dept', '9000000004', 'Inspector'),
(5, 'Meena Shah', 'Food Safety', '9000000005', 'Auditor'),
(6, 'Amit Patel', 'Municipal Corp', '9000000006', 'Officer'),
(7, 'Neha Joshi', 'Health Dept', '9000000007', 'Inspector'),
(8, 'Vikas Singh', 'Food Authority', '9000000008', 'Supervisor');

-- 11. LICENSE

INSERT INTO License (License_ID, Issue_Date, Expiry_Date, Status,
License_Type, Vendor_ID,

Authority_ID) VALUES

(1, '2023-04-01', '2026-03-31', 'Valid', 'Food Handling', 1, 3),

(2, '2022-06-15', '2025-06-14', 'Expired', 'Food Handling', 2, 3),

(3, '2024-01-10', '2027-01-09', 'Valid', 'Street Vending', 3, 3),

(4, '2023-09-01', '2026-08-31', 'Valid', 'Food Handling', 4, 3),

(5, '2021-03-20', '2024-03-19', 'Suspended', 'Street Vending', 5, 3),

(6, '2023-05-01', '2026-04-30', 'Valid', 'Food Handling', 6, 4),

(7, '2022-08-10', '2025-08-09', 'Expired', 'Street Vending', 7, 5),

(8, '2024-02-15', '2027-02-14', 'Valid', 'Food Handling', 8, 6);

-- 12. INSPECTION

INSERT INTO Inspection (Inspection_ID, Inspection_Date, Hygiene_Rating,
Remarks, Stall_ID,

Authority_ID) VALUES

(1, '2025-05-10', 4.5, 'Clean setup, good hygiene practices.', 1, 1),

(2, '2025-05-12', 3.8, 'Minor cleanliness issues near cooking area.',2,
2),

(3, '2025-06-01', 4.0, 'Satisfactory. Suggested better handwashing.',3,
1),

(4, '2025-06-15', 4.8, 'Excellent hygiene. No issues found.', 4, 2),

(5, '2025-07-20', 2.5, 'Poor waste disposal. Warning issued.', 5, 1),

(6, '2025-08-05', 4.2, 'Improved since last inspection.', 6, 2),

(7, '2025-09-10', 3.9, 'Average hygiene maintained.', 7, 7),

(8, '2025-09-18', 4.6, 'Very clean and organized.', 8, 8);

