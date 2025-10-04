#import "Templates/bilele-cv.typ": *

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
    picture: image("Assets/picture.jpg", width: 100%),
    show_picture: true,
    contact: (
      (image("Assets/mail.svg"), "bilele.elhaddadi@gmail.com"),
      (image("Assets/github.svg"), "Github"),
      (image("Assets/linkedin.svg"), "Linkedin")
    )
  )
)

#new_section("Education")

#new_education("Lycée Alfred Kastler",
              ("Baccalauréat Général", "Maths Physique"), 
              "95600 - Cergy", (1, "2000"), (2, "2001"),
              ("Réseaux",)
)

#new_section("Experience")

#new_project("Application",
              ("Réseaux",)
)

#new_section("Skills")

#new_skill("Languages :", ("C++", "Java"))
#new_skill("Soft Skills :", ("Anglais", "Français",))
