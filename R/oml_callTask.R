#' R wrapper for ./gradlew "taskname"
#'
#' @param oml_repository  a repository of the oml project
#'
#' @param task a task can be set manually (i.e: task = "build")
#'
#' @return output from gradle tasks
#' @export
#'
oml_callTask <- function(oml_repository, task){
  command <- sprintf("cd %s\n ./gradlew %s", oml_repository, task)
  ret <- system(command, intern=TRUE)
  return(ret)
}
