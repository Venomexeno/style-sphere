// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileEntityAdapter extends TypeAdapter<ProfileEntity> {
  @override
  final int typeId = 2;

  @override
  ProfileEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileEntity(
      nameEntity: fields[0] as String,
      emailEntity: fields[1] as String,
      avatarEntity: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.nameEntity)
      ..writeByte(1)
      ..write(obj.emailEntity)
      ..writeByte(2)
      ..write(obj.avatarEntity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
