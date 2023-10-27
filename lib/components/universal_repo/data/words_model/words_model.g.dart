// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'words_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WordsModelAdapter extends TypeAdapter<WordsModel> {
  @override
  final int typeId = 0;

  @override
  WordsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WordsModel(
      english: fields[0] as String,
      russian: fields[1] as String,
      createDate: fields[2] as String,
      isFavorite: fields[3] as bool,
      isInBasket: fields[4] as bool,
      id: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, WordsModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.english)
      ..writeByte(1)
      ..write(obj.russian)
      ..writeByte(2)
      ..write(obj.createDate)
      ..writeByte(3)
      ..write(obj.isFavorite)
      ..writeByte(4)
      ..write(obj.isInBasket)
      ..writeByte(5)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
