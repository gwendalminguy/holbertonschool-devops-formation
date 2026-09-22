#!/usr/bin/env bash

# Generate a Git repository with a merge conflict for a single line.
# Usage: ./setup-conflit.sh [<name>]

set -e

DIR="${1:-conflit-example}"
rm -rf "$DIR"
mkdir "$DIR"
cd "$DIR"

git init -q
git config user.name  "DevOps Holberton"
git config user.email "devops@holberton.com"

# 1) Shared base on main
cat > config.yml <<'YAML'
app: devops
environment: production
version: 1.0.0
description: main service
replicas: 2
max_connections: 100
feature_dark_mode: false
log_level: info
YAML
git add config.yml
git commit -qm "chore: initial configuration"
git branch -M main

# 2) Branch A: scaling up (version 1.1.0 + replicas 4)
git switch -qc feature/scale-up
cat > config.yml <<'YAML'
app: devops
environment: production
version: 1.1.0
description: main service
replicas: 4
max_connections: 100
feature_dark_mode: false
log_level: info
YAML
git commit -qam "feat: switch to 4 replicas"

# 3) Branch B: dark mode (version 2.0.0 + flag true)
git switch -q main
git switch -qc feature/dark-mode
cat > config.yml <<'YAML'
app: devops
environment: production
version: 2.0.0
description: main service
replicas: 2
max_connections: 100
feature_dark_mode: true
log_level: info
YAML
git commit -qam "feat: activate dark mode"

# 4) Back to branch A: ready to merge branch B
git switch -q feature/scale-up

echo
echo "Repository '$DIR' ready."
echo "Current branch: feature/scale-up."
echo "Please run: git merge feature/dark-mode"
echo "Then, solve the conflict in config.yml."
