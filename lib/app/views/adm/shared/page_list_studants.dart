import 'package:cefops/app/widgets/school_management/studantsListViewer/widget_get_studants.dart';
import 'package:flutter/material.dart';

class ListUSers extends StatefulWidget {
  const ListUSers({Key? key}) : super(key: key);

  @override
  _ListUSersState createState() => _ListUSersState();
}

class _ListUSersState extends State<ListUSers> {

  @override
  Widget build(BuildContext context) {

    return Container(
          child: GetStudants(),
    );
  }
}
