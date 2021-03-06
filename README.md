- For the installtion, go directly to the **Installation** subcategory
- For the french version, open the file "**README_like_one_of_your_french_files.md**"

# Description
GoRankAnalysis is a pretrained model that can estimate the rank of someone using only one game provided to the program as a `.sgf` file.

While the use of AI in the world of Go has mostly spread to review games and see what mistakes we've made during a game, and learn some better moves, this program aims is to pave th path too a better ranking system in Go, that would be stable and more representative of players' strength.

Wether You want to verify if you're getting stronger with time, or if you're 3 kyu but imagine you're already better than a 1 dan that lived 100 years ago, because of the evolution of Go and Go strategies, you can now verify all of that.


# Context

Ranking in Go uses a kyu/dan system (kyu for the majority of us and dan for the strong players). It starts from 20kyu (for the very beginners) to 1 kyu (for the confirmed players), then from 1 dan (for the good players) to 9 dan (very strong professional players) 

But there is no official representation of what strength represent being 1 dan or being 10 kyu, therefore it can vary from a country to another one.

If you are a man of 177cm, and if we were still mesuring heights and lengths like we mesure Go ranking, you would probably be 5-kyu-tall in New-Zealand (where 177cm is average for a man) but you'd probably be 3-dan-tall in Honduras (where the average man is 166 cm), but fortunately, you are not 6k-tall somewhere and 3d-tall somewhere else, you are 177cm tall **everywhere**.

Current methods of ranking in Go rely mostly on an Elo system where the player win or loose some points after a game depending of the output (game won or lost) and the difference in rank between the player and his opponent. Those Elo points are then converted to the kyu/dan ranking system .

|    Elo (FR)    |     Rank      |   Elo (EU)   |
|:--------------:|:-------------:|:------------:|
| -2000 to -1901 |   **20 kyu**  |  1 to 100    |
| -1900 to -1801 |   **19 kyu**  |  101 to 200  |
| -1800 to -1701 |   **18 kyu**  |  201 to 300  |
|      ...       |       ...     |     ...      |
|  -400 to -301  |   **4 kyu**   | 1601 to 1700 |
|  -300 to -201  |   **3 kyu**   | 1701 to 1800 |
|  -200 to -101  |   **2 kyu**   | 1801 to 1900 |
|   -100 to -1   |   **1 kyu**   | 1901 to 2000 |
|    0 to 99     |   **1 dan**   | 2001 to 2100 |
|   100 to 199   |   **2 dan**   | 2101 to 2200 |
|       ...      |       ...     |      ...     |
|   600 to 699   |   **7 dan**   | 2601 to 2700 |



Multiple algorithms exist to update the player's rank, from the simple ones, based on the rank of both opponent and the outcome of the game, like the ones used by the [French Federation of Go](https://ffg.jeudego.org/echelle/echelle_algo_2012.php), to more complex ones like the [Whole History Rating](https://www.remi-coulom.fr/WHR/) which takes into account the time-varying strengths of players. However, for all of those algorithms, the initial assessment must always be self-declarative (or initialized as the lowest possible) as there is no way to watch a player's moves and directly determine its rank.

Even more, these methods suffer from multiple major limitations for a reliable estimation of a rank :

1. They require multiple games to adjust the true level of someone, therefore, their ranking does not always represent their real level and capabilities.

