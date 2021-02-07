getCircosTutorialsPath <- function() {
  path=Sys.getenv("CIRCOSR_TUTORIALS_PATH")
  if (path=="") {
    exit("circos-tutorials path not found")
  }
  exe = file.path(path, 'tutorials', '8', '19', 'parsemap')
  if ( !file.exists(exe) ) {
    exit("parsemap executable not found")
  }

  return(path)

}
