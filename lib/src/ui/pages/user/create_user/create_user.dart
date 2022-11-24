import 'package:flutter/material.dart';
import 'package:organizer_app/src/models/user/user_model.dart';
import 'package:organizer_app/src/ui/components/button_widget.dart';
import 'package:organizer_app/src/ui/components/text_input_widget.dart';
import 'package:organizer_app/src/ui/global/index.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({Key? key}) : super(key: key);

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void handleUser() {
    UserModel user = UserModel(
      name: nameController.text,
      email: emailController.text,
      cpf: cpfController.text,
      password: passwordController.text
    );

    print(user.toJson());
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
                  controller: nameController,
                  margin: const EdgeInsets.only(top: 22, bottom: 15),
                ),
                TextInputWidget(
                  hintText: 'Seu e-mail',
                  controller: emailController,
                ),
                TextInputWidget(
                  hintText: 'Seu cpf',
                  controller: cpfController,
                ),
                TextInputWidget(
                  hintText: 'Sua senha',
                  controller: passwordController,
                ),
                ButtonWidget(text: 'REGISTRAR-SE', onClick: handleUser),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
