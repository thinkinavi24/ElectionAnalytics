# ElectionAnalytics

R code:

library(tidyverse)

library(ggplot2)

pvstate_df <- read_csv("popvote_bystate_1948-2016.csv")
pvstate_df$full <- pvstate_df$state

library(usmap)

states_map <- usmap::us_map()
unique(states_map$abbr)

pv_swing_map <- pvstate_df %>%

  select(year, state, D_pv2p) %>%
  
  mutate(D_pv2p_lastyr = lag(D_pv2p, n = 51, order_by = year),
         swing_margin = D_pv2p - D_pv2p_lastyr) %>%
         
  filter(year ==  2008)


plot_usmap(data = pv_swing_map, regions = "states", values = "swing_margin") +
  scale_fill_gradient2(
    high = "blue",
    mid = "white",
    low = "red",
    breaks = c(-20, -10, 0, 10, 20),
    limits = c(-20, 20),
    name = "Swing Margin"
  ) +
  labs(title = "Changes in Two Party Popular Vote by State from the 2004 to the 2008 Presidential Election") +
  theme_void()
