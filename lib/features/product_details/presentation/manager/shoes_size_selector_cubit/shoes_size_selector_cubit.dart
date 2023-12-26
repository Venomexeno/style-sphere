import 'package:flutter_bloc/flutter_bloc.dart';

class ShoesSizeSelectorCubit extends Cubit<int> {
  ShoesSizeSelectorCubit() : super(36);

  void selectSize(int newSize) {
    emit(newSize);
  }
}
