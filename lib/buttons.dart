import 'package:flutter/material.dart';

mixin button {
  static Widget buildButton(
      String buttonText, Function() onPressed, Color color) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: color,
          padding: const EdgeInsets.all(25),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontFamily: 'Raleway',
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
