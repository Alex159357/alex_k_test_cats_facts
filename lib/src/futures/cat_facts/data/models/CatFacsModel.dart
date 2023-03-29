import 'package:alex_k_test_cats_facts/src/futures/cat_facts/domain/entities/cat_fact_entity.dart';

class CatFactsModel extends CatFactEntity {
  const CatFactsModel({
    required super.id,
    required super.user,
    required super.text,
    required super.v,
    required super.source,
    required super.updatedAt,
    required super.type,
    required super.createdAt,
    required super.deleted,
    required super.used});

  factory CatFactsModel.fromJson(Map<String, dynamic> json) {
    return CatFactsModel(
        id: json["_id"],
        user: json["user"],
        text: json["text"],
        v: json["__v"],
        source: json["source"],
        updatedAt: DateTime.parse(json["createdAt"]),
        type: json["type"],
        createdAt: DateTime.parse(json["updatedAt"]),
        deleted: json["deleted"],
        used: json["used"]);
  }

  factory CatFactsModel.fromDbJson( Map<dynamic, dynamic> dbMap){
    Map<String, dynamic> convertedMap = dbMap.map((key, value) =>  MapEntry(key.toString(), value));
    return CatFactsModel.fromJson(convertedMap);
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "user": user,
      "text": text,
      "__v": v,
      "source": source,
      "updatedAt": updatedAt.toIso8601String(),
      "type": type,
      "createdAt": createdAt.toIso8601String(),
      "deleted": deleted,
      "used": used
    };
  }


}
