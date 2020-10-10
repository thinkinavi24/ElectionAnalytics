## Forecasting techniques / insights from the advertising week

library(tidyverse)
library(ggplot2)
library(geofacet) ## map-shaped grid of ggplots

#####------------------------------------------------------#
##### Read and merge data ####
#####------------------------------------------------------#

setwd("C:/Users/think/Downloads")

pvstate_df    <- read_csv("popvote_bystate_1948-2016.csv")
pollstate_df  <- read_csv("pollavg_bystate_1968-2016.csv")
vep_df <- read_csv("vep_1980-2016.csv")

#####------------------------------------------------------#
##### Simulating a distribution of election results (PA) ####
#####------------------------------------------------------#

## Get relevant data
VEP_PA_2020 <- as.integer(vep_df$VEP[vep_df$state == "Iowa" & vep_df$year == 2016]) #change the year to 2012 to predict 2016, and the state as needed

## Suppose current (at-the-time) 538 polls were the *literal* individual
## probabilities that each voter turns out to vote blue/red
sim_Dvotes_PA_2020 <- rbinom(n = 10000, size = VEP_PA_2020, prob = 0.519)
sim_Rvotes_PA_2020 <- rbinom(n = 10000, size = VEP_PA_2020, prob = 0.481)
sim_elxns_PA_2020 <- (sim_Dvotes_PA_2020-sim_Rvotes_PA_2020)/(sim_Dvotes_PA_2020+sim_Rvotes_PA_2020)*100
hist(sim_elxns_PA_2020, xlab="", main="Predicted Biden win margin (%) Distribution in Iowa", ylab="", cex.lab=0.5, 
     cex.axis=0.5, cex=0.5, cex.main=1, xaxs="i", yaxs="i", yaxt="n", bty="n", breaks=100)
