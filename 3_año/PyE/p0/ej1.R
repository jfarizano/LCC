# setwd("~/LCC/3_año/PyE/p0")

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

tablaCruzada <- function(Signo, Sexo) {
  tabla <- cbind(table(Signo, Sexo), table(Signo))
  TOTAL <- apply(tabla, 2, "sum")
  rbind(tabla, TOTAL)
}

tortaSigno <- function(Signo) {
  frec <- table(Signo)
  porcentajes <- round((frec / length(Signo)) * 100, digits = 2)
  lbls <- c("Dieta severa\n", "Hiperactividad\n", "Uso de laxantes\n", "Uso de ropa holgada\n")
  lbls <- paste(lbls, porcentajes)
  lbls <- paste(lbls, "%", sep = "")
  pie(frec, labels = lbls, col = c("red", "orange", "blue", "green"))
  mtext("PRINCIPAL SIGNO VISIBLE EN PACIENTES CON ANOREXIA\nARGENTINA, OCTUBRE 2012", side = 3, line = 0)
  mtext("Fuente: Asociación de Lucha contra la Bulimia y la Anorexia.", side = 1, adj = 0)
}

barrasSigno <- function(Signo) {
  indices <- order(table(Signo), decreasing = TRUE)
  frec <- table(Signo)[indices]
  lbls <- c("Dieta severa", "Hiperactividad", "Uso de\nlaxantes", "Uso de\nropa holgada")[indices]
  top <- "PRINCIPAL SIGNO VISIBLE EN PACIENTES CON ANOREXIA\nARGENTINA, OCTUBRE 2012"
  bot <- "Fuente: Asociación de Lucha contra la Bulimia y la Anorexia."
  barplot(frec, names.arg = lbls, horiz = TRUE, main = top, sub = bot, 
          xlab = "Número de pacientes", ylab="Signo", axisnames = TRUE, 
          xlim = c(0, 20), col = "cyan", col.axis = "blue")
}

barrasCruzadasSigno <- function(Signo, Sexo) {
  frec <- table(Signo, Sexo)
  lbls <- c("Dieta severa", "Hiperactividad", "Uso de\nlaxantes", "Uso de\nropa holgada")
  top <- "PRINCIPAL SIGNO VISIBLE EN PACIENTES CON ANOREXIA\nARGENTINA, OCTUBRE 2012"
  bot <- "Fuente: Asociación de Lucha contra la Bulimia y la Anorexia."
  barplot(table(Sexo, Signo), names.arg = lbls, main = top, sub = bot,
          horiz = TRUE, beside = TRUE, xlab = "Numero de pacientes",
          col = c("cyan", "purple"), legend.text = c("F", "M"))
}

# Hacer que muestre el 0 y el 6.
bastonesVisitas <- function(NVisitas) {
  top <- "NÚMERO DE VISITAS POR PACIENTE\nARGENTINA, OCTUBRE 2012"
  bot <- "Fuente: Asociación de Lucha contra la Bulimia y la Anorexia"
  plot(table(NVisitas), type = "h", main = top, sub = bot, xlab = "Número de visitas", ylab = "Frecuencia absoluta", ylim = c(0, 25))
  
  frecacum <- round(cumsum(table(NVisitas)/length(NVisitas)), digits = 1)
  plot(frecacum, type = "s", main = top, sub = bot, xlab = "Número de visitas", ylab = "Frecuencia relativa acumulada", ylim = c(0, 1))
  abline(h = frecacum, lty = 3)
}

histogramaEdades <- function(Edad){
  tit <- "EDADES DE LOS PACIENTES CON ANOREXIA\nARGENTINA, OCTUBRE 2012"
  bot <- "Fuente: Asociación de Lucha contra la Bulimia y la Anorexia"
  b <- seq(11, 35, 3)
  hist(Edad, main = tit, xlab = "Edades", ylab = "Frecuencia absoluta", 
       xlim = c(11, 35), ylim = c(0, 20), sub = bot, col = "green", 
       breaks = b, xaxt = "n", yaxt = "n", right = FALSE)
  axis(side = 1, at = b)
  axis(side = 2, at = seq(0, 20, 5))
  
  frecAbs <- table(cut(Edad, seq(8, 35, 3), right = FALSE))
  frecRel <- round(frecAbs/length(Edad), digits = 2)
  frecRelAcum = round(cumsum(frecAbs/length(Edad)), digits = 2)
  
  plot(frecRel, type = "l", main = tit, sub = bot, xlab = "Edad", ylab = "Frecuencia relativa", names.args = seq(11, 35, 3))
  #plot(frecRelAcum, type = "l", main = tit, sub = bot, xlab = "Edad", ylab = "Frecuencia relativa acumulada") 
}

leer <- function() {
  datos <- read.table(file = "anorexia.data", header = TRUE, sep = "", 
                      col.names = c("Signo", "Sexo", "Edad", "NVisitas"))
  attach(datos)
  tabla1 <<- tablaVisitas(NVisitas)
  tabla2 <<- tablaEdades(Edad)
  tabla3 <<- tablaCruzada(Signo, Sexo)
  torta <<- tortaSigno(Signo)
  barrasSigno(Signo)
  barrasCruzadasSigno(Signo, Sexo)
  bastonesVisitas(NVisitas)
  histogramaEdades(Edad)
  print("Tabla de visitas")
  print(tabla1)
  print("Tabla de edades")
  print(tabla2)
  print("Tabla Cruzada")
  print(tabla3)
}

