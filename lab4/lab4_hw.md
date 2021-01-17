---
title: "Lab 4 Homework"
author: "Fiona Beyerle"
date: "1/14/21"
output:
  html_document: 
    theme: spacelab
    keep_md: yes
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

## Load the tidyverse

```r
library(tidyverse)
```


```r
getwd()
```

```
## [1] "/Users/fionabeyerle/Desktop/BIS15W2021_fbeyerle/lab4"
```

## Data
For the homework, we will use data about vertebrate home range sizes. The data are in the class folder, but the reference is below.  

**Database of vertebrate home range sizes.**  
Reference: Tamburello N, Cote IM, Dulvy NK (2015) Energy and the scaling of animal space use. The American Naturalist 186(2):196-211. http://dx.doi.org/10.1086/682070.  
Data: http://datadryad.org/resource/doi:10.5061/dryad.q5j65/1  

**1. Load the data into a new object called `homerange`.**

```r
homerange <- readr::read_csv("data/Tamburelloetal_HomeRangeDatabase.csv")
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   .default = col_character(),
##   mean.mass.g = col_double(),
##   log10.mass = col_double(),
##   mean.hra.m2 = col_double(),
##   log10.hra = col_double(),
##   preymass = col_double(),
##   log10.preymass = col_double(),
##   PPMR = col_double()
## )
## ℹ Use `spec()` for the full column specifications.
```

```r
homerange
```

```
## # A tibble: 569 x 24
##    taxon common.name class order family genus species primarymethod N    
##    <chr> <chr>       <chr> <chr> <chr>  <chr> <chr>   <chr>         <chr>
##  1 lake… american e… acti… angu… angui… angu… rostra… telemetry     16   
##  2 rive… blacktail … acti… cypr… catos… moxo… poecil… mark-recaptu… <NA> 
##  3 rive… central st… acti… cypr… cypri… camp… anomal… mark-recaptu… 20   
##  4 rive… rosyside d… acti… cypr… cypri… clin… fundul… mark-recaptu… 26   
##  5 rive… longnose d… acti… cypr… cypri… rhin… catara… mark-recaptu… 17   
##  6 rive… muskellunge acti… esoc… esoci… esox  masqui… telemetry     5    
##  7 mari… pollack     acti… gadi… gadid… poll… pollac… telemetry     2    
##  8 mari… saithe      acti… gadi… gadid… poll… virens  telemetry     2    
##  9 mari… lined surg… acti… perc… acant… acan… lineat… direct obser… <NA> 
## 10 mari… orangespin… acti… perc… acant… naso  litura… telemetry     8    
## # … with 559 more rows, and 15 more variables: mean.mass.g <dbl>,
## #   log10.mass <dbl>, alternative.mass.reference <chr>, mean.hra.m2 <dbl>,
## #   log10.hra <dbl>, hra.reference <chr>, realm <chr>, thermoregulation <chr>,
## #   locomotion <chr>, trophic.guild <chr>, dimension <chr>, preymass <dbl>,
## #   log10.preymass <dbl>, PPMR <dbl>, prey.size.reference <chr>
```

**2. Explore the data. Show the dimensions, column names, classes for each variable, and a statistical summary. Keep these as separate code chunks.**  

```r
glimpse(homerange)
```

```
## Rows: 569
## Columns: 24
## $ taxon                      <chr> "lake fishes", "river fishes", "river fish…
## $ common.name                <chr> "american eel", "blacktail redhorse", "cen…
## $ class                      <chr> "actinopterygii", "actinopterygii", "actin…
## $ order                      <chr> "anguilliformes", "cypriniformes", "cyprin…
## $ family                     <chr> "anguillidae", "catostomidae", "cyprinidae…
## $ genus                      <chr> "anguilla", "moxostoma", "campostoma", "cl…
## $ species                    <chr> "rostrata", "poecilura", "anomalum", "fund…
## $ primarymethod              <chr> "telemetry", "mark-recapture", "mark-recap…
## $ N                          <chr> "16", NA, "20", "26", "17", "5", "2", "2",…
## $ mean.mass.g                <dbl> 887.00, 562.00, 34.00, 4.00, 4.00, 3525.00…
## $ log10.mass                 <dbl> 2.9479236, 2.7497363, 1.5314789, 0.6020600…
## $ alternative.mass.reference <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
## $ mean.hra.m2                <dbl> 282750.00, 282.10, 116.11, 125.50, 87.10, …
## $ log10.hra                  <dbl> 5.4514026, 2.4504031, 2.0648696, 2.0986437…
## $ hra.reference              <chr> "Minns, C. K. 1995. Allometry of home rang…
## $ realm                      <chr> "aquatic", "aquatic", "aquatic", "aquatic"…
## $ thermoregulation           <chr> "ectotherm", "ectotherm", "ectotherm", "ec…
## $ locomotion                 <chr> "swimming", "swimming", "swimming", "swimm…
## $ trophic.guild              <chr> "carnivore", "carnivore", "carnivore", "ca…
## $ dimension                  <chr> "3D", "2D", "2D", "2D", "2D", "2D", "2D", …
## $ preymass                   <dbl> NA, NA, NA, NA, NA, NA, 1.39, NA, NA, NA, …
## $ log10.preymass             <dbl> NA, NA, NA, NA, NA, NA, 0.1430148, NA, NA,…
## $ PPMR                       <dbl> NA, NA, NA, NA, NA, NA, 530, NA, NA, NA, N…
## $ prey.size.reference        <chr> NA, NA, NA, NA, NA, NA, "Brose U, et al. 2…
```


