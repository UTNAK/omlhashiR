% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/oml_callTask.R
\name{oml_callTask}
\alias{oml_callTask}
\title{R wrapper for ./gradlew "taskname"}
\usage{
oml_callTask(oml_repository, task, intern = FALSE)
}
\arguments{
\item{oml_repository}{a repository of the oml project}

\item{task}{a task can be set manually (i.e: task = "build")}
}
\value{
output from gradle tasks
}
\description{
R wrapper for ./gradlew "taskname"
}
