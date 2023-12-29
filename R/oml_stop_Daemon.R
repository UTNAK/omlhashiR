#' R wrapper for ./gradlew --stop
#'
#' @param oml_repository
#'
#' @return output from gradle tasks
#' @export
#'
oml_stop_Daemon <- function(oml_repository){
  command <- sprintf("cd %s\n ./gradlew --stop", oml_repository)
  ret <- system(command, intern=TRUE)
  return(ret)
}
