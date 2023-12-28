import 'package:ecommerce/features/order/domain/entities/order_product_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCubit extends Cubit<List<OrderProductEntity>> {
  OrderCubit() : super([]);

  void addOrder(OrderProductEntity newOrder) {
    final List<OrderProductEntity> updatedOrders = List.from(state)
      ..add(newOrder);
    emit(updatedOrders);
  }
}
