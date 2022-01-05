import 'package:flutter/material.dart';

///Widget de exibição de  Próximas financias
class GetNextFinance extends StatelessWidget {
  ///início do código
  const GetNextFinance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> items= List<String>.generate(10000, (int i) => 'Compra $i');

    return Container(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(items[index]),
            children: <Widget>[
              Container(child:Text("Compra no valor de ${items[index]}"),)
            ],
          );

        },
      ),

    );
  }
}
