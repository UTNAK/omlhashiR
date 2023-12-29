#' R wrapper for ./gradlew build
#'
#' @param oml_repo  a repository of the oml project
#'
#' @return output from gradle tasks
#' @export
#'
oml_build <- function(oml_repository){
  command <- sprintf("cd %s\n ./gradlew build", oml_repository)
  ret <- system(command, intern=TRUE)
  return(ret)
}
