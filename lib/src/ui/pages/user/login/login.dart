import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organizer_app/src/ui/components/button_widget.dart';
import 'package:organizer_app/src/ui/components/text_input_widget.dart';
import 'package:organizer_app/src/ui/components/text_widget.dart';
import 'package:organizer_app/src/ui/global/index.dart';
import 'package:organizer_app/src/ui/pages/user/user_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserController userController = UserController();

  handleLogin() async {
    final bool res = await userController.doLogin();
    if (!res) return showAlertDialog();

    nextPage();
  }

  void closeModal() => Navigator.pop(context);

  void nextPage() => Navigator.pushNamed(context, '/tasks');

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
                TextInputWidget(
                  hintText: 'Seu e-mail',
                  controller: userController.emailController,
                  margin: const EdgeInsets.only(top: 22, bottom: 15),
                ),
                TextInputWidget(
                  hintText: 'Sua senha',
                  controller: userController.passwordController,
                  margin: const EdgeInsets.only(bottom: 25),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/create-user'),
                  child: const TextWidget(
                    text: 'Cadastrar-se',
                    alignment: Alignment.centerLeft,
                  ),
                ),
                ButtonWidget(
                  text: 'ENTRAR',
                  margin: const EdgeInsets.only(top: 40),
                  onClick: handleLogin,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showAlertDialog() {
    Widget okButton = ElevatedButton(
      child: const Text("Fechar"),
      onPressed: () {
        closeModal();
      },
    );
    AlertDialog alert = AlertDialog(
      title: const Text('Erro'),
      content: const Text('Usuário não encontrado'),
      actions: [okButton],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
