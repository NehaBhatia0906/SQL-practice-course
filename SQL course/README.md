# SQL Learning Journey

## Overview

This repository contains my SQL learning journey, practice exercises, and portfolio projects completed using MySQL.

The repository includes:

* SQL Fundamentals Practice
* Data Cleaning Project
* Exploratory Data Analysis (EDA) Project

---

## SQL Fundamentals

During this course, I practiced and implemented:

### Day 1

* SELECT
* WHERE
* ORDER BY
* GROUP BY
* LIMIT
* ALIAS
* JOINS
* UNION

### Day 2

* String Functions
* CASE Statements
* Subqueries
* Common Table Expressions (CTEs)
* Window Functions

### Day 3

* Temporary Tables
* Stored Procedures
* Triggers
* Events

---

## Project 1: Data Cleaning in SQL

### Objective

Clean and prepare a real-world layoffs dataset for analysis using SQL.

### Tasks Performed

* Created staging tables to preserve raw data
* Identified and removed duplicate records using ROW_NUMBER()
* Standardized company names using TRIM()
* Standardized country values
* Converted date values using STR_TO_DATE()
* Modified date column datatype
* Identified NULL and blank values
* Investigated missing industry information using self joins
* Removed rows with insufficient information
* Removed temporary columns used during cleaning

### Note

The original tutorial dataset contained approximately 2,300+ records. Due to a CSV import limitation encountered in MySQL Workbench, only 564 records were successfully imported into my local database.

Because of the incomplete dataset, some records required for self-join operations were unavailable. After verification, missing industry values for Airbnb and Bally's Interactive were updated manually.

Despite the reduced dataset size, all major data cleaning techniques demonstrated in the project were successfully implemented and practiced.

---

## Project 2: Exploratory Data Analysis (EDA)

### Objective

Analyze the cleaned layoffs dataset to identify trends, patterns, and business insights.

### Analysis Performed

* Identified companies with the highest layoffs
* Calculated total layoffs by company
* Calculated total layoffs by country
* Determined dataset date range
* Analyzed monthly layoff trends
* Calculated rolling cumulative layoffs using window functions
* Ranked companies by layoffs for each year using DENSE_RANK()
* Examined records with 100% layoffs

### Skills Applied

* GROUP BY
* ORDER BY
* Aggregate Functions
* Window Functions
* ROW_NUMBER()
* DENSE_RANK()
* Common Table Expressions (CTEs)
* Self Joins
* Data Aggregation
* Trend Analysis

---

## Tools Used

* MySQL
* MySQL Workbench
* Git
* GitHub

---

## What I Learned

Through these projects, I gained practical experience in:

* Writing SQL queries
* Cleaning real-world datasets
* Handling NULL and missing values
* Removing duplicate records
* Using joins and self joins
* Working with CTEs and window functions
* Performing exploratory data analysis
* Generating insights from business data
* Managing SQL projects using GitHub

---

## Future Plans

* Advanced SQL Practice
* SQL Interview Questions
* Excel & Google Sheets Projects
* Tableau Dashboards
* Python for Data Analysis
* Pandas & NumPy
* End-to-End Data Analytics Projects

