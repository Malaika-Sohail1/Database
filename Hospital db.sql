--A MID 

create database db_hospital

create table tbl_patient(
	patient_id int primary key,
	first_name varchar(50),
	last_name varchar(50),
	gender char(1),
	birth_date DATE,
	Phone varchar(50),
	Email varchar(100)
	)
	insert into tbl_patient values (101,'John','DOE','M','1985-07-20','555-1234','johndoae@example.com')
	insert into tbl_patient values (102, 'Jane', 'Smith', 'F', '1990-02-14', '555-5678', 'jane.smith@example.com')
	insert into tbl_patient values (103, 'Robert', 'Brown', 'M', '1978-09-30', '555-8765', 'robert.brown@example.com')
	insert into tbl_patient values(104, 'Emily', 'White', 'F', '2000-01-05', '555-4321', 'emily.white@example.com')
	insert into tbl_patient values (105, 'Michael', 'Green', 'M', '1995-12-18', '555-9876', 'michael.green@example.com')

	alter table tbl_patient
	add constraint uniq_check
	unique(patient_id) 

	create table tbl_doctors(
	doctore_id int primary key,
	firstName varchar(50),
	lastName varchar(50),
	speciality varchar(100),
	)

	insert into tbl_doctors values (201, 'Alice', 'Johnson', 'Cardiology', 2)
	insert into tbl_doctors values(202, 'Bob', 'Williams', 'Pediatrics', 3)
	insert into tbl_doctors values (203, 'Charlie', 'Miller', 'Neurology', 5)
	insert into tbl_doctors values  (204, 'Diana', 'Clark', 'Orthopedics', 4)
	insert into tbl_doctors values (205, 'Ethan', 'Taylor', 'Surgery', 1)
	
	alter table tbl_doctors
	add dep_id int null

	alter table tbl_doctors
	add constraint forkey
	foreign key(dep_id) references tbl_departments(department_id)
	
	create table tbl_departments(
	department_id int primary key,
	department_name varchar(100)
	)

	alter table tbl_departments
	add constraint uni
	unique(department_id)

	insert into tbl_departments values(1, 'Surgery')
	insert into tbl_departments values (2, 'Cardiology')
	insert into tbl_departments values  (3, 'Pediatrics')
	insert into tbl_departments values(4, 'Orthopedics')
	insert into tbl_departments values (5, 'Neurology')


	create table tbl_treatment(
	treatment_id int primary key,
	p_id int foreign key references tbl_patient(patient_id),
	doctorID int foreign key references tbl_doctors(doctore_id),
	treatment_date date,
	diagonosis varchar(255),
	treatment varchar(255)
	)
	alter table tbl_treatment
	add constraint uniq
	unique(treatment_id)


	insert into tbl_treatment values (301, 101, 205, '2024-01-10', 'Appendicitis', 'Appendectomy')
	insert into tbl_treatment values(302, 102, 201, '2024-02-15', 'Heart Disease', 'Cardiac Surgery')
	insert into tbl_treatment values (303, 103, 202, '2024-03-12', 'Bronchitis', 'Antibiotics')
	insert into tbl_treatment values(304, 104, 203,'2024-04-20', 'Migraine', 'Medication')
	insert into tbl_treatment values(305, 105, 204, '2024-05-25', 'Fractured Leg', 'Surgery')

	select firstName,lastName from tbl_doctors

	select * from tbl_departments

	select * from tbl_treatment
	order By treatment_date desc

	Select * from tbl_patient p
	inner join tbl_treatment t
	on p.patient_id=t.p_id
	inner join tbl_doctors d
	on d.doctore_id=t.doctorID
	inner join tbl_departments s
	on d.dep_id=s.department_id
	where department_name='Cardiology'



	select d.dep_id,count(p.patient_id) as total from tbl_doctors d
	inner join tbl_treatment t
	on d.doctore_id=t.doctorID
	inner join tbl_patient p
	on p.patient_id=t.p_id
	group by d.dep_id
	


	select first_name from tbl_patient p
	where p.first_name like '[^j,r]%'

	select first_name from tbl_patient p
	where p.first_name like '%[p,j]'
	