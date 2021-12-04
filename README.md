# Context

Current methods of ranking in Go rely mostly on an Elo system where the player win or loose some points after a game depending of the output (game lost or won) and the difference in rank between the player and his opponent.

Multiple algorithms exist, from the simple ones, based on the rank of both oppenent and the outcome of the game, to more complex ones like the "Whole History Rating" which takes into accouont the time-varying strengths of players (https://www.remi-coulom.fr/WHR/)

However all these methods suffer from multiple major limitations for a reliable estimation of level

1. These methods require multiple games to assess the level of a new player, and even more to assess the true level of someone who is making fast progresses but aready posses a rank, therefore, their ranking does not represent their real level and capabilities

2. These methods are higly suceptible to the arrival of new waves of players, as if a lot of new player arrive, the previously middle-ranked players which have some experience will win a lot of games against those freshmens arriving, increasing their rank even though their true level did not change, this problem often requires the need of players called "anchors" players that supposedly do not get better over time, that are used to recalibrate everyone 

3. Finally, these method are also highly biaised by the geographical and time locations of each players. For example, a rank of 1 dan does not represent the same strength in different countries, we also have no way to know if someone 1 dan today, has the same strength than someone 1 dan  that lived centuries ago as there is no way for a 1 dan to play against a 1 dan from from XVIIe century or before, to compare strength.

For all these reason the ranking system needs a more accurate and also faster way to determine the level of a player

In order to do so, a good alternative would be to increase or decrease the points a player after a game according to the real strength of the moves he played during the game, rather than the level of his opponent, This has been made possible with the arrival of deep learning capable of defeating any human by better estimating the value of each moves in any situation. Initiated by Google with AlphaGo, the use of deep learning in Go widely spread with models like leela or katago that can be run on almost any computer, with or without GPU, annd are better than professional players.

# Presentation
Based on a Machine learning approach, this model was trained on more than 500 games and more than 500 different players ranking from 16 kyu to 9 dan, 

The games used for training the model come from the Go Server KGS, on labelized data from people with a stable rank.
Every move of the players were analyzed by Katago and the performance of both players on the full game of all of the game were used to train the predictive model. 
Only games with more than xx moves were retained 

# Performances assesment

While the predictions can intrinsically not return the exact level of all players on the testing set because :
1. KGS ranks suffer from the same limitations as listed above, knowing that it is slow to adapt the real level of a player, and a player labelized as 12 kyu  can for example already play like a 10 kyu or a 9 kyu
2. Most player (as all humans) are not highly constant in their concentration and performances, and even if the overall level of the person is for example 12 kyu and stable over time, the player can sometime suffer from fatigue and play like a 11 or 12 kyu if he is tired, or on the other way around, he can sometime be more involved in some games (in tournament for example) and focus more on each move and have a game where he plays better than his usual level and play like a 10 or 9 kyu on games he values more. Those up and dones give him a stable of 12 kyu even though he'll sometime play better, sometime worse.

If we take into account that a player with a fixed rank does not play every game with the same strength, the performances of the model are strongly .... and allow the establishment of a quick and reliable assesment of the person's level and rank as ...

# Installation

In settings replace the line "model"