```r
dim(homerange)
```

```
## [1] 569  24
```


```r
names(homerange)
```

```
##  [1] "taxon"                      "common.name"               
##  [3] "class"                      "order"                     
##  [5] "family"                     "genus"                     
##  [7] "species"                    "primarymethod"             
##  [9] "N"                          "mean.mass.g"               
## [11] "log10.mass"                 "alternative.mass.reference"
## [13] "mean.hra.m2"                "log10.hra"                 
## [15] "hra.reference"              "realm"                     
## [17] "thermoregulation"           "locomotion"                
## [19] "trophic.guild"              "dimension"                 
## [21] "preymass"                   "log10.preymass"            
## [23] "PPMR"                       "prey.size.reference"
```


```r
summary(homerange)
```

```
##     taxon           common.name           class              order          
##  Length:569         Length:569         Length:569         Length:569        
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##                                                                             
##     family             genus             species          primarymethod     
##  Length:569         Length:569         Length:569         Length:569        
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##                                                                             
##       N              mean.mass.g        log10.mass     
##  Length:569         Min.   :      0   Min.   :-0.6576  
##  Class :character   1st Qu.:     50   1st Qu.: 1.6990  
##  Mode  :character   Median :    330   Median : 2.5185  
##                     Mean   :  34602   Mean   : 2.5947  
##                     3rd Qu.:   2150   3rd Qu.: 3.3324  
##                     Max.   :4000000   Max.   : 6.6021  
##                                                        
##  alternative.mass.reference  mean.hra.m2          log10.hra     
##  Length:569                 Min.   :0.000e+00   Min.   :-1.523  
##  Class :character           1st Qu.:4.500e+03   1st Qu.: 3.653  
##  Mode  :character           Median :3.934e+04   Median : 4.595  
##                             Mean   :2.146e+07   Mean   : 4.709  
##                             3rd Qu.:1.038e+06   3rd Qu.: 6.016  
##                             Max.   :3.551e+09   Max.   : 9.550  
##                                                                 
##  hra.reference         realm           thermoregulation    locomotion       
##  Length:569         Length:569         Length:569         Length:569        
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##                                                                             
##  trophic.guild       dimension            preymass         log10.preymass   
##  Length:569         Length:569         Min.   :     0.67   Min.   :-0.1739  
##  Class :character   Class :character   1st Qu.:    20.02   1st Qu.: 1.3014  
##  Mode  :character   Mode  :character   Median :    53.75   Median : 1.7304  
##                                        Mean   :  3989.88   Mean   : 2.0188  
##                                        3rd Qu.:   363.35   3rd Qu.: 2.5603  
##                                        Max.   :130233.20   Max.   : 5.1147  
##                                        NA's   :502         NA's   :502      
##       PPMR         prey.size.reference
##  Min.   :  0.380   Length:569         
##  1st Qu.:  3.315   Class :character   
##  Median :  7.190   Mode  :character   
##  Mean   : 31.752                      
##  3rd Qu.: 15.966                      
##  Max.   :530.000                      
##  NA's   :502
```

**3. Change the class of the variables `taxon` and `order` to factors and display their levels.**  

```r
class(homerange$taxon)
```

```
## [1] "character"
```

```r
class(homerange$order)
```

```
## [1] "character"
```


```r
homerange$taxon <- as.factor(homerange$taxon)
class(homerange$taxon)
```

```
## [1] "factor"
```

```r
homerange$order <- as.factor(homerange$order)
class(homerange$order)
```

```
## [1] "factor"
```


```r
levels(homerange$taxon)
```

```
## [1] "birds"         "lake fishes"   "lizards"       "mammals"      
## [5] "marine fishes" "river fishes"  "snakes"        "tortoises"    
## [9] "turtles"
```


