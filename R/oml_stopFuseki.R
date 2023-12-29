#' R wrapper for ./gradlew stopFuseki
#'
#' @param oml_repository
#'
#' @return output from gradle tasks
#' @export
#'
oml_stopFuseki <- function(oml_repository){
  command <- sprintf("cd %s\n ./gradlew stopFuseki", oml_repository)
  ret <- system(command, intern=TRUE)
  return(ret)
}
