import 'package:flutter/material.dart'; //Material theme widgets

//Importando os widgets criados separadamente.
import './quiz.dart';
import './result.dart';

/*void main() {
  runApp(MyApp()); //define qual o core widget que vai usar, passando a função
}*/

//Maneira resumida, quando há apenas uma única linha, uma única expressão
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState(); //Conecta com o State
  }
}

class _MyAppState extends State<MyApp> {
// 1 - Criar uma classe e usar objetos para representar pergunta e resposta
  // 2 - Usar Maps
  // var questions = [
  //   'What\'s your favorite color?',
  //   'What\'s your favorite animal?',
  // ];
  //const na frente é para variável
  // const antes do valor (dos colchetes) é uma constante pro valor
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite Animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s is your favorite letter?',
      'answers': [
        {'text': 'A', 'score': 1},
        {'text': 'B', 'score': 2},
        {'text': 'C', 'score': 3},
        {'text': 'D', 'score': 4},
      ],
    },
  ];

  //o underscore na frente faz o dart reconhece que a classe é privada, pode ser apenas usada dentro deste arquivo
  // Diz que o State pertece ao MyApp
  var _questionIndex = 0; // atributo privado
  var _totalScore = 0;

  void _resetQuiz() {
    //reconstruir a tela, método build
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  // função privada
  void _answerQuestion(int score) {
    //embrulhar a parte que vai causar uma alteração do estado
    //setState força a chamada do build novamente para atualizar o widget
    //mudar o título da questão. Vai renderizar novamente na tela apenas a parte que alterou, automaticamente
    //função anônima como parâmetro

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // build() será chamada quando tentar "pintar" um elemento na tela
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App!'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
// As vírgulas no final ajudam na extensão do dart para o vscode para formatar
