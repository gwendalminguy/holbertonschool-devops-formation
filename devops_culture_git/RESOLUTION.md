# Resolution

Branches `feature/scale-up` and `feature/dark-mode` are both created from `main`, then changed concurrently. When attempting to merge `feature/dark-mode` into `feature/scale-up` a conflict happens on **line 3**, because the same line was changed differently on both branches compared to their common ancestor (`main`). The other changes are fine, because they only happen on one branch, so **Git** can merge them automatically without issue.

| Line | Common Ancestor `main` | Branch `feature/scale-up` | Branch `feature/dark-mode` | Modification | Status |
|:----:|:--------------|:--------------------------|:---------------------------|:-------------|:-------|
| 1     | app: devops | app: devops | app: devops | Unmodified | - |
| 2     | environment: production | environment: production | environment: production | Unmodified | - |
| **3** | version: 1.0.0 | **version: 1.1.0** *(change)* | **version: 2.0.0** *(change)* | On `feature/scale-up` & `feature/dark-mode` | **Conflict** |
| 4     | description: main service | description: main service | description: main service | Unmodified | - |
| **5** | replicas: 2 | **replicas: 4** *(change)* | replicas: 2 | On `feature/scale-up` | No Conflict |
| 6     | max_connections: 100 | max_connections: 100 | max_connections: 100 | Unmodified | - |
| **7** | feature_dark_mode: false | feature_dark_mode: false | **feature_dark_mode: true** *(change)* | On `feature/dark-mode` | No Conflict |
| 8     | log_level: info | log_level: info | log_level: info | Unmodified | - |
