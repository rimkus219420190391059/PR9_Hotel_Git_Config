# Защита ветки main — Branch Protection Rules

Для репозитория АИС «Гостиничный комплекс» необходимо установить следующие правила:

1. **Require a pull request before merging** — изменения в `main` принимаются только через Pull Request.
2. **Required approvals: 1** — требуется минимум одно одобрение от Tech Lead.
3. **Require status checks to pass before merging** — включить обязательные проверки сборки и автоматических тестов после появления соответствующих CI checks.
4. **Do not allow bypassing the above settings** — запретить обход правил, если тариф и права репозитория позволяют включить эту настройку.
5. **Restrict force pushes** — запретить принудительную перезапись истории ветки.
6. **Restrict deletions** — запретить удаление `main`.

## Порядок настройки на GitHub

1. Откройте репозиторий на GitHub.
2. Перейдите в **Settings → Branches**.
3. Нажмите **Add branch protection rule**.
4. В поле Branch name pattern укажите `main`.
5. Включите перечисленные выше параметры.
6. Сохраните правило кнопкой **Create** или **Save changes**.

Названия пунктов интерфейса GitHub могут отличаться в зависимости от используемого режима Branch protection / Rulesets и тарифа.

## Модель доступа команды

- **Developer** — создаёт feature-ветки, отправляет коммиты и открывает Pull Request; не вносит изменения напрямую в `main`.
- **Tech Lead** — проверяет Pull Request, оставляет замечания и выполняет approve.
- **main** — защищённая ветка, изменения попадают только после прохождения review и обязательных CI-проверок.
