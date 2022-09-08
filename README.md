# connect_four
**Mostafa &amp; Bryan paired project**

This project aims to satisfy all four iteration requirements for the Connect Four paired project. Below will outline basic explanations of our setup, along with some intentional design choices one may encounter using this program and finally descriptions of processes used to develop this project to completion.

The foundation of this project uses a coordinate system to track pieces, with row and column being two separate classes working together like latitude and longitude on a map. Whether a particular spot is “playable” is triggered by the `toggle_playable` method in the row class, which prevents invalid moves from being played. 

Rows are generated into the column section and can then be referenced by their relevant coordinate position at this point. See graphic below. 

<img width="956" alt="Screen Shot 2022-09-07 at 12 56 14 PM" src="https://user-images.githubusercontent.com/101418582/188956166-f7abdadc-14cc-4690-87c7-185d79e2c064.png">

The turn class both passes through user input into the coordinate system and checks for win conditions after doing so. There are four different win conditions that are checked: vertical, horizontal, diagonal-left, and diagonal-right. All four methods are centered around the following two lines of code:

```
arr.chunk_while{ |a, b| a == b && a != "" }.any?{ |player_piece| player_piece.size >= 4 }
return arr.max_by{ |player| arr.count(player) } 
```

This checks to see if there are any adjacent non-blank spaces that have pieces whose player name’s match each other. If they match in a number greater than or equal to four, it returns a win for that player. This same core code is used to define all four win condition methods. 

Along with the stalemate method, all four win condition methods are tied into the `connect_four` method, allowing one method to run all conditions that determine a win.

In the tests, you will notice that test 5 of the game_spec.rb file occasionally fails. *This is intentional* to ensure that the bot is truly making random choices.

Additionally, there are two, 2-second pauses in the tests. These are from the timer_spec.rb file to test the functionality of the timer. The pauses during testing are intentional.
 
For iteration 4, we completed Two Human Players (THP) and Time Keeping (TK). THP will give the user a prompt to select a computer or bot to play against. TK records time to win, total wins and fastest win for the current session. The TK class is accessible through the terminal via user prompts and successful responses to see their statistics. 

Our TK class does not keep track through sessions after the repeat game loop is terminated. This was due to a misunderstanding in what was being asked in iteration 4 requirements. While Win/Loss Record Keeping specifically states that records should persists between plays, this requirement was absent from TK. We reached out to the instructors to clarify this, but did not have ample time to change from what we had developed by that point. Therefore the TK class only tracks through the current session of games.

In unmerged branch `feat/export_statistics` we modified TK to have a writing function that would track these statistics through play sessions by ways of a .json file. This branch is mostly complete, but we did not have time to thoroughly finish and test before sumbmitting, therefore did not merge it.


Edit 1: at 7 pm, iteration 4 requirements of time keeping were finally fulfilled (was really curious about how to make it work, so I kept at it) but it seems the use of JSON broke the game and timer tests. 

Edit 2: I would very much like feedback on whether testing if we're reading and writing to external files generally is considered IO testing or not, whether there's something different about a json file reading and writing or not, and if both or either of those two are a no just a pointer in the right direction for how to test would be nice.
