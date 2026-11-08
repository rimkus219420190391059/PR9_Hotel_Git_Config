#!/usr/bin/env bash
set -euo pipefail

git --version
git lfs version || { echo "Установите Git LFS: https://git-lfs.com/" >&2; exit 1; }

git lfs install
git lfs track "*.pdf"
git lfs track "*.docx"
git lfs track "*.xlsx"
git add .gitattributes

echo "Текущий статус репозитория:"
git status

echo "Отслеживаемые LFS-файлы:"
git lfs ls-files
