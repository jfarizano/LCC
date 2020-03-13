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
  tabla1t <<- tablaVisitas(NVisitas)
  tabla2 <<- tablaEdades(Edad)
  tabla3 <<- tablaCruzada(Signo, Sexo)
  print(tabla1)
  print(tabla2)
  print(tabla3)
}


