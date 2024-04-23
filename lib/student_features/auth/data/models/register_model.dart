import 'package:equatable/equatable.dart';
import 'package:field_training_app/Core/api_services/end_points.dart';

class RegisterModel extends Equatable {
  final String? status;
  final String? message;

  const RegisterModel({this.status, this.message});

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        status: json[ApiKey.status] as String?,
        message: json[ApiKey.message] as String?,
      );

  Map<String, dynamic> toJson() => {
        ApiKey.status: status,
        ApiKey.message: message,
      };

  @override
  List<Object?> get props => [status, message];
}
