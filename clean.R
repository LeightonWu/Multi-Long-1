library(tidyverse)
library(haven)
library(sjPlot)
library(lme4)

data <- read_dta("data/A-1-NPD-dataset2.dta")
# create copy of dataset to clean
dataw <- data
# glimpse(dataw)

colnames(dataw)
colconv <- c("school", "cohort", "pupil",
             "year2004", "year2005", "year2006",
             "time", "cons") 
dataw[,colconv] <- lapply(dataw[,colconv], as_factor) 

summary(dataw)

# Question 1
nsch <- length(unique(dataw$school))
npup <- length(unique(dataw$pupil))

gGcse <- ggplot(dataw, aes(x=gcsescore))+
  geom_histogram(binwidth = 0.1, fill = "lightblue", color = "black") +
  labs(title = "Histogram of GCSE Scores", x = "GCSE Score", y = "Frequency")
gGcse
  
gK2 <- ggplot(dataw, aes(x = ks2score)) +
  geom_histogram(binwidth = 1, fill = "lightblue", color = "black") +
  labs(title = "Histogram of KS2 Scores", x = "KS2 Score", y = "Frequency")
gK2

gGcseK2 <- ggplot(dataw, aes(y = gcsescore, x = ks2score))+
  geom_point(color = "blue") +
  labs(title = "Scatter Plot of GCSE Scores vs. KS2 Scores",
       x = "KS2 Score",
       y = "GCSE Score") +
  theme_minimal()
gGcseK2


# Question 2
