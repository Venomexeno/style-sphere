// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductCategoryEntityAdapter extends TypeAdapter<ProductCategoryEntity> {
  @override
  final int typeId = 4;

  @override
  ProductCategoryEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductCategoryEntity(
      idEntity: fields[0] as int,
      nameEntity: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductCategoryEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.idEntity)
      ..writeByte(1)
      ..write(obj.nameEntity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductCategoryEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
