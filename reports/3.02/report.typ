#import "../common-typst/common.typ"

#common.PhysicsLabReportStyle[

#let author  = [ Смирнов Алексей Владимирович ]
#let group   = [ R3242 ]
#let teacher = [ Курашова Светлана Александровна ]
#let title   = [ Характеристики источника тока ]
#let lab_id  = [ №3.02 ]

#common.TitlePage(author, group, teacher, title, lab_id)

= Цель работы
+ #[ Исследовать зависимость полной мощности, полезной мощности,
мощности потерь, падения напряжения во внешней цепи и КПД источника
от силы тока в цепи. ]
+ #[ Найти значения параметров источника: электродвижущей силы и
внутреннего сопротивления, оценить их погрешность. ]

= Введение
#figure(
  image("img/setup.png", width: 70%),
  caption: [Принципиальная электрическая схема лабораторной установки],
) <setup> 

= Основные формулы

- $U = cal(E) - I r$ --- Закон Ома для замкнутой цепи. 

- $I_K = cal(E) / r$ --- Сила тока короткого замыкания цепи.

- $P=cal(E) = I r$   --- Полная мощность тока.

- $P_R = cal(E)I - I^2 r$ --- Полезная мощность тока.

#let Rmax=[\R\m\a\x]
- $P_(Rmax) = cal(E)^2 / 4r $ --- Максимум полезной мощности в нагрузке. 

#box(baseline: 0.5cm)[
#stack(dir: ttb, spacing: 1em,
[- $eta = P_R / P = (U I) / (cal(E) I) = U / cal(E)$],
[- $eta = (cal(E) - I r) / cal(E) = 1 - (I r) / cal(E)$]
)] --- КПД тока 

- $R = (I_K)/ cal(E)$ --- Внутреннее сопротивление источника ЭДС.

#pagebreak()
= Обработка результатов

// NOTE: Тут в графике точки должны быть соединены
== График зависимости $U(I)$
#figure(
  image("img/1_notitle.png"),
  caption: [График зависимости $U(I)$]
) <1>
По графику на @1 видно, что зависимость действительно имеет линейный характер.

== Поиск параметров зависимости <r>

Так как зависимость имеет линейный характер, ее можно представить в виде $y=A x + B$, где:
- $|A| = r$
- $B = cal(E)$
С помощью метода наименьших квадратов нашёл
параметры полученной зависимости:
- $r = 691.580" Ом"$
- $cal(E) = 10.661" В"$

== Полная, полезная, мощность потерь Используя результаты измерения напряжений
$U$ и силы тока $I$ (См. @t1) и найденные величины $cal(E)$ и $r$, вычислил и
внес в @t1 значения полезной $P_R=U I$, полной $P=cal(E) I$ мощности, а также
мощности потерь $P_S=I^2 r$

== Графики зависимостей всех мощностей
Построили графики зависимостей всех мощностей от силы тока на одном графическом
поле (См. @3)

// NOTE: Тут в графике точки должны быть соединены
#figure(
  image("img/2_notitle.png"), 
  caption: [График зависимостей $P = P(I),P_R=P_R(I),P_S=P_S(I) $],
) <3>

С помощью графика $P_R = P_R(I)$ нашёл значение силы тока $I^* = 0.0077" A"$ (См. @4)

#figure(
  image("img/3.png"),
  caption: [Значение силы тока $I^*$ на графике $P_R=P_R(I)$],
) <4>

==

Найдём $P_Rmax$ по @4: 

$P_Rmax$ --- вершина параболы функции $P_R=P_R (I)$. 

$P_Rmax = 0.042" Вт"$.

Найдём сопротивление $R$, подставив $P_Rmax$ и $I^*$ в формулу $P_R=I^2R$:

$P_Rmax=(I^*)^2R => R=(P_Rmax) / ( (I^*)^2 )= 0.042 / 0.0077^2 = 699.432" Ом"$.

$R = 699.432" Ом"$

$r = 691.580" Ом"$ (@r)

Сопротивления примерно равны между собой.

$R/r = 1.011$ --- $R" и "r$ Отличаются примерно на 1%.

#pagebreak()
== КПД

Найдем значения КПД как функции силы тока $eta = eta (I)$, построив
соответствующий график. Также продолжим график до пересечения с осями координат.

Воспользуемся формулой $eta = P_R / P$ для вычисления КПД.

#figure(
  
image("img/4_notitle.png"),
  caption: [Значения КПД как функции $eta = eta (I)$]
) <5>

== 

Проведём горизонтальную на @5 линию $eta = 0.5$. Видно, что она пересекает линию
графика примерно в $I = 0.008" A" approx I^* = 0.0077" A"$.

#pagebreak()
= Приложение
#figure(
  caption: figure.caption(position: top)[Результаты прямых измерений и их обработка],
  table(
    columns: 6,
    fill: (_, y) => if y==0 { luma(80%) },
    inset: 0.5em,
    table.header(
      [$U$, _В_], [$I$, _мА_], [$P_R$, _мВт_], [$P_S$, _мВт_], [$P$, _мВт_], [$eta$],
    ),
[ 1.000], [ 14.000], [ 14.000], [ 135.550], [ 149.250], [ 0.094], 
[ 2.100], [ 13.000], [ 27.300], [ 116.877], [ 138.589], [ 0.197], 
[ 2.900], [ 11.000], [ 31.900], [ 83.681], [ 117.268], [ 0.272], 
[ 3.700], [ 10.000], [ 37.000], [ 69.158], [ 106.607], [ 0.347], 
[ 4.300], [ 9.000], [ 38.700], [ 56.018], [ 95.947], [ 0.403], 
[ 5.000], [ 8.000], [ 40.000], [ 44.261], [ 85.286], [ 0.469], 
[ 5.400], [ 8.000], [ 43.200], [ 44.261], [ 85.286], [ 0.507], 
[ 5.800], [ 7.000], [ 40.600], [ 33.887], [ 74.625], [ 0.544], 
[ 6.100], [ 7.000], [ 42.700], [ 33.887], [ 74.625], [ 0.572], 
[ 6.400], [ 6.000], [ 38.400], [ 24.897], [ 63.964], [ 0.600], 
[ 6.600], [ 6.000], [ 39.600], [ 24.897], [ 63.964], [ 0.619], 
[ 6.900], [ 5.000], [ 34.500], [ 17.289], [ 53.304], [ 0.647], 
[ 7.100], [ 5.000], [ 35.500], [ 17.289], [ 53.304], [ 0.666], 
[ 7.300], [ 5.000], [ 36.500], [ 17.289], [ 53.304], [ 0.685], 
[ 7.300], [ 5.000], [ 36.500], [ 17.289], [ 53.304], [ 0.685],
  ),
) <t1>
]