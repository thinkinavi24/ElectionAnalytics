September 11th, 2020

Question: Which states are/have been swing states? Which are no longer swing states?

Prediction: In the 2020 election, based solely on trends in the popular vote within each state, the swing states will likely include...

We begin by taking a look at the margin map for the 2016 Presidential election (citing Soubhik Barari for the R code for this map). This gives us the following:

We see from this map that in the most recent election the closest states were Nevada, Wisconsin, Minnesota, Michigan, Pennsylvania, New Hampshire, and Florida. Additionally, Arizona, Texas, Georgia, North Carolina, Iowa, and Ohio were only slightly Republican, and Virginia and Colorado were only slightly Democratic.

Most of these states are also expected to be close in the 2020 election, and whoever wins the majority of them will almost certainly be the next President of the United States. Here, we look at how the swing states have changed over time. To do this, we only consider the two party vote for each state, and we compute the difference between the Democratic proportion of the two party vote in year y and in year y-4. While we typically think of swing states as having extremely close elections, under this model we are actually looking for larger differences between two consecutive presidential elections in order to see which states change significantly from one election to the next.

There are a number of interesting trends that we can note from these more recent maps and the historical data.

