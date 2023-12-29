// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductDetailsEntityAdapter extends TypeAdapter<ProductDetailsEntity> {
  @override
  final int typeId = 3;

  @override
  ProductDetailsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductDetailsEntity(
      productCategoryEntity: fields[4] as ProductCategoryEntity,
      idEntity: fields[0] as int,
      titleEntity: fields[1] as String,
      priceEntity: fields[2] as num,
      descriptionEntity: fields[3] as String,
      imagesEntity: (fields[5] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductDetailsEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.idEntity)
      ..writeByte(1)
      ..write(obj.titleEntity)
      ..writeByte(2)
      ..write(obj.priceEntity)
      ..writeByte(3)
      ..write(obj.descriptionEntity)
      ..writeByte(4)
      ..write(obj.productCategoryEntity)
      ..writeByte(5)
      ..write(obj.imagesEntity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductDetailsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
