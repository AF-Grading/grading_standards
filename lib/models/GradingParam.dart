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

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the GradingParam type in your schema. */
@immutable
class GradingParam extends Model {
  static const classType = const _GradingParamModelType();
  final String id;
  final String? _ctsItemId;
  final bool? _airland;
  final bool? _min;
  final bool? _oneOneOne;
  final bool? _enroute;
  final bool? _pattern;
  final bool? _tactical;
  final bool? _tacticalPlu;
  final bool? _airdrop;
  final bool? _airdropPlus;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
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
  
  bool get airland {
    try {
      return _airland!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool get min {
    try {
      return _min!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool get oneOneOne {
    try {
      return _oneOneOne!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool get enroute {
    try {
      return _enroute!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool get pattern {
    try {
      return _pattern!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool get tactical {
    try {
      return _tactical!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool get tacticalPlu {
    try {
      return _tacticalPlu!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool get airdrop {
    try {
      return _airdrop!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool get airdropPlus {
    try {
      return _airdropPlus!;
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
  
  const GradingParam._internal({required this.id, required ctsItemId, required airland, required min, required oneOneOne, required enroute, required pattern, required tactical, required tacticalPlu, required airdrop, required airdropPlus, createdAt, updatedAt}): _ctsItemId = ctsItemId, _airland = airland, _min = min, _oneOneOne = oneOneOne, _enroute = enroute, _pattern = pattern, _tactical = tactical, _tacticalPlu = tacticalPlu, _airdrop = airdrop, _airdropPlus = airdropPlus, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory GradingParam({String? id, required String ctsItemId, required bool airland, required bool min, required bool oneOneOne, required bool enroute, required bool pattern, required bool tactical, required bool tacticalPlu, required bool airdrop, required bool airdropPlus}) {
    return GradingParam._internal(
      id: id == null ? UUID.getUUID() : id,
      ctsItemId: ctsItemId,
      airland: airland,
      min: min,
      oneOneOne: oneOneOne,
      enroute: enroute,
      pattern: pattern,
      tactical: tactical,
      tacticalPlu: tacticalPlu,
      airdrop: airdrop,
      airdropPlus: airdropPlus);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GradingParam &&
      id == other.id &&
      _ctsItemId == other._ctsItemId &&
      _airland == other._airland &&
      _min == other._min &&
      _oneOneOne == other._oneOneOne &&
      _enroute == other._enroute &&
      _pattern == other._pattern &&
      _tactical == other._tactical &&
      _tacticalPlu == other._tacticalPlu &&
      _airdrop == other._airdrop &&
      _airdropPlus == other._airdropPlus;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("GradingParam {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("ctsItemId=" + "$_ctsItemId" + ", ");
    buffer.write("airland=" + (_airland != null ? _airland!.toString() : "null") + ", ");
    buffer.write("min=" + (_min != null ? _min!.toString() : "null") + ", ");
    buffer.write("oneOneOne=" + (_oneOneOne != null ? _oneOneOne!.toString() : "null") + ", ");
    buffer.write("enroute=" + (_enroute != null ? _enroute!.toString() : "null") + ", ");
    buffer.write("pattern=" + (_pattern != null ? _pattern!.toString() : "null") + ", ");
    buffer.write("tactical=" + (_tactical != null ? _tactical!.toString() : "null") + ", ");
    buffer.write("tacticalPlu=" + (_tacticalPlu != null ? _tacticalPlu!.toString() : "null") + ", ");
    buffer.write("airdrop=" + (_airdrop != null ? _airdrop!.toString() : "null") + ", ");
    buffer.write("airdropPlus=" + (_airdropPlus != null ? _airdropPlus!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  GradingParam copyWith({String? id, String? ctsItemId, bool? airland, bool? min, bool? oneOneOne, bool? enroute, bool? pattern, bool? tactical, bool? tacticalPlu, bool? airdrop, bool? airdropPlus}) {
    return GradingParam._internal(
      id: id ?? this.id,
      ctsItemId: ctsItemId ?? this.ctsItemId,
      airland: airland ?? this.airland,
      min: min ?? this.min,
      oneOneOne: oneOneOne ?? this.oneOneOne,
      enroute: enroute ?? this.enroute,
      pattern: pattern ?? this.pattern,
      tactical: tactical ?? this.tactical,
      tacticalPlu: tacticalPlu ?? this.tacticalPlu,
      airdrop: airdrop ?? this.airdrop,
      airdropPlus: airdropPlus ?? this.airdropPlus);
  }
  
  GradingParam.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _ctsItemId = json['ctsItemId'],
      _airland = json['airland'],
      _min = json['min'],
      _oneOneOne = json['oneOneOne'],
      _enroute = json['enroute'],
      _pattern = json['pattern'],
      _tactical = json['tactical'],
      _tacticalPlu = json['tacticalPlu'],
      _airdrop = json['airdrop'],
      _airdropPlus = json['airdropPlus'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'ctsItemId': _ctsItemId, 'airland': _airland, 'min': _min, 'oneOneOne': _oneOneOne, 'enroute': _enroute, 'pattern': _pattern, 'tactical': _tactical, 'tacticalPlu': _tacticalPlu, 'airdrop': _airdrop, 'airdropPlus': _airdropPlus, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "gradingParam.id");
  static final QueryField CTSITEMID = QueryField(fieldName: "ctsItemId");
  static final QueryField AIRLAND = QueryField(fieldName: "airland");
  static final QueryField MIN = QueryField(fieldName: "min");
  static final QueryField ONEONEONE = QueryField(fieldName: "oneOneOne");
  static final QueryField ENROUTE = QueryField(fieldName: "enroute");
  static final QueryField PATTERN = QueryField(fieldName: "pattern");
  static final QueryField TACTICAL = QueryField(fieldName: "tactical");
  static final QueryField TACTICALPLU = QueryField(fieldName: "tacticalPlu");
  static final QueryField AIRDROP = QueryField(fieldName: "airdrop");
  static final QueryField AIRDROPPLUS = QueryField(fieldName: "airdropPlus");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "GradingParam";
    modelSchemaDefinition.pluralName = "GradingParams";
    
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
      key: GradingParam.CTSITEMID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradingParam.AIRLAND,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradingParam.MIN,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradingParam.ONEONEONE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradingParam.ENROUTE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradingParam.PATTERN,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradingParam.TACTICAL,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradingParam.TACTICALPLU,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradingParam.AIRDROP,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: GradingParam.AIRDROPPLUS,
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

class _GradingParamModelType extends ModelType<GradingParam> {
  const _GradingParamModelType();
  
  @override
  GradingParam fromJson(Map<String, dynamic> jsonData) {
    return GradingParam.fromJson(jsonData);
  }
}