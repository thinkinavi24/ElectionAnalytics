library(tidyverse)
library(dplyr)
library(ggplot2)

setwd("C:/Users/think/Downloads")

pollstate_df <- read_csv("pollavg_bystate_1968-2016.csv")
polls2020 <- read_csv("polls_2020.csv")
pvstate_df <- read_csv("popvote_bystate_1948-2016.csv")

dat_2020 <- polls2020 %>%
  select(state, fte_grade, sample_size, end_date, answer, pct) %>%
  filter(state == "Florida", answer == "Biden") %>% # fte_grade %in% c(""  "B", "B+", "A/B", "A-", "A", "A+")) %>%
  filter(end_date >= "9/1/20") %>%
  mutate(avg = mean(pct))
  

dat_R <- pvstate_df %>%
  full_join(pollstate_df %>%
              filter(weeks_left <= 9) %>%
              filter(party == "republican") %>%
              filter(weeks_left >= 6) %>%
              filter(state == "Texas") %>%
              #filter(year== 2016) %>%
              group_by(year, party, state) %>%
  mutate(avg_poll_R = mean(avg_poll, na.rm = TRUE))) 

cor(dat_R$avg_poll_R, dat_R$R_pv2p, use = "complete.obs")

lm(R_pv2p ~ avg_poll_R, data = dat_R)

dat_R %>%
  ggplot(aes(x=avg_poll_R, y=R_pv2p,
             label=year)) + 
  geom_text() +
  geom_smooth(method="lm", formula = y ~ x) +
  geom_hline(yintercept=50, lty=2) +
  geom_vline(xintercept=30, lty=2) + # median
  xlab("Republican Poll Average Six to Nine Weeks before the Election") +
  ylab("Actual Republican Two Party Vote") +
  labs(title = "Two Party Republican Vote in Texas vs Average Republican Polling") +
  theme_bw()

dat_D <- pvstate_df %>%
  full_join(pollstate_df %>%
              filter(weeks_left <= 9) %>%
              filter(party == "democrat") %>%
              filter(weeks_left >= 6) %>%
              filter(state == "Pennsylvania") %>%
              #filter(year > 1980) %>%
              group_by(year, party, state) %>%
              mutate(avg_poll_D = mean(avg_poll, na.rm = TRUE))) 

cor(dat_D$avg_poll_D, dat_D$D_pv2p, use = "complete.obs")


lm(D_pv2p ~ avg_poll_D, data = dat_D)



dat_D %>%
  ggplot(aes(x=avg_poll_D, y=D_pv2p,
             label=year)) + 
  geom_text() +
  geom_smooth(method="lm", formula = y ~ x) +
  geom_hline(yintercept=50, lty=3) +
  geom_vline(xintercept=30, lty=3) + # median
  xlab("Democratic Poll Average Six to Nine Weeks before the Election") +
  ylab("Actual Democratic Two Party Vote") +
  labs(title = "Two Party Democratic Vote in Pennsylvania vs Average Democratic Polling") +
  theme_bw()
