import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_toc_toe/data/game.dart';
import 'package:tic_toc_toe/ui/resources/colors.dart';
import 'package:tic_toc_toe/ui/widgets/box_widget.dart';
import 'package:tic_toc_toe/ui/widgets/result_dialog.dart';
import 'package:tic_toc_toe/ui/widgets/turn_widgets.dart';

final randomizer = Random();

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String lastValue = "";
  bool gameOver = false;
  int turn = 0; // to check the draw
  List<int> scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];

  Game game = Game();
  // let's initi the GameBoard
  @override
  void initState() {
    super.initState();
    game.board = Game.initGameBoard();
    lastValue = randomizer.nextBool() == false ? "X" : "O";
  }

  onGameBoxTap(index) {
    if (gameOver) return;
    // when we click we need to add the new value
    // to the board and refrech the screen
    // we need also to toggle the player
    // now we need to apply the click only if the field is empty
    // now let's create a button to repeat the game
    if (game.board![index] == "") {
      setState(
        () {
          game.board![index] = lastValue;
          turn++;
          gameOver = game.winnerCheck(lastValue, index, scoreboard, 3);

          if (gameOver) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) => ResultDialog(
                result: lastValue == "X" ? "O is the Winner" : "X is the Winner",
                onRestart: () => onRestartPress(),
              ),
            );
          } else if (!gameOver && turn == 9) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) => ResultDialog(
                result: "It's a Draw!",
                onRestart: () => onRestartPress(),
              ),
            );
            gameOver = true;
          }
          if (lastValue == "X") {
            lastValue = "O";
          } else {
            lastValue = "X";
          }
        },
      );
    }
  }

  onRestartPress() {
    Navigator.pop(context);
    setState(() {
      // erase the board
      game.board = Game.initGameBoard();
      lastValue = randomizer.nextBool() == false ? "X" : "O";
      gameOver = false;
      turn = 0;
      scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
    });
  }

  @override
  Widget build(BuildContext context) {
    double boardWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TurnWidget(lastValue: lastValue),
            const SizedBox(height: 50.0),
            // now we will make the game board
            // but first we will create a Game class
            // that will contains all the data
            // and method that we will need
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blueAccent,
              ),
              width: boardWidth,
              height: boardWidth,
              child: GridView.count(
                crossAxisCount:
                    Game.boardlenth ~/ 3, // the ~/ operator allows you to evide to integer and return an Int as a result
                padding: const EdgeInsets.all(16.0),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                children: List.generate(
                  Game.boardlenth,
                  (index) {
                    return InkWell(onTap: () => onGameBoxTap(index), child: BoxWidget(text: game.board![index]));
                  },
                ),
              ),
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
    // the first step is organise
    // our project folder structure
  }
}
