getCircos <- function() {

  path=getCircosPath()
  exe = file.path(path, 'bin', 'circos')
  if ( !file.exists(exe) ) {
    exit("circos executable not found")
  }

  return(exe)

}
