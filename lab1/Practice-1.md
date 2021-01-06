---
title: "Practice 1"
author: "Fiona Beyerle"
date: "1/6/2021"
output: 
  html_document: 
    keep_md: yes
---
# Hello
## Hello 
# _hello_ 
# **hello**



```r
#install.packages("tidyverse")
library("tidyverse")
```

```
## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.0 ──
```

```
## ✓ ggplot2 3.3.3     ✓ purrr   0.3.4
## ✓ tibble  3.0.4     ✓ dplyr   1.0.2
## ✓ tidyr   1.1.2     ✓ stringr 1.4.0
## ✓ readr   1.4.0     ✓ forcats 0.5.0
```

```
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```


```r
ggplot(mtcars, aes(x = factor(cyl))) +
    geom_bar()
```

![](Practice-1_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

# hello



