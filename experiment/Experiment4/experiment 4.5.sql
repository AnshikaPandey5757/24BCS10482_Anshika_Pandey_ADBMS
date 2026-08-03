select e1.Employee_name as employee,e2.Employee_name as Manager from employees as e1
left join employees as e2
on e1.Manager_id=e2.Employee_id;

select c1.customer_name,p1.product_name from customers as c1
cross join products as p1;
