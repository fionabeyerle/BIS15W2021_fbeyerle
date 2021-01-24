---
title: "Lab 6 Homework"
author: "Fiona Beyerle"
date: "1/21/21"
output:
  html_document: 
    theme: spacelab
    keep_md: yes
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

## Load the libraries

```r
library(tidyverse)
library(janitor)
library(skimr)
```

For this assignment we are going to work with a large data set from the [United Nations Food and Agriculture Organization](http://www.fao.org/about/en/) on world fisheries. These data are pretty wild, so we need to do some cleaning. First, load the data.  

Load the data `FAO_1950to2012_111914.csv` as a new object titled `fisheries`.

```r
fisheries <- readr::read_csv("data/FAO_1950to2012_111914.csv")
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   .default = col_character(),
##   `ISSCAAP group#` = col_double(),
##   `FAO major fishing area` = col_double()
## )
## ℹ Use `spec()` for the full column specifications.
```

1. Do an exploratory analysis of the data (your choice). What are the names of the variables, what are the dimensions, are there any NA's, what are the classes of the variables?  

```r
glimpse(fisheries)
```

```
## Rows: 17,692
## Columns: 71
## $ Country                   <chr> "Albania", "Albania", "Albania", "Albania",…
## $ `Common name`             <chr> "Angelsharks, sand devils nei", "Atlantic b…
## $ `ISSCAAP group#`          <dbl> 38, 36, 37, 45, 32, 37, 33, 45, 38, 57, 33,…
## $ `ISSCAAP taxonomic group` <chr> "Sharks, rays, chimaeras", "Tunas, bonitos,…
## $ `ASFIS species#`          <chr> "10903XXXXX", "1750100101", "17710001XX", "…
## $ `ASFIS species name`      <chr> "Squatinidae", "Sarda sarda", "Sphyraena sp…
## $ `FAO major fishing area`  <dbl> 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37,…
## $ Measure                   <chr> "Quantity (tonnes)", "Quantity (tonnes)", "…
## $ `1950`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1951`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1952`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1953`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1954`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1955`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1956`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1957`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1958`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1959`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1960`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1961`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1962`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1963`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1964`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1965`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1966`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1967`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1968`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1969`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1970`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1971`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1972`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1973`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1974`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1975`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1976`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1977`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1978`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1979`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1980`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1981`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1982`                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
## $ `1983`                    <chr> NA, NA, NA, NA, NA, NA, "559", NA, NA, NA, …
## $ `1984`                    <chr> NA, NA, NA, NA, NA, NA, "392", NA, NA, NA, …
## $ `1985`                    <chr> NA, NA, NA, NA, NA, NA, "406", NA, NA, NA, …
## $ `1986`                    <chr> NA, NA, NA, NA, NA, NA, "499", NA, NA, NA, …
## $ `1987`                    <chr> NA, NA, NA, NA, NA, NA, "564", NA, NA, NA, …
## $ `1988`                    <chr> NA, NA, NA, NA, NA, NA, "724", NA, NA, NA, …
## $ `1989`                    <chr> NA, NA, NA, NA, NA, NA, "583", NA, NA, NA, …
## $ `1990`                    <chr> NA, NA, NA, NA, NA, NA, "754", NA, NA, NA, …
## $ `1991`                    <chr> NA, NA, NA, NA, NA, NA, "283", NA, NA, NA, …
## $ `1992`                    <chr> NA, NA, NA, NA, NA, NA, "196", NA, NA, NA, …
## $ `1993`                    <chr> NA, NA, NA, NA, NA, NA, "150 F", NA, NA, NA…
## $ `1994`                    <chr> NA, NA, NA, NA, NA, NA, "100 F", NA, NA, NA…
## $ `1995`                    <chr> "0 0", "1", NA, "0 0", "0 0", NA, "52", "30…
## $ `1996`                    <chr> "53", "2", NA, "3", "2", NA, "104", "8", NA…
## $ `1997`                    <chr> "20", "0 0", NA, "0 0", "0 0", NA, "65", "4…
## $ `1998`                    <chr> "31", "12", NA, NA, NA, NA, "220", "18", NA…
## $ `1999`                    <chr> "30", "30", NA, NA, NA, NA, "220", "18", NA…
## $ `2000`                    <chr> "30", "25", "2", NA, NA, NA, "220", "20", N…
## $ `2001`                    <chr> "16", "30", NA, NA, NA, NA, "120", "23", NA…
## $ `2002`                    <chr> "79", "24", NA, "34", "6", NA, "150", "84",…
## $ `2003`                    <chr> "1", "4", NA, "22", NA, NA, "84", "178", NA…
## $ `2004`                    <chr> "4", "2", "2", "15", "1", "2", "76", "285",…
## $ `2005`                    <chr> "68", "23", "4", "12", "5", "6", "68", "150…
## $ `2006`                    <chr> "55", "30", "7", "18", "8", "9", "86", "102…
## $ `2007`                    <chr> "12", "19", NA, NA, NA, NA, "132", "18", NA…
## $ `2008`                    <chr> "23", "27", NA, NA, NA, NA, "132", "23", NA…
## $ `2009`                    <chr> "14", "21", NA, NA, NA, NA, "154", "20", NA…
## $ `2010`                    <chr> "78", "23", "7", NA, NA, NA, "80", "228", N…
## $ `2011`                    <chr> "12", "12", NA, NA, NA, NA, "88", "9", NA, …
## $ `2012`                    <chr> "5", "5", NA, NA, NA, NA, "129", "290", NA,…
```

2. Use `janitor` to rename the columns and make them easier to use. As part of this cleaning step, change `country`, `isscaap_group_number`, `asfis_species_number`, and `fao_major_fishing_area` to data class factor. 

```r
fisheries <- janitor::clean_names(fisheries)
```


```r
names(fisheries)
```

```
##  [1] "country"                 "common_name"            
##  [3] "isscaap_group_number"    "isscaap_taxonomic_group"
##  [5] "asfis_species_number"    "asfis_species_name"     
##  [7] "fao_major_fishing_area"  "measure"                
##  [9] "x1950"                   "x1951"                  
## [11] "x1952"                   "x1953"                  
## [13] "x1954"                   "x1955"                  
## [15] "x1956"                   "x1957"                  
## [17] "x1958"                   "x1959"                  
## [19] "x1960"                   "x1961"                  
## [21] "x1962"                   "x1963"                  
## [23] "x1964"                   "x1965"                  
## [25] "x1966"                   "x1967"                  
## [27] "x1968"                   "x1969"                  
## [29] "x1970"                   "x1971"                  
## [31] "x1972"                   "x1973"                  
## [33] "x1974"                   "x1975"                  
## [35] "x1976"                   "x1977"                  
## [37] "x1978"                   "x1979"                  
## [39] "x1980"                   "x1981"                  
## [41] "x1982"                   "x1983"                  
## [43] "x1984"                   "x1985"                  
## [45] "x1986"                   "x1987"                  
## [47] "x1988"                   "x1989"                  
## [49] "x1990"                   "x1991"                  
## [51] "x1992"                   "x1993"                  
## [53] "x1994"                   "x1995"                  
## [55] "x1996"                   "x1997"                  
## [57] "x1998"                   "x1999"                  
## [59] "x2000"                   "x2001"                  
## [61] "x2002"                   "x2003"                  
## [63] "x2004"                   "x2005"                  
## [65] "x2006"                   "x2007"                  
## [67] "x2008"                   "x2009"                  
## [69] "x2010"                   "x2011"                  
## [71] "x2012"
```


```r
fisheries$country <- as.factor(fisheries$country)
class(fisheries$country)
```

```
## [1] "factor"
```


```r
fisheries$isscaap_group_number <- as.factor(fisheries$isscaap_group_number)
class(fisheries$isscaap_group_number)
```

```
## [1] "factor"
```


```r
fisheries$asfis_species_number <- as.factor(fisheries$asfis_species_number)
class(fisheries$asfis_species_number)
```

```
## [1] "factor"
```


```r
fisheries$fao_major_fishing_area <- as.factor(fisheries$fao_major_fishing_area)
class(fisheries$fao_major_fishing_area)
```

```
## [1] "factor"
```


```r
fisheries$country <- as.factor(fisheries$country)
fisheries$isscaap_group_number <- as.factor(fisheries$isscaap_group_number)
fisheries$asfis_species_number <- as.factor(fisheries$asfis_species_number)
fisheries$fao_major_fishing_area <- as.factor(fisheries$fao_major_fishing_area)
```

We need to deal with the years because they are being treated as characters and start with an X. We also have the problem that the column names that are years actually represent data. We haven't discussed tidy data yet, so here is some help. You should run this ugly chunk to transform the data for the rest of the homework. It will only work if you have used janitor to rename the variables in question 2!

```r
fisheries_tidy <- fisheries %>% 
  pivot_longer(-c(country,common_name,isscaap_group_number,isscaap_taxonomic_group,asfis_species_number,asfis_species_name,fao_major_fishing_area,measure),
               names_to = "year",
               values_to = "catch",
               values_drop_na = TRUE) %>% 
  mutate(year= as.numeric(str_replace(year, 'x', ''))) %>% 
  mutate(catch= str_replace(catch, c(' F'), replacement = '')) %>% 
  mutate(catch= str_replace(catch, c('...'), replacement = '')) %>% 
  mutate(catch= str_replace(catch, c('-'), replacement = '')) %>% 
  mutate(catch= str_replace(catch, c('0 0'), replacement = ''))

fisheries_tidy$catch <- as.numeric(fisheries_tidy$catch)
```

3. How many countries are represented in the data? Provide a count and list their names.

```r
fisheries_tidy %>%
  select(country) %>%
  group_by(country) %>%
  count(country)
```

```
## # A tibble: 203 x 2
## # Groups:   country [203]
##    country                 n
##    <fct>               <int>
##  1 Albania               934
##  2 Algeria              1561
##  3 American Samoa        556
##  4 Angola               2119
##  5 Anguilla              129
##  6 Antigua and Barbuda   356
##  7 Argentina            3403
##  8 Aruba                 172
##  9 Australia            8183
## 10 Bahamas               423
## # … with 193 more rows
```

4. Refocus the data only to include only: country, isscaap_taxonomic_group, asfis_species_name, asfis_species_number, year, catch.

```r
fisheries_tidy %>%
  summarize(country, isscaap_taxonomic_group, asfis_species_name, asfis_species_number, year, catch)
```

```
## # A tibble: 376,771 x 6
##    country isscaap_taxonomic_g… asfis_species_na… asfis_species_num…  year catch
##    <fct>   <chr>                <chr>             <fct>              <dbl> <dbl>
##  1 Albania Sharks, rays, chima… Squatinidae       10903XXXXX          1995    NA
##  2 Albania Sharks, rays, chima… Squatinidae       10903XXXXX          1996    53
##  3 Albania Sharks, rays, chima… Squatinidae       10903XXXXX          1997    20
##  4 Albania Sharks, rays, chima… Squatinidae       10903XXXXX          1998    31
##  5 Albania Sharks, rays, chima… Squatinidae       10903XXXXX          1999    30
##  6 Albania Sharks, rays, chima… Squatinidae       10903XXXXX          2000    30
##  7 Albania Sharks, rays, chima… Squatinidae       10903XXXXX          2001    16
##  8 Albania Sharks, rays, chima… Squatinidae       10903XXXXX          2002    79
##  9 Albania Sharks, rays, chima… Squatinidae       10903XXXXX          2003     1
## 10 Albania Sharks, rays, chima… Squatinidae       10903XXXXX          2004     4
## # … with 376,761 more rows
```

5. Based on the asfis_species_number, how many distinct fish species were caught as part of these data?

```r
fisheries_tidy %>%
  summarize(across(starts_with("asfis_species_number"), n_distinct))
```

```
## # A tibble: 1 x 1
##   asfis_species_number
##                  <int>
## 1                 1551
```

6. Which country had the largest overall catch in the year 2000?

```r
fisheries_tidy %>%
  filter(year==2000)%>%
  arrange(desc(catch))
```

```
## # A tibble: 8,793 x 10
##    country common_name isscaap_group_n… isscaap_taxonom… asfis_species_n…
##    <fct>   <chr>       <fct>            <chr>            <fct>           
##  1 China   Marine fis… 39               Marine fishes n… 199XXXXXXX010   
##  2 Peru    Anchoveta(… 35               Herrings, sardi… 1210600208      
##  3 Russia… Alaska pol… 32               Cods, hakes, ha… 1480401601      
##  4 Viet N… Marine fis… 39               Marine fishes n… 199XXXXXXX010   
##  5 Chile   Chilean ja… 37               Miscellaneous p… 1702300405      
##  6 China   Marine mol… 58               Miscellaneous m… 399XXXXXXX016   
##  7 China   Largehead … 34               Miscellaneous d… 1750600302      
##  8 United… Alaska pol… 32               Cods, hakes, ha… 1480401601      
##  9 China   Marine cru… 47               Miscellaneous m… 299XXXXXXX013   
## 10 Philip… Scads nei   37               Miscellaneous p… 17023043XX      
## # … with 8,783 more rows, and 5 more variables: asfis_species_name <chr>,
## #   fao_major_fishing_area <fct>, measure <chr>, year <dbl>, catch <dbl>
```

7. Which country caught the most sardines (_Sardina pilchardus_) between the years 1990-2000?

```r
fisheries_tidy %>%
  filter(asfis_species_name =="Sardina pilchardus") %>%
  filter(year>= 1990 & year <= 2000) %>%
  group_by(country) %>%
  summarize(sum_catch =sum(catch, na.rm=T)) %>%
  arrange(desc(sum_catch))
```

```
## `summarise()` ungrouping output (override with `.groups` argument)
```

```
## # A tibble: 37 x 2
##    country               sum_catch
##    <fct>                     <dbl>
##  1 Morocco                    7470
##  2 Spain                      3507
##  3 Russian Federation         1639
##  4 Ukraine                    1030
##  5 France                      966
##  6 Portugal                    818
##  7 Greece                      528
##  8 Italy                       507
##  9 Serbia and Montenegro       478
## 10 Denmark                     477
## # … with 27 more rows
```

8. Which five countries caught the most cephalopods between 2008-2012?

```r
fisheries_tidy %>%
  filter(asfis_species_name == "Cephalopoda") %>%
  filter(year >=2008 & year<=2012) %>%
  group_by(country) %>%
  summarize(sum_catch =sum(catch, na.rm=T)) %>%
  arrange(desc(sum_catch))
```

```
## `summarise()` ungrouping output (override with `.groups` argument)
```

```
## # A tibble: 16 x 2
##    country                  sum_catch
##    <fct>                        <dbl>
##  1 India                          570
##  2 China                          257
##  3 Spain                          198
##  4 Algeria                        162
##  5 France                         101
##  6 Mauritania                      90
##  7 TimorLeste                      76
##  8 Italy                           66
##  9 Mozambique                      16
## 10 Cambodia                        15
## 11 Taiwan Province of China        13
## 12 Madagascar                      11
## 13 Croatia                          7
## 14 Israel                           0
## 15 Somalia                          0
## 16 Viet Nam                         0
```

9. Which species had the highest catch total between 2008-2012? (hint: Osteichthyes is not a species)

```r
fisheries_tidy %>%
  filter(year >=2008 & year<=2012) %>%
  group_by(asfis_species_number) %>%
  summarize(sum_catch = sum(catch, na.rm=T)) %>%
  arrange(desc(sum_catch))
```

```
## `summarise()` ungrouping output (override with `.groups` argument)
```

```
## # A tibble: 1,477 x 2
##    asfis_species_number sum_catch
##    <fct>                    <dbl>
##  1 199XXXXXXX010           105651
##  2 1480401601               41075
##  3 1210600208               35523
##  4 1750102501               32153
##  5 1750600302               30400
##  6 1210500105               28527
##  7 1750102610               20119
##  8 1750100201               14723
##  9 1480400202               13253
## 10 1750102605               12019
## # … with 1,467 more rows
```

10. Use the data to do at least one analysis of your choice.

```r
fisheries_tidy %>%
  filter(asfis_species_number == 1750102605)
```

```
## # A tibble: 4,441 x 10
##    country common_name isscaap_group_n… isscaap_taxonom… asfis_species_n…
##    <fct>   <chr>       <fct>            <chr>            <fct>           
##  1 Americ… Albacore    36               Tunas, bonitos,… 1750102605      
##  2 Americ… Albacore    36               Tunas, bonitos,… 1750102605      
##  3 Americ… Albacore    36               Tunas, bonitos,… 1750102605      
##  4 Americ… Albacore    36               Tunas, bonitos,… 1750102605      
##  5 Americ… Albacore    36               Tunas, bonitos,… 1750102605      
##  6 Americ… Albacore    36               Tunas, bonitos,… 1750102605      
##  7 Americ… Albacore    36               Tunas, bonitos,… 1750102605      
##  8 Americ… Albacore    36               Tunas, bonitos,… 1750102605      
##  9 Americ… Albacore    36               Tunas, bonitos,… 1750102605      
## 10 Americ… Albacore    36               Tunas, bonitos,… 1750102605      
## # … with 4,431 more rows, and 5 more variables: asfis_species_name <chr>,
## #   fao_major_fishing_area <fct>, measure <chr>, year <dbl>, catch <dbl>
```

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.   
