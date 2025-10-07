#import "template.typ": *

// who when where how why + final result
// quantitatif et qualitatif

#show: resume.with(
  gparams: (
    firstname: "El Haddadi",
    lastname: "Bilèle",
    lang: "fr",
    position: (
      "Ingénieur informatique",
      "Étudiant ENSEEIHT",
    ),
    picture: image("assets/picture.jpg", width: 100%),
    show_picture: true,
    contact: (
      (image("assets/mail.svg"), "bilele.elhaddadi@gmail.com"),
      (image("assets/github.svg"), "TooLoss"),
      (image("assets/linkedin.svg"), "bilele-elhaddadi")
    )
  )
)

#new_section("Education")

#new_infos("Lycée Alfred Kastler",
              ("Baccalauréat Général", "Maths Physique"), 
              "95600 - Cergy", (1, "2000"), (2, "2001"),
              ("Réseaux",)
)

/* experience */

#new_section("Experience")

#new_project("Project 1",
              ("New Application who when where how why + final result", "Gives more infos")
)

/* skills */

#new_section("Skills")

#new_skill("Languages :", ("C++", "Java"))
#new_skill("Soft Skills :", ("Anglais", "Français",))
