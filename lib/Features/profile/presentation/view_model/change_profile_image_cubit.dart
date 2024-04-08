import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileImageCubit extends Cubit<File?> {
  ProfileImageCubit() : super(null);

  void changeImage(File image) {
    emit(image);
  }
}
