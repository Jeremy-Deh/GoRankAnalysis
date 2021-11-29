# Context

Current methods of ranking in Go rely mostly on an Elo system where the player win or loose some points after a game depending of the output (game lost or won) and the difference in rank between the playr andhis opponent.

Multiple algorithms exist, from the simple ones, using the number of points of both oppenent and the outcome of the game, to more complex ones like the "Whole History Rating" which take sinto accouont the time-varying strengths of players (https://www.remi-coulom.fr/WHR/)

However all these methods suffer from multiple major limitations for a reliable estimation of level

1. These methods require multiple games to assess the level of a new player, and even more to assess the true level of someone who is making fast progresses but aready posses a rank, therefore, their ranking does not represent their real level and capabilities

2. These methods are higly suceptible to the arrival of new waves of players, as if a lot of new player arrive, the previously middle-ranked players which have some experience will win a lot of games again those freshmens arriving increasing theire rank even though their true level did not change, this problem often requires the need of players called "anchors" players that supposedly do not get better over time to recalibrate everyone 

3. Finally, these method are also highly biaised by the geographical and time locations of each players. For example, a rank of 1 dan does not represent the same strength in different countries, we also have no way to know if someone 1 dan today, has the same strength than someone 1 dan for centuries ago as there is no way for a 1 dan to play against a 1 dan from from XVIIe century or before, to compare strength.

For all these reason the ranking system needs a more accurate and also faster way to determine the level of a player

In order to do so, a good alternative would be to increase or decrease the points a player after a game according to the real strength of the moves he played during the game, rather than the level of his opponent,  This has been made possible with the arrival of deep learning capable of defeating any human by better estimating the value of each moves in any situation. Initiated by Google with AlphaGo, the use of deep learning in Go widely spread with models like leela or katago that can be run on almost any computer, with or without GPU.