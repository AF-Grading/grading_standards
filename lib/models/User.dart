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


/** This is an auto generated class representing the User type in your schema. */
@immutable
class User extends Model {
  static const classType = const _UserModelType();
  final String id;
  final String? _email;
  final String? _name;
  final String? _squad;
  final String? _rank;
  final String? _adQual;
  final String? _pilotQual;
  final String? _permission;
  final String? _themeMod;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get email {
    return _email;
  }
  
  String? get name {
    return _name;
  }
  
  String? get squad {
    return _squad;
  }
  
  String? get rank {
    return _rank;
  }
  
  String? get adQual {
    return _adQual;
  }
  
  String? get pilotQual {
    return _pilotQual;
  }
  
  String? get permission {
    return _permission;
  }
  
  String? get themeMod {
    return _themeMod;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const User._internal({required this.id, email, name, squad, rank, adQual, pilotQual, permission, themeMod, createdAt, updatedAt}): _email = email, _name = name, _squad = squad, _rank = rank, _adQual = adQual, _pilotQual = pilotQual, _permission = permission, _themeMod = themeMod, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory User({String? id, String? email, String? name, String? squad, String? rank, String? adQual, String? pilotQual, String? permission, String? themeMod}) {
    return User._internal(
      id: id == null ? UUID.getUUID() : id,
      email: email,
      name: name,
      squad: squad,
      rank: rank,
      adQual: adQual,
      pilotQual: pilotQual,
      permission: permission,
      themeMod: themeMod);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
      id == other.id &&
      _email == other._email &&
      _name == other._name &&
      _squad == other._squad &&
      _rank == other._rank &&
      _adQual == other._adQual &&
      _pilotQual == other._pilotQual &&
      _permission == other._permission &&
      _themeMod == other._themeMod;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("User {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("squad=" + "$_squad" + ", ");
    buffer.write("rank=" + "$_rank" + ", ");
    buffer.write("adQual=" + "$_adQual" + ", ");
    buffer.write("pilotQual=" + "$_pilotQual" + ", ");
    buffer.write("permission=" + "$_permission" + ", ");
    buffer.write("themeMod=" + "$_themeMod" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  User copyWith({String? id, String? email, String? name, String? squad, String? rank, String? adQual, String? pilotQual, String? permission, String? themeMod}) {
    return User._internal(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      squad: squad ?? this.squad,
      rank: rank ?? this.rank,
      adQual: adQual ?? this.adQual,
      pilotQual: pilotQual ?? this.pilotQual,
      permission: permission ?? this.permission,
      themeMod: themeMod ?? this.themeMod);
  }
  
  User.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _email = json['email'],
      _name = json['name'],
      _squad = json['squad'],
      _rank = json['rank'],
      _adQual = json['adQual'],
      _pilotQual = json['pilotQual'],
      _permission = json['permission'],
      _themeMod = json['themeMod'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'email': _email, 'name': _name, 'squad': _squad, 'rank': _rank, 'adQual': _adQual, 'pilotQual': _pilotQual, 'permission': _permission, 'themeMod': _themeMod, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "user.id");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField SQUAD = QueryField(fieldName: "squad");
  static final QueryField RANK = QueryField(fieldName: "rank");
  static final QueryField ADQUAL = QueryField(fieldName: "adQual");
  static final QueryField PILOTQUAL = QueryField(fieldName: "pilotQual");
  static final QueryField PERMISSION = QueryField(fieldName: "permission");
  static final QueryField THEMEMOD = QueryField(fieldName: "themeMod");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";
    
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
      key: User.EMAIL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.SQUAD,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.RANK,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.ADQUAL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.PILOTQUAL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.PERMISSION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.THEMEMOD,
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

class _UserModelType extends ModelType<User> {
  const _UserModelType();
  
  @override
  User fromJson(Map<String, dynamic> jsonData) {
    return User.fromJson(jsonData);
  }
}