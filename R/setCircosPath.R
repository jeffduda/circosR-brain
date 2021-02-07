setCircosPath <- function(path) {
  if ( !dir.exists(path) ) {
    exit("directory does not exist")
  }
  exe = file.path(path, 'bin', 'circos')
  if ( !file.exists(exe) ) {
    exit("circos executable not found")
  }

  Sys.setenv(CIRCOSR_CIRCOS_PATH=path)
}
