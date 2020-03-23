tablaVisitas <- function(NVisitas) {
  frecAbs <- table(NVisitas)
  frecRel <- round(frecAbs/length(NVisitas), digits = 4)
  frecAbsAcum = cumsum(frecAbs)
  frecRelAcum = round(cumsum(frecAbs/length(NVisitas)), digits = 4)
  cbind(frecAbs, frecRel, frecAbs, frecAbsAcum, frecRelAcum)
}

tablaEdades <- function(Edad) {
  frecAbs <- table(cut(Edad, seq(11, 35, 3), right = "FALSE"))
  frecRel <- round(frecAbs/length(Edad), digits = 4)
  frecAbsAcum = cumsum(frecAbs)
  frecRelAcum = round(cumsum(frecAbs/length(Edad)), digits = 4)
  cbind(frecAbs, frecRel, frecAbs, frecAbsAcum, frecRelAcum)
}

tablaCruzada <- function(Signo, Sexo){
  tabla <- cbind(table(Signo, Sexo), table(Signo))
  TOTAL <- apply(tabla, 2, "sum")
  rbind(tabla, TOTAL)
}

leer <- function() {
  datos <- read.table(file = "anorexia.data", header = TRUE, sep = "", col.names = c("Signo", "Sexo", "Edad", "NVisitas"))
  attach(datos)
  tabla1 <<- tablaVisitas(NVisitas)
  tabla2 <<- tablaEdades(Edad)
  tabla3 <<- tablaCruzada(Signo, Sexo)
  print("Tabla de visitas")
  print(tabla1)
  print("Tabla de edades")
  print(tabla2)
  print("Tabla Cruzada")
  print(tabla3)
  
  # Pie chart
  frec <<- table(Signo)
  porcentajes <<- round((frec / 59) * 100)
  lbls <<- c("Uso de ropa holgada\n", "Uso de laxantes\n", "Hiperactividad\n", "Dieta severa\n")
  lbls <<- paste(lbls, porcentajes)
  lbls <<- paste(lbls, "%", sep = "")
  pie(frec, labels = lbls, col = c("red", "orange", "blue", "green"))
}
