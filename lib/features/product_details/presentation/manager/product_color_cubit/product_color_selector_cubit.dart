import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductColorSelectorCubit extends Cubit<Color> {
  ProductColorSelectorCubit() : super(Colors.white);

  void selectProductColor(Color color) {
    emit(color);
  }
}