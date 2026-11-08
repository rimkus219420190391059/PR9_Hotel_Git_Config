# Материалы для отчёта ПР9

## 1. Листинг .gitignore
Используйте содержимое файла `.gitignore` из корня комплекта.

## 2. Листинг .gitattributes
Используйте содержимое файла `.gitattributes` из корня комплекта.

## 3. Лог git status и инициализации LFS
После копирования файлов в свой репозиторий выполните:

```bash
git lfs install
git lfs track "*.pdf"
git lfs track "*.docx"
git lfs track "*.xlsx"
git add .gitattributes
git status
git lfs ls-files
```

В отчёт вставьте фактический вывод терминала или скриншот. Не используйте заранее подготовленный пример как реальный лог выполнения.
