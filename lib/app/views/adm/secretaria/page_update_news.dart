import 'package:cefops/app/data/model/model_publication.dart';
import 'package:cefops/app/widgets/app/widget_forms_for_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
///
class UpdateNews extends StatefulWidget {
  const UpdateNews({Key? key}) : super(key: key);

  @override
  _UpdateNewsState createState() => _UpdateNewsState();
}
final TextEditingController _controller = TextEditingController();
final TextEditingController titleControler = TextEditingController();
final TextEditingController postController = TextEditingController();
  String statusPost="";
Future<PostModel>? editPost;


class _UpdateNewsState extends State<UpdateNews> {
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final String text = _controller.text;
      _controller.value = _controller.value.copyWith(
        text: text,
        selection:
        TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: size.height*1.3,
            child: Column(
              children: [
                SizedBox(
                  height: size.height*0.03,
                ),
                Container(
                  child: inputsForms(titleControler, "Insira o titulo", "titulo", ""),

                ),
                Container(
                  child: inputsForms(postController, "Insira o post", "post", ""),

                ),
                Text(statusPost),

                Container(
                  child: TextButton(
                    child: Text("Postar"),
                    onPressed: (){
                      setState(() {

                          if(titleControler.text ==null || postController.text==null){
                            return ;


                          }else{      setState(() {

                          });
                          print(titleControler.text);
                          }

                      });


                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}