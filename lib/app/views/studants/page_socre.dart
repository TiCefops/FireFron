import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ScoreStudantPage extends StatelessWidget {
  const ScoreStudantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(("modulo1")),
          Container(
            width: Get.width * 0.7,
            height: Get.height * 0.5,
            color: Colors.amber,
            child: Column(
              children: [
                Container(
                  decoration:BoxDecoration(
                    border: Border.all()
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Disciplina |"),
                      Text("Atividade 1  |"),
                      Text("Atividade 2 |"),
                      Text("Trabalho 1 |"),
                      Text("Trabalho 2 |"),
                      Text("Prova 1 |"),
                      Text("Prova 2 |"),
                      Text("Recuperação |"),
                      Text("Aulas de Laboratório |"),
                      Text("Média "),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Genicologia e obstetirica"),
                    Text("0"),
                    Text("9"),
                    Text("0"),
                    Text("5 "),
                    Text("1"),
                    Text("2"),
                    Text("nd"),
                    Text("nd"),
                    Text("5 "),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
