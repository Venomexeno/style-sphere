// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_products_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryProductsEntityAdapter
    extends TypeAdapter<CategoryProductsEntity> {
  @override
  final int typeId = 5;

  @override
  CategoryProductsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryProductsEntity(
      idEntity: fields[0] as int,
      titleEntity: fields[1] as String,
      priceEntity: fields[2] as num,
      descriptionEntity: fields[3] as String,
      imagesEntity: (fields[4] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, CategoryProductsEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.idEntity)
      ..writeByte(1)
      ..write(obj.titleEntity)
      ..writeByte(2)
      ..write(obj.priceEntity)
      ..writeByte(3)
      ..write(obj.descriptionEntity)
      ..writeByte(4)
      ..write(obj.imagesEntity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryProductsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
