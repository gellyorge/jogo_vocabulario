import 'dart:math';
import 'package:flutter/material.dart';
import '../data/items.dart';
import '../models/item.dart';
import '../widgets/option_button.dart';
import 'result_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final int totalQuestions = 5;
  late List<Item> allQuestions;
  late List<Item> currentOptions;
  late Item correctAnswer;
  int currentQuestion = 1;
  int score = 0;
  bool answered = false;
  Item? selectedOption;

  @override
  void initState() {
    super.initState();
    allQuestions = List<Item>.from(items)..shuffle();
    _generateNewQuestion();
  }

  void _generateNewQuestion() {
    final random = Random();
    currentOptions = List<Item>.from(items)..shuffle();
    currentOptions = currentOptions.take(5).toList();
    correctAnswer = currentOptions[random.nextInt(5)];
    answered = false;
    selectedOption = null;
    setState(() {});
  }

  void _checkAnswer(Item selected) {
    if (answered) return;

    setState(() {
      answered = true;
      selectedOption = selected;
    });

    bool isCorrect = selected.name == correctAnswer.name;

    if (isCorrect) {
      score++;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isCorrect ? '✅ Correto!' : '❌ Errado!',
          style: const TextStyle(fontSize: 18),
        ),
        backgroundColor: isCorrect ? Colors.green : Colors.red,
        duration: const Duration(milliseconds: 700),
      ),
    );

    Future.delayed(const Duration(seconds: 1), () {
      if (currentQuestion == totalQuestions) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => ResultPage(score: score, total: totalQuestions),
          ),
        );
      } else {
        setState(() {
          currentQuestion++;
        });
        _generateNewQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentOptions.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Pergunta $currentQuestion / $totalQuestions'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              'Qual é o nome desta imagem?',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Image.network(
              correctAnswer.imageUrl,
              height: 150,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: currentOptions.length,
                itemBuilder: (context, index) {
                  final option = currentOptions[index];
                  final isSelected = option == selectedOption;
                  final isCorrect = option.name == correctAnswer.name;

                  // Mantém o azul padrão, mas troca após a resposta
                  Color buttonColor = const Color.fromARGB(255, 255, 255, 255);

                  if (answered) {
                    if (isSelected && isCorrect) {
                      buttonColor = Colors.green;
                    } else if (isSelected && !isCorrect) {
                      buttonColor = Colors.red;
                    } else if (isCorrect) {
                      buttonColor = Colors.green;
                    }
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: OptionButton(
                      text: option.name,
                      onPressed: () => _checkAnswer(option),
                      backgroundColor: buttonColor,
                      disabled: answered,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
