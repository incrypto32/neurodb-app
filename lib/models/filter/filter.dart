import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'filter.g.dart';

@JsonSerializable(nullable: false, explicitToJson: true)
class Filter {
  @JsonKey(nullable: true, defaultValue: false, includeIfNull: false)
  bool male;
  @JsonKey(nullable: true, defaultValue: false, includeIfNull: false)
  bool female;
  @JsonKey(nullable: true, defaultValue: "_", includeIfNull: false)
  String sexFilter;
  @JsonKey(nullable: true, defaultValue: "_", includeIfNull: false)
  String ageGroup;
  @JsonKey(nullable: true, defaultValue: "_", includeIfNull: false)
  String icd;
  Filter(
      {this.male = false,
      this.female = false,
      this.ageGroup,
      this.icd,
      this.sexFilter});

  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);
  Map<String, dynamic> toJson() => _$FilterToJson(this);

  Query getGenderQuery(Query query) {
    if (male) {
      return query.where("sex", isEqualTo: "M");
    } else if (female) {
      return query.where("sex", isEqualTo: "F");
    } else {
      return query.where("sex", isEqualTo: "O");
    }
  }

  // Query getAgeGroupQuery(Query query, String ageGroup) {
  //   var pair = ageGroup.split('-');
  //   if (pair.length != 2) {
  //     print("Age group error");
  //     return query;
  //   } else {
  //    return query.where(field)
  //   }
  // }
  getQuery(CollectionReference collection) {
    var query = getGenderQuery(collection);
    if (icd != null && icd != "") {
      query = query.where("icd", isEqualTo: icd);
    }
    return query;
  }
}
