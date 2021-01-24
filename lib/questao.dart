import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String perguntaTxt;

  Questao(this.perguntaTxt);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(3, 5, 3, 8),
      child: Text(
        perguntaTxt,
        style: TextStyle(
          fontSize: 28,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
