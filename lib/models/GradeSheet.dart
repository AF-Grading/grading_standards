/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the GradeSheet type in your schema. */
@immutable
class GradeSheet extends Model {
  static const classType = const _GradeSheetModelType();
  final String id;
  final String? _instructorId;
  final String? _studentId;
  final String? _missionNum;
  final Grade? _overallGrade;
  final AdQual? _adQual;
  final PilotQual? _pilotQual;
  final Weather? _weather;
  final SortieType? _sortieType;
  final DayNight? _dayNight;
  final int? _startTime;
  final int? _endTime;
  final String? _profile;
  final String? _overallComments;
  final String? _recommendations;
  final List<GradeItemGradeSheet>? _gradeitems;
  final bool? _isDraft;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get instructorId {
    try {
      return _instructorId!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get studentId {
    try {
      return _studentId!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get missionNum {
    try {
      return _missionNum!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Grade? get overallGrade {
    return _overallGrade;
  }
  
  AdQual? get adQual {
    return _adQual;
  }
  
  PilotQual? get pilotQual {
    return _pilotQual;
  }
  
  Weather? get weather {
    return _weather;
  }
  
  SortieType? get sortieType {
    return _sortieType;
  }
  
  DayNight? get dayNight {
    return _dayNight;
  }
  
  int? get startTime {
    return _startTime;
  }
  
  int? get endTime {
    return _endTime;
  }
  
  String? get profile {
    return _profile;
  }
  
  String? get overallComments {
    return _overallComments;
  }
  
  String? get recommendations {
    return _recommendations;
  }
  
  List<GradeItemGradeSheet>? get gradeitems {
    return _gradeitems;
  }
  
  bool get isDraft {
    try {
      return _isDraft!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const GradeSheet._internal({required this.id, required instructorId, required studentId, required missionNum, overallGrade, adQual, pilotQual, weather, sortieType, dayNight, startTime, endTime, profile, overallComments, recommendations, gradeitems, required isDraft, createdAt, updatedAt}): _instructorId = instructorId, _studentId = studentId, _missionNum = missionNum, _overallGrade = overallGrade, _adQual = adQual, _pilotQual = pilotQual, _weather = weather, _sortieType = sortieType, _dayNight = dayNight, _startTime = startTime, _endTime = endTime, _profile = profile, _overallComments = overallComments, _recommendations = recommendations, _gradeitems = gradeitems, _isDraft = isDraft, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory GradeSheet({String? id, required String instructorId, required String studentId, required String missionNum, Grade? overallGrade, AdQual? adQual, PilotQual? pilotQual, Weather? weather, SortieType? sortieType, DayNight? dayNight, int? startTime, int? endTime, String? profile, String? overallComments, String? recommendations, List<GradeItemGradeSheet>? gradeitems, required bool isDraft}) {
    return GradeSheet._internal(
      id: id == null ? UUID.getUUID() : id,
      instructorId: instructorId,
      studentId: studentId,
      missionNum: missionNum,
      overallGrade: overallGrade,
      adQual: adQual,
      pilotQual: pilotQual,
      weather: weather,
      sortieType: sortieType,
      dayNight: dayNight,
      startTime: startTime,
      endTime: endTime,
      profile: profile,
      overallComments: overallComments,
      recommendations: recommendations,
      gradeitems: gradeitems != null ? List<GradeItemGradeSheet>.unmodifiable(gradeitems) : gradeitems,
      isDraft: isDraft);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GradeSheet &&
      id == other.id &&
      _instructorId == other._instructorId &&
      _studentId == other._studentId &&
      _missionNum == other._missionNum &&
      _overallGrade == other._overallGrade &&
      _adQual == other._adQual &&
      _pilotQual == other._pilotQual &&
      _weather == other._weather &&
      _sortieType == other._sortieType &&
      _dayNight == other._dayNight &&
      _startTime == other._startTime &&
      _endTime == other._endTime &&
      _profile == other._profile &&
      _overallComments == other._overallComments &&
      _recommendations == other._recommendations &&
      DeepCollectionEquality().equals(_gradeitems, other._gradeitems) &&
      _isDraft == other._isDraft;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("GradeSheet {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("instructorId=" + "$_instructorId" + ", ");
    buffer.write("studentId=" + "$_studentId" + ", ");
    buffer.write("missionNum=" + "$_missionNum" + ", ");
    buffer.write("overallGrade=" + (_overallGrade != null ? enumToString(_overallGrade)! : "null") + ", ");
    buffer.write("adQual=" + (_adQual != null ? enumToString(_adQual)! : "null") + ", ");
    buffer.write("pilotQual=" + (_pilotQual != null ? enumToString(_pilotQual)! : "null") + ", ");
    buffer.write("weather=" + (_weather != null ? enumToString(_weather)! : "null") + ", ");
    buffer.write("sortieType=" + (_sortieType != null ? enumToString(_sortieType)! : "null") + ", ");
    buffer.write("dayNight=" + (_dayNight != null ? enumToString(_dayNight)! : "null") + ", ");
    buffer.write("startTime=" + (_startTime != null ? _startTime!.toString() : "null") + ", ");
    buffer.write("endTime=" + (_endTime != null ? _endTime!.toString() : "null") + ", ");
    buffer.write("profile=" + "$_profile" + ", ");
    buffer.write("overallComments=" + "$_overallComments" + ", ");
    buffer.write("recommendations=" + "$_recommendations" + ", ");
    buffer.write("isDraft=" + (_isDraft != null ? _isDraft!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  GradeSheet copyWith({String? id, String? instructorId, String? studentId, String? missionNum, Grade? overallGrade, AdQual? adQual, PilotQual? pilotQual, Weather? weather, SortieType? sortieType, DayNight? dayNight, int? startTime, int? endTime, String? profile, String? overallComments, String? recommendations, List<GradeItemGradeSheet>? gradeitems, bool? isDraft}) {
    return GradeSheet._internal(
      id: id ?? this.id,
      instructorId: instructorId ?? this.instructorId,
      studentId: studentId ?? this.studentId,
      missionNum: missionNum ?? this.missionNum,
      overallGrade: overallGrade ?? this.overallGrade,
      adQual: adQual ?? this.adQual,
      pilotQual: pilotQual ?? this.pilotQual,
      weather: weather ?? this.weather,
      sortieType: sortieType ?? this.sortieType,
      dayNight: dayNight ?? this.dayNight,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      profile: profile ?? this.profile,
      overallComments: overallComments ?? this.overallComments,
      recommendations: recommendations ?? this.recommendations,
      gradeitems: gradeitems ?? this.gradeitems,
      isDraft: isDraft ?? this.isDraft);
  }
  
  GradeSheet.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _instructorId = json['instructorId'],
      _studentId = json['studentId'],
      _missionNum = json['missionNum'],
      _overallGrade = enumFromString<Grade>(json['overallGrade'], Grade.values),
      _adQual = enumFromString<AdQual>(json['adQual'], AdQual.values),
      _pilotQual = enumFromString<PilotQual>(json['pilotQual'], PilotQual.values),
      _weather = enumFromString<Weather>(json['weather'], Weather.values),
      _sortieType = enumFromString<SortieType>(json['sortieType'], SortieType.values),
      _dayNight = enumFromString<DayNight>(json['dayNight'], DayNight.values),
      _startTime = (json['startTime'] as num?)?.toInt(),
      _endTime = (json['endTime'] as num?)?.toInt(),
      _profile = json['profile'],
      _overallComments = json['overallComments'],
      _recommendations = json['recommendations'],
      _gradeitems = json['gradeitems'] is List
        ? (json['gradeitems'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => GradeItemGradeSheet.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _isDraft = json['isDraft'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'instructorId': _instructorId, 'studentId': _studentId, 'missionNum': _missionNum, 'overallGrade': enumToString(_overallGrade), 'adQual': enumToString(_adQual), 'pilotQual': enumToString(_pilotQual), 'weather': enumToString(_weather), 'sortieType': enumToString(_sortieType), 'dayNight': enumToString(_dayNight), 'startTime': _startTime, 'endTime': _endTime, 'profile': _profile, 'overallComments': _overallComments, 'recommendations': _recommendations, 'gradeitems': _gradeitems?.map((GradeItemGradeSheet? e) => e?.toJson()).toList(), 'isDraft': _isDraft, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "gradeSheet.id");
  static final QueryField INSTRUCTORID = QueryField(fieldName: "instructorId");
  static final QueryField STUDENTID = QueryField(fieldName: "studentId");
  static final QueryField MISSIONNUM = QueryField(fieldName: "missionNum");
  static final QueryField OVERALLGRADE = QueryField(fieldName: "overallGrade");
  static final QueryField ADQUAL = QueryField(fieldName: "adQual");
  static final QueryField PILOTQUAL = QueryField(fieldName: "pilotQual");
  static final QueryField WEATHER = QueryField(fieldName: "weather");
  static final QueryField SORTIETYPE = QueryField(fieldName: "sortieType");
  static final QueryField DAYNIGHT = QueryField(fieldName: "dayNight");
  static final QueryField STARTTIME = QueryField(fieldName: "startTime");
  static final QueryField ENDTIME = QueryField(fieldName: "endTime");
  static final QueryField PROFILE = QueryField(fieldName: "profile");
  static final QueryField OVERALLCOMMENTS = QueryField(fieldName: "overallComments");
  static final QueryField RECOMMENDATIONS = QueryField(fieldName: "recommendations");
  static final QueryField GRADEITEMS = QueryField(
    fieldName: "gradeitems",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (GradeItemGradeSheet).toString()));
  static final QueryField ISDRAFT = QueryField(fieldName: "isDraft");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "GradeSheet";
    modelSchemaDefinition.pluralName = "GradeSheets";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradeSheet.INSTRUCTORID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradeSheet.STUDENTID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradeSheet.MISSIONNUM,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradeSheet.OVERALLGRADE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradeSheet.ADQUAL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradeSheet.PILOTQUAL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradeSheet.WEATHER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradeSheet.SORTIETYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradeSheet.DAYNIGHT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradeSheet.STARTTIME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradeSheet.ENDTIME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradeSheet.PROFILE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradeSheet.OVERALLCOMMENTS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradeSheet.RECOMMENDATIONS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: GradeSheet.GRADEITEMS,
      isRequired: false,
      ofModelName: (GradeItemGradeSheet).toString(),
      associatedKey: GradeItemGradeSheet.GRADESHEET
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradeSheet.ISDRAFT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _GradeSheetModelType extends ModelType<GradeSheet> {
  const _GradeSheetModelType();
  
  @override
  GradeSheet fromJson(Map<String, dynamic> jsonData) {
    return GradeSheet.fromJson(jsonData);
  }
}