import 'package:equatable/equatable.dart';
import 'package:field_training_app/Core/api_services/end_points.dart';

class LoginModel extends Equatable {
  final int? id;
  final String? token;
  final String? expiration;

  const LoginModel({this.id, this.token, this.expiration});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        id: json[ApiKey.id] as int?,
        token: json[ApiKey.token] as String?,
        expiration: json['expiration'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'token': token,
        'expiration': expiration,
      };

  @override
  List<Object?> get props => [id, token, expiration];
}
