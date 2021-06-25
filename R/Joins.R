# JOINS CON DPLYR ----

# Cargar librerías requeridas
library(dplyr)

# COMBINAR VARIABLES ----

# Datos de prueba ----

x <- tibble(id = c(1, 2, 3),
            Var_x = c("X1", "X2", "X3"))

y <- tibble(id = c(1, 2, 4),
            Var_y = c("Y1", "Y2", "Y4"))

y_extra <- tibble(id = c(1, 2, 4, 2),
                  Var_y = c("Y1", "Y2", "Y4", "Y5"))

#  left_joint ----

left_join(x, y, by = "id")

left_join(x, y_extra, by = "id")

#  right_join ----

right_join(x, y, by = "id")

#  full_join ----

full_join(x, y, by = "id")

#  inner_join ----

inner_join(x, y, by = "id")

#  semi_join ----

semi_join(x, y, by = "id")

#  anti_join ----

anti_join(x, y, by = "id")

# Otros ejemplos ----

# Crear bases de datos

# id diferentes ----

superheroes <- tibble::tribble(
  ~nombre,   ~papel,   ~sexo,        ~estudio,
  "Magneto",  "bad",  "male",        "Marvel",
  "Storm",    "good", "female",      "Marvel",
  "Mystique", "bad",  "female",      "Marvel",
  "Batman",   "good", "male",        "DC",
  "Joker",    "bad",  "male",        "DC",
  "Catwoman", "bad",  "female",      "DC",
  "Hellboy",  "good", "male",        "Dark Horse Comics"
)

estudios <- tibble::tribble(
  ~estudio_final, ~fundacion,
  "DC",       1934L,
  "Marvel",   1939L,
  "Image",    1992L
)


# Usar left_join

left_join(superheroes, estudios,  by = c("estudio" = "estudio_final"))

# Doble id ----

Curso <- tibble(Nombre = c("Alberto", "Andres", "Ana", "Gloria", "Alberto", "Ana", "Aleja", "Leo", "Ana"),
                Apellidos = c("Rodríguez", "Gomez", "Diaz", "Ruiz", "Mendez", "Lopez", "Perez", "Riaño", "Diaz"),
                Edad = c(13, 15, 65, 23, 34, 45, 37, 25, 43))

Notas <- tibble(Nombre = c("Alberto", "Carlos", "Ana", "Leo", "Ana", "Claudia", "Alberto"),
                Apellidos = c("Rodríguez", "Diaz", "Rodríguez", "Riaño", "Diaz", "Neira", "Campos"),
                Sexo = c("M", "M", "F", "M", "F", "F", "M"),
                Notas = c(1.4, 2.5, 4.5, 4.2, 3.6, 3.2, 2.5))


# Usar left_joint

left_join(Curso, Notas, by = c("Nombre", "Apellidos"))
