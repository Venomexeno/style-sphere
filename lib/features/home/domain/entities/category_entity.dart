import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int idEntity;
  final String nameEntity;

  const CategoryEntity({
    required this.idEntity,
    required this.nameEntity,
  });

  @override
  List<Object?> get props => [
        idEntity,
        nameEntity,
      ];
}
