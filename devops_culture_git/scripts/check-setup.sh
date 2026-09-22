#!/usr/bin/env bash

ok()   { printf "  [ OK ] %s\n" "$1"; }
ko()   { printf "  [ KO ] %s\n" "$1"; FAILS=$((FAILS+1)); }
warn() { printf "  [ !  ] %s\n" "$1"; }

FAILS=0
printf "\n========== Checking Environment ==========\n\n"

# Docker
if command -v docker >/dev/null 2>&1; then
  if docker info >/dev/null 2>&1; then
    ok "Docker installed and daemon running ($(docker --version | cut -d',' -f1))."
  else
    ko "Docker installed but daemon not running."
  fi
else
  ko "Docker not found."
fi

# Git
if command -v git >/dev/null 2>&1; then
  ok "Git installed ($(git --version))."
  [ -n "$(git config --global user.name)" ]  && ok "git user.name configured."  || ko "git user.name not configured (git config --global user.name \"...\")."
  [ -n "$(git config --global user.email)" ] && ok "git user.email configured." || ko "git user.email not configured."
else
  ko "Git not found."
fi

# SSH & GitHub
if command -v ssh >/dev/null 2>&1; then
  SSH_OUT=$(ssh -T -o StrictHostKeyChecking=no -o BatchMode=yes git@github.com 2>&1 || true)
  case "$SSH_OUT" in
    *"successfully authenticated"*) ok "SSH GitHub working." ;;
    *"Permission denied"*)          ko "SSH not recognized by GitHub." ;;
    *)                              warn "SSH GitHub unknown : $SSH_OUT" ;;
  esac
else
  warn "SSH not found."
fi

# Runtime
if command -v node >/dev/null 2>&1; then ok "Node.js installed ($(node --version))."
elif command -v python3 >/dev/null 2>&1; then ok "Python installed ($(python3 --version))."
else warn "Node.js and Python not found."
fi

printf "\n==========================================\n\n"
if [ "$FAILS" -eq 0 ]; then
  printf "Environment is ready!\n"
else
  printf "%d setp(s) to fix.\n" "$FAILS"
  exit 1
fi
