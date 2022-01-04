import 'package:cefops/Shared/themes/app_colors.dart';
import 'package:cefops/Shared/themes/app_textstayle.dart';
import 'package:cefops/app/controller/status_app_controller.dart';
import 'package:flutter/material.dart';

///forms de login
TextFormField formsForLoginPage(
  TextEditingController controller,
  String labels,
  String hintTExt,
  String error,
  IconData icons,
  BuildContext context,
    {required bool isobscure,required bool icon2,}
) {
  return TextFormField(
    controller: controller,
    onChanged: (String value) {
      statusApp.status.erros1.value = "";
    },
    style: TextStyle(
      color: AppColors.textOnSecondary,
    ),
    decoration: InputDecoration(
        fillColor: Colors.black,
        labelText: labels,
        labelStyle: TextStyles.titleListTile,
        hintText: hintTExt,
        hintStyle: TextStyle(
          color: AppColors.blue,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: AppColors.blue),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: AppColors.orange),
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Icon(icons, color: AppColors.primary),
        suffixIcon: icon2
            ? InkWell(
                child: Icon(
                  statusApp.status.verSenha.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: AppColors.primary,
                ),
                onTap: () {
                  statusApp.status.verSenha.value =
                      !statusApp.status.verSenha.value;
                },
              )
            : null,),
    obscureText: isobscure,
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return error;
      }
      return null;
    },
  );
}
