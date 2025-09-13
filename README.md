# 📘 Empirical Analysis

### The Impact of the National School Feeding Program on Strengthening Family Farming in Brazil

![GitHub Stars](https://img.shields.io/badge/Version-1.0-blue) ![License](https://img.shields.io/badge/license-MIT-green.svg) ![R](https://img.shields.io/badge/R-%3E=4.0-blue) ![Status](https://img.shields.io/badge/status-in%20progress-yellow) ![Contributions](https://img.shields.io/badge/contributions-welcome-brightgreen)

This repository contains the **empirical component** of the study *The Impact of the National School Feeding Program on Strengthening Family Farming in Brazil*, derived from the doctoral dissertation of \[Author Name].

It includes **R scripts**, **documentation of processed datasets**, and selected **intermediate and final analysis outputs**.

The main objective of this repository is to provide the code and data that support the empirical analysis in the study. All statistical modeling was conducted in **R**, with a focus on panel data analysis at the municipal level.

---

## 📂 Repository Structure

```bash
├── data/          # Raw and processed data (where sharing is permitted)
├── scripts/       # R scripts organized by analysis stage
├── results/       # Results: tables, charts, and statistical outputs
├── README.md      # This file
```

---

## 📊 Data

The datasets used in this analysis come from various official public sources and are structured as a **municipal-level panel**:

* **IBGE**

  * Rural and urban classification
  * Annual population estimates
  * Municipal Agricultural Survey (PAM)
  * Municipal Livestock Survey (PPM)

* **FNDE – National Fund for Educational Development**

  * Expenditures of the **National School Feeding Program (PNAE)** and the proportion allocated to family farming

* **MDS – Ministry of Social Development**

  * Implementation of the **Food Acquisition Program (PAA)**

* **INCRA – National Institute for Colonization and Agrarian Reform**

  * Institutional and land tenure information

* **INMET – National Institute of Meteorology**

  * Climate normals: average temperature and annual precipitation

* **ANATEL**

  * Broadband density per municipality, used as a proxy for infrastructure

**Timeframe:**

* **2011–2019** → associative analyses
* **2011–2017** → impact evaluation models

⚠️ **Note**: Confidential or restricted-access data are **not included**. When necessary, simulated or aggregated data have been provided for replication purposes only.

---

## ⚙️ Requirements

* **R (>= 4.0)**
* Key packages:

```r
install.packages(c("tidyverse", "data.table", "ggplot2", "fixest", "stargazer"))
```

---

## 🚀 How to Run

1. Clone this repository:

   ```bash
   git clone https://github.com/meningue91/Teste.git
   ```
2. Open **R** or **RStudio** in the root directory.
3. Run the scripts in the `scripts/` folder following the numerical order:

   * `01_data_cleaning.R`
   * `02_analysis.R`
   * `03_results.R`
4. The results (tables and charts) will be automatically saved in `results/`.

---

## 📈 Expected Outputs

* Descriptive statistics of key variables
* Continuous difference-in-differences regression models
* Charts and tables supporting the final study

---

## 📚 Study Reference

This repository supports the study:

**"The Impact of the National School Feeding Program on Strengthening Family Farming in Brazil"**
Authors: João P.M. Machado and Alexandre Nicolella
Year: 2005
📄 DOI / Preprint: \[not available]

---

## 🤝 Contributions

Contributions are welcome!
Please feel free to open **issues** or submit **pull requests**.

---

## 📄 License and Usage

All materials in this repository (scripts, processed datasets, results, and documentation) are for **exclusive use by the authors**.

* ❌ Copying, redistributing, modifying, or using the content for commercial or academic purposes is **not allowed** without prior written permission from the authors.
* ✅ Access is provided solely for reading and following the research associated with the study *The Impact of the National School Feeding Program on Strengthening Family Farming in Brazil*.
* ⚠️ Any unauthorized use, in whole or in part, may constitute copyright infringement under **Brazilian Law No. 9.610/1998 (Copyright Law)** and applicable international legislation.

All rights reserved by the authors.

