#import "../common-typst/common.typ"

#let author  =[ Смирнов Алексей Владимирович ]
#let group   =[ R3242 ]
#let teacher =[ Курашова Светлана Александровна ]
#let title   =[ Изучение электрических свойств сегнетоэлектриков ]
#let lab_id  =[ №3.10 ]


#common.PhysicsLabReportStyle[

#common.TitlePage(author, group, teacher, title, lab_id)

= Ход работы

== Параметры установки
$
  R_1 = 47 "кОм"\
  R_2= 470 "кОм"\ //e3
  C_1 = 1  "мкФ"\ //e-6
  s  = 500 "мм"^2 \ //e-6
  d  = 0.5 "мм"   \ //e-3
$

== Прямые измерения

// # Задание 6
$
// measuremntK = 5.0    # Масштаб в В/дел
  K = 5"В"/"дел" \

// # Измерения из пункта 6 в делениях
// measurementDs_ticks = 2.8  # Край по Y
// measurementEs_ticks = 2.7  # Край по X
  E_s = 2.7 "дел" \
  D_s = 2.8 "дел" \

// measurementDr_ticks = 1.0 # Пересечение с осью по Y 
// measurementEc_ticks = 0.6  # Пересечение с осью по X
  D_r = 1.0 "дел" \
  E_c = 0.6 "дел" \ 
$

А также столбцы 1-5 @t1[Таблицы].

== Вычисленные величины
Напряжение на Конденсаторе $C_1$
$
  U_C_1 = D_s dot K =  14"В"
$
Напряжение на резисторе $U_R_1$
$
  U_R_1 = E_s dot K = 13.5"В"
$
Электрическая индукция в состоянии насыщенности
$
  D_s = C_1/s dot U_C_1 = 0.028"Кл"/"м"^2
$
Напряженность электрического поля
$
  E_s = (R_1 + R_2) / R_1 dot U_R_1/d = 297dot 10^3"В"/"м"
$
Остаточная поляризация
$
  P_r = D_r = C_1/s dot K D_r = 0.01
$

=== Площадь предельной петли Гистерезиса
По фотографии предельной петли Гистерезиса выбрали несколько 
точек на верхней и нижней кривой и аппроксимировали их полиномами 
методом наименьших квадратов. Нашли площадь петли как интеграл между кривыми. 
Проиллюстрировали это на @ptask2

Полином верхней кривой
$ P_"верх" (x) = 
  &0.00188988931500665& x^5 + \
  &0.0155906127303955 & x^4 - \
  &0.0636066672849179 & x^3 - \
  &0.232457685031377  & x^2 + \
  &1.4001596709756    & x  + \
  &0.879349855584172
$
Полином нижней кривой
$ P_"нижн" (x) = 
  & 0.00285311694940667 &x^5 - \
  & 0.0225987345328868  &x^4 - \
  & 0.0740306050510353  &x^3 + \
  & 0.294835734778522   &x^2 + \
  & 1.42513958419297    &x   - \
  & 0.952406704710386
  
$

Площадь петли Гистерезиса
$
  S_0 = integral_(-E_s)^(E_s) P_"верх" (x) - P_"нижн" (x) dif x \
  S_0 = integral_(-2.7)^(2.7) P_"верх" (x) - P_"нижн" (x) dif x = 5.1642
$

Тангенс угла диэлектрических потерь
$
  tan delta = 1/pi dot S_0/ (D_s E_s) = 0.2174
$

Начальное значение диэлектрической проницаемости (См @ptask4-6)
$
  epsilon_"нач" = 3104.407
$

Ему соответсвует напряженность (См @ptask4-6)
$
  E_epsilon_"max" = 231000
$

Максимальное значение диэлектрической проницаемости (См @ptask4-6)
$
  epsilon_"max" = 13200.885
$

== Прочие результаты

- Столбцы 1-5 @t1[Таблицы] с измеренными величинами $U$, $K_x$, $K_y$, $X$, $Y$ 
- Столбцы 6-8 @t1[Таблицы] с вычисленными величинами $E$, $D$, $epsilon$
- График зависимости $D = D(E)$ (@ptask3)
- График зависимости $epsilon = epsilon (E)$ (@ptask4-6)
- фотография предельной петли Гистерезиса (@loop)

= Приложение

#figure(
  image("loop-high-contrast.jpg", width: 75%),
  caption: [фотография предельной петли Гистерезиса]
) <loop>

#figure(
  image("task2fig.svg"),
  caption: [Аппроксимация кривых петли Гистерезиса]
) <ptask2>

#figure(
  image("task3fig.svg"),
  caption: [График зависимости $D = D(E)$]
) <ptask3>

#figure(
  image("tasks4-6fig.svg"),
  caption: [График зависимости $epsilon = epsilon (E)$]
) <ptask4-6>



#figure(
  table(columns: 9,
  [ №],
  [$U$, В],
  [$K_x$, \ В/дел],
  [$K_y$, \ В/дел],
  [$X$,\ дел],
  [$Y$,\ дел],
  [$E$,\ В/м],
  [$D$,\ Кл/$"м"^2$],
  [$epsilon$],

[ 1],[15.000],[5.00],[5.00],[2.4],[2.8],[264000.00],[0.02800],[11978.581],
[ 2],[13.000],[5.00],[5.00],[2.1],[2.7],[231000.00],[0.02700],[13200.885],
[ 3],[11.000],[5.00],[5.00],[1.8],[2.3],[198000.00],[0.02300],[13119.398],
[ 4],[ 9.000],[2.00],[2.00],[3.6],[3.9],[158400.00],[0.01560],[11122.968],
[ 5],[ 7.000],[2.00],[2.00],[2.8],[2.8],[123200.00],[0.01120],[10267.355],
[ 6],[ 5.000],[2.00],[2.00],[2.0],[1.4],[ 88000.00],[0.00560],[ 7187.149],
[ 7],[ 4.400],[1.00],[1.00],[3.6],[2.2],[ 79200.00],[0.00440],[ 6274.495],
[ 8],[ 3.800],[1.00],[0.50],[2.1],[3.2],[ 46200.00],[0.00320],[ 7822.747],
[ 9],[ 3.200],[1.00],[0.50],[2.6],[2.3],[ 57200.00],[0.00230],[ 4541.330],
[10],[ 2.600],[1.00],[0.50],[2.1],[1.6],[ 46200.00],[0.00160],[ 3911.373],
[11],[ 2.000],[0.50],[0.20],[3.2],[2.7],[ 35200.00],[0.00108],[ 3465.232],
[12],[ 1.400],[0.50],[0.10],[2.2],[3.1],[ 24200.00],[0.00062],[ 2893.527],
[13],[ 0.400],[0.20],[0.05],[3.1],[3.0],[ 13640.00],[0.00030],[ 2484.038],
[14],[ 0.200],[0.05],[0.02],[2.9],[1.6],[  3190.00],[0.00006],[ 2265.899],
),
  caption: [Измеренные и вычиcленные величины]
) <t1>

]