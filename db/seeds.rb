# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
dev1 = Developer.create(email: "lamtoan557@gmail.com")
dev1.programming_languages.create(name: "Ruby")
dev1.programming_languages.create(name: "Javascript")
dev1.programming_languages.create(name: "Python")

dev1.languages.create(code: "vn")
dev1.languages.create(code: "en")


dev2 = Developer.create(email: "hmtien@gmail.com")
dev2.programming_languages.create(name: "Javascript")
dev2.programming_languages.create(name: "Python")

dev2.languages.create(code: "vn")
dev2.languages.create(code: "ja")


dev3 = Developer.create(email: "ltduong@gmail.com")
dev3.programming_languages.create(name: "Javascript")
dev3.programming_languages.create(name: "Java")
dev3.programming_languages.create(name: "Python")


dev3.languages.create(code: "vn")
dev3.languages.create(code: "ja")

dev4 = Developer.create(email: "mdlong@gmail.com")
dev4.programming_languages.create(name: "Javascript")
dev4.programming_languages.create(name: "Java")
dev3.programming_languages.create(name: "Python")


dev4.languages.create(code: "vn")
dev4.languages.create(code: "ja")
dev4.languages.create(code: "en")
