import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final pontuacao;
  String _mensagem;
  final Function() reiniciar;
  Resultado(this.pontuacao, this.reiniciar);

  void _construirMensagem() {
    if (this.pontuacao <= 3) {
      _mensagem =
          'Você pode melhorar, infelizmente sua pontuação foi de apenas 0${this.pontuacao} pontos.';
    } else if (this.pontuacao <= 6) {
      _mensagem = 'Sua pontuação foi mediana, com 0${this.pontuacao} pontos.';
    } else if (this.pontuacao <= 9) {
      _mensagem =
          'Parabéns, você alcançou uma pontuação excelente! Com 0${this.pontuacao} pontos.';
    } else {
      _mensagem =
          'Que maravilha! Com ${this.pontuacao} pontos você alcançou a pontuação máxima!';
    }
  }

  @override
  Widget build(BuildContext context) {
    _construirMensagem();

    return Column(
      children: [
        SizedBox(
          height: 200,
        ),
        Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
            width: double.infinity,
            color: Colors.black,
            child: Text(
              _mensagem,
              style: TextStyle(
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        RaisedButton(
          color: Color.fromRGBO(0, 0, 0, 0.5),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(100, 15, 100, 15),
            child: Row(
              children: [
                Icon(Icons.settings_backup_restore),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Reiniciar',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          onPressed: reiniciar,
        )
      ],
    );
  }
}
