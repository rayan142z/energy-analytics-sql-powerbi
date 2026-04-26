# ⚡ Energy Analytics: Cost Optimization & Risk Insights

## 📌 Overview
Energy prices fluctuate due to external factors such as weather conditions and the share of renewable energy in the grid.  
This project analyzes how temperature and green energy availability influence market prices and identifies conditions for cost-efficient energy purchasing.

---

## 🎯 Objectives
- Identify key drivers of energy price fluctuations  
- Analyze the impact of temperature and green energy on market costs  
- Classify market conditions into SAFE and RISK scenarios  
- Determine optimal conditions for minimizing energy costs  

---

## 📊 Data Sources
The analysis is based on multiple data sources:

- **Market price and energy production data** were obtained from the SMARD platform (German electricity market data)  
- **Weather data (temperature)** was collected via an external API using Python  

The datasets were combined and transformed into a structured format for analysis.

---

## 🛠️ Approach

### 1. Data Collection
- Retrieved weather data using a Python-based API script  
- Collected market and energy production data from SMARD  

### 2. Data Preparation
- Joined datasets (market, weather, energy source) using SQL  
- Cleaned and structured data for analysis  

### 3. Feature Engineering
- Built a rule-based decision model:
  - **SAFE** → favorable cost conditions  
  - **RISK** → high-cost conditions  

### 4. Analysis
- Compared costs across different conditions  
- Analyzed price volatility over time  
- Evaluated distribution of SAFE vs RISK scenarios  

---

## 🔍 Key Insights
- 🌱 High green energy levels (>69.5%) are associated with lower-than-average prices  
- ❄️ Cold temperatures combined with low green energy (<60%) create high-risk conditions  
- ⚠️ Risk conditions occur approximately **57%** of the time  
- ✅ Safe conditions (~42%) provide opportunities for cost optimization  

---

## 📈 Impact Analysis
If decisions were made based on the model:

### SAFE conditions:
- Average cost: **54.11**  
- Minimum cost: **1.78**  
- Maximum cost: **99.74**  

### RISK conditions:
- Average cost: **96.63**  
- Minimum cost: **53.18**  
- Maximum cost: **395.34**  

👉 This demonstrates that operating under SAFE conditions can significantly reduce energy costs.

---

## 📊 Dashboard
An interactive Power BI dashboard was developed to visualize:
- Average energy cost trends across all 12 months of 2024
- Distribution of SAFE vs RISK conditions (57.38% risk — 42.62% safe) across 366 records
- Average cost breakdown by condition, showing risk consistently drives higher costs
- Impact of temperature category (cold, hot, normal) on average energy cost

📸 Preview:

<img width="1276" height="715" alt="dashboard preview" src="https://github.com/user-attachments/assets/c9e74c5f-dee5-42ec-a1f6-e893dd3d3f25" />

---

## 🧰 Tools Used
- Python (weather API data extraction)  
- SQL (data transformation & analysis)  
- Power BI (data visualization & dashboarding)  


