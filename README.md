# GoExplore — Automated Analytics & Reporting

## 📌 Project Overview

GoExplore is a rapidly growing camping and hiking supplier that wants to move from ad-hoc analysis toward a more scalable, self-service reporting system.

The company previously relied on a single data scientist for its reporting and insights. After that person left, the business needed an analytics solution that would allow management and other departments to explore performance without depending on a data specialist for every question.

The objective of this project is therefore **not simply to perform a one-time analysis**. The goal is to build a reusable analytics workflow and reporting system using:

- **Google Sheets** — source data preparation and lightweight business analysis
- **Google BigQuery** — structured data storage and SQL-based analytical processing
- **Google Looker Studio** — interactive dashboards and self-service reporting

The dashboard should allow non-technical stakeholders to understand the business quickly and explore the data independently.

- Data provided is from 1st Jan of 2015 Till 20th Jul of 2018
---

## 🎯 Business Objectives

The project is based on two main business questions from GoExplore's leadership.

### 1. European Market Expansion

GoExplore plans to open markets in:

- Czech Republic
- Norway
- Poland
- Portugal

The European Division needs an estimate of the potential market size in these countries.

The analysis should compare the target countries with existing GoExplore markets using relevant external indicators such as:

- Population
- GDP
- Geographic or neighbouring-market characteristics
- Comparable markets where GoExplore already operates

The objective is to create a reusable framework that helps management evaluate potential expansion markets rather than relying on a single static estimate.

### 2. Retailer Performance

The Retailer Connections team wants to understand whether **specialty retailers** perform differently from **general retailers**.

Examples of specialty stores include:

- Golf Shops
- Eyewear Stores
- Other retailers focused on a specific product range

Examples of more general retailers include:

- Sports Stores
- Outdoors Shops

---

## 👥 Stakeholders

The reporting system is designed around the information needs of several potential stakeholders.

| Stakeholder | Questions they may want to answer |
|---|---|
| CEO / Management | How is the business performing overall? |
| European Division | Which new markets could represent meaningful opportunities? |
| Retailer Connections | How are specialty and general retailers performing? |
| Marketing | Which markets, products or channels are showing changes in demand? |
| Finance | How are revenue, orders and commercial performance developing? |
| Product | Which product categories and products are contributing to performance? |

The dashboard should focus on answering business questions rather than simply displaying as many metrics as possible.

---

## 🏗️ Analytics Architecture

The project follows a simple analytics pipeline:

```text
Raw / Source Data
       ↓
Google Sheets
       ↓
Google BigQuery
       ↓
SQL Transformations & KPI Calculations
       ↓
Google Looker Studio
       ↓
Interactive Management Dashboard
```
---

## 📊 Dashboard Philosophy

A key design principle is that a dashboard should allow a non-technical user to understand the main story within a few seconds.

The dashboard therefore prioritises:

- Clear KPI definitions
- Simple visual hierarchy
- Relevant comparisons
- Consistent filters
- Limited visual clutter
- Trends and context rather than isolated numbers
- Drill-down opportunities where useful

The purpose of the dashboard is to help users **monitor, understand and act on data**, rather than forcing them to inspect raw tables.

---

## 📈 Planned Dashboard Structure

### 1. Executive Overview

A high-level view for management.

Possible KPIs:

- Total Revenue
- Total Quantity
- Profit Margin
- Revenue Trends
- Revenue by Product line
- Revenue by Retailer type
- Revenue by Order  Method
- Gross Profit

---

### 2. Retailer Performance

Designed for the Retailer Connections team.

Possible visualisations:

- Total Revenue per Retailer
- Total Revenue with Gross Profit
- Different Stores and Total Revenue
- UNits Sold by the Store
- Filters based on Region , COuntry and data

---

### 3. Market Expansion

Designed for the European Division.

Target markets:

- Czech Republic
- Norway
- Poland
- Portugal

Possible visualisations:

- Geographic comparison
- Filters based on Region , COuntry and data

### 3. Products 

Possible Visulaization
- Top 10 products by revenue

---

## 🗂️ Project Structure

Recommended repository structure:

```text
goexplore-analytics/
│
├── README.md
│
├── sql/
│   ├── GoExplore_Combined_Query.sql
│
├── data/
│   └── GoExplore_daily_sales.csv
│   └── GoExplore_methods.csv
│   └── GoExplore_products.csv
│   └── GoExplore_retailers.csv
│   └── README.md
│
├── Looker_Studio/
│   └── Overview_KPI.png
│   └── EU_Region_Growth.png
│   └── Products.png
│   └── Regions.png
│   └── Retailers.png
│
└── Google_Sheets/
    └──Avg_Unit_Selling_Price.png
    └──Total_Units_Sold_by_EU_non_EU.png
    └──Year_Based_Growth.png
```


## 🛠️ Tools

| Tool | Role |
|---|---|
| Google Sheets | Source data / preparation |
| Google BigQuery | Data warehouse and SQL analysis |
| Google Looker Studio | Dashboard and visualisation |








