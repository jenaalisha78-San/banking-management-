use banking;

select * from  accounts;
select * from  transactions;

1. Retrieve all customer names who have a balance greater than 50,000.

Answer:
mysql> select name , current_balance from Account_table where current_balance > 50000;
+-----------------+-----------------+
| name            | current_balance |
+-----------------+-----------------+
| Vijay Shah      |           75433 |
| Suresh Mukharji |          500000 |
| Surya Yadhav    |           80000 |
| Smriti Jha      |          100000 |
+-----------------+-----------------+
4 rows in set (0.05 sec)

2. Display account number, customer name, and account type of all customers having SAVINGS
accounts.
Answer:

mysql> select account_number,name,account_type from Account_table where account_type='savings';
+----------------+----------------+--------------+
| account_number | name           | account_type |
+----------------+----------------+--------------+
|        1234561 | Ram Patil      | savings      |
|        1234563 | Meera Ramsingh | savings      |
|        1234566 | Yogesh Rathod  | savings      |
|        1234568 | Surya Yadhav   | savings      |
|        1234570 | Radha Paranjpe | savings      |
+----------------+----------------+--------------+
5 rows in set (0.00 sec)


3. List all transactions made in the current month.

Answer:
mysql> select * from Transactions Where month(Transaction_date_time) = month(now());
+----------------+----------------+-------------------+--------+-----------------------+
| Transaction_id | Account_number | type_of_operation | amount | Transaction_date_time |
+----------------+----------------+-------------------+--------+-----------------------+
|              1 |        1234561 | Deposit           |   2000 | 2025-11-03 22:45:42   |
|              2 |        1234562 | Withdraw          |    500 | 2025-11-03 22:45:42   |
|              3 |        1234563 | Deposit           |   3000 | 2025-11-03 22:45:42   |
|              4 |        1234564 | Withdraw          |  10000 | 2025-11-03 22:45:42   |
|              5 |        1234565 | Deposit           |   1500 | 2025-11-03 22:45:42   |
|              6 |        1234566 | Withdraw          |    700 | 2025-11-03 22:45:42   |
|              7 |        1234567 | Deposit           |   2500 | 2025-11-03 22:45:42   |
|              8 |        1234568 | Withdraw          |   4000 | 2025-11-03 22:45:42   |
|              9 |        1234569 | Deposit           |   8000 | 2025-11-03 22:45:42   |
|             10 |        1234570 | Withdraw          |   1000 | 2025-11-03 22:45:42   |
+----------------+----------------+-------------------+--------+-----------------------+
10 rows in set (0.00 sec)

4. Show customers who have not made any transactions yet.
Answer:
mysql> SELECT Account_number, name, Account_type, current_balance FROM Account_table WHERE Account_number NOT IN (SELECT Account_number FROM Transactions);
Empty set (0.00 sec)

5. Display the top 3 customers with the highest account balance.
Answer:
mysql> SELECT Account_number, name, Account_type, current_balance FROM Account_table ORDER BY current_balance DESC LIMIT 3;
+----------------+-----------------+--------------+-----------------+
| Account_number | name            | Account_type | current_balance |
+----------------+-----------------+--------------+-----------------+
|        1234564 | Suresh Mukharji | current      |          500000 |
|        1234569 | Smriti Jha      | current      |          100000 |
|        1234568 | Surya Yadhav    | savings      |           80000 |
+----------------+-----------------+--------------+-----------------+
3 rows in set (0.00 sec)

6. Retrieve all transactions where the amount is greater than 10,000.

Answer:
mysql> select * from transactions where amount >10000;
Empty set (0.00 sec)

7. Show the total balance of all accounts combined.
Answer:
mysql> select sum(current_balance) as total_amount from Account_table;
+--------------+
| total_amount |
+--------------+
|       786987 |
+--------------+
1 row in set (0.06 sec)

8. List customers along with their total deposited amount.
Answer:
mysql> select * from Transactions where type_of_operation='deposit';
+----------------+----------------+-------------------+--------+-----------------------+
| Transaction_id | Account_number | type_of_operation | amount | Transaction_date_time |
+----------------+----------------+-------------------+--------+-----------------------+
|              1 |        1234561 | Deposit           |   2000 | 2025-11-03 22:45:42   |
|              3 |        1234563 | Deposit           |   3000 | 2025-11-03 22:45:42   |
|              5 |        1234565 | Deposit           |   1500 | 2025-11-03 22:45:42   |
|              7 |        1234567 | Deposit           |   2500 | 2025-11-03 22:45:42   |
|              9 |        1234569 | Deposit           |   8000 | 2025-11-03 22:45:42   |
+----------------+----------------+-------------------+--------+-----------------------+
5 rows in set (0.00 sec)

