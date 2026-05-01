# 🔍 Predicting Employee Attrition — NexGen Internship

> Why do employees leave? This project tries to answer that using real HR data, SQL analysis, machine learning, and a Power BI dashboard.

---

## Project Files

```
NexGen-Intern---Predicting-Employee-Attrition
 ┣  Attrition.ipynb                       → EDA + ML model (Python)
 ┣  employee_attrition.sql                → SQL analysis queries
 ┣  Employee Attrition Prediction.pbix    → Power BI dashboard
 ┗  test.csv                              → Dataset
```

---

## 🛠️ Tech Stack

`Python` &nbsp;|&nbsp; `SQL (MySQL)` &nbsp;|&nbsp; `Power BI` &nbsp;|&nbsp; `scikit-learn` &nbsp;|&nbsp; `pandas`

---

## 🧠 What the SQL Covers

The SQL file has 11 queries covering:

- Overall attrition rate across the company
- Attrition breakdown by **job role**, **salary group**, and **experience level**
- Impact of **overtime** and **work-life balance** on leaving
- Whether **promotions** actually help with retention
- Avg salary comparison — employees who left vs who stayed
- CTE to flag **high-risk segments** (attrition rate > 40%)
- Window functions to rank job roles and compare groups to company average

---

## 📊 Dashboard

> Add your Power BI screenshot here
> `![Dashboard](dashboard.png)`

---

## ▶️ How to Use

**SQL**
```sql
-- Import test.csv into MySQL, then run:
source employee_attrition.sql;
```

**Python**
```bash
jupyter notebook Attrition.ipynb
```

**Power BI**
→ Open `Employee Attrition Prediction.pbix` in Power BI Desktop

---

## 💡 Key Questions This Project Answers

- Which job roles have the highest attrition?
- Does overtime push employees to quit?
- Do low-salary employees leave more often?
- What combination of factors puts an employee at highest risk?

---

*Built during NexGen internship — 2025*
