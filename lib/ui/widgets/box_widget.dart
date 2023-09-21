import 'package:flutter/material.dart';
import 'package:tic_toc_toe/data/game.dart';
import 'package:tic_toc_toe/ui/resources/colors.dart';

class BoxWidget extends StatelessWidget {
  final String text;
  const BoxWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Game.blocSize,
      height: Game.blocSize,
      decoration: BoxDecoration(
        color: MainColor.secondaryColor,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: text == "X" ? Colors.redAccent : Colors.yellowAccent,
            fontSize: 64.0,
          ),
        ),
      ),
    );
  }
}
