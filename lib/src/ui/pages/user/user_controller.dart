import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:organizer_app/src/models/user/user_model.dart';

part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @observable
  UserModel? userModel;

  @action
   createUserModel(){

  }
}
