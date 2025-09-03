#!/bin/bash

# چک کن ورودی‌ها درست باشن
if [ -z "$1" ]; then
  echo "❌ لطفاً شماره روز رو بده (مثلاً: 01)"
  exit 1
fi

DAY="day-$1"
MESSAGE=${2:-"Daily coding update"}

# ساخت فولدر و فایل‌ها
mkdir -p $DAY
echo "# $DAY - $MESSAGE" > $DAY/README.md
echo "print('Hello from $DAY!')" > $DAY/code.py

# آپدیت روی گیت
git add .
git commit -m "$DAY - $MESSAGE"
git push origin main

echo "✅ $DAY ساخته شد و روی گیت‌هاب پوش شد!"
