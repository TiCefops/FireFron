import 'package:cefops/shared/themes/app_textstayle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///pagina responsável pelo  finances
class FinanceStudantPage extends StatefulWidget {
  ///inicio

  const FinanceStudantPage({Key? key}) : super(key: key);

  @override
  _FinanceStudantPageState createState() => _FinanceStudantPageState();
}

class _FinanceStudantPageState extends State<FinanceStudantPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Meu Financeiro",
              style: TextStyles.titleRegular,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: List.generate(6, (int index) => Row(
              children: [
              Text("Boleto $index"),Icon(Icons.monetization_on)
            ],)),
          )
        ],
      ),
    );
  }
}
