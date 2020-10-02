library(tidyverse)

setwd("C:/Users/think/Downloads")

popvote_df <- read_csv("popvote_1948-2016.csv")

polls_df <- read_csv("pollavg_1968-2016.csv")

dat <- popvote_df %>%
  full_join(polls_df %>%
              filter(days_left <= 36) %>%
              filter(days_left >= 32) %>%
              filter(year <= 2012) %>%
              #filter(days_left == 33) %>%
              group_by(year, party)) %>%
  filter(incumbent == TRUE)

newDat <- dat[-c(9, 10, 11, 12, 14, 15, 16), ] #filters out excess polls, makes graph look nicer

newDat %>%
  ggplot(aes(x=avg_support, y=pv,
             label=year)) + 
  geom_text() +
  geom_smooth(method="lm", formula = y ~ x) +
  geom_hline(yintercept=50, lty=2) +
  geom_vline(xintercept=0, lty=2) + # median
  xlab("Average Incumbent Polling Percentage Five Weeks Before the Election") +
  ylab("Incumbent President's Popular Vote Share on Election Day") +
  labs(title = "Relationship Between the Popular Vote and National Polling Averages for Incumbent Presidents") +
  theme_bw()

cor(dat$avg_support, dat$pv, use = "complete.obs")

lm(pv ~ avg_support, data = dat)
