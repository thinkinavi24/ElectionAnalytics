library(tidyverse)

setwd("C:/Users/think/Downloads")

demographics <- read_csv("demographic_1990-2018.csv") %>%
  filter(state == "AZ") %>%
  filter(year %% 4 == 2) %>%
  filter(year < 2018)

pvstate_df <- read_csv("popvote_bystate_1948-2016.csv") %>%
 filter(state == "Arizona") %>%
#mutate(state = "WI") %>%
 filter(year > 1988)
 #filter(year < 2016)

#dat <- pvstate_df %>%
 # left_join(demographics)

cor(pvstate_df$D_pv2p, demographics$Male, use = "complete.obs")

lm(pvstate_df$D_pv2p ~ demographics$Male)

demographics %>%
  ggplot(aes(x=Male, y=pvstate_df$D_pv2p, label = year + 2
             )) + 
  geom_text() +
  geom_smooth(method="lm", formula = y ~ x) +
  geom_hline(yintercept=0, lty=2) +
  geom_vline(xintercept=48.5, lty=2) + # median
  xlab("Percent Male Two Years Before Election") +
  ylab("Actual Democratic Two Party Vote") +
  labs(title = "Two Party Democratic Vote in Arizona vs Male Population Percentage") +
  theme_bw()

#AR: Male
#FL:
#GA: Male
#IA: White
#MI:
#NC: age3045
#OH:
#PA: White
#TX: Male
#WI:
