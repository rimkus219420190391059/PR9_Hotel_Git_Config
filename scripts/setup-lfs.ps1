$ErrorActionPreference = "Stop"

Write-Host "Проверка Git..."
git --version
if ($LASTEXITCODE -ne 0) { throw "Git не найден." }

Write-Host "Проверка Git LFS..."
git lfs version
if ($LASTEXITCODE -ne 0) { throw "Git LFS не установлен. Установите его с https://git-lfs.com/." }

Write-Host "Инициализация Git LFS..."
git lfs install
if ($LASTEXITCODE -ne 0) { throw "Не удалось выполнить git lfs install." }

git lfs track "*.pdf"
if ($LASTEXITCODE -ne 0) { throw "Не удалось настроить LFS для PDF." }
git lfs track "*.docx"
if ($LASTEXITCODE -ne 0) { throw "Не удалось настроить LFS для DOCX." }
git lfs track "*.xlsx"
if ($LASTEXITCODE -ne 0) { throw "Не удалось настроить LFS для XLSX." }

git add .gitattributes
if ($LASTEXITCODE -ne 0) { throw "Не удалось добавить .gitattributes." }

Write-Host "`nТекущий статус репозитория:"
git status
if ($LASTEXITCODE -ne 0) { throw "Команда git status завершилась с ошибкой." }

Write-Host "`nОтслеживаемые LFS-файлы:"
git lfs ls-files
