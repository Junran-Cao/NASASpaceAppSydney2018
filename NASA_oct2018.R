# NASA SpaceApp Challenge
# Oct 21, 2018

# Apply SVM to classify WEATHER CONDITIONS to that results in a 'GO' or 'NO GO' launch decision

library(tidyverse)
library(lubridate)

NASA_df <- read.csv("~/Desktop/additional learning and training/NASA_import.csv", comment.char="#", stringsAsFactors=FALSE)
glimpse(NASA_df)

NASA_df$Status <- as.factor(NASA_df$Status)

NASA_df$time <- with(NASA_df, paste(Year,"-", Date.Month,"-", Launch_time))
NASA_df$time <- lubridate::ydm_hms(NASA_df$time)

NASA_df$Direction <- as.factor(NASA_df$Direction)
NASA_df$Weather_cond <- as.factor(NASA_df$Weather_cond)

library(e1071)
library(kernlab)
library(RColorBrewer)

glimpse(NASA_df)

# find optimal cost of misclassification
optimisation_c <- tune(svm,
                 Status ~ Temp_oC + Weather_cond + Wind_kmHr + Direction + Humidity_per + Barometer_mbar + Visibility_km, 
                 data = NASA_df, 
                 kernel = "radial",
                 ranges = list(cost = c(0.001, 0.01, 0.1, 1, 5, 10, 100)))

# extract the best model
(Best.Fit <- optimisation_c$best.model)

svmfit <- svm(Status ~ Temp_oC + Weather_cond + Wind_kmHr + Direction + Humidity_per + Barometer_mbar + Visibility_km,
              data = NASA_df, 
              kernel = "radial", 
              gamma = 0.05263158, 
              cost = 1)

summary(svmfit)

svmfit.1 <- svm(Status ~ Temp_oC, #+ Weather_cond + Wind_kmHr + Direction + Humidity_per + Barometer_mbar + Visibility_km,
              data = NASA_df,
              kernel = "linear",
              scale = FALSE)

summary(svmfit.1)

kernfit <- ksvm(NASA_df$Temp_oC, NASA_df$Status, type = "C-svc", kernel = 'vanilladot')

kernfit

