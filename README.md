# Решатели
Написаны в формате Jupyter Notebook.

Подставьте результаты измереные в соответствующие вектора в единицах системы СИ и выполните все ячейки ноутбука.
Данные измерений подписаны комментарием `-- CHANGE THIS --`. 

Графики сохраняются в формате svg и вставляются в отчёт по именам файлов. Некоторые таблицы генерируются и пишутся в вывод ячеек.

Правильность вычислений не гарантируется, всегда перечитывайте результаты и отчёт.
## Зависимости 
- numpy 
- matplotlib
- sympy

# Примеры отчётов
Написаны в Typst.
## Компилция
После запуска решателя:
```
cd reports
$typst compile --root='.' 3.xx/report.typ
```
