# DORA

> 1. Match each DORA metric to its definition.

- **Deployment Frequency**: How often an organization successfully releases code to production (such as multiple times per day, weekly, or monthly).
- **Lead Time for Changes**: The amount of time it takes for a code commit to reach live production and run successfully.
- **Failed Deployment Recovery Time**: Previously known as Mean Time to Recovery (MTTR), this measures how long it takes to restore service after a failed deployment causes an incident.
- **Change Failure Rate**: The percentage of production deployments that result in a failure and require immediate remediation or hotfixes.
- **Deployment Rework Rate**: The proportion of deployment activity that is reactive and unplanned, triggered directly to fix recent production issues.

> 2. A team deploys once a quarter. Which metric is poor?

The **Deployment Frequency** metric is poor.

> 3. You shorten the time between merging a PR and shipping it to production. Which metric improves?

The **Lead Time for Changes** metric improves by decreasing.

> 4. 1 deployment out of 4 causes an incident. Which metric is this, and is a high value good or bad?

It's the **Change Failure Rate** metric, and a high value is obviously problematic.

> 5. What does the acronym CALMS stand for?

Culture, Automation, Lean, Measurement and Sharing.

> 6. Do the "best" teams deploy less often but in bigger batches? Justify your answer.

No, they should deploy often with small changes, to diminish the risks of breaking something without noticing, by introducing a bug for example.

> 7. Which practice improves MTTR the most?

Extensive testing, automated in the deployment pipeline should reduce the **Change Failure Rate**, but to reduce the **Failed Deployment Recovery Time**... Proper and detailled logging, to quickly identify what breaks? With proper versionning, to quickly restore to the last working version in case finding what breaks takes too long?

> 8. Among the 4 DORA metrics, which measure throughput and which measure stability?

**Deployment Frequency** and **Lead Time for Changes** metrics measure throughput, while **Failed Deployment Recovery Time**, **Change Failure Rate** and **Deployment Rework Rate** metrics measure stability.

> 9. Why do we run blameless post-mortems?

To learn collectively from mistakes and avoid them happening again, by searching for **what** went wrong and **how**, instead of **who** is to blame.
