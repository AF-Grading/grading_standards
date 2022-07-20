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
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the GradeSheet type in your schema. */
@immutable
class GradeSheet extends Model {
  static const classType = const _GradeSheetModelType();
  final String id;
  final String? _instructorId;
  final String? _studentId;
  final int? _missionNum;
  final String? _grades;
  final Grade? _grade;
  final String? _adQual;
  final String? _pilotQual;
  final String? _weather;
  final String? _sortieType;
  final String? _dayNight;
  final TemporalDateTime? _startTime;
  final TemporalDateTime? _endTime;
  final String? _profile;
  final String? _overallComments;
  final String? _recommendations;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get instructorId {
    return _instructorId;
  }
  
  String? get studentId {
    return _studentId;
  }
  
  int? get missionNum {
    return _missionNum;
  }
  
  String? get grades {
    return _grades;
  }
  
  Grade? get grade {
    return _grade;
  }
  
  String? get adQual {
    return _adQual;
  }
  
  String? get pilotQual {
    return _pilotQual;
  }
  
  String? get weather {
    return _weather;
  }
  
  String? get sortieType {
    return _sortieType;
  }
  
  String? get dayNight {
    return _dayNight;
  }
  
  TemporalDateTime? get startTime {
    return _startTime;
  }
  
  TemporalDateTime? get endTime {
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
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const GradeSheet._internal({required this.id, instructorId, studentId, missionNum, grades, grade, adQual, pilotQual, weather, sortieType, dayNight, startTime, endTime, profile, overallComments, recommendations, createdAt, updatedAt}): _instructorId = instructorId, _studentId = studentId, _missionNum = missionNum, _grades = grades, _grade = grade, _adQual = adQual, _pilotQual = pilotQual, _weather = weather, _sortieType = sortieType, _dayNight = dayNight, _startTime = startTime, _endTime = endTime, _profile = profile, _overallComments = overallComments, _recommendations = recommendations, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory GradeSheet({String? id, String? instructorId, String? studentId, int? missionNum, String? grades, Grade? grade, String? adQual, String? pilotQual, String? weather, String? sortieType, String? dayNight, TemporalDateTime? startTime, TemporalDateTime? endTime, String? profile, String? overallComments, String? recommendations}) {
    return GradeSheet._internal(
      id: id == null ? UUID.getUUID() : id,
      instructorId: instructorId,
      studentId: studentId,
      missionNum: missionNum,
      grades: grades,
      grade: grade,
      adQual: adQual,
      pilotQual: pilotQual,
      weather: weather,
      sortieType: sortieType,
      dayNight: dayNight,
      startTime: startTime,
      endTime: endTime,
      profile: profile,
      overallComments: overallComments,
      recommendations: recommendations);
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
      _grades == other._grades &&
      _grade == other._grade &&
      _adQual == other._adQual &&
      _pilotQual == other._pilotQual &&
      _weather == other._weather &&
      _sortieType == other._sortieType &&
      _dayNight == other._dayNight &&
      _startTime == other._startTime &&
      _endTime == other._endTime &&
      _profile == other._profile &&
      _overallComments == other._overallComments &&
      _recommendations == other._recommendations;
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
    buffer.write("missionNum=" + (_missionNum != null ? _missionNum!.toString() : "null") + ", ");
    buffer.write("grades=" + "$_grades" + ", ");
    buffer.write("grade=" + (_grade != null ? enumToString(_grade)! : "null") + ", ");
    buffer.write("adQual=" + "$_adQual" + ", ");
    buffer.write("pilotQual=" + "$_pilotQual" + ", ");
    buffer.write("weather=" + "$_weather" + ", ");
    buffer.write("sortieType=" + "$_sortieType" + ", ");
    buffer.write("dayNight=" + "$_dayNight" + ", ");
    buffer.write("startTime=" + (_startTime != null ? _startTime!.format() : "null") + ", ");
    buffer.write("endTime=" + (_endTime != null ? _endTime!.format() : "null") + ", ");
    buffer.write("profile=" + "$_profile" + ", ");
    buffer.write("overallComments=" + "$_overallComments" + ", ");
    buffer.write("recommendations=" + "$_recommendations" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  GradeSheet copyWith({String? id, String? instructorId, String? studentId, int? missionNum, String? grades, Grade? grade, String? adQual, String? pilotQual, String? weather, String? sortieType, String? dayNight, TemporalDateTime? startTime, TemporalDateTime? endTime, String? profile, String? overallComments, String? recommendations}) {
    return GradeSheet._internal(
      id: id ?? this.id,
      instructorId: instructorId ?? this.instructorId,
      studentId: studentId ?? this.studentId,
      missionNum: missionNum ?? this.missionNum,
      grades: grades ?? this.grades,
      grade: grade ?? this.grade,
      adQual: adQual ?? this.adQual,
      pilotQual: pilotQual ?? this.pilotQual,
      weather: weather ?? this.weather,
      sortieType: sortieType ?? this.sortieType,
      dayNight: dayNight ?? this.dayNight,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      profile: profile ?? this.profile,
      overallComments: overallComments ?? this.overallComments,
      recommendations: recommendations ?? this.recommendations);
  }
  
  GradeSheet.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _instructorId = json['instructorId'],
      _studentId = json['studentId'],
      _missionNum = (json['missionNum'] as num?)?.toInt(),
      _grades = json['grades'],
      _grade = enumFromString<Grade>(json['grade'], Grade.values),
      _adQual = json['adQual'],
      _pilotQual = json['pilotQual'],
      _weather = json['weather'],
      _sortieType = json['sortieType'],
      _dayNight = json['dayNight'],
      _startTime = json['startTime'] != null ? TemporalDateTime.fromString(json['startTime']) : null,
      _endTime = json['endTime'] != null ? TemporalDateTime.fromString(json['endTime']) : null,
      _profile = json['profile'],
      _overallComments = json['overallComments'],
      _recommendations = json['recommendations'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'instructorId': _instructorId, 'studentId': _studentId, 'missionNum': _missionNum, 'grades': _grades, 'grade': enumToString(_grade), 'adQual': _adQual, 'pilotQual': _pilotQual, 'weather': _weather, 'sortieType': _sortieType, 'dayNight': _dayNight, 'startTime': _startTime?.format(), 'endTime': _endTime?.format(), 'profile': _profile, 'overallComments': _overallComments, 'recommendations': _recommendations, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "gradeSheet.id");
  static final QueryField INSTRUCTORID = QueryField(fieldName: "instructorId");
  static final QueryField STUDENTID = QueryField(fieldName: "studentId");
  static final QueryField MISSIONNUM = QueryField(fieldName: "missionNum");
  static final QueryField GRADES = QueryField(fieldName: "grades");
  static final QueryField GRADE = QueryField(fieldName: "grade");
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
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradeSheet.STUDENTID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradeSheet.MISSIONNUM,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradeSheet.GRADES,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradeSheet.GRADE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradeSheet.ADQUAL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradeSheet.PILOTQUAL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradeSheet.WEATHER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradeSheet.SORTIETYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradeSheet.DAYNIGHT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradeSheet.STARTTIME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradeSheet.ENDTIME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
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