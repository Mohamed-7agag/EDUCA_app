import 'package:flutter_bloc/flutter_bloc.dart';

class SelectAnswerCubit extends Cubit<List<String>> {
  SelectAnswerCubit() : super(List.generate(20, (index) => ''));

  void setAnswer(int questionIndex, String answer) {
    state[questionIndex] = answer;
    List<String> temp = List.from(state);
    emit(temp);
  }
}
