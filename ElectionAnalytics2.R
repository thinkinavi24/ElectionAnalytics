library(tidyverse)
library(ggplot2)

setwd("C:/Users/think/OneDrive/Documents")

economy_df <- read_csv("econ.csv")
popvote_df <- read_csv("popvote_1948-2016.csv")

dat <- popvote_df %>% 
  filter(incumbent_party == TRUE) %>%
  select(year, winner, pv2p) %>%
  left_join(economy_df %>% filter(quarter == 2))

## scatterplot + line
dat %>%
  ggplot(aes(x=RDI_growth, y=pv2p,
             label=year)) + 
  geom_text() +
  geom_smooth(method="lm", formula = y ~ x) +
  geom_hline(yintercept=50, lty=2) +
  geom_vline(xintercept=0, lty=2) + # median
  xlab("Second Quarter RDI Growth Percentage") +
  ylab("Incumbent Party's national popular voteshare") +
  labs(title = "Effect of Second Quarter RDI Growth on the Incumbent Party's Popular Vote") +
  theme_bw()

cor(dat$RDI_growth, dat$pv2p, use = "complete.obs")

## fit a model
lm_econ <- lm(pv2p ~ RDI_growth, data = dat)
summary(lm_econ)
head(lm_econ)

lm(pv2p ~ RDI_growth, data = dat)

dat %>%
  ggplot(aes(x=RDI_growth, y=pv2p,
             label=year)) + 
  geom_text(size = 8) +
  geom_smooth(method="lm", formula = y ~ x) +
  geom_hline(yintercept=50, lty=2) +
  geom_vline(xintercept=0.01, lty=2) + # median
  xlab("Q2 RDI growth (X)") +
  ylab("Incumbent Candidate PV (Y)") +
  theme_bw() +
  ggtitle("Y = 48.33 + 500.68 * X") + 
  theme(axis.text = element_text(size = 20),
        axis.title = element_text(size = 24),
        plot.title = element_text(size = 32))
