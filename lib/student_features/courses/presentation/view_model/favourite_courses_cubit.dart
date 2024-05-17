import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteCoursesCubit extends Cubit<bool> {
  FavouriteCoursesCubit() : super(false);
  // todo make favourite based on course model object
  void changeState() => emit(!state);
}
