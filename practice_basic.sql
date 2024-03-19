select name,age from Authors;
select * from Books where pub_year>2020;

select user_id,book_id,purchase_date from Purchases where YEAR(purchase_date)=2024 limit 12;

select name,address from Users where address='서울' limit 12;
select * from Books ORDER BY price DESC limit 12;

select * from `Categories` where category_name='과학';
select email,age from `Users` where age>=28 and age<=30;