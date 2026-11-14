# Business Insights & Recommendations

## 1. Executive Summary

This project evaluates the impact of moving the first progression gate from level 30 (control) to level 40 (treatment) in the mobile game Cookie Cats.

The experiment included 90,189 players.

The results indicate that moving the gate to level 40 did not improve player retention.

Day 7 retention decreased significantly, while the Day 1 difference was not statistically significant.

## 2. Key Findings

| Metric | Control (gate_30) | Treatment (gate_40) | Difference |
|---|---:|---:|---:|
| Total Players | 44,700 | 45,489 | +789 |
| Day 1 Retention | 44.82% | 44.23% | -0.591 pp |
| Day 7 Retention | 19.02% | 18.20% | -0.820 pp |
| Average Game Rounds | 52.46 | 51.30 | -1.16 |

### Day 1 Retention

- P-value: 0.074410
- 95% CI: [-1.239, +0.058] pp
- Result: Not statistically significant at α = 0.05.

The observed decrease in Day 1 retention does not provide sufficient evidence of a treatment effect at the selected significance level.

### Day 7 Retention

- P-value: 0.001554
- 95% CI: [-1.328, -0.312] pp
- Result: Statistically significant at α = 0.05.

The treatment group showed a statistically significant decrease in Day 7 retention.

The observed difference was approximately -0.82 percentage points, equivalent to a relative decrease of about 4.3% compared with the control group.

## 3. Experiment Validation

A Sample Ratio Mismatch (SRM) test was conducted under an assumed 50/50 allocation.

Results:

- Chi-square statistic: 6.9024
- SRM p-value: 0.008608
- SRM threshold used: 0.001

The test did not detect a mismatch at the 0.001 threshold. However, the p-value is below 0.05, suggesting potential allocation imbalance under the assumed 50/50 design.

The expected allocation ratio and randomization mechanism should be verified before treating the experiment results as fully reliable.

## 4. Business Recommendations

**Recommendation 1 — Do not roll out gate_40 based on the current evidence.**

The treatment did not demonstrate improved retention and was associated with lower Day 7 retention.

**Recommendation 2 — Investigate experiment allocation.**

Confirm the intended allocation ratio, user assignment logic, and possible causes of imbalance.

**Recommendation 3 — Retain gate_30 provisionally.**

Keeping the existing gate placement is the more conservative decision while experiment validity is being reviewed.

**Recommendation 4 — Consider a follow-up experiment.**

After validating the experiment setup, test alternative gate placements or progression designs to identify opportunities for improving player retention.

## 5. Limitations

- The expected experiment allocation ratio has not been independently confirmed.
- Potential SRM requires further investigation.
- Average game rounds were compared descriptively; no statistical significance test was performed for this metric.
- The analysis focuses primarily on D1 and D7 retention.
- Monetization and longer-term retention metrics were not evaluated.

## 6. Final Conclusion

The observed results favor the existing gate_30 configuration for Day 7 retention.

However, because experiment allocation validity has not been fully established, the findings should be treated as provisional rather than definitive causal evidence.

A final product decision should follow verification of the experiment design and assignment process.
