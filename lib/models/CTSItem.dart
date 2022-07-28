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


/** This is an auto generated class representing the CTSItem type in your schema. */
@immutable
class CTSItem extends Model {
  static const classType = const _CTSItemModelType();
  final String id;
  final String? _name;
  final String? _performance;
  final String? _standards;
  final Grade? _fpc;
  final Grade? _fpq;
  final Grade? _mp;
  final Grade? _ip;
  final Grade? _cpad;
  final Grade? _acad;
  final Grade? _adip;
  final Grade? _ldad;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get performance {
    try {
      return _performance!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get standards {
    try {
      return _standards!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Grade? get fpc {
    return _fpc;
  }
  
  Grade? get fpq {
    return _fpq;
  }
  
  Grade? get mp {
    return _mp;
  }
  
  Grade? get ip {
    return _ip;
  }
  
  Grade? get cpad {
    return _cpad;
  }
  
  Grade? get acad {
    return _acad;
  }
  
  Grade? get adip {
    return _adip;
  }
  
  Grade? get ldad {
    return _ldad;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const CTSItem._internal({required this.id, required name, required performance, required standards, fpc, fpq, mp, ip, cpad, acad, adip, ldad, createdAt, updatedAt}): _name = name, _performance = performance, _standards = standards, _fpc = fpc, _fpq = fpq, _mp = mp, _ip = ip, _cpad = cpad, _acad = acad, _adip = adip, _ldad = ldad, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory CTSItem({String? id, required String name, required String performance, required String standards, Grade? fpc, Grade? fpq, Grade? mp, Grade? ip, Grade? cpad, Grade? acad, Grade? adip, Grade? ldad}) {
    return CTSItem._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      performance: performance,
      standards: standards,
      fpc: fpc,
      fpq: fpq,
      mp: mp,
      ip: ip,
      cpad: cpad,
      acad: acad,
      adip: adip,
      ldad: ldad);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CTSItem &&
      id == other.id &&
      _name == other._name &&
      _performance == other._performance &&
      _standards == other._standards &&
      _fpc == other._fpc &&
      _fpq == other._fpq &&
      _mp == other._mp &&
      _ip == other._ip &&
      _cpad == other._cpad &&
      _acad == other._acad &&
      _adip == other._adip &&
      _ldad == other._ldad;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("CTSItem {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("performance=" + "$_performance" + ", ");
    buffer.write("standards=" + "$_standards" + ", ");
    buffer.write("fpc=" + (_fpc != null ? enumToString(_fpc)! : "null") + ", ");
    buffer.write("fpq=" + (_fpq != null ? enumToString(_fpq)! : "null") + ", ");
    buffer.write("mp=" + (_mp != null ? enumToString(_mp)! : "null") + ", ");
    buffer.write("ip=" + (_ip != null ? enumToString(_ip)! : "null") + ", ");
    buffer.write("cpad=" + (_cpad != null ? enumToString(_cpad)! : "null") + ", ");
    buffer.write("acad=" + (_acad != null ? enumToString(_acad)! : "null") + ", ");
    buffer.write("adip=" + (_adip != null ? enumToString(_adip)! : "null") + ", ");
    buffer.write("ldad=" + (_ldad != null ? enumToString(_ldad)! : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  CTSItem copyWith({String? id, String? name, String? performance, String? standards, Grade? fpc, Grade? fpq, Grade? mp, Grade? ip, Grade? cpad, Grade? acad, Grade? adip, Grade? ldad}) {
    return CTSItem._internal(
      id: id ?? this.id,
      name: name ?? this.name,
      performance: performance ?? this.performance,
      standards: standards ?? this.standards,
      fpc: fpc ?? this.fpc,
      fpq: fpq ?? this.fpq,
      mp: mp ?? this.mp,
      ip: ip ?? this.ip,
      cpad: cpad ?? this.cpad,
      acad: acad ?? this.acad,
      adip: adip ?? this.adip,
      ldad: ldad ?? this.ldad);
  }
  
  CTSItem.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _performance = json['performance'],
      _standards = json['standards'],
      _fpc = enumFromString<Grade>(json['fpc'], Grade.values),
      _fpq = enumFromString<Grade>(json['fpq'], Grade.values),
      _mp = enumFromString<Grade>(json['mp'], Grade.values),
      _ip = enumFromString<Grade>(json['ip'], Grade.values),
      _cpad = enumFromString<Grade>(json['cpad'], Grade.values),
      _acad = enumFromString<Grade>(json['acad'], Grade.values),
      _adip = enumFromString<Grade>(json['adip'], Grade.values),
      _ldad = enumFromString<Grade>(json['ldad'], Grade.values),
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'performance': _performance, 'standards': _standards, 'fpc': enumToString(_fpc), 'fpq': enumToString(_fpq), 'mp': enumToString(_mp), 'ip': enumToString(_ip), 'cpad': enumToString(_cpad), 'acad': enumToString(_acad), 'adip': enumToString(_adip), 'ldad': enumToString(_ldad), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "cTSItem.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField PERFORMANCE = QueryField(fieldName: "performance");
  static final QueryField STANDARDS = QueryField(fieldName: "standards");
  static final QueryField FPC = QueryField(fieldName: "fpc");
  static final QueryField FPQ = QueryField(fieldName: "fpq");
  static final QueryField MP = QueryField(fieldName: "mp");
  static final QueryField IP = QueryField(fieldName: "ip");
  static final QueryField CPAD = QueryField(fieldName: "cpad");
  static final QueryField ACAD = QueryField(fieldName: "acad");
  static final QueryField ADIP = QueryField(fieldName: "adip");
  static final QueryField LDAD = QueryField(fieldName: "ldad");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "CTSItem";
    modelSchemaDefinition.pluralName = "CTSItems";
    
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
      key: CTSItem.NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CTSItem.PERFORMANCE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CTSItem.STANDARDS,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CTSItem.FPC,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CTSItem.FPQ,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CTSItem.MP,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CTSItem.IP,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CTSItem.CPAD,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CTSItem.ACAD,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CTSItem.ADIP,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CTSItem.LDAD,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
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

class _CTSItemModelType extends ModelType<CTSItem> {
  const _CTSItemModelType();
  
  @override
  CTSItem fromJson(Map<String, dynamic> jsonData) {
    return CTSItem.fromJson(jsonData);
  }
}