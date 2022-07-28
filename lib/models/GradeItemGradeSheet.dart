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


/** This is an auto generated class representing the GradeItemGradeSheet type in your schema. */
@immutable
class GradeItemGradeSheet extends Model {
  static const classType = const _GradeItemGradeSheetModelType();
  final String id;
  final GradeItem? _gradeItem;
  final GradeSheet? _gradeSheet;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  GradeItem get gradeItem {
    try {
      return _gradeItem!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  GradeSheet get gradeSheet {
    try {
      return _gradeSheet!;
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
  
  const GradeItemGradeSheet._internal({required this.id, required gradeItem, required gradeSheet, createdAt, updatedAt}): _gradeItem = gradeItem, _gradeSheet = gradeSheet, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory GradeItemGradeSheet({String? id, required GradeItem gradeItem, required GradeSheet gradeSheet}) {
    return GradeItemGradeSheet._internal(
      id: id == null ? UUID.getUUID() : id,
      gradeItem: gradeItem,
      gradeSheet: gradeSheet);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GradeItemGradeSheet &&
      id == other.id &&
      _gradeItem == other._gradeItem &&
      _gradeSheet == other._gradeSheet;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("GradeItemGradeSheet {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("gradeItem=" + (_gradeItem != null ? _gradeItem!.toString() : "null") + ", ");
    buffer.write("gradeSheet=" + (_gradeSheet != null ? _gradeSheet!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  GradeItemGradeSheet copyWith({String? id, GradeItem? gradeItem, GradeSheet? gradeSheet}) {
    return GradeItemGradeSheet._internal(
      id: id ?? this.id,
      gradeItem: gradeItem ?? this.gradeItem,
      gradeSheet: gradeSheet ?? this.gradeSheet);
  }
  
  GradeItemGradeSheet.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _gradeItem = json['gradeItem']?['serializedData'] != null
        ? GradeItem.fromJson(new Map<String, dynamic>.from(json['gradeItem']['serializedData']))
        : null,
      _gradeSheet = json['gradeSheet']?['serializedData'] != null
        ? GradeSheet.fromJson(new Map<String, dynamic>.from(json['gradeSheet']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'gradeItem': _gradeItem?.toJson(), 'gradeSheet': _gradeSheet?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "gradeItemGradeSheet.id");
  static final QueryField GRADEITEM = QueryField(
    fieldName: "gradeItem",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (GradeItem).toString()));
  static final QueryField GRADESHEET = QueryField(
    fieldName: "gradeSheet",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (GradeSheet).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "GradeItemGradeSheet";
    modelSchemaDefinition.pluralName = "GradeItemGradeSheets";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: GradeItemGradeSheet.GRADEITEM,
      isRequired: true,
      targetName: "gradeItemID",
      ofModelName: (GradeItem).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: GradeItemGradeSheet.GRADESHEET,
      isRequired: true,
      targetName: "gradeSheetID",
      ofModelName: (GradeSheet).toString()
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

class _GradeItemGradeSheetModelType extends ModelType<GradeItemGradeSheet> {
  const _GradeItemGradeSheetModelType();
  
  @override
  GradeItemGradeSheet fromJson(Map<String, dynamic> jsonData) {
    return GradeItemGradeSheet.fromJson(jsonData);
  }
}