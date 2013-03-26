#encoding: UTF-8
system("rake import")
Modul.create(name: "Bachelorarbeit", credits: 15, key: "BA")

Studiengang.new(
  name: "Informatik",
  constraints: [Constraints::Credits.new(180), Constraints::StammmodulCount.new(3)],
  initial_moduls: Modul.where(
    name: [
      "Grundbegriffe der Informatik",
      "Algorithmen I",
      "Theoretische Grundlagen der Informatik",
      "Algorithmen II",

      "Programmieren",
      "Softwaretechnik I",
      "Praxis der Software-Entwicklung",
      "Betriebssysteme",
      "Kommunikation und Datenhaltung",
      "Programmierparadigmen",

      "Technische Informatik",

      "Höhere Mathematik",
      "Lineare Algebra",
      "Praktische Mathematik",

      "Teamarbeit in der Software-Entwicklung"
  ])
).save
