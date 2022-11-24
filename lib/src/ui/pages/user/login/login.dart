import 'package:flutter/material.dart';
import 'package:organizer_app/src/ui/components/button_widget.dart';
import 'package:organizer_app/src/ui/components/text_input_widget.dart';
import 'package:organizer_app/src/ui/components/text_widget.dart';
import 'package:organizer_app/src/ui/global/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  teste() {
    print('teste');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Image.asset(GlobalImages.login, scale: 1)),
                const TextInputWidget(
                  hintText: 'Seu e-mail',
                  margin: EdgeInsets.only(top: 22, bottom: 15),
                ),
                const TextInputWidget(
                  hintText: 'Sua senha',
                  margin: EdgeInsets.only(bottom: 25),
                ),
                const TextWidget(
                  text: 'Cadastrar-se',
                  alignment: Alignment.centerLeft,
                ),
                ButtonWidget(
                  text: 'ENTRAR',
                  margin: const EdgeInsets.only(top: 40),
                  onClick: teste,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
