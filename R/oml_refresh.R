#' R wrapper for refresh fuseki servers.
#'
#' @param oml_repository
#'
#' @return output from gradle tasks
#' @export
#'
oml_refresh <- function(oml_repository){
  # Find process locking port 3030 on Mac
  ret <- system("lsof -P -i:3030", intern=TRUE)
  if(!length(ret)){
    ret <- sprintf("no process is running")
  }else{
    # Extract process PID
    pid <- unlist(strsplit(ret[2], "\\s+"))[2]
    # Kill process locking port 3030 on Mac
    ret <- system(sprintf("kill -9 %s", pid), intern=TRUE)
    if(!length(ret)){
      ret <- sprintf("kill success for pid=%s", pid)
    }
  }
  return(ret)
}
