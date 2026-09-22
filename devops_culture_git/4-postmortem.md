# Post-Mortem Case Study: The Friday Night Incident

## Script

The team at **PixelCart**, a small online shop, is rolling out its new checkout page. Here is what happened, as later reconstructed.

- **Friday, 5:40 PM**: Karim wants to ship a fix the marketing team has been asking for before the weekend. There is no automated pipeline: deploying means logging into the production server over SSH, copying the files by hand, then editing the configuration file directly on the server.
- **Friday, 5:52 PM**: Karim changes a configuration value (the database URL) but leaves a typo in it. There is no test environment identical to production: he tested "more or less" on his own machine.
- **Friday, 6:05 PM**: Karim leaves for the weekend. Nobody is actively watching the site, and there is no automated alerting.
- **Friday, 8:30 PM**: A customer reports on social media that checkout is failing. The post spreads. Nobody on the team sees it until the next morning.
- **Saturday, 9:15 AM**: Inès, unofficially on call, discovers the complaints. She does not have access to the server and does not know what was deployed: there is no record of what changed, and no simple way to roll back.
- **Saturday, 11:40 AM**: After reaching Karim, identifying the typo, and fixing the file by hand, service is restored. The toll: around 15 hours of checkout downtime over a weekend, and a chunk of lost revenue.

## Analysis

### 1. Factual Timeline

Evolution of problem situation over time:

| Problem Status | Date & Time | Details |
|:---------------|:------------|:--------|
| Occurence | **Friday, 5:52 PM** | The checkout system went down at the exact moment the database URL was changed on the production server. |
| Detection | **Saturday, 9:15 AM** | Even though the issue was noticed by customers the night before, **PixelCart** was only aware of it in the next morning. |
| Resolution | **Saturday, 11:40 AM** | The problem was finally solved 2 hours and 25 minutes after it was detected. |

### 2. Systemic Causes

A concurrence of several causes lead to the problem, and to the long duration it took to be solved:

| Issue | Explanation | DORA Metric Impacted |
|:------|:------------|:---------------------|
| Lack of unit and integration tests. | Manual testing is unsufficient and does not guarantee everything works. | Change Failure Rate |
| Lack of automated deployment pipeline. | Manual deployment can lead to human errors even though the code is fine. | Deployment Rework Rate |
| Lack of automated reporting system. | Company not alerted when a service in production fails. | Failed Deployment Recovery Time |
| Lack of team communication. | Employees are not aware a deployment has occured and what was introduced. | Deployment Frequency |

### 3. Priority Actions

Several actions can be planned to adress these issues, and to highly decrease the chances of something similar happening again:

1. **Extensive Testing**: Writing an extensive set of unit and integration tests to cover functionalities and services, to identify easily what is broken.
2. **CI/CD Pipeline**: Replacing the manual procedure for deployment with an automatic pipeline, that runs all the tests and stops if any of them fails.
3. **Reporting System**: Setting an automatic alert on production services failure, to know as soon as possible when something goes wrong.
