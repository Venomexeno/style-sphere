// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryEntityAdapter extends TypeAdapter<CategoryEntity> {
  @override
  final int typeId = 1;

  @override
  CategoryEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryEntity(
      idEntity: fields[0] as int,
      nameEntity: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryEntity obj) {
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
      other is CategoryEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
