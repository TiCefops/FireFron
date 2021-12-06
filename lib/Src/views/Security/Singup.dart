
import 'package:cefops/Shared/Security/Repository/AuthRepository.dart';
import 'package:cefops/Src/controller/status.dart';
import 'package:cefops/Src/widgets/widget_Navegation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final formKey = GlobalKey<FormState>();

String fristName="";
String lastName="";
String cpf="";
String email="";
String password="";
String password1="";



class Singup extends StatefulWidget {
  const Singup({Key? key}) : super(key: key);


  @override
  _SingupState createState() => _SingupState();
}

class _SingupState extends State<Singup> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> scaffoldKey;
    return Scaffold(

      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [

              Center(
                child: Image.asset("assets/images/logo2.png")),
              Center(
                child: Text("Cadastrar")
                ,),
              Container(
                
                padding: EdgeInsets.all(20),
                width: size.width,

                  child: Row(
                    children: [
                      Container(
                        width: size.width/4,
                        child: TextFormField(
                          decoration: InputDecoration(hintText: 'Geremias', labelText: 'Nome'),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (value) {
                            fristName = value!.toString();
                          },
                        ),
                      ),
                SizedBox(width: size.width*0.03,),
                Container(
                  width: size.width/4,
                  child: TextFormField(
                    decoration: InputDecoration(hintText: 'Dias', labelText: 'Sobrenome'),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {
                      lastName = value!.toString();
                    },
                  ),
                ),
                    ],
                  ),
                ),

              Container(

                padding: EdgeInsets.all(20),
                width: size.width,

                child: Row(
                  children: [
                    Container(
                      width: size.width/4,
                      child: TextFormField(
                        decoration: InputDecoration(hintText: '00000000000', labelText: 'CPF'),
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {
                          cpf = value!.toString();
                        },
                      ),
                    ),
                    SizedBox(width: size.width*0.03,),
                    Container(
                      width: size.width/4,
                      child: TextFormField(
                        decoration: InputDecoration(hintText: 'adm@adm.com', labelText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {
                          email=value.toString();

                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(

                padding: EdgeInsets.all(20),
                width: size.width,

                child: Row(
                  children: [
                    Container(
                      width: size.width/4,
                      child: TextFormField(
                        onChanged: (val){
                          error.value="";
                        } ,
                        obscureText: true,
                        decoration: InputDecoration(hintText: 'insira sua senha', labelText: 'Senha'),
                        keyboardType: TextInputType.emailAddress,

                        onSaved: (value) {
                          password = value!.toString();
                        },
                      ),
                    ),
                    SizedBox(width: size.width*0.03,),
                    Container(
                      width: size.width/4,
                      child: TextFormField(
                        onChanged: (val){
                          error.value="";
                        } ,
                        obscureText: true,
                        decoration: InputDecoration(hintText: 'insira sua senha', labelText: 'Confirme sua Senha'),
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {
                          password1=value.toString();

                        },
                      ),
                    ),
                  ],
                ),
              ),
               Obx(()=> Center(
                    child:Text("${error.value}"),
                ),
               ),
              Obx(()=> statusApp.status.loading.value ?CircularProgressIndicator():ElevatedButton(onPressed: ()async{
                formKey.currentState!.save();
                validatePassword();
                print(password1);
                await SingUpNewUser(fristName, lastName, cpf, email, password);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  MyApp()),);
                await Login(email, password);
              }, child: Text("Teste")))
            ],
          ),
        ),
      ),
    );
  }
}
var error="".obs;
var error1=false.obs;
validatePassword(){
  if(password!=password1){
    error1.value=true;
    return error.value="Senhas não conferem";

  }
}
validateEmail(){
  if (!email.isEmail) {
    return error.value="Inira um Email Valido";


  }
}