Answer:
9. Find customers who made a withdrawal of more than 5,000.
Answer:
mysql> select * from transactions where type_of_operation='withdraw' and amount >5000;
+----------------+----------------+-------------------+--------+-----------------------+
| Transaction_id | Account_number | type_of_operation | amount | Transaction_date_time |
+----------------+----------------+-------------------+--------+-----------------------+
|              4 |        1234564 | Withdraw          |  10000 | 2025-11-03 22:45:42   |
+----------------+----------------+-------------------+--------+-----------------------+
1 row in set (0.00 sec)


10. Display the most recent transaction date for each account.
Answer:
mysql> select Account_number, MAX(Transaction_date_time) AS Most_Recent_Transaction FROM Transactions GROUP BY Account_number;
+----------------+-------------------------+
| Account_number | Most_Recent_Transaction |
+----------------+-------------------------+
|        1234561 | 2025-11-03 22:45:42     |
|        1234562 | 2025-11-03 22:45:42     |
|        1234563 | 2025-11-03 22:45:42     |
|        1234564 | 2025-11-03 22:45:42     |
|        1234565 | 2025-11-03 22:45:42     |
|        1234566 | 2025-11-03 22:45:42     |
|        1234567 | 2025-11-03 22:45:42     |
|        1234568 | 2025-11-03 22:45:42     |
|        1234569 | 2025-11-03 22:45:42     |
|        1234570 | 2025-11-03 22:45:42     |
+----------------+-------------------------+
10 rows in set (0.00 sec)

11. Retrieve the number of transactions each customer has made.
 Answer:

mysql> select Account_number, COUNT(Transaction_id) AS Total_Transactions FROM Transactions GROUP BY Account_number;
+----------------+--------------------+
| Account_number | Total_Transactions |
+----------------+--------------------+
|        1234561 |                  1 |
|        1234562 |                  1 |
|        1234563 |                  1 |
|        1234564 |                  1 |
|        1234565 |                  1 |
|        1234566 |                  1 |
|        1234567 |                  1 |
|        1234568 |                  1 |
|        1234569 |                  1 |
|        1234570 |                  1 |
+----------------+--------------------+
10 rows in set (0.00 sec)

12. List customers who have both SAVINGS and CURRENT accounts (if allowed).

Answer:
mysql> select name FROM Account_table WHERE Account_type IN ('savings', 'current') GROUP BY name HAVING COUNT(DISTINCT Account_type) = 2;
Empty set (0.01 sec)


13. Find all accounts created by customers whose name starts with 'p'(R).
Answer:
mysql> select * FROM Account_table WHERE name LIKE 'r%';
+----------------+----------------+-----------------+--------------+
| Account_number | name           | current_balance | Account_type |
+----------------+----------------+-----------------+--------------+
|        1234561 | Ram Patil      |            6754 | savings      |
|        1234570 | Radha Paranjpe |            5600 | savings      |
+----------------+----------------+-----------------+--------------+
2 rows in set (0.00 sec)

14. Retrieve customers sorted by their account balance in descending order.
Answer:
mysql> select * FROM Account_table ORDER BY current_balance DESC;
+----------------+-----------------+-----------------+--------------+
| Account_number | name            | current_balance | Account_type |
+----------------+-----------------+-----------------+--------------+
|        1234564 | Suresh Mukharji |          500000 | current      |
|        1234569 | Smriti Jha      |          100000 | current      |
|        1234568 | Surya Yadhav    |           80000 | savings      |
|        1234562 | Vijay Shah      |           75433 | current      |
|        1234561 | Ram Patil       |            6754 | savings      |
|        1234566 | Yogesh Rathod   |            6500 | savings      |
|        1234563 | Meera Ramsingh  |            6000 | savings      |
|        1234570 | Radha Paranjpe  |            5600 | savings      |
|        1234567 | Dhananjay Mane  |            4700 | current      |
|        1234565 | Vaishu Sharma   |            2000 | current      |
+----------------+-----------------+-----------------+--------------+
10 rows in set (0.00 sec)

15. Display the average account balance per account type
Answer:
mysql> select Account_type, AVG(current_balance) AS Average_Balance FROM Account_table GROUP BY Account_type;
+--------------+-----------------+
| Account_type | Average_Balance |
+--------------+-----------------+
| savings      |      20970.8000 |
| current      |     136426.6000 |
+--------------+-----------------+
2 rows in set (0.01 sec)
