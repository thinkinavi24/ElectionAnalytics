library(tidyverse)

setwd("C:/Users/think/Downloads")

COVID <- read_csv("United_States_COVID-19_Cases_and_Deaths_by_State_over_Time.csv") %>%
  filter(state == "PA") %>%
  filter(row_number() %% 2 == 1) %>%
  filter(row_number() > 5) #helps line up numbers so that correlation can be calculated. Changes based on state

polls2020 <- read_csv("polls_2020.csv") %>%
  filter(state == "Pennsylvania") %>%
  filter(candidate_name == "Donald Trump")

polls <- polls2020[order(as.Date(polls2020$end_date, format="%m/%d/%Y")),] #%>%
#  filter(row_number() > 22)

cor(COVID$tot_death, polls$pct, use = "complete.obs")

lm(polls$pct ~ COVID$tot_cases)

polls %>%
  ggplot(aes(x=COVID$tot_death, y=pct, label = "*"
  )) + 
  geom_text() +
  geom_smooth(method="lm", formula = y ~ x) +
  geom_hline(yintercept=0, lty=2) +
  geom_vline(xintercept=0, lty=2) + # median
  xlab("Pennsylvania deaths due to COVID 19") +
  ylab("Donald Trump's Pennsylvania Poll Percentages") +
  labs(title = "Donald Trump's Poll Percentages vs COVID 19 Deaths in PA") +
  theme_bw()
