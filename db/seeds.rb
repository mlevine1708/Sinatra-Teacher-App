micah = Users.create(name: "Micah", grade_level: 5, username: "mlevine", password: "password")
brett = Users.create(name: "Brett", grade_level: 4, username: "blebowitz", password: "password")

Assignments.create(title: "SS 1", subject: "Social Studies", user_id: micah.id)


Students.create(name: "Eli", grade_level: 5)