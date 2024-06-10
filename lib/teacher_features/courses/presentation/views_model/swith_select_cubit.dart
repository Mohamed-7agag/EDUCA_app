import 'package:flutter_bloc/flutter_bloc.dart';

class SwithSelectCubit extends Cubit<bool> {
  SwithSelectCubit() : super(false);

  bool get state => super.state;
  void toggle() {
    emit(!state);
  }
}