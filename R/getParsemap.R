getParsemap <- function() {

  path=getCircosTutorialsPath()
  exe = file.path(path, 'tutorials', '8', '19', 'parsemap')
  if ( !file.exists(exe) ) {
    exit("parsemap executable not found")
  }

  return(exe)

}
