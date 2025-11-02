-- --- what are the names of salesperson who had atleast one shipmement
###using in###
select salesperson from people where spid in (select spid from sales);
###using exist##
select Salesperson from people As T1
where exists(
select spid 
from sales as T2
where T2.spid = T1.SPID
);
###using join####
select distinct Salesperson from people  as T1
inner join sales as T2
on  T1.spid = T2.spid;
-- How many sales (shipments) each of the salesperson had in the monday
select 
T2.Salesperson,
count(T1.spid) as shipment_quantity
from sales as T1 
inner join
people as T2
on T1.spid = T2.spid 
where weekday(T1.Saledate)='monday'
group by T1.SPID,T2.Salesperson 
order by shipment_quantity desc;
-- Which product sold more boxes milkbars or eclairs.
select pid,product from products where product in ('milk bars','eclairs');
select pid,count(boxes) as no_of_boxes from sales 
where pid 
in 
(select pid from products where product in ('milk bars','eclairs')) 
group by pid order by no_of_boxes desc limit 2;
###using join####################
select P_T2.Product,count(S_T1.Boxes) as No_Of_Boxes from sales as S_T1 
inner join 
products as P_T2
on S_T1.PID = P_T2.PID
where P_T2.Product in ('milk bars','eclairs') group by S_T1.PID,P_T2.Product order by No_Of_Boxes desc limit 1;
###################
-- which product sold more boxes in the first 7 days of february 2022;
select pid,count(boxes) 
as no_of_box 
from sales 
where cast(saledate as date) 
between
2021-02-01 and 2021-02-07 
group by pid;
-- count of box means number of transactions means box row how many 
-- times occure 10,5--> 2and sum of boxes means value of box total 10,5 --> 15.
select pid,count(boxes),sum(boxes) from sales group by pid; 
###using join
select T1.pid,T2.Product,sum(T1.boxes) as total_boxes from sales as T1 
inner join 
products as T2
on T1.PID=T2.PID
where saledate 
between 2022-02-01 and 2022-02-07
group by T1.pid,T2.Product order by total_boxes desc limit 1;
##--which shipments had under 100 customer and under 100 boxes. did any?
select * from sales;
select spid,sum(customers) as total_customer ,sum(boxes) as total_no_of_boxes 
from sales 
group by spid
having total_customer<1000 and total_no_of_boxes<1000;
############hard
-- name the salesperson who had atleast one shipment
select T2.Salesperson,T1.SPID,count(T1.SPID) as no_of_shipment from sales as T1
inner join 
people as T2
on T1.SPID=T2.SPID
group by T1.spid
having count(T1.spid)<0;
-- ##which salesperson didnot make any shipments in the first 7 days of january
select T2.SPID,T2.Salesperson from sales as T1 
left join 
people as T2
on T1.spid=T2.SPID 
and T1.SaleDate between 2021-01-01 and 2021-01-07
where T1.spid is null;
##########not in
select salesperson from people 
where spid 
not in(select distinct spid from sales where SaleDate between 2021-01-01 and 2021-01-07);
#######How many times we shipped more than 1000 boxes per month
select monthname(Saledate) 
as By_Month,
count(boxes) as total_boxes 
from sales 
group by By_Month
having total_boxes>1000;
###########
select year(saledate) as By_year,
month(saledate) as By_Month,
count(*) as Times_we_shipped_1k_boxes 
from sales
where Boxes>1000
group by year(saledate),
month(saledate)
order by year(saledate),
month(saledate);
