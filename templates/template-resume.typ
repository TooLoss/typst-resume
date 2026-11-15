#import "@preview/datify-core:1.0.0": *

// colors
#let color_dark = rgb("#131A28")
#let color_gray = rgb("333333")
#let color_neutral = rgb("444444")
#let color_maybe = rgb("#3F4970")

#let textsize_title = 14pt
#let textsize_subtitle = 12pt
#let textsize_text = 10.3pt

#let picture_size = 90pt
#let icon_size = 10pt

#let contact_margin = 5pt
#let section_gap_above = 8pt
#let section_gap_below = 16pt
#let paragraph_spacing = 0.75em

#let paragraph_spacing = 0.75em


#let align_left_right(left_element, right_element) = {
  grid(
    columns: (1fr, auto),
    column-gutter: 1em,
    align: (left + bottom, right + bottom),
    left_element,
    right_element,
  )
}


// gparams
// - lang
// - firstname
// - lastname
// - position
// - contacts

#let resume(gparams: (:), body) = {

  // document metadata
  set document(
    author: gparams.firstname + " " + gparams.lastname,
    title: "cv"
  )

  // text default parameters
  set text(
    //font: 
    lang: gparams.lang,
    size: textsize_text,
    fill: color_dark,
    fallback: false,
    font: "New Computer Modern"
  )

  // document margin
  set page(
    paper: "a4",
    margin: (left: 0.30in, right: 0.30in, top: 0.3in, bottom: 0.3in),
  )

  // disable header numbering, border, ...
  set heading(
    numbering: none,
    outlined: false,
  )

  let photo = {
    if gparams.picture != none and gparams.picture != "" {
      box(fill: gray, width: picture_size, height: picture_size, gparams.picture)
    } else {
      box(fill: gray, width: picture_size, height: picture_size, image("Assets/picture.jpg"))
    }
  }

  let header_info = {
    block(below: 9pt)[
      #smallcaps[
        #text(size: 25pt, weight: "bold")[#gparams.firstname #gparams.lastname]
      ]
    ]
    block(below: 10pt)[
      #set text(size: textsize_title, weight: "regular", ligatures: false)
      #smallcaps[
        #gparams.position.join(text[#" "#sym.dot.c#" "])
      ]
    ]
    block(below: 10pt)[
      #set text(size: 10pt ,weight: "regular", ligatures: false)
      #stack(
        dir: ttb,
        spacing: 5pt,
        ..gparams.extra.map(item => {
          set text(weight: "regular", ligatures: false)
          smallcaps(item)
        })
      )
    ]
    block(below: 2pt)[
      #set text(size: 10pt)
      #let items = gparams.contact.map(((icon, label, url)) => {
        let entry = box[
          #if type(icon) == str {
            text(weight: "bold")[#icon]
          } else if icon != none {
            box(icon, height: icon_size, baseline: 20%)
            h(2pt)
          }
          #label
        ]
        if url != none and url != "" {
          link(url, entry)
        } else {
          entry
        }
      })
      #items.join([#h(contact_margin) | #h(contact_margin)])
    ]
  }

  if gparams.show_picture {
    grid(
      columns: (auto, 1fr),
      column-gutter: 1.6em,
      align: (left + top, left + top),
      photo,
      header_info,
    )
  } else {
    header_info
  }

  body
}

#let new_section(name) = {
  v(section_gap_above)
  block(below: section_gap_below, sticky: true)[
    #set text(
      size: textsize_title,
      weight: "bold",
      fill: color_maybe
    )
    #smallcaps[#name]
    #box(width: 1fr, line(length: 100%, stroke: 0.8pt + color_maybe))
  ]
}

#let date_range(start, end) = {
  set text(weight: "regular", style: "italic")

  let start_month = start.at(0)
  let start_year = start.at(1)

  let end_month = end.at(0)
  let end_year = end.at(1)

  context {
    let start_str = if start_month != 0 {
      [#get-month-name(start_month, width: "abbreviated", lang: text.lang) #start_year]
    } else {
      [#start_year]
    }

    let end_str = if end_year == "" or end_year == 0 or end_year == "0" {
      [Présent]
    } else if end_month != 0 {
      [#get-month-name(end_month, width: "abbreviated", lang: text.lang) #end_year]
    } else {
      [#end_year]
    }

    if start_str == end_str {
      start_str
    } else {
      [#start_str - #end_str]
    }
  }
}

#let new_infos(name, positions, location, start_date, end_date, infos) = {
  
  pad(bottom: -7pt)[
    #align_left_right[
      #text(name, weight: "bold", size: textsize_subtitle)
    ][
      #text(location, weight: "regular", style: "italic")
    ]
  ]
  pad(bottom: -7pt)[
    #align_left_right[
      #smallcaps[
        #let i = 0
        #for pos in positions {
          i += 1
          text(pos, fill: color_neutral)
          if i != positions.len() [
            #box(width: -5pt)
            #sym.dot.c
            #box(width: -5pt)
          ]
        }
      ]
    ][
      #date_range(start_date, end_date)
    ]
  ]
  for i in infos {
    if i != "" {
      "- "
      text(i)
      linebreak()
    } else {
      v(7pt)
    }
  }
}

#let new_project(name, infos) = {
  pad(bottom: -7pt)[
    #text(name, weight: "bold", size: textsize_subtitle, fill: color_maybe)
  ]
  for i in infos {
    "-" + text(i)
    linebreak()
  }
}

// #let new_skill(category, infos) =  {
//   pad(bottom: -7pt)[
//     #grid(
//       align: top,
//       columns: (1.5fr, 5fr),
//       column-gutter: 2em,
//       align(right)[#smallcaps[#text(category, weight: "bold")]],
//       {
//         let index = 0
//         for i in infos {
//           index += 1
//           text(i)
//           if index != infos.len() [
//             #text(",")
//           ]
//         } 
//       },
//     )
//   ]
// }

#let new_skill(category, infos) = {
  pad(bottom: -7pt)[
    #grid(
      align: top,
      columns: (135pt, 1fr),
      column-gutter: 2em,
      align(right)[#box[#smallcaps[#text(category, weight: "bold")]]],
      text(infos),
    )
  ]
}
