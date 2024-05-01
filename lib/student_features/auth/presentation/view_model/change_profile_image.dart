import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ChangeProfileImageCubit extends Cubit<XFile?> {
  ChangeProfileImageCubit() : super(null);

  void changeImage(XFile? image) {
    emit(image!);
  }
}
