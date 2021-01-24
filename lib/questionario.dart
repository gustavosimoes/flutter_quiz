import 'package:flutter/material.dart';
import 'package:flutter_perguntas/questao.dart';
import 'package:flutter_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> questoes;
  final int perguntaSelecionada;
  final void Function(bool) responder;

  const Questionario({
    @required this.questoes,
    @required this.perguntaSelecionada,
    @required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < questoes.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? questoes[perguntaSelecionada]['respostas']
        : null;

    return Center(
      child: Column(
        children: [
          Questao(questoes[perguntaSelecionada]['pergunta']),
          ...respostas
              .map((res) =>
                  Resposta(res['text'], () => responder(res['isCorrect'])))
              .toList(),
        ],
      ),
    );
  }
}
