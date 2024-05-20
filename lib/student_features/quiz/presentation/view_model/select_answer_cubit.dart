import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectAnswerCubit extends Cubit<List<String>> {
  SelectAnswerCubit() : super([]);

  void setAnswer(int questionIndex, String answer) {
    List<String> temp =  List.from(state);
    temp[questionIndex] = answer;
    studentAnswersList = temp;
    emit(temp);
  }
}
