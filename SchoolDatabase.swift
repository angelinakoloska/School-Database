struct Student {
  let name: String
  let favoriteTeacherID: Int
}

struct Teacher {
  let id: Int
  let name: String
  let hairColor: String?
  let email: String?
}

struct School {
  let name: String
  let teachers: [Teacher]

  func getTeacher(withId id: Int) -> Teacher? {
    for teacher in teachers {
      if teacher.id == id {
        return teacher
      }
    }
      return nil
  }

  func printFavoriteTeacherInfo(for student: Student) {
    guard let favoriteTeacher = getTeacher(withId: student.favoriteTeacherID) else {
      print("No teacher with the id \(student.favoriteTeacherID) works at \(name)!")
      return
    }
    print("\(student.name)'s favorite teacher is \(favoriteTeacher.name)")
    print("They have \(favoriteTeacher.hairColor ?? "no") hair")
    guard let email = favoriteTeacher.email else {
      print("They do not have an email address on file")
      return
    }
    print("Their email adress is \(email)")
  }
}


let teachers = [
  Teacher(id: 1035, name: "Barry", hairColor: "White", email: nil),
  Teacher(id: 2304, name: "Benjamin", hairColor: nil, email: "benjamin@encinas.com"),
  Teacher(id: 5408, name: "Claire", hairColor: "Blonde", email: "claire@encinas.com")

]

let lasEncinas = School(name: "Las Encinas", teachers: teachers)

let jorge = Student(name: "Jorge G.", favoriteTeacherID: 2304)

let anna = Student(name: "Anna M.", favoriteTeacherID: 3456)

lasEncinas.printFavoriteTeacherInfo(for: jorge)
lasEncinas.printFavoriteTeacherInfo(for: anna)
