# connect_four
**Mostafa &amp; Bryan paired project**

This project aims to satisfy all four iteration requirements for the Connect Four paired project. Below will outline basic explanations of our setup, along with some intentional design choices one may encounter using this program, and finally descriptions of processes used to develop this project to completion.

The foundation of this project uses a coordinate system to track pieces, with row and column being two separate classes working together like a latitude and longitude on a map. Whether a particular spot is “playable” is triggered by the `toggle_playable` method in the row class, which prevents invalid moves from being played. 

Rows are generated into the column section and can then be referenced by their relevant coordinate position at this point. See graphic below. 

<img width="956" alt="Screen Shot 2022-09-07 at 12 56 14 PM" src="https://user-images.githubusercontent.com/101418582/188956166-f7abdadc-14cc-4690-87c7-185d79e2c064.png">

The turn class both passes through user input into the coordinate system, and checks for win conditions after doing so. There are four different win conditions that are checked for: vertical, horizontal, diagonal-left, and diagonal-right. These are all anchored by two identical lines of code:

```
arr.chunk_while{ |a, b| a == b && a != "" }.any?{ |player_piece| player_piece.size >= 4 }
return arr.max_by{ |player| arr.count(player) } 
```

This checks to see if there are any adjacent non-blank spaces that have pieces whose player name’s match each other. If they match in a number greater than four, it returns a win for that player. This same core code is used to define all four win condition methods. 

Along with the stalemate method, all four win conidiation methods are tied into the `connect_four` method, allowing one method to be ran to determine a win.


In the tests, you will notice that test 5 of the game_spec.rb occasionally fails. *This is intentional* to ensure that the bot is truly making random choices.

Additionally, there are two, 2-second pauses in the tests. These are from timer_spec.rb to test the functionality of the timer. While a tad irritating, it is intentional.
 
For iteration 4, we completed Two Human Players (THP) and Time Keeping (TK). THP will give the user a prompt to select a computer or bot to play against, time to win, total wins and fastest win for the current session are recorded to the TK class. The TK class is accessible through the terminal via user prompts and successful responses to see their statistics. 

Our TK class does not keep track through sessions where the repeat game loop is terminated. This was due to a misunderstanding in what was being asked in iteration 4 requirements. While Win/Loss Record Keeping specifically states that records should persists between plays, this requirement was absent from TK. We reached out to the instructors to clarify this, but did not have ample time to change from what we had developed by that point. Therefore the TK class only tracks through the current session of games.
