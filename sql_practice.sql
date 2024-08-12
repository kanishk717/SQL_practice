create database mydb; # To create database
drop database mydb; # To drop(delete) database,for delete database we dont want to turn off anything like autocommit or sql_safe_updates etc..
create schema mydb; # To create schema(same as database but different method to create database)
drop schema mydb; # To drop(delete) schema,for delete schema we dont want to turn off anything like autocommit or sql_safe_updates etc..
use mydb; #To access the created database or schema
create table student(sno int(5),sname varchar(15),marks int(3)); #To create table 
drop table student; #To drop(delete) table,for delete table we dont want to turn off anything like autocommit or sql_safe_updates etc..
describe student; #To see how much rows and columns,how much colums we created and its datatype.
insert into student values(101,'kanishk',80); #To insert the datas in the table
insert into student(marks,sname,sno) values(90,'guruprasath',100);  #To insert the datas in the table
insert into student values(102,'manoj',null);  #To insert the datas in the table,if you dont have anything to enter values instead we must use null
select sname student_names,sno-10 sno from student; #To select the columns in the table,we can change the columns name by entering the new name after entering the existing name 
select * from student where sno%2=0; # selecting datas from student(table) by using where command
select * from student where marks is null; # selecting datas from student(table) by using where command
insert into student values(103,'kiran',90);
select distinct marks from student; # distinct command will remove all duplicates and give the original value(firstly entered)
select distinct student_name from student; #same as the above one
select * from student where marks>=85 and sno>101;  #selecting datas using AND operator
select * from student where marks>=85 or sno>101; #selecting datas using OR operator
select * from student where sname!='kanishk';
select * from student where not sname = 'kanishk'; #selecting datas using NOT operator
select * from student where marks between 80 and 90; #selecting datas using BETWEEN operator
select * from student where marks not between 80 and 90; #selecting datas using NOT BETWEEN operator
select * from student where marks in(85); #selecting datas using IN operator
select * from student where marks not in(85); #selecting datas using NOT IN operator
#pattern matching operators
select * from student where sname like 'g%'; #selecting datas using LIKE operator,where the input of the name is starts with 'g' and % represents multiple chars.
select * from student where sname not like 'g%'; #selecting datas using NOT LIKE operator,where the input of the name is not starts with 'g' and % represents multiple chars.
select * from student where sname like '%n%'; #selecting datas using LIKE operator,where in the middle of the input(str),somewhere 'n' is there and both of left and right side having multiple chars(%)   
select * from student where sname not like '%n%'; #selecting datas using NOT LIKE operator,where in the middle of the input(str),somewhere 'n' is not there and both of left and right side having multiple chars(%) 
select * from student where sname like 'k%n'; #selecting datas using LIKE operator,where the input start with 'k' and in middle has multiple chars(%) and it ends with 'n'
select * from student where sname not like 'k%k'; #selecting datas using NOT LIKE operator,where the input not start with 'k' and in middle has multiple chars(%) and it not ends with 'n'
select * from student where sname like '%k_'; #selecting datas using LIKE operator,where the input is starts with multiple chars(%) and last before char is 'k','_' is represent the single character
select * from student where student_name like '_____'; #selecting datas using NOT LIKE operator,where the datas have only 5 chars because we use 5'_'
# end pattern matching operators
#DDL commands.
commit; # To save the modification,when autocommmit is off
alter table student add(CGPA decimal(3)); # To add new column,we use ALTER key and ADD method
alter table student drop column cgpa; #To drop(delete) the column,we use ALTER key and DROP method
alter table student modify column sname varchar(25); # To modify column specification(for ex:In this command we change the column char.length 15 to 25),we use ALTER key and MODIFY method 
alter table student rename column sname to  student_name; #To rename the column name,we use ALTER key and RENAME method
# end DDL commands.
#String Functions
select upper(student_name) from student; #To change the datas(str) to upper cases using UPPER function
select length(student_name) from student; # To find the length of datas(str) using LENGTH function
select * from student where length(student_name)=5; #selecting the datas where the length of the datas in the given column is 5
select trim(student_name) from student; #To trim every spaces in the given column and returns only string
select trim('k' from student_name) from student; #To trim(remove) 'k' char from datas in the student_name column
select  instr(student_name, 'o') from student; # it shows that 'o' char is placed in which column and which position in numbers
select substr(student_name,2,4) from student; # it displays 2nd char to 4th char from the student_name datas.
select substr(student_name,3,3) from student; # when the firstnum>=secondnum,then the second num represents,how many chars should i need to display after the firstnum.
select substr(student_name,4,3) from student; # same as the above one
select concat('kanishk','bk'); #kanishkbk(joins the given input)
# Numeric Functions.
select abs(-40); # 40(return absolute value)
select sqrt(25); # 5 (return square root of given value)
select mod(10,3); # 1 (return modulus of given value,first num represents the input,and second num represents as divisor in MOD method
select power(2,5);# 32(return power value of first num ,where second num is the power of first num(for ex: 2^5))
select truncate(40.1234,3); #40.123(return the first three values in the decimal values )
select truncate(4079,-1); # 4070
select truncate(-4079,-3);#4000
select greatest(100,200,300); # 300
select least(100,200,300); #100
# Date Functions
select curdate(); # return current date
select curtime(); # return current time
select now(); #return both date and time
select sysdate(); #return system date and time
select month(curdate()); # return month of the given input
select year(sysdate()); # return year of the given input
select day(now()); #return day of the given input
select * from student where year(student_dob)='2000'; # return the column where the year is equal to 2000
select * from student where month(student_dob)='2'; # return the column where the month is equal to 2 (1 to 12)
select * from student where day(student_dob)='20'; # return the column where the day is equal to 20 (1 to 31)
select * from student where monthname(student_dob)='june'; #return the column of the given month,which the input is given in string format
# Aggregate Functions(It always return the single value)
select max(marks) from student; # return the max number of the given input column
select avg(marks) from student; # return the average of sum of all numbers in marks column
select min(marks) from student; # return the minimum number in the marks column
select sum(marks) from student; # return the sum of all numbers in marks column
select count(marks) from student; # return the number of values present in given input column 
set autocommit=1;#In mysql autocommit is builtin method which saves every changes, but if you want to delete something you must set autocommmit=0,to turn back on,change the value to 1 
set sql_safe_updates = 0; # To delete a data we must turn off safe update,so we set sql_safe_update=0,to turn back on,change the value to 1 
delete from student; # delete the data
rollback; # To undo the deleted data
select * from student; # To select all datas in table we use * command
