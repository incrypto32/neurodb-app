// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoundsData _$RoundsDataFromJson(Map<String, dynamic> json) {
  return RoundsData()
    ..bp = json['bp'] as String ?? '_'
    ..temp = json['temp'] as String ?? '_'
    ..pulse = json['pulse'] as String ?? '_'
    ..respRate = json['respRate'] as String ?? '_'
    ..sp02 = json['sp02'] as String ?? '_'
    ..grbs = json['grbs'] as String ?? '_'
    ..newComplaints = json['newComplaints'] as String ?? '_'
    ..currentStatus = json['currentStatus'] as String ?? '_'
    ..investigation = json['investigation'] as String ?? '_'
    ..medication = json['medication'] as String ?? '_'
    ..comment = json['comment'] as String ?? '_'
    ..status = json['status'] as String ?? '_'
    ..timeStamp = json['timeStamp'] ?? '_'
    ..procedures = json['procedures'] == null
        ? null
        : Procedures.fromJson(json['procedures'] as Map<String, dynamic>);
}

Map<String, dynamic> _$RoundsDataToJson(RoundsData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bp', instance.bp);
  writeNotNull('temp', instance.temp);
  writeNotNull('pulse', instance.pulse);
  writeNotNull('respRate', instance.respRate);
  writeNotNull('sp02', instance.sp02);
  writeNotNull('grbs', instance.grbs);
  writeNotNull('newComplaints', instance.newComplaints);
  writeNotNull('currentStatus', instance.currentStatus);
  writeNotNull('investigation', instance.investigation);
  writeNotNull('medication', instance.medication);
  writeNotNull('comment', instance.comment);
  writeNotNull('status', instance.status);
  writeNotNull('timeStamp', instance.timeStamp);
  val['procedures'] = instance.procedures?.toJson();
  return val;
}

Procedures _$ProceduresFromJson(Map<String, dynamic> json) {
  return Procedures(
    mechanicalThrombectomy: json['mechanicalThrombectomy'] as bool ?? false,
    thrombolysis: json['thrombolysis'] as bool ?? false,
    conservative: json['conservative'] as bool ?? false,
  );
}

Map<String, dynamic> _$ProceduresToJson(Procedures instance) =>
    <String, dynamic>{
      'mechanicalThrombectomy': instance.mechanicalThrombectomy,
      'thrombolysis': instance.thrombolysis,
      'conservative': instance.conservative,
    };
