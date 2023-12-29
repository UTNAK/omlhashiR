
<!-- README.md is generated from README.Rmd. Please edit that file -->

# omlhashiR

R wrapper for Gradle tasks of OML projects

This package allows users to run Gradle tasks of OML projects from R.
Note: Only Mac OS has been tested.

[OML projects](https://www.opencaesar.io/oml-tutorials/#getting-ready)
created by [openCAESAR](https://www.opencaesar.io/) are Gradle projects
that have OML analysis tools configured as Gradle tasks in a
build.gradle script. A user can invoke Gradle tasks from a
console/terminal session using the Gradle Wrapper Command-Line Interface
(e.g., ./gradlew owlLoad). The supported OML editors such as [OML
Rosetta](https://github.com/opencaesar/oml-rosetta) and [OML
Luxor](https://github.com/opencaesar/oml-luxor) allow invoking those
Gradle tasks using a UI.

In the MBSE practice using openCAESAR, the vocabularies are described to
answer analysis questions. Typically, the process is iterative. Build
OML vocabularies and descriptions, write queries in the SPARQL language
for analysis, and modify the model based on the query results in an
exploratory manner.

This package aims to improve the reproducibility of the exploratory
modeling process with documentation tools such as [R
Markdown](https://rmarkdown.rstudio.com/) and
[Quarto](https://quarto.org/).

## Installation

You can install the development version of “tansakusuR” from
[GitHub](https://github.com/UTNAK/omlhashiR) with:

``` r
# library(devtools)
# install_github("UTNAK/omlhashiR")
```

## Usage

### Prepare an OML project

Here is an example OML project called [Kepler
16b](https://github.com/opencaesar/kepler16b-example). For details,
check this
[tutorial](http://www.opencaesar.io/oml-tutorials/#tutorial2).

    git clone https://github.com/opencaesar/kepler16b-example.git

### Run Gradle Tasks

``` r
library(omlhashiR)
oml_repository <- "./kepler16b-example"
```

#### clean

    ./gradlew clean 

``` r
oml_clean(oml_repository)
#> [1] "> Task :clean"                 ""                             
#> [3] "BUILD SUCCESSFUL in 647ms"     "1 actionable task: 1 executed"
```

#### build

    ./gradlew build  

``` r
oml_build(oml_repository)
#>  [1] "> Task :omlZip"                 "> Task :assemble"              
#>  [3] "> Task :downloadDependencies"   "> Task :omlToOwl"              
#>  [5] "> Task :owlReason"              "> Task :check"                 
#>  [7] "> Task :build"                  ""                              
#>  [9] "BUILD SUCCESSFUL in 3s"         "4 actionable tasks: 4 executed"
```

#### owlLoad

    ./gradlew owlLoad  

``` r
oml_owlLoad(oml_repository)
#>  [1] "> Task :downloadDependencies UP-TO-DATE"                                                      
#>  [2] "> Task :omlToOwl UP-TO-DATE"                                                                  
#>  [3] "> Task :owlReason UP-TO-DATE"                                                                 
#>  [4] ""                                                                                             
#>  [5] "> Task :startFuseki"                                                                          
#>  [6] "Fuseki server has now successfully started with pid=25146, listening on http://localhost:3030"
#>  [7] ""                                                                                             
#>  [8] "> Task :owlLoad"                                                                              
#>  [9] ""                                                                                             
#> [10] "BUILD SUCCESSFUL in 4s"                                                                       
#> [11] "5 actionable tasks: 2 executed, 3 up-to-date"
```

#### owlReason

    ./gradlew owlReason  

``` r
oml_owlReason(oml_repository)
#> [1] "> Task :downloadDependencies UP-TO-DATE"
#> [2] "> Task :omlToOwl UP-TO-DATE"            
#> [3] "> Task :owlReason UP-TO-DATE"           
#> [4] ""                                       
#> [5] "BUILD SUCCESSFUL in 565ms"              
#> [6] "3 actionable tasks: 3 up-to-date"
```

#### owlQuery

    ./gradlew owlQuery  

``` r
oml_owlQuery(oml_repository)
#> [1] "> Task :downloadDependencies UP-TO-DATE"     
#> [2] "> Task :omlToOwl UP-TO-DATE"                 
#> [3] "> Task :owlReason UP-TO-DATE"                
#> [4] "> Task :startFuseki UP-TO-DATE"              
#> [5] "> Task :owlLoad UP-TO-DATE"                  
#> [6] "> Task :owlQuery"                            
#> [7] ""                                            
#> [8] "BUILD SUCCESSFUL in 772ms"                   
#> [9] "6 actionable tasks: 1 executed, 5 up-to-date"
```

#### startFuseki

    ./gradlew startFuseki  

``` r
oml_startFuseki(oml_repository)
#> [1] "> Task :startFuseki UP-TO-DATE"  ""                               
#> [3] "BUILD SUCCESSFUL in 528ms"       "1 actionable task: 1 up-to-date"
```

#### stopFuseki

    ./gradlew stopFuseki  

``` r
oml_stopFuseki(oml_repository)
#> [1] ""                                             
#> [2] "> Task :stopFuseki"                           
#> [3] "Fuseki server with pid=25146 has been stopped"
#> [4] ""                                             
#> [5] "BUILD SUCCESSFUL in 506ms"                    
#> [6] "1 actionable task: 1 executed"
```

#### –stop

    ./gradlew --stop 

``` r
oml_stop_Daemon(oml_repository)
#> [1] "Stopping Daemon(s)" "1 Daemon stopped"
```

#### kill pid

This process is not a gradle task but we often use this for killing
existing fuseki server PIDs. When Fuseki server has failed to start,
this command helps to solve the issue in some case.

``` r
oml_startFuseki(oml_repository)
#> [1] "Starting a Gradle Daemon, 8 stopped Daemons could not be reused, use --status for details"    
#> [2] ""                                                                                             
#> [3] "> Task :startFuseki"                                                                          
#> [4] "Fuseki server has now successfully started with pid=25223, listening on http://localhost:3030"
#> [5] ""                                                                                             
#> [6] "BUILD SUCCESSFUL in 7s"                                                                       
#> [7] "1 actionable task: 1 executed"

oml_refresh()
#> [1] "kill success for pid=25223"
```
