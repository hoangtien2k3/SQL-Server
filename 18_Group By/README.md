### Trong SQL Server, GROUP BY là một câu lệnh được sử dụng để nhóm các hàng có cùng giá trị trong một hoặc nhiều cột, và cho phép tính toán các giá trị thống kê như SUM, AVG, COUNT, MAX, MIN, v.v.


### Syntax:
```Sql
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
ORDER BY column_name(s);
```

#

### Example:
Giả sử chúng ta có bảng "orders" sau đây:
|order_id  | customer_name | order_date | total_amount|
|----------|---------------|------------|-------------|
|1         | John          | 2022-01-01 | 100         |
|2         | John          | 2022-01-03 | 50          |
|3         | Mary          | 2022-01-02 | 200         |
|4         | Mary          | 2022-01-04 | 150         |



#### Chúng ta có thể sử dụng câu lệnh GROUP BY để tính tổng số tiền của mỗi khách hàng:
 ```Sql
 SELECT customer_name, SUM(total_amount)
FROM orders
GROUP BY customer_name;
 
 ```


### Kết quả:
|customer_name | total_amount|
|--------------|-------------|
|John          | 150         |
|Mary          | 350         |


#

#### Chúng ta có thể sử dụng câu lệnh GROUP BY để tính tổng số tiền của mỗi khách hàng theo tháng:
```Sql
SELECT customer_name, MONTH(order_date), SUM(total_amount)
FROM orders
GROUP BY customer_name, MONTH(order_date);
```

### Kết Qủa:
|customer_name | month | total_amount|
|--------------|-------|-------------|
|John          | 1     | 150         |
|Mary          | 1     | 350         |



