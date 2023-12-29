#' R wrapper for ./gradlew owlReason
#'
#' @param oml_repository
#'
#' @return output from gradle tasks
#' @export
#'
oml_owlReason <- function(oml_repository){
  command <- sprintf("cd %s\n ./gradlew owlReason", oml_repository)
  ret <- system(command, intern=TRUE)
  return(ret)
}
