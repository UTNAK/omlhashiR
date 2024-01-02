
<!-- README.md is generated from README.Rmd. Please edit that file -->

# omlhashiR

> R wrapper for Gradle tasks of OML projects

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

You can install the development version of “omlhashiR” from
[GitHub](https://github.com/UTNAK/omlhashiR) with:

``` r
library(devtools)
install_github("UTNAK/omlhashiR")
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
#> [3] "BUILD SUCCESSFUL in 807ms"     "1 actionable task: 1 executed"
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
#> [1] "> Task :downloadDependencies UP-TO-DATE"     
#> [2] "> Task :omlToOwl UP-TO-DATE"                 
#> [3] "> Task :owlReason UP-TO-DATE"                
#> [4] "> Task :startFuseki UP-TO-DATE"              
#> [5] "> Task :owlLoad"                             
#> [6] ""                                            
#> [7] "BUILD SUCCESSFUL in 1s"                      
#> [8] "5 actionable tasks: 1 executed, 4 up-to-date"
```

#### owlReason

    ./gradlew owlReason  

``` r
oml_owlReason(oml_repository)
#> [1] "> Task :downloadDependencies UP-TO-DATE"
#> [2] "> Task :omlToOwl UP-TO-DATE"            
#> [3] "> Task :owlReason UP-TO-DATE"           
#> [4] ""                                       
#> [5] "BUILD SUCCESSFUL in 587ms"              
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
#> [8] "BUILD SUCCESSFUL in 640ms"                   
#> [9] "6 actionable tasks: 1 executed, 5 up-to-date"
```

#### startFuseki

    ./gradlew startFuseki  

``` r
oml_startFuseki(oml_repository)
#> [1] "> Task :startFuseki UP-TO-DATE"  ""                               
#> [3] "BUILD SUCCESSFUL in 507ms"       "1 actionable task: 1 up-to-date"
```

#### stopFuseki

    ./gradlew stopFuseki  

``` r
oml_stopFuseki(oml_repository)
#> [1] ""                                             
#> [2] "> Task :stopFuseki"                           
#> [3] "Fuseki server with pid=12764 has been stopped"
#> [4] ""                                             
#> [5] "BUILD SUCCESSFUL in 505ms"                    
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
#> [1] "Starting a Gradle Daemon, 6 stopped Daemons could not be reused, use --status for details"    
#> [2] ""                                                                                             
#> [3] "> Task :startFuseki"                                                                          
#> [4] "Fuseki server has now successfully started with pid=13144, listening on http://localhost:3030"
#> [5] ""                                                                                             
#> [6] "BUILD SUCCESSFUL in 6s"                                                                       
#> [7] "1 actionable task: 1 executed"

oml_refresh()
#> [1] "kill success for pid=13144"
```

## Example workflows

We introduce a case study of an exploratory modeling workflows using
this package. The figure below shows an overview of the process.

<div class="figure">

<img src="man/figures/README-/process.png" alt="Modeling, Reasoning and Visualizing Process." width="100%" />
<p class="caption">
Modeling, Reasoning and Visualizing Process.
</p>

</div>

In this case study, we use an example OML project called [Kepler
16b](https://github.com/opencaesar/kepler16b-example). For details,
check this
[tutorial](http://www.opencaesar.io/oml-tutorials/#tutorial2). This case
study answers the question of what is the total mass of the spacecraft.
The total mass is recalculated when the mass of one subsystem is
changed.

We use a package [tansakusuR](https://github.com/UTNAK/tansakusuR) as a
wrapper to send SPARQL codes to the endpoint of [Kepler
16b](https://github.com/opencaesar/kepler16b-example).

By using the “omlhashiR” and “tansakusuR” packages, workflows can be
seamlessly connected.

### Install R wrapper package to send SPARQL codes

``` r
library(devtools)
install_github("UTNAK/tansakusuR")
```

### Start Fuseki Server and store oml model data

``` r
library(omlhashiR)
oml_repository <- "./kepler16b-example"
oml_owlLoad(oml_repository)
#>  [1] "> Task :downloadDependencies UP-TO-DATE"                                                      
#>  [2] "> Task :omlToOwl UP-TO-DATE"                                                                  
#>  [3] "> Task :owlReason UP-TO-DATE"                                                                 
#>  [4] ""                                                                                             
#>  [5] "> Task :startFuseki"                                                                          
#>  [6] "Fuseki server has now successfully started with pid=13161, listening on http://localhost:3030"
#>  [7] ""                                                                                             
#>  [8] "> Task :owlLoad"                                                                              
#>  [9] ""                                                                                             
#> [10] "BUILD SUCCESSFUL in 4s"                                                                       
#> [11] "5 actionable tasks: 2 executed, 3 up-to-date"
```

### Send SPARQL Query Codes

Before we send the SPARQL query codes, we need to set the endpoint url.
We can see the endpoint url of the “kepler16b-example” project from
<http://localhost:3030> as shown below.

<div class="figure">

<img src="man/figures/README-/fusekiserver.png" alt="Fuseki server screen shot." width="100%" />
<p class="caption">
Fuseki server screen shot.
</p>

</div>

Here we set the endpoint_url.

``` r
library(tansakusuR)
endpoint_url <- "http://localhost:3030/tutorial2/sparql"
```

Below is query codes that extract components and containment relations.

``` r
query_string <-'
PREFIX base:        <http://example.com/tutorial2/vocabulary/base#>
PREFIX mission:     <http://example.com/tutorial2/vocabulary/mission#>
PREFIX vim4:            <http://bipm.org/jcgm/vim4#>

SELECT DISTINCT ?c1_id ?c1_name ?c1_mass ?c2_id ?c2_name
WHERE {
    ?c1 a mission:Component ;
        base:hasIdentifier ?c1_id ;
        base:hasCanonicalName ?c1_name .
    OPTIONAL {
        ?c1 base:isContainedIn ?c2 .
        ?c2 base:hasIdentifier ?c2_id ;
            base:hasCanonicalName ?c2_name .
    }
}
ORDER BY ?c1_id ?c2_id 
'
```

#### Send Query

We can send a SPARQL query using `tansakusuR::send_query`.

``` r
data_frame <- tansakusuR::send_query(endpoint_url,query_string)
```

#### Visualize

We can check the query results as a tabular views as follows.

``` r
# visualize dataframe
library(DT)
datatable(data_frame, options = list(pageLength = -1))
```

<div class="figure">

<img src="man/figures/README-/table01.png" alt="Table without mass properties" width="100%" />
<p class="caption">
Table without mass properties
</p>

</div>

### Modify Query

Next, we modify the query codes to get mass properties.

``` r
query_string2 <-'
PREFIX base:        <http://example.com/tutorial2/vocabulary/base#>
PREFIX mission:     <http://example.com/tutorial2/vocabulary/mission#>
PREFIX vim4:            <http://bipm.org/jcgm/vim4#>

SELECT DISTINCT ?c1_id ?c1_name ?c1_mass ?c2_id ?c2_name
WHERE {
    ?c1 a mission:Component ;
        base:hasIdentifier ?c1_id ;
        base:hasCanonicalName ?c1_name .
    OPTIONAL {
        ?c1 base:isContainedIn ?c2 .
        ?c2 base:hasIdentifier ?c2_id ;
            base:hasCanonicalName ?c2_name .
    }
    OPTIONAL {
        ?c1_mass_mag vim4:characterizes ?c1 ;
            vim4:hasDoubleNumber ?c1_mass .
    }
}
ORDER BY ?c1_id ?c2_id 
'
```

#### Send Query

``` r
data_frame <- tansakusuR::send_query(endpoint_url,query_string2)
```

#### Visualize

``` r
datatable(data_frame, options = list(pageLength = -1))
```

<div class="figure">

<img src="man/figures/README-/table02.png" alt="Table with mass properties" width="100%" />
<p class="caption">
Table with mass properties
</p>

</div>

### Analyse

What is a total mass of the Orbiter Spacecraft?

``` r
library(dplyr)
#> Warning: package 'dplyr' was built under R version 4.3.1
#> 
#> Attaching package: 'dplyr'
#> The following object is masked from 'package:tansakusuR':
#> 
#>     show_query
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
df <- data_frame %>% 
  filter(c2_name == "Orbiter Spacecraft") %>%
  select(c1_id, c1_name, c1_mass) %>%
  mutate(c1_mass = as.integer(c1_mass))

total_mass <- sum(df$c1_mass)
total_mass
#> [1] 1957
```

### Modify the oml descriptions

Next, we modify the mass property of the Orbiter GN&C Subsystem from
156.0 kg to 200.0 kg in
“src/oml/example.com/tutorials/description/masses.oml”.

<div class="figure">

<img src="man/figures/README-/changemass.png" alt="Change the mass property of GNC subsystem in src/oml/example.com/tutorials/description/masses.oml." width="100%" />
<p class="caption">
Change the mass property of GNC subsystem in
src/oml/example.com/tutorials/description/masses.oml.
</p>

</div>

### Run the owlLoad task

Then we run the `owlLoad` task to update the data on our fuseki server.

``` r
oml_owlLoad(oml_repository)
#> [1] "> Task :downloadDependencies UP-TO-DATE"
#> [2] "> Task :omlToOwl UP-TO-DATE"            
#> [3] "> Task :owlReason UP-TO-DATE"           
#> [4] "> Task :startFuseki UP-TO-DATE"         
#> [5] "> Task :owlLoad UP-TO-DATE"             
#> [6] ""                                       
#> [7] "BUILD SUCCESSFUL in 689ms"              
#> [8] "5 actionable tasks: 5 up-to-date"
```

### Send the query again

Now we send our SPARQL query codes again to check the update.

#### Send query

``` r
data_frame <- tansakusuR::send_query(endpoint_url,query_string2)
```

#### Visualize

``` r
datatable(data_frame, options = list(pageLength = -1))
```

<div class="figure">

<img src="man/figures/README-/table03.png" alt="Table with mass properties after modification of GNC mass" width="100%" />
<p class="caption">
Table with mass properties after modification of GNC mass
</p>

</div>

### Analyse

What is a total mass of the Orbiter Spacecraft?

``` r
library(dplyr)
df <- data_frame %>% 
  filter(c2_name == "Orbiter Spacecraft") %>%
  select(c1_id, c1_name, c1_mass) %>%
  mutate(c1_mass = as.integer(c1_mass))

total_mass <- sum(df$c1_mass)
total_mass
#> [1] 2001
```

### Summary

We demonstrated a case study of documenting the trial and error of the
modeling process in a reproducible manner using Quarto documentation.
[omlhashiR](https://github.com/UTNAK/omlhashiR)is a wrapper for
executing gradle tasks from R.
[tansakusuR](https://github.com/UTNAK/tansakusuR) is a wrapper for
sending SPARQL codes to the endpoint from R.
