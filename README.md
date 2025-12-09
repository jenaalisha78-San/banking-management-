# Banking System Database

The **Banking System Database** is designed to efficiently manage customer accounts and transactions in a simplified banking environment. It demonstrates essential database operations such as deposits, withdrawals, and balance inquiries using MySQL. This project provides a foundational understanding of how banking systems handle and record financial data.

---

## Project Overview

The Banking System Database consists of two main tables — **Accounts** and **Transactions** — that work together to simulate real-world banking operations.  
Every deposit or withdrawal is recorded as a transaction, and the account balance is updated manually using SQL queries (without triggers).  

This structure provides a clear and educational approach to understanding relational databases and their interconnections in financial systems.

---

## Key Objectives

### Account Management  
Store and manage customer details, account types, and current balances.

### Transaction Management  
Record deposits and withdrawals with transaction IDs, timestamps, and corresponding account numbers.

### Data Analysis & Reporting  
Execute SQL queries to retrieve insights such as total balances, top customers, transaction histories, and account summaries.

### Educational Focus  
Demonstrate fundamental SQL concepts including **JOINs**, **GROUP BY**, **aggregate functions**, and **subqueries**.

---

## Tools & Technologies Used
<img src="https://github.com/vaishu-08/college_management_database/blob/main/image/My_sql.jpg" alt="mysql_img" width="300"/> &nbsp;

- **MySQL** – Database Management System  
- **SQL** – Query Language for data manipulation  

---
## Database Design

### **1. Accounts Table**
| Column | Type | Description |
|--------|------|-------------|
| account_number | INT | Primary Key |
| customer_name | VARCHAR(100) | Customer’s full name |
| current_balance | DECIMAL(10,2) | Current balance in account |
| account_type | VARCHAR(20) | Either ‘savings’ or ‘current’ |

### **2. Transactions Table**
| Column | Type | Description |
|--------|------|-------------|
| trans_id | INT | Primary Key |
| transaction_type | VARCHAR(20) | Deposit or Withdraw |
| amount | DECIMAL(10,2) | Transaction amount |
| date_time | DATETIME | Date and time of transaction |
| account_number | INT (FK) | References `accounts(account_number)` |

---

## Project Results  
[Click here to get full code](Bank Management code .sql)

---

## Working of the System

- Deposits and withdrawals are recorded in the **Transactions** table.  
- Balances are updated manually through SQL queries (no triggers used).  
- Each record maintains timestamped transaction history for accurate tracking.  

---

## Advantages
- Simple and beginner-friendly structure.  
- Demonstrates clear understanding of SQL operations.  
- Easy to extend for advanced functionality.  

---

## Limitations
- Manual updates can lead to inconsistencies.  
- Not ideal for large-scale or real-time banking systems.  

---

## Future Scope
- Add triggers for automatic balance updates.  
- Introduce online fund transfer between accounts.  
- Implement user login and role-based access control.  
- Develop a web-based front end for better user interaction.  

---

## Conclusion
This project represents a practical approach to learning and implementing fundamental database management concepts using MySQL.  
