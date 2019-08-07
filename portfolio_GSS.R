install.packages("readxl")
library(readxl)
install.packages("sqldf")
library(sqldf)
install.packages("ggplot2")
library(ggplot2)
install.packages("magrittr") # package installations are only needed the first time you use it
install.packages("dplyr")    # alternative installation of the %>%
library(magrittr) # needs to be run every time you start R and want to use %>%
library(dplyr)    # alternatively, this also loads %>%
my_data <- read_xlsx("c:/Users/John/Documents/CSU_Docs/02_MIS500-1__Intro_to_Data_Analytics/r_sandbox/GSS__1972_2018.xlsx", sheet = NULL, range = NULL, col_names = TRUE,
  col_types = NULL, na = "", trim_ws = TRUE, skip = 0,
  n_max = Inf, guess_max = min(500, 60000),
  progress = readxl_progress(), .name_repair = "unique")
warnings()
df <- my_data %>%
        filter(MARITAL__CODE__ == 1 | MARITAL__CODE__ == 2) %>%
        select(HAPPY__CODE__, MARITAL__CODE__)

# Married happiness summary stats
summary(df %>% filter(MARITAL__CODE__ == 1) %>% .$HAPPY__CODE__)

# Remarried happiness summary stats
summary(df %>% filter(MARITAL__CODE__ == 2) %>% .$HAPPY__CODE__)

t.test(HAPPY__CODE__ ~ MARITAL__CODE__, data = df)