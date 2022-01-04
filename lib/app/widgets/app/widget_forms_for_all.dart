import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:flutter/material.dart';

class FormsForAll extends StatelessWidget {
  TextEditingController Controller;
  String labels;
  String hintTExt;
  String error;

  ///
  FormsForAll(
    this.Controller,
    this.labels,
    this.hintTExt,
    this.error, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: TextFormField(
        controller: Controller,
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
            fillColor: Colors.black,
            labelText: labels,
            labelStyle: TextStyles.titleRegular,
            hintText: hintTExt,
            hintStyle: TextStyles.input,
            focusedBorder: OutlineInputBorder()),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return error;
          }
          return null;
        },
        maxLines: 1,
      ),
    );
  }
}

TextFormField inputsForms(
  TextEditingController controller,
  String labels,
  String hintTExt,
  String error,
) {
  return TextFormField(
    controller: controller,
    style: TextStyle(
      color: Colors.black,
    ),
    decoration: InputDecoration(
        fillColor: Colors.black,
        labelText: labels,
        labelStyle: TextStyles.titleRegular,
        hintText: hintTExt,
        hintStyle: TextStyles.input,
        focusedBorder: OutlineInputBorder()),
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return error;
      }
      return null;
    },
    maxLines: 2,
  );
}
