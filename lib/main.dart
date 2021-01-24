import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_perguntas/questionario.dart';
import 'package:flutter_perguntas/resultado.dart';

main() {
  runApp(new PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacao = 0;

  final List<Map<String, Object>> _questoes = const [
    {
      'pergunta': 'Quem é o maior artilheiro da história do Atlético?',
      'respostas': [
        {'text': 'Diego Tardelli', 'isCorrect': false},
        {'text': 'Reinaldo', 'isCorrect': true},
        {'text': 'Marques', 'isCorrect': false},
        {'text': 'Renaldo', 'isCorrect': false},
      ]
    },
    {
      'pergunta': 'Quem marcou o gol do título da Copa do Brasil em 2014?',
      'respostas': [
        {'text': 'Luan', 'isCorrect': false},
        {'text': 'Léo Silva', 'isCorrect': false},
        {'text': 'Diego Tardelli', 'isCorrect': true},
        {'text': 'Dátolo', 'isCorrect': false},
      ]
    },
    {
      'pergunta': 'Quem foi a venda mais cara da história Atlético?',
      'respostas': [
        {'text': 'Douglas Santos', 'isCorrect': false},
        {'text': 'Jemerson', 'isCorrect': false},
        {'text': 'Bernard', 'isCorrect': true},
        {'text': 'Bremer', 'isCorrect': false}
      ]
    },
    {
      'pergunta': 'Quem foi a compra mais cara da história do Atlético?',
      'respostas': [
        {'text': 'Yimmi Chará', 'isCorrect': false},
        {'text': 'Juan Cazares', 'isCorrect': false},
        {'text': 'André', 'isCorrect': false},
        {'text': 'Matías Zaracho', 'isCorrect': true}
      ]
    },
    {
      'pergunta': 'Qual é o técnico com mais jogos no Atlético?',
      'respostas': [
        {'text': 'Sampaoli', 'isCorrect': false},
        {'text': 'Telê Santana', 'isCorrect': true},
        {'text': 'Levir Culpi', 'isCorrect': false},
        {'text': 'Cuca', 'isCorrect': false},
      ]
    },
    {
      'pergunta':
          'Quem fez um hat-trick conta o São Paulo na Libertadores de 2013?',
      'respostas': [
        {'text': 'Ronaldinho Gaúcho', 'isCorrect': false},
        {'text': 'Jô', 'isCorrect': true},
        {'text': 'Diego Tardelli', 'isCorrect': false},
        {'text': 'Bernard', 'isCorrect': false}
      ],
    },
    {
      'pergunta':
          'Qual jogador não disputou a Copa das Confederações 2013 pela Seleção Brasileira?',
      'respostas': [
        {'text': 'Bernard', 'isCorrect': false},
        {'text': 'Jô', 'isCorrect': false},
        {'text': 'Réver', 'isCorrect': false},
        {'text': 'Ronaldinho Gaúcho', 'isCorrect': true}
      ],
    },
    {
      'pergunta':
          'Qual jogador marcou gol em todas as fases na Copa do Brasil 2014?',
      'respostas': [
        {'text': 'Guilherme', 'isCorrect': false},
        {'text': 'Luan', 'isCorrect': true},
        {'text': 'Carlos', 'isCorrect': false},
        {'text': 'Dátolo', 'isCorrect': false}
      ],
    },
    {
      'pergunta': 'Em quais anos o Atlético foi campeão da Copa Conmebol?',
      'respostas': [
        {'text': '1192 e 1997', 'isCorrect': true},
        {'text': '1998 e 1999', 'isCorrect': false},
        {'text': '1995 e 1997', 'isCorrect': false},
        {'text': '1992 e 1995', 'isCorrect': false}
      ],
    },
    {
      'pergunta':
          'Quais eram os adversários do Atlético no triangular final do Brasileiro de 1971?',
      'respostas': [
        {'text': 'Bahia e Flamengo', 'isCorrect': false},
        {'text': 'Internacional e Santos', 'isCorrect': false},
        {'text': 'Cruzeiro e Vasco', 'isCorrect': false},
        {'text': 'Botafogo e São Paulo', 'isCorrect': true}
      ],
    },
  ];

  void _responder(bool isCorrectAnswer) {
    setState(() {
      _perguntaSelecionada++;
      if (isCorrectAnswer) {
        _pontuacao++;
      }
    });
  }

  void _reiniciar() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacao = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _questoes.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.cyan[600],

        // Define the default font family.
        fontFamily: 'Georgia',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Quiz do Galão',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: temPerguntaSelecionada
              ? Questionario(
                  perguntaSelecionada: _perguntaSelecionada,
                  questoes: _questoes,
                  responder: _responder,
                )
              : Resultado(_pontuacao, _reiniciar),
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() {
    return _PerguntaAppState();
  }
}
