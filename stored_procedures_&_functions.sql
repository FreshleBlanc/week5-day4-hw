-- Stored procedure and function 

-- Create a function that takes in an integer values 
-- and returns its double



create or replace function doubleNum (a_num Integer)
returns Integer
language plpgsql as $$
begin 
	--code goes here
	return a_num * 2;
end;
$$




select doubleNum(5);

create or replace function averageTotalCountryPayments(country varchar)
returns float
language plpgsql as $$
begin
	return 
end;
$$


-- creat a procedure to insert a new actor

insert into actor (first_name, last_name)
values
	('Dylan', 'Smith')
	
create or replace procedure insertActor(_first_name varchar, _last_name varchar)
language plpgsql as $$
begin 
	insert into actor (first_name, last_name)
end;
$$
	

call insertactor('Dylan', 'Smith')