```r
levels(homerange$order)
```

```
##  [1] "accipitriformes"    "afrosoricida"       "anguilliformes"    
##  [4] "anseriformes"       "apterygiformes"     "artiodactyla"      
##  [7] "caprimulgiformes"   "carnivora"          "charadriiformes"   
## [10] "columbidormes"      "columbiformes"      "coraciiformes"     
## [13] "cuculiformes"       "cypriniformes"      "dasyuromorpha"     
## [16] "dasyuromorpia"      "didelphimorphia"    "diprodontia"       
## [19] "diprotodontia"      "erinaceomorpha"     "esociformes"       
## [22] "falconiformes"      "gadiformes"         "galliformes"       
## [25] "gruiformes"         "lagomorpha"         "macroscelidea"     
## [28] "monotrematae"       "passeriformes"      "pelecaniformes"    
## [31] "peramelemorphia"    "perciformes"        "perissodactyla"    
## [34] "piciformes"         "pilosa"             "proboscidea"       
## [37] "psittaciformes"     "rheiformes"         "roden"             
## [40] "rodentia"           "salmoniformes"      "scorpaeniformes"   
## [43] "siluriformes"       "soricomorpha"       "squamata"          
## [46] "strigiformes"       "struthioniformes"   "syngnathiformes"   
## [49] "testudines"         "tetraodontiformes\xa0" "tinamiformes"
```

**4. What taxa are represented in the `homerange` data frame? Make a new data frame `taxa` that is restricted to taxon, common name, class, order, family, genus, species.**  

```r
taxa <- select(homerange, "taxon", "common.name", "class", "order", "family", "genus", "species")
taxa
```

```
## # A tibble: 569 x 7
##    taxon     common.name       class      order     family    genus    species  
##    <fct>     <chr>             <chr>      <fct>     <chr>     <chr>    <chr>    
##  1 lake fis… american eel      actinopte… anguilli… anguilli… anguilla rostrata 
##  2 river fi… blacktail redhor… actinopte… cyprinif… catostom… moxosto… poecilura
##  3 river fi… central stonerol… actinopte… cyprinif… cyprinid… campost… anomalum 
##  4 river fi… rosyside dace     actinopte… cyprinif… cyprinid… clinost… funduloi…
##  5 river fi… longnose dace     actinopte… cyprinif… cyprinid… rhinich… cataract…
##  6 river fi… muskellunge       actinopte… esocifor… esocidae  esox     masquino…
##  7 marine f… pollack           actinopte… gadiform… gadidae   pollach… pollachi…
##  8 marine f… saithe            actinopte… gadiform… gadidae   pollach… virens   
##  9 marine f… lined surgeonfish actinopte… percifor… acanthur… acanthu… lineatus 
## 10 marine f… orangespine unic… actinopte… percifor… acanthur… naso     lituratus
## # … with 559 more rows
```

**5. The variable `taxon` identifies the large, common name groups of the species represented in `homerange`. Make a table the shows the counts for each of these `taxon`.**  

```r
table(homerange$taxon)
```

```
## 
##         birds   lake fishes       lizards       mammals marine fishes 
##           140             9            11           238            90 
##  river fishes        snakes     tortoises       turtles 
##            14            41            12            14
```

**6. The species in `homerange` are also classified into trophic guilds. How many species are represented in each trophic guild.**  


```r
table(homerange$trophic.guild)
```

```
## 
## carnivore herbivore 
##       342       227
```


```r
trophic_guild <- select(homerange, trophic.guild, species)
trophic_guild
```

```
## # A tibble: 569 x 2
##    trophic.guild species    
##    <chr>         <chr>      
##  1 carnivore     rostrata   
##  2 carnivore     poecilura  
##  3 carnivore     anomalum   
##  4 carnivore     funduloides
##  5 carnivore     cataractae 
##  6 carnivore     masquinongy
##  7 carnivore     pollachius 
##  8 carnivore     virens     
##  9 herbivore     lineatus   
## 10 herbivore     lituratus  
## # … with 559 more rows
```

```r
homerange %>% 
select(trophic.guild, species) %>%
group_by(trophic.guild) %>%
summarize(n=n())
```

```
## `summarise()` ungrouping output (override with `.groups` argument)
```

```
## # A tibble: 2 x 2
##   trophic.guild     n
##   <chr>         <int>
## 1 carnivore       342
## 2 herbivore       227
```

**7. Make two new data frames, one which is restricted to carnivores and another that is restricted to herbivores.**  

```r
homerange$trophic.guild <- as.factor(homerange$trophic.guild)
homerange$trophic.guild
```

