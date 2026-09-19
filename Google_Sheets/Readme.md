# GoExplore — Google Sheets

## 📊 Overview

Google Sheets is used as the initial data preparation and exploration layer for the GoExplore analytics project.

The source dataset is first reviewed and prepared in Google Sheets before being loaded into Google BigQuery for SQL-based analysis and reporting.

---

## 🔄 Data Workflow

```text
Source Dataset
      ↓
Google Sheets
      ↓
Google BigQuery
      ↓
SQL Analysis
      ↓
Looker Studio
      ↓
Interactive Dashboard
