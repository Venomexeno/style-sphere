import 'package:flutter_bloc/flutter_bloc.dart';

class ShirtSizeSelectorCubit extends Cubit<String> {
  ShirtSizeSelectorCubit() : super('S');

  void selectSize(String newSize) {
    emit(newSize);
  }
}
