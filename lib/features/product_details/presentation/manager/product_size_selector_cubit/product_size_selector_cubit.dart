import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSizeSelectorCubit extends Cubit<String> {
  ProductSizeSelectorCubit() : super('S');

  void selectSize(String newSize) {
    emit(newSize);
  }
}
