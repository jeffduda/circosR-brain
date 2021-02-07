getCircosPath <- function() {
  path=Sys.getenv("CIRCOSR_CIRCOS_PATH")
  if (path=="") {
    exit("circos path not found")
  }
  exe = file.path(path, 'bin', 'circos')
  if ( !file.exists(exe) ) {
    exit("circos executable not found")
  }

  return(path)

}
