#import "style.typ": zihao

#let checkbox = box(grid(
  gutter: -8pt,
  $square$,
  $checkmark$,
))

#let checkcircle = box(grid(
  gutter: -8pt,
  $circle$,
  $checkmark$,
))

#let distr(s, w: auto) = {
  block(width: w, stack(dir: ltr, ..s.clusters().map(x => [#x]).intersperse(1fr)))
}

#let achievements(papers, patents) = {
  let bibitem(body) = figure(kind: "bibitem", supplement: none, body)
  show figure.where(kind: "bibitem"): it => {
    set align(left)
    set text(size: zihao.wuhao)
    set par(first-line-indent: (amount: 2em, all: true))
    box(width: 2em, it.counter.display("[1]"))
    it.body
    parbreak()
  }
  show ref: it => {
    let e = it.element
    if e.func() == figure and e.kind == "bibitem" {
      let loc = e.location()
      return link(loc, numbering("[1]", ..e.counter.at(loc)))
    }
    it
  }

  if papers != none {
    if papers.len() != 0 {
      list(indent: 1.5em)[*学术论文*]
      for paper in papers {
        bibitem(paper)
      }
    }
  }

  if patents != none {
    if patents.len() != 0 {
      list(indent: 1.5em)[*专利*]
      for patent in patents {
        bibitem(patent)
      }
    }
  }

  if papers == none and patents == none {
    [无。]
  }
  if papers != none and patents == none {
    if papers.len() == 0 and patents.len() == 0 {
      [无。]
    }
  }
}
