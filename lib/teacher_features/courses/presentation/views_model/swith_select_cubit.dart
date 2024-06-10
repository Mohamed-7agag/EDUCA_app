import 'package:flutter_bloc/flutter_bloc.dart';

class SwithSelectCubit extends Cubit<bool> {
  SwithSelectCubit() : super(false);

  bool isactive = false;
  void toggle() {
    isactive = !isactive;
    emit(!state);
  }
}
