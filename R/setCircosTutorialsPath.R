setCircosTutorialsPath <- function(path) {
  if ( !dir.exists(path) ) {
    exit("directory does not exist")
  }
  exe = file.path(path, 'tutorials', '8', '19', 'parsemap')
  if ( !file.exists(exe) ) {
    exit("parsemap executable not found")
  }

  Sys.setenv(CIRCOSR_TUTORIALS_PATH=path)
}
