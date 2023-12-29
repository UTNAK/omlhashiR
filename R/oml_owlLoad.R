#' R wrapper for ./gradlew owlLoad
#'
#' @param oml_repository
#'
#' @return output from gradle tasks
#' @export
#'
oml_owlLoad <- function(oml_repository){
  command <- sprintf("cd %s\n ./gradlew owlLoad", oml_repository)
  ret <- system(command, intern=TRUE)
  return(ret)
}
