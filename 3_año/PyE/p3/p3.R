ej1 <- function() {
  veces <- c(10, 100, 1000, 10000, 100000, 1000000)
  todo = c()
  for (i in length(veces)) {
    frecAbs <- table(sample(c(0,1), veces[i], replace = T))
    frecRel <- frecAbs/veces[i]
    plot(frecRel, type = "p")
  }
  
}