import 'package:equatable/equatable.dart';

class CheckEmailEntity extends Equatable {
  final bool isAvailableEntity;

  const CheckEmailEntity({
    required this.isAvailableEntity,
  });

  @override
  List<Object?> get props => [
    isAvailableEntity,
      ];
}
