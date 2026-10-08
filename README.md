<div align="center">

# 🗄️ Advanced SQL Queries

**Asking a database the right questions.**

![MySQL](https://img.shields.io/badge/MySQL-3B3561?style=for-the-badge&logo=mysql&logoColor=E8DCE6)
![SQL](https://img.shields.io/badge/SQL-685369?style=for-the-badge&logo=databricks&logoColor=E8DCE6)
![Queries](https://img.shields.io/badge/Queries-8-4B88A2?style=for-the-badge)

</div>

A set of MySQL queries against a small customers/orders schema, written to practice the patterns that come up in real reporting work: grouping and filtering aggregates, combining tables with joins, and filtering with subqueries.

## 🔍 What's covered

| | Technique | The question it answers |
|---|---|---|
| ➕ | `GROUP BY` + `SUM` | How much has each customer spent in total? |
| 🚦 | `HAVING` | Which customers have spent more than $200? |
| 🔢 | `COUNT` | How many transactions does each customer have? |
| ⬅️ | `LEFT JOIN` | Every order with the customer's name, *including* orders with no customer on file |
| 🎯 | `INNER JOIN` | Only the orders that match a known customer |
| 🪆 | Subquery with `IN` | Orders from customers who share a last name |
| 📊 | Subquery with `AVG` | Orders at or above the average order total |

## 🧩 Schema

```
customers (id PK, first_name, last_name)
orders    (id PK, customer_id FK → customers.id, nullable, order_date, total_amount)
```

> 💡 One order deliberately has a `NULL` customer, which makes the difference between `LEFT JOIN` and `INNER JOIN` show up right in the results.

## ▶️ Run it

1. Open MySQL Workbench (or any MySQL client) and select or create a database.
2. Run [`advanced-SQL-queries.sql`](advanced-SQL-queries.sql). It drops and recreates the tables, seeds the data, then runs each query in order.

## 🎓 What I took away

The hardest part wasn't any single feature; it was knowing which tool fits a question once joins, subqueries and aggregates start stacking together. What helped was breaking every question into three steps:

**1.** What rows do I need? → **2.** How do I group them? → **3.** How do I filter the groups?

---

<div align="center">

Want to see MySQL in a full app? Check out 🎵 **[Harmonotes](https://github.com/BrookeFloyd10/Harmonotes-FullStack-Brooke-F)**, built with Spring Boot, JPA and MySQL.

</div>
