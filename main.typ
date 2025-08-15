#import "style.typ": zihao, ziti
#import "utils.typ": *
#import "@preview/cuti:0.3.0": show-cn-fakebold
#import "@preview/numbly:0.1.0": numbly
#import "@preview/itemize:0.1.2" as el

#set heading(numbering: numbly(
  "{1}、",
  "{1}.{2} ",
  "{1}.{2}.{3} ",
  "{1}.{2}.{3}.{4} ",
))
#set heading(hanging-indent: 1.5em)
#show heading: it => {
  show h.where(amount: 0.3em): none
  it
}
#show heading.where(level: 1): set block(above: 2.5em, below: 1.5em)
#show heading.where(level: 2): set block(above: 2em, below: 1.5em)
#show heading.where(level: 3): set block(above: 1.75em, below: 1.5em)
#show heading.where(level: 4): set block(above: 1.5em, below: 1.5em)
#show heading.where(level: 1): set text(font: ziti.fangsong, weight: "regular", size: zihao.xiaosi, top-edge: 3pt)
#show heading.where(level: 2): set text(font: ziti.kaiti, size: zihao.xiaosi)
#set page(margin: (x: 2.6cm, y: 2.5cm))
#set text(hyphenate: false, font: ziti.songti)
#set par(leading: 1em)
#show: el.default-enum-list
#set enum(body-indent: 1em)
#show: show-cn-fakebold
#show bibliography: set par(hanging-indent: 0em)
#show math.equation: set text(font: ziti.math)
#show raw: set text(font: ziti.dengkuan)

#let uline(width, body) = box(body, width: width, stroke: (bottom: 0.5pt), outset: (bottom: 2pt))
#let mid-exam-date = datetime.today()
#let proposal-date = datetime(year: 2025, month: 1, day: 2)
#let info = (
  student_id: "012345678910",
  name: "张三",
  degree: "专业型硕士生 Professional Master Student",
  study_mode: "全日制 Full-time",
  supervisor: "李四",
  title: "一个很长很长的题目",
  school: "上海交通大学",
  major: "电子信息",
  date: mid-exam-date.display("[year]年[month padding:none]月[day padding:none]日"),
)

#align(center, image(
  "figures/sjtu-logo.png",
  width: 10cm,
))

#align(center, text(
  "硕士研究生学位论文中期检查报告",
  font: ziti.songti,
  size: zihao.yihao,
  weight: "bold",
))

#align(center, text(
  "Mid-term Examination Report for SJTU Master Student",
  size: zihao.xiaosan,
  weight: "bold",
))

#v(38pt)

#set table(stroke: (x, y) => if x == 1 {
  (bottom: 0.5pt + black)
})

#let info-key(zh, en) = (
  text(
    zh,
    font: ziti.kaiti,
    size: zihao.sihao,
    weight: "black",
  )
    + h(0.5em)
    + text(
      en,
      size: zihao.xiaosi,
      weight: "bold",
    )
)

#let info-value(v) = (
  text(
    v,
    font: ziti.fangsong,
    size: zihao.xiaosi,
  )
)

#align(center, block(width: 85%)[#table(
  align: left + horizon,
  columns: (38%, 1fr),
  row-gutter: 1em,
  column-gutter: -2em,
  [#info-key("学号", "Student ID")], [#info-value(info.student_id)],
  [#info-key("姓名", "Name")], [#info-value(info.name)],
  [#info-key("学生类别", "\nDegree Program")], [#info-value(info.degree)],
  [#info-key("学习形式", "\nStudy Mode")], [#info-value(info.study_mode)],
  [#info-key("导师", "Supervisor(s)")], [#info-value(info.supervisor)],
  [#info-key("专业", "Major")], [#info-value(info.major)],
  [#info-key("学院", "School")], [#info-value(info.school)],
  [#info-key("考核日期", "Date")], [#info-value(info.date)],
)])

#pagebreak()

#set page(
  header: [
    #align(center, text(
      "上海交通大学硕士论文中期检查报告  Mid-term Examination for SJTU Master Student",
      font: ziti.songti,
      size: zihao.xiaowu,
    ))
    #v(-0.8em)
    #line(length: 100%, stroke: 0.5pt)
    #v(0.5em)
  ],
  footer: context [
    #set align(center)
    #set text(zihao.xiaowu, weight: "bold")
    1 / 1
  ],
)
#counter(page).update(1)

#align(
  center,
  text(
    "填报说明",
    font: ziti.heiti,
    size: zihao.xiaosan,
  )
    + h(1em)
    + text(
      "Instruction",
      size: zihao.xiaosan,
      weight: "bold",
    ),
)

#v(1em)

#set text(font: ziti.fangsong, size: zihao.xiaosi)
#set par(justify: true)
#let mysjtu-link(it) = {
  underline(text(rgb(0, 0, 255), link("http://my.sjtu.edu.cn/")[#it]), evade: false)
}

1. 硕士研究生学位论文中期检查应通过#mysjtu-link[数字交大]在线提交申请，填写本表并上传系统。特殊情况下经研究生院事先同意，可不上传系统，并使用《上海交通大学硕士论文中期检查评审表》完成评审。
  #v(0.2em)
  The application for thesis mid-term examination should be submitted online through #mysjtu-link[My SJTU]. The student shall filled this form and upload it in the system. Under special circumstance, this form does not need to be uploaded and the review can be proceeded with the review form with prior consent from the graduate school.
  #v(0.1em)

2. 本报告请用A4纸双面打印，于左侧订在一起。各栏空格不够时，请自行加页。考核前提前一周送交导师、评审专家审阅。
  #v(0.2em)
  This report should be printed with A4 papers and bound together on the left. If the space left is not enough, please feel free to add extra pages. The print version shall be sent to the supervisor, and the review committee members for review at least one week before the oral presentation.
  #v(0.1em)

3. 中期检查报告通过后，定稿版报告由研究生、导师各存档一份，无需上传系统。
  #v(0.2em)
  Upon passing the review, the final version of this report shall be archived by the graduate student and his/her supervisors for future reference.
  #v(0.1em)

#pagebreak()

#set page(footer: context [
  #set align(center)
  #set text(zihao.xiaowu, weight: "bold")
  #counter(page).display(
    "1 / 1",
    both: true,
  )
])
#counter(page).update(1)
#set par(justify: false)