```
##   [1] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
##   [8] carnivore herbivore herbivore herbivore herbivore carnivore carnivore
##  [15] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
##  [22] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
##  [29] carnivore carnivore carnivore carnivore carnivore carnivore herbivore
##  [36] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
##  [43] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
##  [50] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
##  [57] carnivore carnivore carnivore carnivore carnivore herbivore herbivore
##  [64] herbivore carnivore herbivore herbivore herbivore herbivore herbivore
##  [71] herbivore herbivore herbivore herbivore herbivore herbivore carnivore
##  [78] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
##  [85] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
##  [92] carnivore carnivore carnivore herbivore carnivore carnivore carnivore
##  [99] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [106] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [113] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [120] herbivore carnivore carnivore carnivore herbivore herbivore herbivore
## [127] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [134] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [141] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [148] carnivore carnivore herbivore herbivore herbivore herbivore herbivore
## [155] herbivore herbivore herbivore carnivore herbivore carnivore carnivore
## [162] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [169] herbivore herbivore carnivore carnivore herbivore herbivore carnivore
## [176] carnivore herbivore carnivore carnivore carnivore carnivore carnivore
## [183] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [190] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [197] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [204] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [211] herbivore carnivore carnivore carnivore carnivore carnivore carnivore
## [218] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [225] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [232] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [239] carnivore herbivore herbivore herbivore carnivore carnivore carnivore
## [246] carnivore carnivore carnivore carnivore carnivore carnivore herbivore
## [253] herbivore carnivore carnivore herbivore herbivore herbivore herbivore
## [260] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [267] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [274] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [281] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [288] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [295] herbivore carnivore carnivore carnivore carnivore carnivore carnivore
## [302] carnivore herbivore carnivore carnivore carnivore carnivore carnivore
## [309] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [316] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [323] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [330] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [337] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [344] carnivore herbivore herbivore carnivore carnivore carnivore carnivore
## [351] carnivore carnivore carnivore carnivore carnivore carnivore herbivore
## [358] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [365] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [372] herbivore herbivore herbivore herbivore carnivore carnivore herbivore
## [379] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [386] herbivore herbivore herbivore herbivore herbivore herbivore carnivore
## [393] carnivore carnivore carnivore carnivore carnivore herbivore herbivore
## [400] herbivore herbivore herbivore herbivore carnivore herbivore herbivore
## [407] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [414] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [421] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [428] herbivore herbivore carnivore herbivore herbivore herbivore herbivore
## [435] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [442] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [449] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [456] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [463] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [470] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [477] herbivore herbivore herbivore herbivore herbivore carnivore carnivore
## [484] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [491] carnivore herbivore carnivore carnivore carnivore carnivore carnivore
## [498] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [505] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [512] carnivore carnivore carnivore carnivore carnivore carnivore herbivore
## [519] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [526] herbivore carnivore herbivore carnivore carnivore carnivore carnivore
## [533] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [540] carnivore carnivore carnivore carnivore carnivore carnivore carnivore
## [547] carnivore carnivore carnivore carnivore carnivore herbivore herbivore
## [554] carnivore carnivore carnivore herbivore herbivore herbivore herbivore
## [561] herbivore herbivore herbivore herbivore herbivore herbivore herbivore
## [568] herbivore carnivore
## Levels: carnivore herbivore
```


```r
carnivore <- homerange %>%
filter(trophic.guild== "carnivore")
```


```r
herbivore <- homerange %>% 
filter(trophic.guild== "herbivore")
```

**8. Do herbivores or carnivores have, on average, a larger `mean.hra.m2`? Remove any NAs from the data.**  

```r
herbivore_mean <- herbivore$mean.hra.m2
mean(herbivore_mean, na.rm=T)
```

```
## [1] 34137012
```


```r
carnivore_mean <- carnivore$mean.hra.m2
mean(carnivore_mean, na.rm=T)
```

```
## [1] 13039918
```

**9. Make a new dataframe `deer` that is limited to the mean mass, log10 mass, family, genus, and species of deer in the database. The family for deer is cervidae. Arrange the data in descending order by log10 mass. Which is the largest deer? What is its common name?**  

```r
deer <- homerange%>%
filter(family=="cervidae") %>%
select(family, genus, species, mean.mass.g, log10.mass) %>%
arrange(desc(log10.mass))
```

**10. As measured by the data, which snake species has the smallest homerange? Show all of your work, please. Look this species up online and tell me about it!** **Snake is found in taxon column**    

```r
snake <- homerange %>%
filter(taxon=="snakes") %>%
arrange (log10.hra)
```

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.   
