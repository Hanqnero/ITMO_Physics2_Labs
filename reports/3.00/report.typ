#set page(paper: "a4")
#set text(
  font: "Times New Roman",
  lang: "ru", 
  size: 14pt
)
#set par(
  first-line-indent: 1cm,
  justify: true,
  linebreaks: "optimized",
)

#set heading(
  numbering: (..numbers) => 
      if numbers.pos().len() <= 1 {
        return numbering("1.", ..numbers)
      }
)

#show figure: set align(center)

#let author=[ Смирнов Алексей Владимирович ]
#let group=[ R3242 ]
#let teacher=[ Курашова Светлана Александровна ]

#grid(
  columns: 2,
  row-gutter: 1em,
  column-gutter: -5cm,
  [*Группа*: _#{ group }_],
  [*Студент*: _#{ author }_],
  [*Преподаватель*: _#{ teacher }_],
)

#align(center)[
  #image(
    "../common-img/logo.png",
    width: 50%
  )
]

#line(length: 100%)
#v(1fr)
#align(center)[
  #text(size: 1.3em, weight: "extrabold")[
    Рабочий протокол и отчёт по лабораторной работе №3.00
  ]
  
  #text(size: 1.3em, style: "italic")[
    Изучение электрических сигналов с помощью лабораторного осциллографа
  ]
]

#v(1fr)

#align(center+bottom)[Санкт-Петербург, 2024 г.]
#pagebreak()

#let task(name) = {
  heading(level: 2, numbering: 
    (..nums) => {
      "Задание " + str(nums.pos().at(1)) + ". "
    }
  )[#name]
}

= Ход работы

#task[Исследование сигналов различной формы]

#show figure.where(
  kind: table
): set figure.caption(position: top)

#figure(
  table(
    columns: 4,
    [Канал 1], 
    [Автоматические измерения],
    [Измерения с помощью курсора],
    [ГС АКИП-3409],

    [Частота сигнала, Гц/кГц/МГц],
    [1 КГц], [0.99 КГц],[1 КГц],

    [Амплитуда сигнала, В/мВ],
    [975 мВ], [1.02 В],[1 В],
    
    [Период мс/с],
    [1 с], [1.02 с],[1 с]
  ),
  caption: []
) <t1>

#let aut = "aвт"
#let cur = "кур"
=== Относительное отклониние измеренных величин
$
  & Delta_% nu_aut = 0 % \
    & Delta_% nu_cur = (-0.01) / (1) dot 100% = -1% \      
  & Delta_% U_aut = (-0.025)/(1) dot 100% = 2.5% \
    & Delta_% U_cur = (1.02 - 0.975)/(1.02) dot 100% = 4.41% \
  & Delta_% T_aut = 0 \
    &Delta_% T_cur = (1.02 - 1) / (1) dot 100% = 2% \
$

#task[Исследование предельных характеристик прибора]

Верхняя предельная частота $nu_ "верх" = 120 "кГц"$. При низких частотах (от 3
до 1 Гц) фигура имеет искажения, коротые усиливаются при уменешьнии частоты.
Нижняя предельная частота $nu_ "нижн" = 3 " Гц". $

#task[Изучение сложения взаимно перпендикулярных колебаних разных частот. фигуры Лиссажу]

Параметры сигналов:
Частота --- 10~кГц; Амплитуда --- 3~В; Смещение --- 0~мс; Фаза --- $0 degree$.

=== Фигура со смещением фаз $Delta phi = 45 degree$

Установили смещение фаз $Delta phi = 45 degree plus.minus 0.05 degree$ Получили на экране осцилографа фигуру (См. @i1).

#figure(
  image("img/task3-1.jpg", width: 70%),
  caption: [Фигура Лиссажу при $Delta phi = 45 degree$]
) <i1>

Параметры фигры: $U_(Y"max") = 1.5" В"$, $U_(Y 1) = 1.00" В"$, $U_(Y 2) = 1.02" В"$ .

Сдвиг фаз:

#let nonumeq = math.equation.with(block: true, numbering: none)
#let dm(x) = box[#nonumeq[#x]]
#let dfrac(x,y) = math.frac(dm(x),dm(y))
// $ dfrac( frac(2 S^2,V^2 sum_i (mu_i^2)/(sigma_i^2)) mu_i V^2 , 2 S^2 sigma_i^2) $

