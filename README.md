# SQL-Pizza-Sales-Analysis
SQL-based Pizza Sales Analysis using relational database tables

# 🍕 SQL Pizza Sales Analysis
## 🗄️ Database Schema

The project uses four relational tables connected through primary and foreign keys:

```text
Pizza Types
    │
    │ pizza_type_id
    ▼
Pizzas
    │
    │ pizza_id
    ▼
Order Details
    │
    │ order_id
    ▼
Orders

## 📌 Project Overview

This project analyzes pizza sales data using SQL to identify sales performance, revenue trends, popular pizza types, customer ordering patterns, and category-level performance.

The analysis is performed using a relational database consisting of four tables:

- Orders
- Order Details
- Pizzas
- Pizza Types

## 🛠️ Tools & Technologies

- SQL
- MySQL
- Relational Database
- GitHub

## 📂 Dataset

The project contains four tables:

| Table | Description |
|---|---|
| Orders | Contains order date and order time information |
| Order Details | Contains pizza quantities and order-level details |
| Pizzas | Contains pizza size and price information |
| Pizza Types | Contains pizza names and categories |

## 🔍 SQL Analysis

The project answers several business questions, including:

- What is the total number of orders?
- What is the total revenue generated?
- Which pizza has the highest price?
- What is the most commonly ordered pizza size?
- What are the top 5 most ordered pizza types?
- Which pizza categories have the highest quantity of orders?
- How are orders distributed throughout the day?
- What is the average number of pizzas ordered per day?
- Which pizzas generate the highest revenue?
- What percentage of revenue comes from each pizza category?
- How does cumulative revenue change over time?
- What are the top 3 revenue-generating pizzas within each category?

## 🧠 SQL Concepts Used

- SELECT
- Aggregate Functions
- GROUP BY
- ORDER BY
- JOINs
- Subqueries
- Window Functions
- RANK()
- PARTITION BY
- Date and Time Functions
- Revenue Analysis

## 📊 Key Insights

The SQL analysis helps identify:

- Overall sales and revenue performance
- Best-selling pizza types
- Highest-revenue pizzas
- Popular pizza sizes
- Category-level sales performance
- Ordering patterns by hour
- Revenue contribution by category
- Cumulative revenue trends

## 📁 Project Structure

```text
SQL-Pizza-Sales-Analysis/
│
├── dataset/
│   ├── Order Details
│   ├── Orders
│   ├── Pizza Type
│   └── Pizzas
│
├── sql/
│   └── SQL Project
│
└── README.md
