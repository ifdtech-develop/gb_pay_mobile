class SigninModel {
  int? id;
  String? name;
  String? email;
  String? cpf;
  String? accessToken;
  String? tokenType;

  SigninModel({
    this.id,
    this.name,
    this.email,
    this.cpf,
    this.accessToken,
    this.tokenType,
  });

  factory SigninModel.fromJson(Map<String, dynamic> json) {
    return SigninModel(
      id: json['id'],
      name: json['nome'],
      email: json['email'],
      cpf: json['cpf'],
      accessToken: json['accessToken'],
      tokenType: json['tokenType'],
    );
  }
}
