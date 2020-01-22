library(dplyr)
library(ggplot2)

#Q1
mid <- as.data.frame(ggplot2::midwest)
mid %>% 
    select(popadults, poptotal) %>% 
    mutate(t_ad=(popadults/poptotal)*100) %>% 
    head()

#Q2
mid %>%
    select(popadults,poptotal) %>% 
    mutate(t_ad=(popadults/poptotal)*100) %>%
    arrange(desc(t_ad)) %>% 
    head(5)

#Q3
mid %>%
    select(popadults,poptotal) %>% 
    mutate(t_ad=(popadults/poptotal)*100) %>%
    mutate(range=ifelse(t_ad>=40, "large",
                        ifelse(t_ad>=30, "middle", "small"))) %>% 
    head(5)

#Q4
mid %>% 
    select(popasian, poptotal, state, county) %>% 
    mutate(t_as=(popasian/poptotal)*100) %>%
    arrange(t_as) %>% 
    head(10)
    