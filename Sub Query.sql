--Question 1
select * from Orderss
where salesman_id=(
		Select salesman_id from salesman
		where name='Paul Adam'
		)

--Question 2
select * from Orderss
where salesman_id in(
		select salesman_id from salesman
		where city='London'
		)

--Question 3
Select * from Orderss
where salesman_id =(
			Select salesman_id from orderss 
			where customer_id=3007
			)

--Question 4
Select * from Orderss
where purch_amt >(
		Select avg(purch_amt) from Orderss
		where ord_date='2012-10-10'
		)

--Question 5
Select * from Orderss
where salesman_id in(
		Select salesman_id from salesman 
		where city='New York'
		)

--Question 6
Select commission from salesman
where salesman_id in(
			Select salesman_id from customer
			where city='Paris'
			)

--Question 7
Select * from customer
where customer_id=(
		select salesman_id - 2001 from salesman
		where name= 'Mc Lyon'
		)

--Question 8
Select grade,count(*) from customer  
group by grade 
Having grade > (
			Select avg(grade) from customer
			where city='New York'
			)
	

--Question 9
Select order_no,purch_amt,ord_date, salesman_id from Orderss
where salesman_id in(
		Select salesman_id from salesman 
		where commission=(
			select max(commission) from salesman
			)
			);

--Question 10






--Question 11
Select salesman_id,name from salesman a
where 1< (
			Select count(*) from Customers
			where salesman_id=a.salesman_id
			)


--Question 12
Select * from Orderss o1
where purch_amt >(
				select avg(purch_amt) from Orderss o2
				where o1.customer_id=o2.customer_id
				)

--Question 13
Select * from Orderss o1
where purch_amt >=(
				Select avg(purch_amt) from Orderss o2
				where o2.customer_id=o1.customer_id
				)

--Question 14
Select ord_date,sum(purch_amt) from Orderss o1
group by ord_date 
having sum(purch_amt) >(
			select 1000+ max(purch_amt) from Orderss o2
			where o1.ord_date=o2.ord_date
			)


--	Question 15
Select customer_id,cust_name,city from customer
where Exists(
		Select * from customer
		where city='London'
		)

--Question 16
Select * from salesman s1
where salesman_id in(
		Select salesman_id from customer
		where 1< (
			Select count(*) from customer
			where salesman_id=s1.salesman_id
		)
	);
--Question 17
select * from salesman s1
where salesman_id in(
		Select salesman_id from customer
		where 1=(
		select count(*) from customer
		where salesman_id=s1.salesman_id
		)
		);

--Question 18  *
Select * from salesman s1
where exists(
			Select * from customer c1
			where s1.salesman_id=c1.salesman_id

			AND 1<
			(Select count(*) from Orderss
			where orderss.customer_id=c1.customer_id
			)
			);


--Question 19
Select * from salesman s1
where city in (
				select city from customer
				where 0<(
				select count(*) from customer
				where city=s1.city
				)
				);

--Question 20
Select * from salesman s1
where city in(
				Select city from customer
				where city=s1.city
				)