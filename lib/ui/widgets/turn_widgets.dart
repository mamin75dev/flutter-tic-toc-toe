import 'package:flutter/material.dart';
import 'package:tic_toc_toe/data/game.dart';
import 'package:tic_toc_toe/ui/resources/colors.dart';

class TurnWidget extends StatelessWidget {
  final String lastValue;
  const TurnWidget({super.key, required this.lastValue});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: Game.blocSize,
            height: Game.blocSize,
            decoration: BoxDecoration(
              color: lastValue == "X" ? MainColor.secondaryColor : Colors.white54,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Center(
              child: Text(
                "X",
                style: TextStyle(
                  color: lastValue == "X" ? Colors.redAccent : Colors.white54,
                  fontSize: 64.0,
                ),
              ),
            ),
          ),
          Container(
            width: Game.blocSize,
            height: Game.blocSize,
            decoration: BoxDecoration(
              color: lastValue == "O" ? MainColor.secondaryColor : Colors.white54,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Center(
              child: Text(
                "O",
                style: TextStyle(
                  color: lastValue == "O" ? Colors.yellowAccent : Colors.white54,
                  fontSize: 64.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
