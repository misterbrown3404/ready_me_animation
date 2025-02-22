import 'package:flutter/material.dart';

class GameController extends StatelessWidget {
  final Function onUpPressed;
  final Function onDownPressed;
  final Function onLeftPressed;
  final Function onRightPressed;
  final String upText;
  final String downText;
  final String leftText;
  final String rightText;

  const GameController({
    super.key,
    required this.onUpPressed,
    required this.onDownPressed,
    required this.onLeftPressed,
    required this.onRightPressed,
    required this.upText,
    required this.downText,
    required this.leftText,
    required this.rightText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: ElevatedButton(
              onPressed: () => onUpPressed(),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(16),
                minimumSize: const Size(48, 48),
              ),
              child: Text(upText),
            ),
          ),
          Positioned(
            bottom: 0,
            child: ElevatedButton(
              onPressed: () => onDownPressed(),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(16),
                minimumSize: const Size(48, 48),
              ),
              child: Text(downText),
            ),
          ),
          Positioned(
            left: 0,
            child: ElevatedButton(
              onPressed: () => onLeftPressed(),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(16),
                minimumSize: const Size(48, 48),
              ),
              child: Text(leftText),
            ),
          ),
          Positioned(
            right: 0,
            child: ElevatedButton(
              onPressed: () => onRightPressed(),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(16),
                minimumSize: const Size(48, 48),
              ),
              child: Text(rightText),
            ),
          ),
        ],
      ),
    );
  }
}
