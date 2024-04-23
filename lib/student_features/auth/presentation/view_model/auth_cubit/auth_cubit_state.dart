part of 'auth_cubit.dart';

sealed class AuthCubitState extends Equatable {
  const AuthCubitState();

  @override
  List<Object> get props => [];
}

final class AuthCubitInitial extends AuthCubitState {}
final class AuthCubitLoginLoading extends AuthCubitState {}
final class AuthCubitLoginSuccess extends AuthCubitState {}
final class AuthCubitLoginFailure extends AuthCubitState {}
final class AuthCubitRegisterLoading extends AuthCubitState {}
final class AuthCubitRegisterSuccess extends AuthCubitState {}
final class AuthCubitRegisterFailure extends AuthCubitState {}