2. These methods are higly suceptible to the arrival of new waves of players. Indeed, if a lot of new players arrive, the previously ranked players which have some experience will win a lot of games against the new players, increasing their rank even though their true level and strength did not change. By going up they will face better players that themselves will rank up. Therefore, the ranking system does not represent a fixed level or strength, but more of a relative classment among the current players, that will quickly vary. This problem often requires the need of players called [anchors](https://www.gokgs.com/help/anchor.html). Anchors are players that are supposedly very stable and do not get better over time, and that are used to recalibrate everyone, preventing those fluctuations. It's a solution often used on internet but not possible for official national or international rankings.

3. Finally, these method are also highly biaised by the geographical and time locations of each players. For example, a rank of 1 dan does not represent the same strength in different countries, we also have no way to know if someone ranked 1 dan today, has the same strength than someone ranked 1 dan that lived centuries ago, as there is no way for a "21<sup>st</sup> century 1 dan" to play against a "17<sup>th</sup> century 1 dan" and compare which of them was better.



This way of mesuring somebody's strength, is equivalent to using body members to measure distances. If you're using your foot to measure a distance, 5 feet might be more or less a good representation of distance in your community, but would propably not represent the same distance in another country, or even in the same population in 100 years.
That is why current systems of measure are all established relatively to unvarying elements (1 metre is currently based on the speed of light, as it represents the distance traveled by light in 1/300.000.000<sup>th</sup> of a second in the void. The second itself is based on the cesium atom oscillations), and no one would ever think of using body members to measure anything. Even in the imperial system the foot unit is now officialy based on the metric system since 1959.


For all these reason, and like all other measurment systems the ranking system of Go needs a more accurate and more stable way of measuring people's strength.

In order to do so, multiple alternatives exist :
1. A possible one would be to increase or decrease the Elo points of a player after a game according to the real strength of the moves he played during the game. *e.g* : if a player is 12 kyu, but played its last game like a 9 kyu, and still loose the game, the player would still win some Elo points, as his level clearly increased since its last tournament even though he lost the game to a stronger player .
2. Another possibility would be to assess the level played during the last *x* games on a rolling window and use them with an EWW (Exponential Weight Window) approach, giving more weight to the last games, and less to the old ones, to determine the current level of the player.


It's not the first time Go federations modify their way of adjusting the rankings to improve the system. [Historically](https://ffg.jeudego.org/echelle/chronologie_echelle_ffg_1981_2011.pdf), the French Federation of Go changed its algorithm on multiple occasions to adapt the ranking system to the time and needs. 

>In 1985 the current algorithm was implemented in BASIC, in 1997 it was modified to incorporate the strongest european players with impementation of the "10% formula", then in 2000 the FFG changed again the algorithm to better represent the ranking in the "high-kyu low-dan" rank and the "very low kyu", and later used some minor adjustments in the rankings in 2002, 2009 and 2010. The whole algorithm was then changed at the end of 2012 and is still acting as 2022 approaches, event though some rank adjustments are still performed, as in the summer 2021 kyu players were given 100 Elo points. All those changed were needed to improve the system, and now, ten years after the last big change, no major improvement were made. 

Yet, since the last change in the FFG algorithm occured in 2012, some light changes were made in the ranks, showing that the system could still benefit some improvments, but no major changes occured, even though a major technology shook the world of Go in the meantime, with the arrival of AI. Such technology in Go changed for good the way we play Go, and it is now time to adapt to the recent changes and take advantage of it to improve our ranking system and get really close to a uniformed and reliable ranking system.

 The AI revolution in Go has been made possible with the arrival of deep learning in the world of Go, with models capable of defeating any human by better estimating the value of each moves in any situation on the board. Initiated in 2016 by Google with [AlphaGo](https://www.nature.com/articles/nature16961) and [AlphaGoZero](https://www.nature.com/articles/nature24270), the use of deep learning in Go widely spread with models like leela or katago, that can be run on almost any computer, with or without GPU, and are better than professional players. Using deep learning capacity to estimate the strength of each moves, and a machine learning approach to correlate the level and strength of each moves on a whole game, to a specific rank, we would obtain a reliable and efficient way to asses the stregnth of a player during a game, on a predetermine scale  that is not subject to changes and would allow to compare efficiently players from different region or different time period.

# Presentation
Based on a Machine learning approach, this model was trained on more than 500 games and more than 500 different players ranking from 16 kyu to 9 dan, 

The games used for training the model come from the Go Server KGS, on labelized data from people with a stable rank.
For all the games, every move of the players were analyzed by Katago and the performance of both players on the full game were used to train the predictive model. 
Only games with more than xx moves were retained 

# Performances assessment

While the predictions can intrinsically not return the exact level of all players on the testing set because :
1. KGS ranks suffer from the same limitations as listed above, knowing that it is slow to adapt the real level of a player, and a player labelized as 12 kyu  can for example already play like a 11 kyu or a 10 kyu
2. Most player (as all humans) are not highly constant in their concentration and performances, and even if the overall level of the person is for example 12 kyu and stable over time, the player can sometime suffer from fatigue and play like a 13 or 14 kyu if he is tired, or on the other way around, he can sometime be more involved in some games (in tournament for example) and focus more on each move and have a game where he plays better than his usual level and play like a 10 or 9 kyu on games he values more. Those up and dones give him a stable of 12 kyu even though he'll sometime play better, sometime worse.

If we take into account that a player with a fixed rank does not play every game with the same strength, the performances of the model are strongly accurate and allow the establishment of a quick and reliable assessment of the person's level.

The median error of rank estimation being less than 2, which is in the range of strength variation of a player,we can assume that the difference between the prediction given by the model and the official rank of the player at the time he played the game, can be mainly imputed to the human performance variation.
![ConfusionGraph](ModelPerformances/ConfusionGraph.png)
![Repartition](ModelPerformances/error.png)
![RepartitionAbsoluteError](ModelPerformances/AbsError.png)



# Installation
## Requirements 
### If you're familiar with python or programming 
`- Language :` Python 3 or more,

`- Libraries :` Please refer to the requirements.txt file

`- Models :` You will need two models to make it run :
1. The first one to assess the strength of every move played during the game, for that, you will need a [network file](https://media.katagotraining.org/uploaded/networks/models/kata1/kata1-b40c256-s10359230464-d2525387336.bin.gz) (if it is ever down, you can find the latest network [here](https://katagotraining.org/networks/)).
2. The second one to predict the rank of the player on the KGS scale, according to his moves. This one is a pickle present in this project and don't need any extra-downloads
### If reading code lines gives you headaches
To run it : 
- Be sure to have python installed on your machine 
>   if you don't have it, just download and install [anaconda for windows](https://repo.anaconda.com/archive/Anaconda3-2021.11-Windows-x86_64.exe)
 or [anaconda for mac](https://repo.anaconda.com/archive/Anaconda3-2021.11-MacOSX-x86_64.pkg)
- After the installation is complete, clone this repo (or download the [folder](https://github.com/Jeremy-Deh/GoRankAnalysis/archive/refs/heads/main.zip) and unzip it) 
- Go in the main folder and double-click `install.bat` (if you're on Windows) to make sure you have all python dependencies that are needed for the program to run. (If you're using Mac, use a shell to pip install the dependancies that you can find in the file `requirements.txt`)
- Download a [network file](https://media.katagotraining.org/uploaded/networks/models/kata1/kata1-b40c256-s10359230464-d2525387336.bin.gz) which will be used by the program to estimate the score of the moves.
## Settings
In `GoPredict.py` find :
```python
settings = {
    "fast_visits": 25,
    "max_visits": 500,
    "threads": 64,
    "model": "C:\\Users\\jerem\\Documents\\Go\\Katago\\g170-b40c256x2-s5095420928-d1229425124.bin.gz",
}
```
and change the `C:\\Users\\jerem\\Documents\\Go\\Katago\\g170-b40c256x2-s5095420928-d1229425124.bin.gz` for the pathway and name of the `.bin.gz` that you've got downloaded earlier.

# Rank prediction
You are now ready to go and estimate your own games by giving this program your `.sgf` files.

To do so : 
- Place one or more .sgf file if the folder named `data`
- Launch the file `GoPredict.py`
- Open the newly created file `prediction.csv`

