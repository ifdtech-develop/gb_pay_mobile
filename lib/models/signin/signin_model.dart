class SigninModel {
  int? id;
  String? name;
  String? email;
  String? acessToken;
  String? tokenType;

  SigninModel({
    this.id,
    this.name,
    this.email,
    this.acessToken,
    this.tokenType,
  });

  factory SigninModel.fromJson(Map<String, dynamic> json) {
    return SigninModel(
      id: json['id'],
      name: json['nome'],
      email: json['email'],
      acessToken: json['acessToken'],
      tokenType: json['tokenType'],
    );
  }
}
