SELECT first_name, last_name 
FROM CompanyAnalysis.DBO.Employees$

SELECT dept_no, dep_name 
FROM CompanyAnalysis.DBO.departments$

SELECT COUNT(emp_no) AS Total_Employees
FROM CompanyAnalysis.DBO.Employees$

SELECT AVG(salary) AS Average_Sal
FROM CompanyAnalysis.DBO.salaries$


SELECT birth_date, hire_date
FROM CompanyAnalysis.DBO.Employees$
WHERE emp_no = 10003

SELECT DISTINCT title
FROM CompanyAnalysis.DBO.employee_titles$

 SELECT COUNT(dept_no) as TotalDepartments
 FROM CompanyAnalysis.DBO.Departments$

 SELECT dep.dept_no, dep.dep_name
 FROM  CompanyAnalysis.DBO.departments$ dep
 JOIN CompanyAnalysis.DBO.dept_emp$ dem
 ON dem.dept_no = dep.dept_no
 JOIN CompanyAnalysis.DBO.Employees$ emp
 ON emp.emp_no = dem.emp_no
 WHERE emp.emp_no = 10004

--Find the gender of employee with emp_no 10007.

SELECT Gender
FROM CompanyAnalysis.DBO.Employees$
WHERE emp_no = 10007
 
  --Get the highest salary among all employees

SELECT MAX(salary) as HighestSalary
FROM CompanyAnalysis.DBO.salaries$

--Retrieve the names of all managers along with their department names.

SELECT emp.first_name, emp.last_name, dept.[dep_name ]
FROM CompanyAnalysis.DBO.Employees$ emp
JOIN CompanyAnalysis.DBO.dept_manager$ depm
ON emp.emp_no = depm.emp_no
JOIN CompanyAnalysis.DBO.departments$ dept
ON depm.dept_no = dept.dept_no

--Find the department with the highest number of employees.

SELECT TOP 1 dept.dep_name, COUNT(empt.emp_no) AS LargestDepartment
FROM CompanyAnalysis.dbo.dept_emp$ demp
JOIN CompanyAnalysis.DBO.employee_titles$ empt
ON demp.emp_no = empt.emp_no
JOIN CompanyAnalysis.DBO.departments$ dept
ON demp.dept_no = dept.dept_no
GROUP BY dept.[dep_name ]
ORDER BY COUNT(empt.emp_no)

--Retrieve the employee number, first name, last name, and salary of employees earning more 
--than $60,000.

SELECT emp.emp_no, emp.first_name, emp.last_name, sal.salary
FROM CompanyAnalysis.DBO.Employees$ emp
JOIN CompanyAnalysis.DBO.salaries$ sal
ON emp.emp_no = sal.emp_no
WHERE sal.salary > 60000

--Get the average salary for each department.

SELECT dept.[dep_name ], AVG(sal.salary) as AverageSalary
FROM CompanyAnalysis.DBO.salaries$ sal
JOIN CompanyAnalysis.DBO.dept_emp$ depte
ON sal.emp_no = depte.emp_no
JOIN CompanyAnalysis.DBO.departments$ dept
ON dept.dept_no = depte.dept_no
GROUP BY dept.[dep_name ]
ORDER BY AVG(sal.salary) 




