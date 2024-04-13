import 'package:flutter_bloc/flutter_bloc.dart';

class ClassOptionsCubit extends Cubit<int> {
  ClassOptionsCubit() : super(-1);

  void changeClassOption(int option) {
    emit(option);
  }
}
