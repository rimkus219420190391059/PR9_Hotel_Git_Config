# ПР9 — Настройка .gitignore и прав доступа

**Вариант 12 — АИС «Гостиничный комплекс»**

Этот комплект содержит конфигурационные файлы и инструкции для настройки репозитория:
- `.gitignore` — исключение результатов сборки, настроек IDE, локальных секретов, логов и файлов баз данных;
- `.gitattributes` — нормализация текстовых файлов и правила Git LFS для PDF, DOCX и XLSX;
- `scripts/setup-lfs.ps1` и `scripts/setup-lfs.sh` — команды установки Git LFS и регистрации типов файлов;
- `docs/BRANCH_PROTECTION.md` — регламент защиты ветки `main`.

## 1. Добавление конфигурации в проект

Скопируйте `.gitignore` и `.gitattributes` в корень существующего Git-репозитория рядом с `.sln`.

## 2. Настройка Git LFS

Установите Git LFS:
- Windows: `git lfs install` (предварительно установите Git LFS с https://git-lfs.com/);
- macOS: `brew install git-lfs`;
- Ubuntu/Debian: установите пакет `git-lfs` через пакетный менеджер.

Затем из корня репозитория выполните:

```bash
git lfs install
git lfs track "*.pdf"
git lfs track "*.docx"
git lfs track "*.xlsx"
git add .gitattributes
git status
```

Скрипты в `scripts/` выполняют эти команды автоматически. Запускайте скрипт из корня репозитория.

Важно: `git lfs track` настраивает отслеживание файлов для будущих коммитов. Если большие файлы уже были закоммичены ранее, для переноса существующей истории в LFS потребуется отдельная миграция (`git lfs migrate import`).

## 3. Защита ветки main

Откройте GitHub → Settings → Branches → Add branch protection rule (или Rulesets, в зависимости от интерфейса). Укажите `main` и включите требования из `docs/BRANCH_PROTECTION.md`.

Настройка Branch Protection выполняется в интерфейсе GitHub и не может быть применена одним локальным конфигурационным файлом.

## 4. Проверка

```bash
git status
git check-attr text eol filter -- .gitattributes README.md sample.pdf
git lfs ls-files
```

`git status` показывает состояние конкретного локального репозитория. В этом архиве намеренно не приводится вымышленный вывод команды: после копирования файлов выполните её у себя и добавьте фактический скриншот в отчёт.
