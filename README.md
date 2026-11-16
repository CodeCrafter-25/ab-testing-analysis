# A/B Testing Analysis — Cookie Cats

## Project Overview

This project analyzes the results of an A/B experiment conducted in the mobile game Cookie Cats.

The experiment tested whether moving the first progression gate from level 30 to level 40 would affect player retention and engagement.

The analysis uses SQL (Google BigQuery) and Python to evaluate retention rates and determine whether observed differences are statistically significant.

## Reproducing the SQL Analysis

Load `cookie_cats.csv` into your BigQuery project as `ab_testing.cookie_cats_raw`. Replace the project ID in both SQL scripts with your own, then run `sql/ab_testing_analysis.sql` followed by `sql/tableau_retention_metrics.sql`.

## Tableau Dashboard

The interactive Tableau dashboard presents the results of the Cookie Cats A/B experiment, including player retention, statistical significance, and confidence intervals.

**Key Dashboard Features:**
- Total experiment participants: 90,189
- Day 1 retention difference: -0.591 percentage points
- Day 7 retention difference: -0.820 percentage points
- Statistical significance analysis
- 95% confidence interval visualization
- Experiment validation notes
### Interactive Dashboard

Explore the published Cookie Cats A/B Testing dashboard on Tableau Public:

[**View Interactive A/B Testing Dashboard**](https://public.tableau.com/views/ABTesting_17943368840910/ABTestingAnalysis)

The dashboard includes retention comparisons, statistical significance results, 95% confidence intervals, and experiment validation notes.

### Dashboard Preview

![Cookie Cats A/B Testing Dashboard](visualizations/ab_testing_dashboard_v3.png)

**Main Finding:** Moving the progression gate from level 30 to level 40 was associated with a statistically significant decrease in Day 7 retention.

The results remain provisional pending validation of the experiment allocation.

## Business Problem

The company wants to understand whether changing the gate placement improves player engagement and retention.

Two experimental groups were compared:

- **Control (gate_30):** The first gate appears at level 30.
- **Treatment (gate_40):** The first gate appears at level 40.

The main objective is to determine which version performs better in terms of Day 1 and Day 7 retention.

## Dataset

**Source:** [Cookie Cats A/B Testing — Kaggle](https://www.kaggle.com/datasets/yufengsui/mobile-games-ab-testing)

**Total Users:** 90,189

**Dataset Columns:**
- `userid` — Unique player identifier
- `version` — Experiment group
- `sum_gamerounds` — Number of game rounds played
- `retention_1` — Day 1 retention indicator
- `retention_7` — Day 7 retention indicator

## Tools & Technologies

- Google BigQuery — SQL analysis and data validation
- Python — Statistical analysis
- Pandas and NumPy — Data analysis libraries
- Statsmodels — Two-proportion Z-tests
- Google Colab — Python development environment
- Tableau Public — Retention analysis and dashboard development

## Data Quality Checks

The dataset contains 90,189 records representing 90,189 unique users.

The following checks were completed:

- Missing values: 0
- Duplicate User IDs: 0
- Invalid experiment groups: 0
- Negative game rounds: 0

No issues were detected in the completed validation checks.

## Retention Analysis

| Metric | Control (gate_30) | Treatment (gate_40) |
|---|---:|---:|
| Total Users | 44,700 | 45,489 |
| Day 1 Retention | 44.82% | 44.23% |
| Day 7 Retention | 19.02% | 18.20% |
| Average Game Rounds | 52.46 | 51.30 |

## Statistical Analysis

A two-sided two-proportion Z-test was performed to compare retention rates between the control and treatment groups.

**Significance Level:** α = 0.05

| Metric | Z-statistic | P-value | Result |
|---|---:|---:|---|
| Day 1 Retention | 1.7841 | 0.074410 | Not Significant |
| Day 7 Retention | 3.1644 | 0.001554 | Significant |

## Initial Findings

**Day 1 Retention:**

The treatment group showed a decrease of approximately 0.59 percentage points compared with the control group.

However, the difference was not statistically significant at the 5% significance level.

**Day 7 Retention:**

The treatment group showed a decrease of approximately 0.82 percentage points.

The difference was statistically significant (p = 0.001554), suggesting that moving the gate to level 40 negatively affected Day 7 retention.

### Sample Ratio Mismatch (SRM) Validation

A Chi-square goodness-of-fit test was conducted to evaluate whether the observed experiment allocation differed from the assumed 50/50 split.

**Results:**
- Control group: 44,700 users
- Treatment group: 45,489 users
- Chi-square statistic: 6.9024
- P-value: 0.008608
- SRM significance threshold: 0.001

**Interpretation:**

No statistically significant sample ratio mismatch was detected at the predefined threshold of 0.001.

However, the p-value is below 0.05, indicating some evidence of an allocation imbalance under the assumed 50/50 design.

Further validation of the experiment assignment mechanism would be recommended before making a final rollout decision.

### Tableau Retention Analysis — Initial Visualization

**Completed:**
- Created `tableau_retention_metrics` in Google BigQuery.
- Prepared retention data for Tableau visualization.
- Exported the aggregated dataset to CSV.
- Connected the dataset to Tableau Public.
- Created the first worksheet: Retention Comparison.
- Configured percentage formatting and experiment group colors.
- Validated the results against SQL calculations.

**Key Findings:**
- Control D1 Retention: 44.82%
- Treatment D1 Retention: 44.23%
- Control D7 Retention: 19.02%
- Treatment D7 Retention: 18.20%

## Preliminary Business Recommendation

The results suggest that retaining the gate at level 30 is preferable for Day 7 player retention.

Day 7 retention was 0.82 percentage points lower in the gate_40 group than in the gate_30 group (p = 0.001554).

The observed difference was statistically significant. However, the experiment allocation requires further validation before making a definitive causal conclusion.

The 95% confidence interval for the difference was [-1.328, -0.312] percentage points.

However, the experiment allocation showed some evidence of imbalance under the assumed 50/50 design (SRM p = 0.008608).

Therefore, the recommendation is provisional until the experiment design and allocation mechanism have been further validated.

### Tableau Dashboard — KPI Cards and Retention Comparison

An interactive A/B testing dashboard is being developed in Tableau Public to communicate experiment performance and support product decisions.

**Completed:**
- Created a KPI card displaying the total number of experiment participants.
- Developed calculated fields for Day 1 and Day 7 retention differences.
- Calculated retention differences as Treatment minus Control.
- Displayed differences in percentage points (pp).
- Integrated three KPI cards and the Retention Comparison chart into one dashboard.
- Improved typography, alignment, chart labels, and color formatting.
- Validated KPI values against SQL and Python results.

**Dashboard KPIs:**

| KPI | Value |
|---|---:|
| Total Players | 90,189 |
| D1 Retention Difference | -0.591 pp |
| D7 Retention Difference | -0.820 pp |

**Interpretation:**

The treatment group (gate_40) demonstrated lower retention rates than the control group (gate_30) on both Day 1 and Day 7.

The Day 1 difference was not statistically significant (p = 0.074410), whereas the Day 7 decrease was statistically significant (p = 0.001554).

The Tableau dashboard includes retention KPI cards, statistical significance indicators, 95% confidence interval visualizations, and experiment validation notes.

The dashboard provides a comprehensive overview of the A/B testing results and supports data-driven product decisions.

**Dashboard Preview:**

![A/B Testing Dashboard — Version 1](visualizations/ab_testing_dashboard_v1.png)

### Tableau Dashboard — Statistical Significance

Extended the A/B testing dashboard with statistical significance results and confidence intervals.

**Completed:**
- Added Day 1 and Day 7 statistical significance indicators.
- Displayed p-values from two-proportion Z-tests.
- Included 95% confidence intervals calculated using the Newcombe method.
- Added an experiment validation note covering Sample Ratio Mismatch (SRM).

**Key Findings:**
- D1 Retention: p = 0.074410 — not statistically significant.
- D7 Retention: p = 0.001554 — statistically significant decrease.
- D7 95% CI: [-1.328, -0.312] percentage points.
- Experiment allocation requires further validation before a final rollout decision.

**Updated Dashboard Preview:**

![A/B Testing Dashboard — Version 2](visualizations/ab_testing_dashboard_v2.png)

### Tableau Dashboard — Confidence Interval Visualization

Extended the A/B testing dashboard with a visual comparison of 95% confidence intervals for Day 1 and Day 7 retention.

**Completed:**
- Prepared a confidence interval dataset using Python statistical results.
- Created horizontal Gantt bars to represent confidence interval ranges.
- Added point estimates for retention differences between treatment and control.
- Added a zero-reference line to distinguish statistically significant and non-significant results.
- Integrated the confidence interval visualization into the main Tableau dashboard.

**Key Findings:**
- D1 Retention: -0.591 pp, 95% CI [-1.239, +0.058] pp. The interval includes zero.
- D7 Retention: -0.820 pp, 95% CI [-1.328, -0.312] pp. The interval excludes zero.

**Interpretation:**

The treatment group (gate_40) experienced a statistically significant decrease in Day 7 retention compared with the control group (gate_30).

The Day 1 retention difference was not statistically significant.

These findings should be interpreted with caution until the experiment allocation and potential Sample Ratio Mismatch have been validated.

**Confidence Interval Visualization:**

![Confidence Intervals](visualizations/confidence_intervals.png)

**Updated Dashboard:**

![A/B Testing Dashboard v3](visualizations/ab_testing_dashboard_v3.png)

## Business Insights & Recommendations

The experiment results suggest that moving the progression gate from level 30 to level 40 negatively affected Day 7 player retention.

The recommendation is to avoid rolling out gate_40 based on the current evidence and retain gate_30 provisionally while experiment allocation validity is reviewed.

A potential Sample Ratio Mismatch under the assumed 50/50 allocation remains an important limitation.

For detailed findings, limitations, and product recommendations, see [Business Insights & Recommendations](business_insights.md).

## Reproducing the Analysis

To reproduce the SQL analysis:
1. Download the Cookie Cats dataset from Kaggle.
2. Upload the dataset to Google BigQuery.
3. Create a dataset named `ab_testing`.
4. Import the data into a table named `cookie_cats_raw`.
5. Replace the Google Cloud project ID in the SQL scripts with your own.
6. Run `sql/ab_testing_analysis.sql`.
7. Run `sql/tableau_retention_metrics.sql`.

For statistical analysis, open `notebooks/ab_testing_analysis.ipynb` in Google Colab and execute the cells.

Required Python libraries:
- pandas
- numpy
- scipy
- statsmodels

The Tableau dashboard can be recreated using the aggregated retention data and confidence interval CSV files.

## Next Steps
- [x] Prepare and validate the dataset using SQL.
- [x] Calculate Day 1 and Day 7 retention rates.
- [x] Perform statistical significance testing using Python.
- [x] Calculate 95% confidence intervals.
- [x] Perform Sample Ratio Mismatch (SRM) validation.
- [x] Create the Retention Comparison visualization.
- [x] Develop the three main Tableau KPI cards.
- [x] Add statistical significance indicators to Tableau.
- [x] Visualize 95% confidence intervals.
- [x] Include experiment validation limitations and business recommendations.
- [x] Publish the final Tableau Dashboard.
- [x] Complete the final GitHub documentation and portfolio review.
