#import "/templates/template-resume.typ": *
#import "@preview/linguify:0.5.0": *

#let lang="en"

// language
#let lang-data = toml("lang.toml")
#set-database(lang-data)
#let l = linguify // alias

#set text(lang: lang)

// who when where how why + final result
// quantitatif et qualitatif

#show: resume.with(
  gparams: (
    firstname: "El Haddadi",
    lastname: "Bilèle",
    lang: lang,
    position: (
      l("status"),
      l("ingenieur"),
    ),
    extra: (
      l("seek"),
      l("begin"),
      l("location"),
    ),
    picture: image("private/cv-image.jpg", width: 100%),
    show_picture: true,
    // contact: (
    //   (image("assets/website.svg"), "eportfolio.bilele.tech", "https://eportfolio.bilele.tech/"),
    //   (image("assets/github.svg"), "github.com/TooLoss", "https://github.com/TooLoss"),
    //   (image("assets/linkedin.svg"), "linkedin.com/in/bilele-elhaddadi",
    //   "https://www.linkedin.com/in/bilele-elhaddadi/"),
    //   (image("assets/mail.svg"), "bilele.elhaddadi@gmail.com",
    //   "mailto:bilele.elhaddadi@gmail.com"),
    //   (image("assets/phone.svg"), "+33 6 51 92 76 04", "tel:+33651927604"
    //   )
    contact: (
      // ("Portfolio : ", "eportfolio.bilele.tech", "https://eportfolio.bilele.tech/"),
      ("GitHub : ", "github.com/TooLoss", "https://github.com/TooLoss"),
      ("LinkedIn : ", "linkedin.com/in/bilele-elhaddadi", "https://www.linkedin.com/in/bilele-elhaddadi/"),
      ("Email : ", "bilele.elhaddadi@gmail.com", "mailto:bilele.elhaddadi@gmail.com"),
      ("Tél. : ", "+33 6 51 92 76 04", "tel:+33651927604"),
    )
  )
)

/* education */

#new_section(l("formation"))

#new_infos("Toulouse INP-ENSEEIHT",
           (l("diplome"), l("logiciel")),
           "31000 - Toulouse", (9, "2025"), (0, l("actuel")),
           (l("enseeiht-skill-1"), l("enseeiht-skill-2")))

#new_infos(l("prepa"),
           (l("prepa-sup"), l("prepa-spe")),
           "78100 - Saint-Germain-en-Laye", (9, "2023"), (7, "2025"),
           ("",))


#new_infos(l("lycee"),
              (l("bac"), l("bac-spe")), 
              "95600 - Cergy", (7, "2023"), (7, "2023"),
              (l("bac-mention"),))

/* exprience */

#new_section(l("experience"))

#new_infos(l("net7"),
           (l("net7-role"), ),
           "31000 - Toulouse", (5, "2026"), (0, l("actuel")),
           (l("net7-1"), l("net7-2"), l("net7-3")))

#new_infos(l("stage-1A"),
           (l("stage-1A-role"), l("stage-1A-type")),
           "31000 - Toulouse", (6, "2026"), (7, "2026"),
           (l("stage-1A-what"), l("stage-1A-result")))
              
/* projects */

#new_section(l("projets"))

#new_project(l("projet1-name"),
  (
    l("projet1-what"),
    l("projet1-how"),
    l("projet1-why"),
    l("projet1-result"),
  ))

#new_project(l("projet2-name"),
  (
    l("projet2-what"),
    l("projet2-how"),
    l("projet2-why"),
    l("projet2-result"),
  ))

/* skills */

#new_section(l("skills"))

#new_skill(l("skill-langages-title"), l("skill-langages-list"))
#new_skill(l("skill-devops-title"), l("skill-devops-list"))
#new_skill(l("skill-methodes-title"), l("skill-methodes-list"))
#new_skill(l("skill-interets-title"), l("skill-interets-list"))
