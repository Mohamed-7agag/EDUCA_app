part of 'student_profile_cubit_cubit.dart';

sealed class StudentProfileState extends Equatable {
  const StudentProfileState();

  @override
  List<Object> get props => [];
}

final class StudentProfileInitial extends StudentProfileState {}

final class StudentProfileLoading extends StudentProfileState {}

final class StudentProfileSuccess extends StudentProfileState {
  final StudentModel studentModel;
  const StudentProfileSuccess({required this.studentModel});
}

final class StudentProfileFailure extends StudentProfileState {
  final String errMessage;
  const StudentProfileFailure({required this.errMessage});
}
