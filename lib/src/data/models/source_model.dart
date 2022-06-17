import 'package:daily_news/src/logic_business/entities/source.dart';

class SourceModel extends Source {

  const SourceModel({
    required super.id,
    required super.name
  });

  factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
    id: (json["id"] == null) ? '' : json["id"],
    name: (json["name"] == null) ? '' : json["name"],
  );
}