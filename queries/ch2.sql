-- Task => Show an example of a select statement that uses all of the clauses just listed.
-- Show the employee_id, last_name, and credit_limit columns from the l_employees table of the Lunches database.
-- Show only the employees who have a credit limit greater than $20.00.
-- Sort the rows of the result by the last name of the employee.
SELECT employee_id, last_name, credit_limit
FROM l_employees
WHERE credit_limit > money(20)
ORDER BY last_name;

-- Task => Get the following three columns from the l_employees table:
--     employee_id
--     phone_number
--     last_name
-- Display them in that order. Change the name of the employee_id column
-- to employee_number and the name of the phone_number column to extension.
-- Also create two new columns: evaluation and rating. Give every employee an evaluation
-- of “excellent worker” and a rating of 10.
SELECT
       employee_id as employee_number,
       phone_number as extension,
       last_name,
       'Excellent Worker' as evaluation,
       10 as rating
FROM l_employees;

-- Task => List the description and price of all the foods. Change the name of the description
-- column to food_item and the name of the price column to cost.
-- SELECT description as food_items, price as cost from l_foods;

SELECT DISTINCT manager_id FROM l_employees;

SELECT DISTINCT manager_id FROM l_employees WHERE employee_id in (201, 208, 210);

-- Check
-- List all the different supplier_id values from the l_foods table.
SELECT DISTINCT supplier_id FROM l_foods;
