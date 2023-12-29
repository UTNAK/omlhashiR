#' R wrapper for ./gradlew owlQuery
#'
#' @param oml_repository
#'
#' @return output from gradle tasks
#' @export
#'
oml_owlQuery <- function(oml_repository){
  command <- sprintf("cd %s\n ./gradlew owlQuery", oml_repository)
  ret <- system(command, intern=TRUE)
  return(ret)
}
