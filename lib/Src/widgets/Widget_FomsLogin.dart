
import 'package:flutter/material.dart';

FormsLogin(key){
  return TextFormField(
    key: key,
    validator: (value) {
      if (value!.isEmpty) {
        return 'Informe o valor';
      }

    },

  );

}