// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:day04_flash_card/flashcard.dart';
import 'package:day04_flash_card/flashcard_view.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlipCardController _controller = FlipCardController();

  List<Flashcard> _flashcards = [
    Flashcard(
        question: "What programming language deos flutter use?",
        answer: "Dart"),
    Flashcard(
        question: "What is the capital of Karntaka?", answer: "Bangalore"),
    Flashcard(
        question: "Who is the father of our nation?", answer: "Mahatma Gandhi"),
    Flashcard(
        question: "Which encryption algorithm hasn't been broken yet?",
        answer: "AES"),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: FlipCard(
                    controller: _controller,
                    direction: FlipDirection.HORIZONTAL,
                    front: FlashcardView(
                      text: _flashcards[_currentIndex].question,
                    ),
                    back:
                        FlashcardView(text: _flashcards[_currentIndex].answer)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton.icon(
                      onPressed: showPrevCard,
                      icon: Icon(Icons.chevron_left),
                      label: Text('Prev')),
                  OutlinedButton.icon(
                      onPressed: showNextCard,
                      icon: Icon(Icons.chevron_right),
                      label: Text('Next'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void showNextCard() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _flashcards.length;
      if (!_controller.state.isFront) {
        _controller.toggleCard();
      }
    });
  }

  void showPrevCard() {
    setState(() {
      _currentIndex = (_currentIndex - 1) % _flashcards.length;
      if (!_controller.state.isFront) {
        _controller.toggleCard();
      }
    });
  }
}
