import 'package:flutter_bloc/flutter_bloc.dart';

class BottomBarCubitForTeacher extends Cubit<int> {
  BottomBarCubitForTeacher() : super(2);

  void changeBottomBarIndex(int index) {
    emit(index);
  }
}
