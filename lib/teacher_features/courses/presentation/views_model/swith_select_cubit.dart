// ignore_for_file: unnecessary_overrides

import 'package:flutter_bloc/flutter_bloc.dart';

class SwithSelectCubit extends Cubit<bool> {
  SwithSelectCubit() : super(false);

  @override
  bool get state => super.state;
  void toggle() {
    emit(!state);
  }
}
