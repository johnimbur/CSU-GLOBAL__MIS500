install.packages("dplyr")

# Step 1: Load data
tScore_before <- c(40, 62, 74, 22, 64, 65, 49, 49, 49)
tScore_after <- c(68, 61, 64, 76, 90, 75, 66, 60, 63)
# Create a data frame
my_data <- data.frame(
                group = rep(c("Score Before", "Score After"), each = 9),
                scores = c(tScore_before,  tScore_after)
                )
 
# Step 2: Print all data
print(my_data)
 
# Step 3: Compute summary statistics by groups
library(dplyr)
group_by(my_data, group) %>%
  summarise(
    count = n(),
    mean = mean(scores, na.rm = TRUE),
    sd = sd(scores, na.rm = TRUE)
  )
 
# Step 4: Compute Unpaired Two Sample t-test
res <- t.test(tScore_before, tScore_after, var.equal = TRUE)
res
 
# Step 5: Compute independent t-test
res <- t.test(scores ~ group, data = my_data, var.equal = TRUE)
res
 
# Step 6: test whether the average "Score Before" is less than the average "Score After"
t.test(scores ~ group, data = my_data, var.equal = TRUE, alternative = "less")

