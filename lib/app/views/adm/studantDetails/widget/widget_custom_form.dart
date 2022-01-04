
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// formulario usado
Widget CustomForm(
    GlobalKey<FormState> _formKey, int max, TextEditingController controller,
    String text, String hintText, String vazio,
    String error,String errorMenor,TextInputType input) {
  return Container(
    height: Get.height * 0.1,
    width: Get.width * 0.2,
    alignment: Alignment.centerLeft,
    child: Form(
      key: _formKey,
      child: TextFormField(
        keyboardType: input,
        maxLength: max,
        onChanged: (String value) {
          if(value.length <=max){
            _formKey.currentState!.validate();
          }
        },
        controller: controller,
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
            fillColor: Colors.black,
            labelText: text,
            labelStyle: TextStyles.titleRegular,
            hintText: hintText,
            hintStyle: TextStyles.input,
            focusedBorder: OutlineInputBorder()),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return vazio;
          }
          if(value.length < max){
            return errorMenor;
          }else{
            if (text == "CPF") {
              if(value.isNumericOnly){
                if (value.isCpf == false) {
                  return error;
                }
              }else{
                return "O CPF deve Conter apenas Números";
              }
            }
          }


          return null;
        },
        maxLines: 1,
      ),
    ),
  );
}
