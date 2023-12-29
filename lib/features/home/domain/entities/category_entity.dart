import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'category_entity.g.dart';

@HiveType(typeId: 1)
class CategoryEntity extends Equatable {
  @HiveField(0)
  final int idEntity;
  @HiveField(1)
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
