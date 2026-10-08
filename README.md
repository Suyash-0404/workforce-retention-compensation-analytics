# Workforce Retention & Compensation Analytics

An end-to-end HR analytics project designed to analyze employee attrition, compensation, tenure, job satisfaction, and workforce characteristics using an AWS-based data pipeline and an interactive Looker Studio dashboard.

The project demonstrates the complete workflow from raw employee data ingestion and transformation to SQL-based analytics, data mart integration, and business intelligence reporting.

---

## 🔗 Live Dashboard

**Looker Studio Dashboard:**  
[👉 VIEW INTERACTIVE DASHBOARD](https://datastudio.google.com/reporting/eacec7cf-d5d1-4f0a-9dae-c4ecf70afc59)

> The dashboard contains two interactive pages with filters for department, job role, overtime, gender, and other workforce segments.

---

### Data Flow

**CSV Dataset → Amazon S3 → AWS Glue DataBrew → Amazon Athena → OWOX Data Mart → Looker Studio → Interactive Dashboard**

---

## 🛠️ Technology Stack

| Layer | Technology |
|---|---|
| Data Storage | Amazon S3 |
| Data Preparation | AWS Glue DataBrew |
| Data Querying | Amazon Athena |
| Data Integration | OWOX Data Marts |
| Business Intelligence | Looker Studio |
| Query Language | SQL |
| Version Control | Git / GitHub |

---

## 📊 Dataset

The project uses an employee attrition dataset containing:

- **10,000 employee records**
- **26 original attributes**
- Employee demographics
- Department and job role information
- Compensation
- Tenure and promotion history
- Job satisfaction
- Performance
- Work-life balance
- Overtime
- Workload indicators
- Employee attrition


# 🔄 Data Pipeline

## 1. CSV Dataset

The raw employee attrition dataset serves as the initial source.

The dataset is preserved separately from the transformed analytical data to maintain traceability between source and reporting layers.

---

## 2. Amazon S3

The raw dataset is stored in an Amazon S3 bucket.

S3 acts as the centralized cloud storage layer for the raw and processed data used throughout the pipeline.

---

## 3. AWS Glue DataBrew

AWS Glue DataBrew was used for visual data preparation, cleaning, and feature engineering.

### Transformations performed

The following analytical fields were created:

- `Age_Band`
- `Tenure_Band`
- `Promotion_Gap_Band`
- `Satisfaction_Band`
- `Work_Life_Balance_Band`
- `Performance_Band`
- `Salary_Band`
- `Tenure_Data_Quality_Flag`

These fields were created to make the dataset easier to analyze and segment in the BI layer.

### Data Quality Handling

The source dataset contained **2,284 records** where:

`Years_In_Current_Role > Years_at_Company`

Instead of silently modifying these source values, the records were preserved and identified using:

`Tenure_Data_Quality_Flag`

This keeps the original data intact while making potential data-quality issues visible for downstream analysis.

---

## 4. Amazon Athena

Amazon Athena was used to query the curated CSV data directly from Amazon S3 using SQL.

A structured Athena table was created over the cleaned dataset, followed by a dashboard-oriented SQL view:

`vw_dashboard_data`

The view provides a consistent analytical layer for downstream reporting.

---

## 5. OWOX Data Mart

OWOX Data Marts was used to connect the Athena analytical layer with the BI environment.

The configured data mart uses the Athena view:

`AwsDataCatalog.hr_employee.vw_dashboard_data`

This provides the reporting layer consumed by Looker Studio.

---

## 6. Looker Studio

Looker Studio was used to build the final interactive dashboard.

The dashboard contains **two pages**:

### Page 1 — Executive Workforce Overview

Focuses on high-level workforce and retention metrics:

- Total Employees
- Employees Left
- Attrition Rate
- Average Monthly Income
- Average Tenure
- Attrition by Department
- Attrition by Salary Band
- Attrition by Tenure Band
- Employee Attrition Composition

### Page 2 — Attrition & Workforce Drivers

Focuses on deeper workforce relationships and segmentation:

- Age vs Monthly Income
- Attrition Rate by Job Satisfaction
- Employees Lost by Job Role
- Department-level Attrition and Employee Loss
- Employees Lost by Department and Job Role

Interactive dropdown filters allow users to explore the dashboard by relevant workforce dimensions.

---

# 🎯 Business Questions

The dashboard was designed around practical HR and workforce analytics questions:

1. What is the overall employee attrition rate?
2. Which departments experience higher employee attrition?
3. How does attrition vary across salary and tenure bands?
4. Is job satisfaction associated with employee attrition?
5. Which job roles contribute the largest number of employee exits?
6. Where is employee loss concentrated across departments and roles?
7. Is a longer promotion gap associated with employee attrition?
8. How are age and compensation distributed across employees?

> The analysis identifies associations and patterns in the available data. It does not establish causal relationships.

---

# 📈 Key Metrics

The dataset contains:

| Metric | Value |
|---|---:|
| Total Employees | 10,000 |
| Employees Left | 1,997 |
| Overall Attrition Rate | 19.97% |
| Average Monthly Income | ~₹11.45K |
| Records Flagged for Tenure Review | 2,284 |

These figures are calculated from the processed analytical dataset.

---

# 🔍 Key Analytical Areas

### Attrition

The dashboard analyzes employee exits across departments, tenure, salary, job roles, satisfaction, and other workforce dimensions.

### Compensation

Salary bands and monthly income are used to examine the relationship between compensation levels and employee retention patterns.

### Employee Tenure

Tenure bands provide a lifecycle-based view of employee attrition.

### Job Satisfaction

Job satisfaction levels are compared with attrition rates to identify potential retention patterns.

### Career Progression

Promotion-gap analysis is used to investigate whether extended periods without promotion are associated with higher employee attrition.

---

# 🧹 Data Quality Approach

A key design decision in this project was to **preserve potentially inconsistent source records rather than overwrite or 'correct' them!**.

Records where:

`Years_In_Current_Role > Years_at_Company`

were flagged using `Tenure_Data_Quality_Flag`.

This approach provides:

- Source-data preservation
- Transparent data-quality monitoring
- Traceability
- Safer downstream analysis

It also prevents assumptions from being introduced into the original dataset without business validation.

---

# 📁 Project Files

The repository contains the main project assets:

- Raw employee attrition dataset
- Cleaned and transformed dataset
- Athena SQL scripts
- Dashboard PDF
- Architecture diagram
- AWS / OWOX setup screenshots
- Project documentation

---

# 🚀 Skills Demonstrated

### Cloud & Data Engineering
- Amazon S3
- AWS Glue DataBrew
- Amazon Athena
- Cloud-based data pipelines

### Data Analytics
- SQL
- Data Cleaning
- Data Quality Validation
- Feature Engineering
- Exploratory Data Analysis
- Workforce Analytics

### Business Intelligence
- Looker Studio
- OWOX Data Marts
- Interactive Dashboard Design
- KPI Development
- Data Visualization
- Business-oriented storytelling

### Version Control
- Git
- GitHub

---

# 💡 Business Value

This project demonstrates how raw employee data can be transformed into a structured analytics pipeline and ultimately into an interactive decision-support dashboard.

The resulting analysis can help HR and business stakeholders investigate:

- Where employee attrition is concentrated
- Which workforce segments require further investigation
- Compensation and tenure patterns
- Employee satisfaction patterns
- Potential career-progression related retention risks

The dashboard is intended as an analytical decision-support tool rather than a predictive attrition model.

---

# 📌 Project Highlights

- Built an end-to-end **AWS → BI analytics pipeline**
- Processed **10,000 employee records**
- Created **8 analytical/quality features**
- Implemented SQL-based analytical modeling in Athena
- Integrated Athena with OWOX Data Marts
- Developed a **2-page interactive Looker Studio dashboard**
- Preserved and flagged **2,284 source-data quality issues**
- Analyzed **1,997 employee exits**
- Calculated an overall **19.97% attrition rate**

---


## 📜 Disclaimer

This project is intended for educational, portfolio, and analytical demonstration purposes.

The findings represent patterns observed in the available dataset and should not be interpreted as evidence of causal relationships.

---

## 👤 Author

**Suyash**
