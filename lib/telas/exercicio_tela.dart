import 'package:flutter/material.dart';
import 'package:flutter_gymapp/modelos/exercicio_modelo.dart';
import 'package:flutter_gymapp/modelos/sentimento_modelo.dart';

class ExercicioTela extends StatelessWidget {
  ExercicioTela({super.key});

  final ExercicioModelo exercicioModelo = ExercicioModelo(
      id: "EX001",
      nome: "Remada baixa supinada",
      treino: "Treino A",
      comoFazer: "Segura a barra e puxa");

  final List<SentimentoModelo> listaSentimentos = [
    SentimentoModelo(
      id: "SE001",
      sentindo: "Pouca ativação",
      data: "2022-02-17",
    ),
    SentimentoModelo(
      id: "SE001",
      sentindo: "Ja senti alguma ativação ",
      data: "2022-02-19",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("${exercicioModelo.nome} - ${exercicioModelo.treino}")),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Foi clicado!!");
          },
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text("Enviar foto"),
              ),
              const Text(
                "como fazer?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(exercicioModelo.comoFazer),
              const Divider(),
              const Text(
                "como estou me sentindo?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(listaSentimentos.length, (index) {
                  SentimentoModelo sentimentoAgora = listaSentimentos[index];
                  return Text(sentimentoAgora.sentindo);
                }),
              )
            ],
          ),
        ));
  }
}