$ 
  & alpha = arcsin(dfrac(U_(Y 1), U_(Y"max"))) 
  = arcsin(dfrac(U_(Y 1), U_2)) \
  
  & alpha = arcsin(dfrac(1.0, 1.50)) = 41.81 degree \

  & Delta alpha = alpha - alpha_"ген" = -3.19 degree \
  & Delta_% alpha = (-3.19) / (45) dot 100% = -7.09%
$ 

=== Фигура со смещением фаз $Delta phi = 90 degree$

Фигура имеет форму окружности.

#figure(
  image(
    "img/task3-2.png",
    width: 40%
    ),
  caption: [Симуляция фигуры Лиссажу с $Delta phi = 90 degree$]
)

Параметры фигуры: $U_(Y"max") = 1.47" В"$, $U_(Y 1) = 1.47" В"$, $U_(Y 2) = 1.50" В"$ .

Сдвиг фаз:

$ alpha = arcsin(dfrac(1.47, 1.47)) = 90 degree $


=== Фигура со смещением фаз $Delta phi = 180 degree$

#figure(
  image("img/task3-4.jpg", width: 70%),
  caption: [Фигура Лиссажу с $Delta phi = 180 degree$]
)

=== Фигура с соотношением амплитуд 1:2 и смещением фаз $Delta phi = 45 degree$

#figure(
  image("img/task3-3.jpg", width: 70%),
  caption: [Фигура Лиссажу с соотношением амплитуд 1:2 и $Delta phi = 45 degree$ ]
)

=== Фигура с отличающимися частотами

Установили частоты на генераторе с разностью $0.1 "кГц"$. Характер изменения
фигуры во времени соответствовал теоретическим формулам:

$
  &U_x = U_1 dot cos(omega t) \
  &U_y = U_2 dot cos[omega t + (Delta omega t + alpha)]
$

#task[Изучение сложения однонаправленных колебаний мало отличающихся по частоте (биения)]

Подали на каналы осцилографа сигналы одинаковой амплитуды $a = 1" В"$ и фазы. С
Частотами, отличающимися на 7%: $nu_1 = 1" кГц"$ $nu_2 = 1.02" кГц"$.

Измерели амплитуду сигнала в максимуме  и период биений:

$
  a_"сум" = 1.8" В" \
  T = 14.2" мс"
$

#task[Изучение сложения однонаправленных колебаний одинаковой частоты]

Подали на каналы осцилографа сигналы одинаковой частоты $nu = 1" кГц"$ с разными
фазами и амплитудами.  

#align(center)[#set table.cell(align: horizon+center)
#box(table(
  columns: 2,
  [Параметры\ сигналов], [$a_"рез"$, В],
  [$a_1 = 1" В"$ \ $a_2 = 1.2" В"$ \ $Delta phi = 45 degree$],
  [$2.04$],

  [$a_1 = 1.6" В"$ \ $a_2 = 2" В"$ \ $Delta phi = 30 degree$],
  [3.52],

  [$a_1 = 3" В"$ \ $a_2 = 2.5" В"$ \ $Delta phi = 40 degree$],
  [5.2],
))]

= Результаты

#task[]
$
  & Delta_% nu_aut = 0 % \
    & Delta_% nu_cur = -1% \      
  & Delta_% U_aut = 2.5% \
    & Delta_% U_cur = 4.41% \
  & Delta_% T_aut = 0% \
    &Delta_% T_cur = 2% \
$

#task[]

$
  &nu_"верх" = 120" кГц" \ 
  &nu_"нижн" = 3" Гц"
$

#task[]

$ Delta_% alpha = -7.09% $

#task[]

$
  a_"сум" = 1.8" В" \
  T = 14.2 "мс"
$

#task[]

#let res = "рез"
#let Vt  = " В"
$
  &a_res_1 = 2.04Vt \
  &a_res_2 = 3.52Vt \
  &a_res_3 = 5.2Vt
$

= Вывод 

Работа продемонстрировала возможности осциллографа в исследовании сигналов
различных форм и параметров. Были подтверждены теоретические положения о
сложении гармонических сигналов, биениях и формах Лиссажу. 