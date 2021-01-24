import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String respostaTxt;
  final void Function() onSelection;

  Resposta(this.respostaTxt, this.onSelection);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.black,
        child: Text(
          respostaTxt,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        onPressed: onSelection,
      ),
    );
  }
}
