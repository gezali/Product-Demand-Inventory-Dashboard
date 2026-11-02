<div align="center">

# 📊 Product Demand & Inventory Dashboard

### Turning raw inventory data into decisions that cut stock-outs and losses

![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![SQL Server](https://img.shields.io/badge/SQL_Server-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)
![Excel](https://img.shields.io/badge/Excel-217346?style=for-the-badge&logo=microsoftexcel&logoColor=white)
![DAX](https://img.shields.io/badge/DAX-8A2BE2?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)

</div>

---

## 🎯 Project Overview

Running out of a fast-selling product loses sales, while overstocking a slow one ties up money. This project answers one question:

> **Is product availability keeping up with customer demand, and what is the financial impact when it isn't?**

I cleaned and joined inventory data in **SQL Server**, then built a two-page **Power BI** dashboard that tracks demand, availability, supply shortage, profit and loss, with interactive filters by product and date.

---

## 🖼️ Dashboard Preview

### Page 1: Demand & Supply Analysis
![Dashboard Page 1](Screenshot%202026-11-02%20191652.png)

### Page 2: Profit & Loss Analysis
![Dashboard Page 2](Screenshot%202026-11-02%20191652.png)

---

## ✨ Key Metrics

| Page | KPI | What it tells you |
|------|-----|-------------------|
| **Demand & Supply** | Average Demand per Day | How much customers want, on a typical day |
| | Average Availability per Day | How much stock is actually on hand |
| | Total Supply Shortage | How far supply falls short of demand |
| **Profitability** | Total Profit | Revenue earned from fulfilled demand |
| | Total Loss | Value lost from unmet demand |
| | Average Daily Loss | Typical loss per day, to size the problem |

**Interactive filters:** Product Name and Order Date, applied across both pages.

---

## 🗂️ Dataset

| File | Rows | Description |
|------|------|-------------|
| `Prod_Env_Inventory_Dataset.csv` | 1,043 | Production inventory records: Order Date, Product ID, Availability, Demand |
| `Test_Environment_Inventory_Dataset.csv` | 99 | Test environment records with the same structure |
| `Products.csv` | 20 | Product master list: Product ID, Product Name, Unit Price ($) |

The catalog covers 20 consumer electronics and home products, such as Wireless Mouse, 4K Smart TV, Smartwatch, Air Purifier and VR Headset.

---

## 🧹 Data Cleaning & Preparation (SQL)

All preparation was done in SQL Server (see [`sql/Product_report.sql`](sql/Product_report.sql)):

1. **Explored** the data with `SELECT DISTINCT` checks on dates, products, availability and demand.
2. **Checked data quality** by looking for NULL or empty order dates.
3. **Fixed invalid Product IDs.** The production data contained IDs `21` and `22`, which don't exist in the product master. They were corrected to `7` and `11` using `UPDATE` statements.
4. **Joined** the inventory table with the product master using a `LEFT JOIN` on `Product_ID` to bring in product names and unit prices.
5. **Created a clean reporting table** with `SELECT ... INTO` for Power BI to read.

```sql
-- Example: build the clean reporting table
SELECT a.Product_ID, a.Order_Date_DD_MM_YYYY, a.Availability, a.Demand,
       b.Product_Name, b.Unit_Price
INTO new_table
FROM [dbo].[Prod+Env+Inventory+Dataset] AS a
LEFT JOIN [dbo].[Products] AS b
       ON a.Product_ID = b.Product_ID;
```

---

## 🛠️ Tech Stack

- **SQL Server**: data cleaning, validation, joins
- **Power BI Desktop**: data model, visuals, interactivity
- **DAX**: custom measures (average demand, availability, shortage, profit, loss)
- **Excel / CSV**: source data

---

## 🔄 Workflow

```
Raw CSV / Excel  →  SQL Server (clean + join)  →  Power BI (model + DAX)  →  Interactive Dashboard
```

---

## 📁 Repository Structure

```
product-demand-inventory-dashboard/
├── README.md
├── LICENSE
├── dashboard/
│   └── Product_report_1.pbix
├── data/
│   ├── Prod_Env_Inventory_Dataset.csv
│   ├── Test_Environment_Inventory_Dataset.csv
│   └── Products.csv
├── sql/
│   └── Product_report.sql
└── screenshots/
    ├── dashboard-page-1.png
    └── dashboard-page-2.png
```

---

## 🚀 How to Use

1. **Clone or download** this repository.
2. Open `dashboard/Product_report_1.pbix` in [Power BI Desktop](https://powerbi.microsoft.com/desktop/) (free).
3. To rebuild the data yourself, import the CSVs into SQL Server and run `sql/Product_report.sql`.
4. Use the **Product Name** and **Order Date** filters to explore.

---

## 💡 What I Learned

- Validating data before analysis. Invalid product IDs would have silently skewed the totals.
- Combining fact data with a product master to turn demand units into money.
- Designing a clean, dark-themed KPI dashboard that answers a business question at a glance.

---

## 🔮 Future Improvements

- Add a demand-vs-availability trend line over time
- Add a product-wise ranking of the highest shortage and loss
- Add reorder-point suggestions for at-risk products
- Publish to Power BI Service for live sharing

---

## 👤 Author

**Zakariya Gezali**
Data Analyst | SQL • Python • Power BI

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/zakariya-gezali-389393235)
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/gezali)
[![HackerRank](https://img.shields.io/badge/HackerRank-00EA64?style=for-the-badge&logo=hackerrank&logoColor=black)](https://www.hackerrank.com/profile/gezalizakariya94)
[![Email](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:gezalizakariya94@gmail.com)

---

<div align="center">

⭐ If you found this project useful, consider giving it a star!

</div>