#align(center, text(
  font: ziti.fangsong,
  size: zihao.sihao,
  weight: "bold",
)[中期检查报告 Mid-term Examination Report])

#v(0.5em)

#align(center, table(
  align: left + horizon,
  columns: (28%, 1fr),
  stroke: 0.5pt + black,
  inset: (y: 10pt),
  [论文题目 #linebreak() Proposed Title], [#info.title],
  [研究课题来源 #linebreak() Source of Research Project],
  [
    请在合适选项前画 $checkmark$ Please select proper options by $checkmark$.

    $square$ 国家自然科学基金课题 NSFC Research Grants

    $square$ 国家社会科学基金 National Social Science Fund of China

    $square$ 国家重大科研专项 National Key Research Projects

    $square$ 其它纵向科研课题 Other Governmental Research Grants

    #checkbox 企业横向课题 R&D Projects from Industry

    $square$ 自拟课题 Self-proposed Project
  ],

  [论文开题日期 #linebreak() Thesis Proposal Date],
  [#proposal-date.display("[year]年[month padding:none]月[day padding:none]日")],
))

#set text(font: ziti.kaiti, size: zihao.xiaosi)
#show heading: set par(leading: 1em)
#set par(
  leading: 1.25em,
  first-line-indent: (amount: 3.5em, all: true),
  spacing: 1.25em,
  hanging-indent: 1.5em,
  justify: true,
)
#set enum(indent: 1.75em)
#show enum: set par(hanging-indent: 0em)
#set list(indent: 2.65em)
#show list: set par(hanging-indent: 0em)

= *报告正文 Report。*请阐述开题报告以来学位论文研究工作的进展情况及所取得的阶段性成果，并简述下一阶段研究计划，不少于4000汉字。Please summarize your research progress and achievements since your thesis proposal as well as your plan for next step. No less than 3200 words if written in English.

== 进展情况

进展情况良好。

== 阶段性成果

取得了很多成果。

== 下一阶段研究计划

下一阶段计划很明确。

= *成果清单 List of Achievements。*请列出开题报告以来或上次年度进展报告以来新发表的学术论文、授权专利、国际会议论文、专著等成果清单。作者、标题、杂志、卷、期、页码等信息请填写完整。Please provide a list of academic publications (papers, patents, international academic conference talks/presentations, monographs, etc.) since your thesis proposal. Information on author list, title, journal name, volume, number, and pages shall be complete.

#achievements(
  (
    "Chen H, Chan C T. Acoustic cloaking in three dimensions using acoustic metamaterials[J]. Applied Physics Letters, 2007, 91:183518.",
    "Chen H, Wu B I, Zhang B, et al. Electromagnetic Wave Interactions with a Metamaterial Cloak[J]. Physical Review Letters, 2007, 99(6):63903.",
  ),
  (
    "第一发明人, 永动机[P], 专利申请号202510149890.0.",
  ),
)

#set text(font: ziti.fangsong, size: zihao.xiaosi, weight: "bold", top-edge: 3pt)
#set par(leading: 1em, hanging-indent: 0em, first-line-indent: 2em)

#v(5em)

本人承诺：报告中的内容真实无误，若有不实，愿承担相应的责任和后果。 I hereby declare and confirm that the details provided in this Form are valid and accurate. If anything untruthful found, I will bear the corresponding liabilities and consequences.

#linebreak()

#table(
  columns: (60%, 1fr),
  stroke: none,
  inset: 0em,
  [
    #grid(
      columns: (70%, 1fr),
      [学生签字/Signature of Student：], place(dx: -20pt, dy: -22pt, image("figures/student-sign.png", height: 2.5em)),
    )
  ],
  [日期/Date：#mid-exam-date.display()],
)

