import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final String? token;
  final String? expiration;

  const LoginModel({this.token, this.expiration});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json['token'] as String?,
        expiration: json['expiration'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'expiration': expiration,
      };

  @override
  List<Object?> get props => [token, expiration];
}
