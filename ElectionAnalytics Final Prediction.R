library(tidyverse)
library(ggplot2)
library(lubridate)

setwd("C:/Users/think/Downloads")

popvote_df <- read_csv("popvote_1948-2016.csv")

polls_df <- read_csv("pollavg_1968-2016.csv")

dat <- popvote_df %>%
  full_join(polls_df %>%
              filter(days_left <= 10) %>%
              filter(days_left >= 4) %>%
              #filter(year <= 2012) %>%
              #filter(days_left == 33) %>%
              group_by(year, party)) %>%
  filter(incumbent == TRUE)

newDat <- dat[-c(7, 9, 10, 12, 13, 14, 15, 16, 17, 18, 20, 21, 22, 23, 24, 25, 27, 28, 29, 30, 31, 32, 34, 35, 36, 37, 38, 39), ] #filters out excess polls, makes graph look nicer

newDat %>%
  ggplot(aes(x=avg_support, y=pv,
             label=year)) + 
  geom_text() +
  geom_smooth(method="lm", formula = y ~ x) +
  geom_hline(yintercept=50, lty=2) +
  geom_vline(xintercept=0, lty=2) + # median
  xlab("Average Incumbent Polling Percentage Ten to Four Days Before the Election") +
  ylab("Incumbent President's Popular Vote Share on Election Day") +
  labs(title = "Relationship Between Popular Vote and National Polling Averages for Incumbents") +
  theme_bw()

cor(newDat$avg_support, newDat$pv, use = "complete.obs")

lm(pv ~ avg_support, data = newDat)

pollstate_df <- read_csv("pollavg_bystate_1968-2016.csv")
polls2020_updated <- read_csv("president_polls.csv")
pvstate_df <- read_csv("popvote_bystate_1948-2016.csv") %>%
  mutate(margin = R_pv2p - D_pv2p)

dat_2020 <- polls2020_updated %>%
  select(state, fte_grade, sample_size, end_date, answer, pct) %>%
  filter(state == "Wisconsin", answer == "Biden") %>%
  filter(mdy(end_date) >= mdy("10/24/20")) %>%
  mutate(avg = mean(pct))


dat_R <- pvstate_df %>%
  full_join(pollstate_df %>%
              filter(days_left <= 10) %>%
              filter(party == "republican") %>%
              filter(days_left >= 4) %>%
              filter(state == "Florida") %>%
              #filter(year < 2016) %>%
              group_by(year, party, state) %>%
              mutate(avg_poll_R = mean(avg_poll, na.rm = TRUE))) %>%
              filter(row_number() > 2)

dat_D <- pvstate_df %>%
  full_join(pollstate_df %>%
              filter(days_left <= 10) %>%
              filter(party == "democrat") %>%
              filter(days_left >= 4) %>%
              filter(state == "Florida") %>%
              #filter(year < 2016) %>%
              group_by(year, party, state) %>%
              mutate(avg_poll_D = mean(avg_poll, na.rm = TRUE))) %>%
              filter(row_number() > 0)

avg_margin <- dat_R$avg_poll_R - dat_D$avg_poll_D

cor(avg_margin, dat_R$margin, use = "complete.obs")

lm(dat_R$margin ~ avg_margin) #y ~ x

dat_R %>%
  ggplot(aes(x=avg_margin, y=margin,
             label=year)) + 
  geom_text() +
  geom_smooth(method="lm", formula = y ~ x) +
  geom_hline(yintercept=0, lty=2) +
  geom_vline(xintercept=0, lty=2) + # median
  xlab("Republican Polling Advantage Ten to Four days Before Election") +
  ylab("Actual Republican Victory Margin") +
  labs(title = "Republican Margin of Victory vs Polling Advantage in Arizona") +
  theme_bw()

cor(dat_D$avg_poll_D, dat_D$D_pv2p, use = "complete.obs")


lm(D_pv2p ~ avg_poll_D, data = dat_D)

dat_R %>%
  ggplot(aes(x=avg_poll_R, y=R_pv2p,
             label=year)) + 
  geom_text() +
  geom_smooth(method="lm", formula = y ~ x) +
  geom_hline(yintercept=30, lty=3) +
  geom_vline(xintercept=40, lty=3) + # median
  xlab("Democratic Polling Average") +
  ylab("Actual Democrat") +
  labs(title = "Two Party Democratic Vote in Pennsylvania vs Average Democratic Polling") +
  theme_bw()
