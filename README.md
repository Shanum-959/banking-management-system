# banking-management-system
Relational database design for a banking system with ERD, schema, and analytical SQL queries
# Banking Management System — Database Design & SQL Analysis

A relational database project simulating a multi-branch banking system, designed to practice database normalization, schema design, and analytical SQL querying.

---

## Overview

This project models the core operations of a bank — customer accounts, transactions, loans, cards, and customer support — across multiple branches. It includes a fully normalized relational schema, an Entity-Relationship Diagram (ERD), and a set of analytical SQL queries demonstrating joins, subqueries, and correlated queries.

---

## Database Design

The schema consists of 10 interconnected tables:

| Table | Purpose |
|---|---|
| Branch | Stores bank branch details |
| Admin | Bank staff/admin login records |
| Customer | Customer personal and contact information |
| Account | Customer bank accounts linked to branches |
| Customer_Account | Mapping table for shared/joint account access |
| Transactions | Deposit and withdrawal records |
| Account_Request | New account opening requests and approval status |
| Loan | Loan applications and status tracking |
| Loan_Payment | Loan repayment records |
| Card | Debit/credit card details linked to accounts |
| Customer_Support | Customer queries and support replies |

See `ERD.pdf` for the full entity-relationship diagram and `Relational_Schema.pdf` for the complete schema with primary/foreign key relationships and cardinalities.

---

## Analytical Queries

The project includes SQL queries covering a range of analytical techniques:

- **Filtering & aggregation** — active accounts, customers by location, account type breakdowns
- **INNER / LEFT / RIGHT JOINs** — combining customer, account, and loan data
- **Nested subqueries** — identifying customers with above-average account balances and active cards
- **Correlated subqueries (EXISTS)** — finding customers with loan amounts exceeding their balance who have also raised a support query

These queries reflect common real-world analytical patterns: segmenting customers, flagging risk indicators (e.g. loan-to-balance ratio), and cross-referencing multiple data sources to answer business questions.

---

## Tech Stack

`SQL` · `MySQL`

---

## Files

```
banking-management-system/
├── ERD.pdf                 # Entity-Relationship Diagram
├── Relational_Schema.pdf    # Full relational schema with cardinalities
├── banking_system.sql       # Schema creation, sample data, and analytical queries
└── README.md
```

---

## Key Skills Demonstrated

- Relational database design and normalization
- Entity-Relationship modeling
- Writing multi-table JOIN queries
- Nested and correlated subqueries for business-question answering
- Translating real-world banking processes into a structured data model

---

## Contact

Developed by **Shanum Shahzad**
Email: shanumshahzad01@gmail.com
[GitHub](https://github.com/Shanum-959) · [LinkedIn](https://www.linkedin.com/in/shanum-shahzad-a6b130296/)
