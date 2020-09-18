**Effects of the Economy on the Incumbent President's Chances**

September 19th, 2020

Question: Is the effect of the economy stronger for sitting presidents running for re-election compared to same-party heirs seeking the office? Does the predictive power of economy change across time? If so, why?

Prediction for 2020: Although the economy appears to have a stronger effect for sitting presidents compared to the incumbent party candidates, this year the economy is wildly different relative to previous years due to COVID 19. For this reason, factors which normally correlate with the incumbent's popular vote are not reliable predictors in 2020. For this reason, my prediction for this week remains the same as last week.

We examine the relationship between the national popular vote in presidential elections for an incumbent President versus an incumbent party candidate relative to two economic factors: real disposable income and the unemployment rate in the second quarter, as this is fresh in voters' minds when they cast their ballots in November. Each of these factors impacts different groups of people in different ways. We note that many people will always vote Democrat or Republican based on their views on issues such as healthcare, abortion, religion, and more. These people comprise the majority of voters in very liberal states like California and Massachusetts or very conservative states like West Virginia or Oklahoma. However, for undecided voters, the predominant question is which candidate is more likely to improve their lives the most. Especially as COVID 19 has led many people to lose their jobs, many voters will be looking to choose the candidate whom they believe will get them back on their feet and save them from getting evicted.

We begin by looking at the relationship between second quarter RDI Growth and the incumbent president's national popular vote: 

