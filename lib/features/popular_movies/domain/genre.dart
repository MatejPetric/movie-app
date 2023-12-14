// ignore_for_file: invalid_annotation_target, depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'genre.freezed.dart';
part 'genre.g.dart';

@Freezed()
class Genre with _$Genre {
  @JsonSerializable(explicitToJson: true)
  @HiveType(typeId: 2, adapterName: 'GenreAdapter')
  const factory Genre({
    @HiveField(0) required int id,
    @HiveField(1) required String name,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}
