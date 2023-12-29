#' R wrapper for ./gradlew clean
#'
#' @param oml_repo  a repository of the oml project
#'
#' @return output from gradle tasks
#' @export
#'
oml_clean <- function(oml_repository){
  command <- sprintf("cd %s\n ./gradlew clean", oml_repository)
  ret <- system(command, intern=TRUE)
  return(ret)
}
