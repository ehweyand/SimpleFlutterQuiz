import 'package:flutter/material.dart';

// Passando parâmetros para o widget
// Via Construtor

class Question extends StatelessWidget {
  final String questionText;

  // Construtor
  /*Question() {
  }*/

  // Forma simplificada
  Question(this.questionText);

  //estilizando também o widget
  //precisa de um container para o text usar todo o width do container,
  //não apenas o que ele utiliza.
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
