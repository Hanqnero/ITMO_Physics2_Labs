#let PhysicsLabReportStyle(body) = {
  // Page, font, parapgraph settings
  set page(paper: "a4")
  set text(
    font: "Times New Roman", lang: "ru", size: 14pt,
  )
  set par(
    first-line-indent: 1cm, justify: true, linebreaks: "optimized",
  )


  // Align figures and put cation above tables
  show figure: set align(center)
  show figure.where(kind: table): set figure.caption(position: top)

  // Number only first level heading
  let option_LastNumberedHeading = 1
  set heading(
    numbering: (..numbers) => 
        if numbers.pos().len() <= option_LastNumberedHeading {
          return numbering("1.", ..numbers)
        }
  )
  body
}

#let numeq(content) = { math.equation(numbering: "(1)", content)}

// Numbered task heading
#let task(name) = {
  heading(level: 2, numbering: 
    (..nums) => {
      return "Задание " + str(nums.pos().at(1)) + ". "
    }
  )[#name]
}

#let TitlePage(author, group, teacher, title, id) = [

// =================
// -- TITLE PAGE ---
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
    Рабочий протокол и отчёт по лабораторной работе #id
  ]

  #text(size: 1.3em, style: "italic", title)
]

#v(1fr)

#let year = datetime.today().year()

#align(center+bottom)[Санкт-Петербург, #year г.]
#pagebreak()
// -- TITLE PAGE ---
// =================
]
