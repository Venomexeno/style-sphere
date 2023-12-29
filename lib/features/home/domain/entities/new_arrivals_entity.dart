import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'new_arrivals_entity.g.dart';

@HiveType(typeId: 0)
class NewArrivalsEntity extends Equatable {
  @HiveField(0)
  final int idEntity;
  @HiveField(1)
  final String titleEntity;
  @HiveField(2)
  final num priceEntity;
  @HiveField(3)
  final String descriptionEntity;
  @HiveField(4)
  final List<String> imagesEntity;

  const NewArrivalsEntity({
    required this.idEntity,
    required this.titleEntity,
    required this.priceEntity,
    required this.descriptionEntity,
    required this.imagesEntity,
  });

  @override
  List<Object?> get props => [
        idEntity,
        titleEntity,
        priceEntity,
        descriptionEntity,
        imagesEntity,
      ];
}
