-- Task => Show an example of a select statement that uses all of the clauses just listed.
-- Show the employee_id, last_name, and credit_limit columns from the l_employees table of the Lunches database.
-- Show only the employees who have a credit limit greater than $20.00.
-- Sort the rows of the result by the last name of the employee.
SELECT employee_id, last_name, credit_limit
FROM l_employees
WHERE credit_limit > money(20)
ORDER BY last_name;
