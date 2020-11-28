// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Patient _$PatientFromJson(Map<String, dynamic> json) {
  return Patient()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..sex = json['sex'] as String
    ..age = json['age'] as String
    ..room = json['room'] as String
    ..date = json['date']
    ..address = json['address'] as String
    ..phone = json['phone'] as String
    ..inPatient = json['inPatient'] as bool
    ..currentMedication = json['currentMedication'] as String ?? 'NIL'
    ..diagnosis = Diagnosis.fromJson(json['diagnosis'] as Map<String, dynamic>)
    ..presentHistory =
        PresentHistory.fromJson(json['presentHistory'] as Map<String, dynamic>)
    ..personalHistory = PersonalHistory.fromJson(
        json['personalHistory'] as Map<String, dynamic>)
    ..pastHistory =
        PastHistory.fromJson(json['pastHistory'] as Map<String, dynamic>)
    ..vitals = Vitals.fromJson(json['vitals'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PatientToJson(Patient instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sex': instance.sex,
      'age': instance.age,
      'room': instance.room,
      'date': instance.date,
      'address': instance.address,
      'phone': instance.phone,
      'inPatient': instance.inPatient,
      'currentMedication': instance.currentMedication,
      'diagnosis': instance.diagnosis,
      'presentHistory': instance.presentHistory,
      'personalHistory': instance.personalHistory,
      'pastHistory': instance.pastHistory,
      'vitals': instance.vitals,
    };

Diagnosis _$DiagnosisFromJson(Map<String, dynamic> json) {
  return Diagnosis()
    ..pd1 = json['pd1'] as String ?? ''
    ..pd2 = json['pd2'] as String ?? ''
    ..pd3 = json['pd3'] as String ?? ''
    ..finalDiagnosis = json['final'] as String ?? ''
    ..icd = json['icd'] as String;
}

Map<String, dynamic> _$DiagnosisToJson(Diagnosis instance) => <String, dynamic>{
      'pd1': instance.pd1,
      'pd2': instance.pd2,
      'pd3': instance.pd3,
      'final': instance.finalDiagnosis,
      'icd': instance.icd,
    };

History _$HistoryFromJson(Map<String, dynamic> json) {
  return History()
    ..description = json['description'] as String ?? ''
    ..duration = json['duration'] as String ?? '';
}

Map<String, dynamic> _$HistoryToJson(History instance) => <String, dynamic>{
      'description': instance.description,
      'duration': instance.duration,
    };

PresentHistory _$PresentHistoryFromJson(Map<String, dynamic> json) {
  return PresentHistory()
    ..ph1 = History.fromJson(json['ph1'] as Map<String, dynamic>)
    ..ph2 = History.fromJson(json['ph2'] as Map<String, dynamic>)
    ..ph3 = History.fromJson(json['ph3'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PresentHistoryToJson(PresentHistory instance) =>
    <String, dynamic>{
      'ph1': instance.ph1,
      'ph2': instance.ph2,
      'ph3': instance.ph3,
    };

PastHistory _$PastHistoryFromJson(Map<String, dynamic> json) {
  return PastHistory()
    ..diabates = json['diabates'] as bool ?? false
    ..hyperTension = json['hyperTension'] as bool ?? false
    ..cva = json['cva'] as bool ?? false
    ..other = json['other'] as String ?? '';
}

Map<String, dynamic> _$PastHistoryToJson(PastHistory instance) =>
    <String, dynamic>{
      'diabates': instance.diabates,
      'hyperTension': instance.hyperTension,
      'cva': instance.cva,
      'other': instance.other,
    };

PersonalHistory _$PersonalHistoryFromJson(Map<String, dynamic> json) {
  return PersonalHistory()
    ..currentSmoker = json['currentSmoker'] as bool ?? false
    ..exSmoker = json['exSmoker'] as bool ?? false
    ..alcoholic = json['alcoholic'] as bool ?? false
    ..sleep = json['sleep'] as String ?? ''
    ..bowelBladderHistory = json['bowelBladderHistory'] as String ?? 'NIL'
    ..familyHistory = json['familyHistory'] as String ?? 'NIL'
    ..otherRemarks = json['otherRemarks'] as String ?? 'NIL';
}

Map<String, dynamic> _$PersonalHistoryToJson(PersonalHistory instance) =>
    <String, dynamic>{
      'currentSmoker': instance.currentSmoker,
      'exSmoker': instance.exSmoker,
      'alcoholic': instance.alcoholic,
      'sleep': instance.sleep,
      'bowelBladderHistory': instance.bowelBladderHistory,
      'familyHistory': instance.familyHistory,
      'otherRemarks': instance.otherRemarks,
    };

Vitals _$VitalsFromJson(Map<String, dynamic> json) {
  return Vitals()
    ..bp = json['bp'] as String ?? 'Unavailbale'
    ..pulse = json['pulse'] as String ?? 'Unavailbale'
    ..respRate = json['respRate'] as String ?? 'Unavailbale'
    ..sp02 = json['sp02'] as String ?? 'Unavailbale'
    ..grbs = json['grbs'] as String ?? 'Unavailbale';
}

Map<String, dynamic> _$VitalsToJson(Vitals instance) => <String, dynamic>{
      'bp': instance.bp,
      'pulse': instance.pulse,
      'respRate': instance.respRate,
      'sp02': instance.sp02,
      'grbs': instance.grbs,
    };
