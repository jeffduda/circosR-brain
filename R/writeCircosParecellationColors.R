writeCircosParcellationColors <- function( dat, file ) {

  colorName = tolower(gsub("[^[:alnum:]]", "", dat$name))
  rgb = col2rgb(dat$color)
  lines = paste0( colorName, " = ", rgb[1,], ",", rgb[2], ",", rgb[3,] )

  lines = c( paste("#", file), lines )

  fileConn<-file(file)
  writeLines(lines, fileConn)
  close(fileConn)

}
