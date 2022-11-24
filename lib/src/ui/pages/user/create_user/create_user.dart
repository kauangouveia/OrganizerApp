import 'package:flutter/material.dart';
import 'package:organizer_app/src/ui/components/button_widget.dart';
import 'package:organizer_app/src/ui/components/text_input_widget.dart';
import 'package:organizer_app/src/ui/global/index.dart';
import 'package:organizer_app/src/ui/pages/user/user_controller.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({Key? key}) : super(key: key);

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  final UserController userController = UserController();

  void nextPage() => Navigator.pushNamed(context, '/login');

  void closeModal() => Navigator.pop(context);

  void handleUser() async {
    final bool res = await userController.createUser();
    showAlertDialog(res);
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
                Center(child: Image.asset(GlobalImages.cube, scale: 1.8)),
                TextInputWidget(
                  hintText: 'Seu nome',
                  controller: userController.nameController,
                  margin: const EdgeInsets.only(top: 22, bottom: 15),
                ),
                TextInputWidget(
                  hintText: 'Seu e-mail',
                  controller: userController.emailController,
                ),
                TextInputWidget(
                  hintText: 'Seu cpf',
                  controller: userController.cpfController,
                ),
                TextInputWidget(
                  hintText: 'Sua senha',
                  obscureText: true,
                  controller: userController.passwordController,
                ),
                ButtonWidget(text: 'REGISTRAR-SE', onClick: handleUser),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showAlertDialog(bool value) {
    Widget okButton = ElevatedButton(
      child: const Text("Fechar"),
      onPressed: () {
        closeModal();
        if (value) nextPage();
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text(value ? 'Sucesso' : 'Erro'),
      content:
          Text(value ? "Usuário cadastrado com sucesso" : 'Ocorreu um erro'),
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
