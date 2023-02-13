# Question 01
#****************
# 1.1) Alter the table to change datatype of empID from int to varchar2(10)
            
            ALTER TABLE employee
            MODIFY EmpID VARCHAR(10);
            
# 1.2) Select the data from the table grouped by address and blood group.

            SELECT EmpID,EmpName,EmpAddress,'Blood Group' FROM employee
            GROUP BY EmpAddress,'Blood Group';
            
# 1.3) Display the data of employee no 2 and 3

             SELECT * FROM employee
             WHERE EmpID IN (1,2);
             
#1.4) Delete the record of employee no 1.

            DELETE FROM employee
            WHERE EmpID = 1;
            
# Question No 02 
#*****************

# 2.1) Select the appointments with the patient dated 20/2/2022

            SELECT * FROM Patient
            WHERE PID IN (SELECT PID FROM Appointments
						   WHERE 'date'='20/2/2022');
                       
# 2.2) Find the appointment time and patient name of all appointments for doctor Akash on April-14-2021.

              SELECT s.name,s.time FROM
			                      (SELECT  p.name,a.time,a.SID FROM patient AS p
                                   LEFT JOIN  appointments AS a ON p.PID=a.PID WHERE a.date= 'April-14-2021') AS s
               LEFT JOIN doctor AS d ON s.SID=d.SID
              WHERE d.name='Akash';


# Question No 03
#******************

# 3.1) From the following tables write a SQL query to find those orders where the orderamount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city

          SELECT o.ord_no,o.purch_amt,c.cust_name,c.city FROM orders AS o
          LEFT JOIN customer AS c on o.customer_id=c.customer_id
          WHERE o.purch_amt  BETWEEN 500 and 2000; 
                      
# Question NO 04
#*********************

# 4.1) Create a view for those salespeople who belong to the city of New York.

          SELECT * FROM salesman
		  WHERE city='NEW YORK';
          
# 4.2) Return salesperson ID, name, and city.

		  SELECT salesman_id ,name, city FROM salesman;
          
# 4.3) Create a view to find all the salesman who have the commission = 0.15,Return all the fields of the salesman

		  SELECT * FROM salesman
		  WHERE commission = 0.15;
          
# 4.4) Create a view to count the number of salespeople in each city. Return city,number of salespersons.

		   SELECT city, count(*) AS 'no of salesperson' from salesman
           GROUP BY city;
           
# Question No 05
#*******************

# 5.1) Select the appointments with the customer dated 20/2/2022

			SELECT * FROM Customer
            WHERE CID IN (SELECT CID FROM Appointments
						   WHERE 'date'='20/2/2022');

# 5.2) Find the appointment time and client name of all appointments for employee member Joy on Dec-14-2021.

			SELECT s.name,s.time FROM
			                      (SELECT  c.name,a.time,a.SID FROM Customer AS c
                                   LEFT JOIN  appointments AS a ON c.CID=a.CID WHERE a.date= 'Dec-14-2021') AS s
               LEFT JOIN Employee AS e ON s.SID=e.SID
              WHERE e.name='Joy';

# Question No 06
#*****************

# 6.1) Write a plsql query to display empid , empname , deptmanager

                 SELECT e.empid,e.empname,d.deptmanager FROM Employee AS e
                 LEFT JOIN Department AS d ON e.deptid=d.deptid;
                 
# 6.2) Write a plsql query to display empid , salary

			     SELECT * FROM Income;
                 
# 6.3) Write a plsql query to run left join on employee and department

		        SELECT e.empid,e.empname,d.deptmanager FROM Employee AS e
                 LEFT JOIN Department AS d ON e.deptid=d.deptid;
                 
# 6.4) Wirte a plsql query to run right join on employee and salary

				SELECT e.empid,e.empname,e,emp_designation,i.salary FROM Employee AS e
                RIGHT JOIN Income AS i ON e.empid=i.empid;
                
# 6.5) Write a plsql query to run cross join on all the three tables

				SELECT * FROM Employee
                CROSS JOIN Department
                CROSS JOIN Income;
                
# Question NO 07
#*****************

# 7.1) create a table customer (columns: customerid , customer_name ,customer_address)

				CREATE TABLE customer(
                     customer_id INT PRIMARY KEY,
                     customer_name VARCHAR(20),
                     customer_address VARCHAR(50));

# 7.2) alter the above table to add another column customer_contactnumber

				ALTER TABLE customer
                ADD COLUMN(
                  customer_contactnumber VARCHAR(10));
                  
# 7.3) insert a record in the table

				INSERT INTO customer
                VALUES(1,'HIMANSHU SINGH','ABC',1234567890);
                
# 7.4) delete a record from the above table where customerid = 1

				DELETE FROM customer
                where customer_id =1;
                
# 7.5) update the above table to change customer_name as ‘Rajesh’ where customerid=1
 
				UPDATE customer
                SET customer_name='Rajesh'
                where customer_id=1;
               
# Question No 08
#*****************

# 8.1) Write a plsql query to display sid , sname , books_issued, books_returned  

				SELECT s.sid,s.sname,l.books_issued,l.books_returned FROM Student AS s
                RIGHT JOIN Library AS l ON s.sid=l.sid;
                
# 8.2) Write a plsql query to display sname , grade

				SELECT s.sname,m.grade FROM Student AS s
                LEFT JOIN Marks AS m ON s.sid=m.sid;
                
# 8.3) Write a plsql query to run left join on student and library

				SELECT s.sid,s.sname,l.books_issued,l.books_returned FROM Student AS s
                LEFT JOIN Library AS l ON s.sid=l.sid;
                
# 8.4) Wirte a plsql query to run right join on library and marks

				SELECT l.sid,l.books_issued,l.book_returned,m.grade FROM library AS l
                RIGHT JOIN Marks AS m ON l.sid=m.sid;
                
# 8.5) Write a plsql query to run full join on all the three tables

				SELECT Student.sid,Student.sname,Student.saddr,
                Library.books_issued,Library.books_returned,Marks.grade FROM Student
                FULL JOIN Library  
                ON Student.sid=Library.sid,
                FULL JOIN Marks 
                ON Library.sid=Marks.sid ;
                
# Question No 09
#*****************

# 9.1) Explain group by clauses in plsql with the help of example

     /* Group By clause helps to display the data from the table by combining the data with respect to given parameters
          example:
          
           SELECT city, count(*) AS 'no of salesperson' from salesman
           GROUP BY city;
           
           the following code will display city name and no of sales person in that city, 
           this output was due to the Group By clause use with city asparameters. 
	  */

# Question No 10
#******************

# 10.1) Explain subqueries in pl/sql with the help of an example

	/*     Subqueries are those queries written inside other querie.In SQL first Subquerie are execute
           and then the outside querie.
		   so we can say the the result of outside quarie is based on inside quarie or sub querie.
           Example:
           
           SELECT * FROM Patient
            WHERE PID IN (SELECT PID FROM Appointments
						   WHERE 'date'='20/2/2022');
                           
	 */
     
    
    