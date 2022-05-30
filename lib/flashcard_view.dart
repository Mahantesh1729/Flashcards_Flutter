// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class FlashcardView extends StatelessWidget {
  String text;
  FlashcardView({Key key, this.text}) : super(key: key);

  Widget build(BuildContext) {
    return Card(
      elevation: 4,
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