![Second Quarter RDI Growth](https://user-images.githubusercontent.com/70708980/93628693-f77fd180-f9b4-11ea-824b-717c18d1042a.png)

We get is a correlation between RDI_growth in the second quarter and the popular vote of the incumbent candidate of approximately 0.746. The best fit line above is given by the equation y = 500.68x + 48.33. Since the second quarter RDI growth of 2020 was 0.097%, this model would predict that Donald Trump would win 500.68(0.09724) + 48.33 = 97.01% of the vote! Obviously, this is absurd and no electoral predictions for this election are remotely close to this. The issue here is that the RDI_growth in the second quarter of 2020 was fairly high at 0.097% as the government passed the PPP and stimulus checks in order to help businesses continue to pay their workers as they shut down due to COVID 19.

We also get a visible relationship between second quarter RDI_growth and the incumbent party candidate's national popular vote:

![RDI Growth Incumbent Party](https://user-images.githubusercontent.com/70708980/93630437-0fa52000-f9b8-11ea-99ca-cb26a84eb9b8.png)

This graph includes both the sitting presidents running for reelection as well as incumbent party candidates. Here, while we do see a general positive trend, we only get a correlation of 0.507. This indicates that voters do not associate the current growth in rdi with the political party in the White House as much as they associate it with the President himself. Further, part of the trend we see in this graph is influenced by the previously observed trend with sitting presidents. 

Now we look at the relationship between second quarter unemployment rate and the national popular vote of sitting presidents:

![Second Quarter Unemployment Rate](https://user-images.githubusercontent.com/70708980/93628915-60674980-f9b5-11ea-83d7-f52edff8f3dd.png)

We see that unemployment in the second quarter actually has very low correlation, about -0.16, with the popular vote of the incumbent. Perhaps this is because the majority of voters in any given election are not going to be unemployed, so whether the unemployment rate is 4% or 6% does not seem to be a good indicator of whether the incumbent will win reelection. With regards to the 2020 election, many have speculated that the economic downturn will lead many voters to blame Donald Trump and vote for Joe Biden. However, this is not backed up by historical data and suggests that voters do not generally associate the unemployment rate with the current President. In 2020 especially, many voters are likely to blame the pandemic as opposed to the government if they got laid off due to the lockdown. For this reason, Joe Biden’s best strategy in this regard is to actively blame Donald Trump for allowing COVID 19 to become this widespread for this long. Otherwise, the historical data indicates that Donald Trump will not be as damaged by the rise in unemployment as the media have speculated.

If instead we look at the incumbent party rather than just an incumbent President, the correlation vanishes entirely:

![Unemployment Incumbent Party](https://user-images.githubusercontent.com/70708980/93630412-087e1200-f9b8-11ea-8254-c7e5806b3199.png)

Visually, we can see that there is no relationship between these two variables, and the correlation is about 0.0067. Similar to our observations with RDI growth, this also suggests that voters do not make an association between the previous president's party and the incumbent party candidate. 

From these models, it does not appear that the predictive power of the economy has changed significantly over time, since the data from 50 years ago or more appears to be distributed similarly to the data in more recent elections. Rather, it suggests that single variables such as RDI growth or the unemployment rate appear to be too contrived to accurately reflect voters' opinions for the next presidential election, especially when a sitting president is not running for reelection. For this reason, it is difficult to extrapolate from this data in any meaningful way to predict the outcome of the 2020 election, particularly with the unprecedented impact of COVID 19 this year. In order to accurately predict the 2020 election, other variables outside of the economy should be considered.

September 12th, 2020

Question: Which states are/have been swing states? Which are no longer swing states?

Prediction: In the 2020 election, based solely on trends in the popular vote within each state, the swing states will likely include Wisconsin, Minnesota, Michigan, Pennsylvania, Florida, Arizona, Georgia, and Texas.

These states are expected to be close in the 2020 election, and whoever wins the majority of them will almost certainly be the next President of the United States. Here, we look at how the swing states have changed over time. To do this, we only consider the two party vote for each state, and we compute the difference between the Democratic proportion of the two party vote in year y and in year y-4. A positive number with large magnitude indicates a Democratic shift, while a a negative number with large magnitude indicates a Republican shift. While we typically think of swing states as having extremely close elections, under this model we are actually looking for larger differences between two consecutive presidential elections in order to see which states swing significantly from one election to the next.

We see a large blue wave from 2004 to 2008 across the country:
![2004-2008](https://user-images.githubusercontent.com/70708980/92980174-1d602000-f463-11ea-9124-c388c1d62c7d.png)

Then, from 2008 to 2012, things mostly stayed the same, with some light red shifts throughout the country:

![2008-2012](https://user-images.githubusercontent.com/70708980/92979981-5ba90f80-f462-11ea-8060-e1493a25b99f.png)

Finally, from 2012 to 2016, we see the midwest shift red while some southern states shift blue:

![2012-2016 Changes](https://user-images.githubusercontent.com/70708980/92979984-5ea40000-f462-11ea-8bfd-c8a9481be140.png)

We see that Utah is the darkest red state from 2008 to 2012 and the darkest blue state from 2012 to 2016. However, this is likely due to Mitt Romney's popularity in his home state and is not indicative of Utah swinging broadly from one election to the next in general.

There are a number of interesting trends that we can note from these swing maps. For example, we see that from 2008 to 2012 and from 2012 to 2016 that Missouri has gotten progressively redder. In 2008, John McCain narrowly beat Barack Obama in Missouri with a slim margin of 0.135% of the two party vote. A former swing state, Missouri now appears to be safely in Republican hands.
 
We can also see that several reliably blue states are trending towards being much more swingy. For example, Democrats have won Minnesota in every election since 1976, including in 1984 when Ronald Reagan won every other state (although it is worth noting that his opponent Walter Mondale was from Minnesota, which enabled him to escape with a 0.182% majority of the two party vote). However, we see that from 2008 to 2012 and from 2012 to 2016, Minnesota has swerved much closer to the center.
 
Michigan, Pennsylvania, and Wisconsin show similar trends. After voting blue in every election since 1992 (and 1988 in the case of Wisconsin), these three states flipped in 2016. If we look at the maps, we see that all three states have been getting redder since 2008.
 
On the other hand, some reliably red states are also moving towards the center, including Arizona, Georgia, and Texas. Since the end of George W Bush’s second term, Texas has been moving closer to the center, most notably from 2004 to 2008 and 2012 to 2016. Georgia follows a similar pattern. From 2008 to 2012 they each leaned slightly Republican compared to the previous election, but the trend is towards the center. Arizona has also been shifting blue in more recent elections.
 
From these trends, it appears that the midwest is turning red, while the south is getting more blue. As these regions approach the center from opposite directions, it is likely that these are the states which will decide the outcome of the elections in 2020 and the near future. 
