class UserModel {
  String? name;
  String? cpf;
  String? password;
  String? email;

  UserModel({this.name, this.cpf, this.password, this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cpf = json['cpf'];
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['cpf'] = cpf;
    data['password'] = password;
    data['email'] = email;
    return data;
  }
}