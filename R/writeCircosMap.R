writeCircosMap <- function( dat, file ) {

  fileConn<-file(file)
  writeLines(c(paste('#', paste(names(dat), collapse=' '))), fileConn)
  write.table( dat, file, append=TRUE, row.names=F, col.names=F, sep=' ', quote=FALSE)
  close(fileConn)

}
