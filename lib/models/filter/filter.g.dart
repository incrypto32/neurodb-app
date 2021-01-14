// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Filter _$FilterFromJson(Map<String, dynamic> json) {
  return Filter(
    male: json['male'] as bool ?? false,
    female: json['female'] as bool ?? false,
    ageGroup: json['ageGroup'] as String ?? '_',
    icd: json['icd'] as String ?? '_',
    sexFilter: json['sexFilter'] as String ?? '_',
  );
}

Map<String, dynamic> _$FilterToJson(Filter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('male', instance.male);
  writeNotNull('female', instance.female);
  writeNotNull('sexFilter', instance.sexFilter);
  writeNotNull('ageGroup', instance.ageGroup);
  writeNotNull('icd', instance.icd);
  return val;
}
