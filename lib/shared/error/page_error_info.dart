
import 'package:cefops/shared/themes/app_colors.dart';
import 'package:cefops/shared/themes/app_textstayle.dart';
import 'package:flutter/material.dart';
///
class ErrorInfo extends StatelessWidget {
  ///
  const ErrorInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LinearGradient gradient = LinearGradient(
      colors:<Color> [AppColors.blue,AppColors.orange],
    );

    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return gradient.createShader(Offset.zero & bounds.size);
      },
      child:   Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[
            const Text(
              'Oops!',
              style:  TextStyle(
                color: Colors.white,
                fontSize: 70.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Tivemos um erro com a sua requisição ",
              style:TextStyles.trailingRegular,),
            Text("Tente Novamente",
              style:TextStyles.trailingRegular,)
          ],
        ),
      ),
    );
  }
}
