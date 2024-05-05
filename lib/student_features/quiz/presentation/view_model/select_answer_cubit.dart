import 'package:flutter_bloc/flutter_bloc.dart';

class SelectAnswerCubit extends Cubit<String> {
  SelectAnswerCubit() : super('');

  void select(String text) => emit(text);
  
}
