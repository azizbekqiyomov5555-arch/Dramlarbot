#!/usr/bin/env bash
# Ishlatish: .env faylini to'ldiring, so'ng:  bash set_secrets.sh
set -e
[ -f .env ] || { echo ".env topilmadi (.env.example dan nusxa oling)"; exit 1; }
grep -vE '^\s*(#|$)' .env | sed -E 's/\s+#.*$//' | xargs fly secrets set
