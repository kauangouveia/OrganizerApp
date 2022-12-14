import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:organizer_app/src/models/user/user_model.dart';
import 'package:organizer_app/src/repositories/index.dart';
import 'package:organizer_app/src/services/storage.dart';

part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  UserRepository userRepository = UserRepository();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @observable
  UserModel? userModel;

  @action
  UserModel createUserModel() {
    userModel = UserModel(
      name: nameController.text,
      email: emailController.text,
      cpf: cpfController.text,
      password: passwordController.text,
    );

    return userModel!;
  }

  @action
  Future<bool> createUser() async {
    createUserModel();

    try {
      final bool res = await userRepository.createUser(
        userModel!,
      );

      return res;
    } catch (e) {
      return false;
    }
  }

  @action
  Future<bool> doLogin() async {
    createUserModel();

    try {
      final res = await userRepository.doUserLogin(userModel!);

      if(res.statusCode == 200) {
        Storage.setString('access-token', res.data['token']);
      }

      return res.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
