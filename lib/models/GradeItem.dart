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


/** This is an auto generated class representing the GradeItem type in your schema. */
@immutable
class GradeItem extends Model {
  static const classType = const _GradeItemModelType();
  final String id;
  final String? _gradesheetId;
  final String? _ctsItemId;
  final Grade? _grade;
  final String? _comment;
  final List<GradeItemGradeSheet>? _GradeSheets;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get gradesheetId {
    try {
      return _gradesheetId!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get ctsItemId {
    try {
      return _ctsItemId!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Grade get grade {
    try {
      return _grade!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get comment {
    return _comment;
  }
  
  List<GradeItemGradeSheet>? get GradeSheets {
    return _GradeSheets;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const GradeItem._internal({required this.id, required gradesheetId, required ctsItemId, required grade, comment, GradeSheets, createdAt, updatedAt}): _gradesheetId = gradesheetId, _ctsItemId = ctsItemId, _grade = grade, _comment = comment, _GradeSheets = GradeSheets, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory GradeItem({String? id, required String gradesheetId, required String ctsItemId, required Grade grade, String? comment, List<GradeItemGradeSheet>? GradeSheets}) {
    return GradeItem._internal(
      id: id == null ? UUID.getUUID() : id,
      gradesheetId: gradesheetId,
      ctsItemId: ctsItemId,
      grade: grade,
      comment: comment,
      GradeSheets: GradeSheets != null ? List<GradeItemGradeSheet>.unmodifiable(GradeSheets) : GradeSheets);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GradeItem &&
      id == other.id &&
      _gradesheetId == other._gradesheetId &&
      _ctsItemId == other._ctsItemId &&
      _grade == other._grade &&
      _comment == other._comment &&
      DeepCollectionEquality().equals(_GradeSheets, other._GradeSheets);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("GradeItem {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("gradesheetId=" + "$_gradesheetId" + ", ");
    buffer.write("ctsItemId=" + "$_ctsItemId" + ", ");
    buffer.write("grade=" + (_grade != null ? enumToString(_grade)! : "null") + ", ");
    buffer.write("comment=" + "$_comment" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  GradeItem copyWith({String? id, String? gradesheetId, String? ctsItemId, Grade? grade, String? comment, List<GradeItemGradeSheet>? GradeSheets}) {
    return GradeItem._internal(
      id: id ?? this.id,
      gradesheetId: gradesheetId ?? this.gradesheetId,
      ctsItemId: ctsItemId ?? this.ctsItemId,
      grade: grade ?? this.grade,
      comment: comment ?? this.comment,
      GradeSheets: GradeSheets ?? this.GradeSheets);
  }
  
  GradeItem.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _gradesheetId = json['gradesheetId'],
      _ctsItemId = json['ctsItemId'],
      _grade = enumFromString<Grade>(json['grade'], Grade.values),
      _comment = json['comment'],
      _GradeSheets = json['GradeSheets'] is List
        ? (json['GradeSheets'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => GradeItemGradeSheet.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'gradesheetId': _gradesheetId, 'ctsItemId': _ctsItemId, 'grade': enumToString(_grade), 'comment': _comment, 'GradeSheets': _GradeSheets?.map((GradeItemGradeSheet? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "gradeItem.id");
  static final QueryField GRADESHEETID = QueryField(fieldName: "gradesheetId");
  static final QueryField CTSITEMID = QueryField(fieldName: "ctsItemId");
  static final QueryField GRADE = QueryField(fieldName: "grade");
  static final QueryField COMMENT = QueryField(fieldName: "comment");
  static final QueryField GRADESHEETS = QueryField(
    fieldName: "GradeSheets",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (GradeItemGradeSheet).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "GradeItem";
    modelSchemaDefinition.pluralName = "GradeItems";
    
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
      key: GradeItem.GRADESHEETID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradeItem.CTSITEMID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradeItem.GRADE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradeItem.COMMENT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: GradeItem.GRADESHEETS,
      isRequired: false,
      ofModelName: (GradeItemGradeSheet).toString(),
      associatedKey: GradeItemGradeSheet.GRADEITEM
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

class _GradeItemModelType extends ModelType<GradeItem> {
  const _GradeItemModelType();
  
  @override
  GradeItem fromJson(Map<String, dynamic> jsonData) {
    return GradeItem.fromJson(jsonData);
  }
}