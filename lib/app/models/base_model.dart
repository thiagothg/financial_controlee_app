import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import '../interfaces/base_model_interface.dart';

part 'base_model.g.dart';

@JsonSerializable()
class BaseModel implements IBaseModelInterface {
  @JsonKey(name: 'id', includeIfNull: false)
  String? id;
  @JsonKey(name: 'is_active', includeIfNull: false)
  bool? isActive;
  @JsonKey(name: 'created_at', includeIfNull: false)
  DateTime? createdAt;
  @JsonKey(name: 'updated_at', includeIfNull: false)
  DateTime? updatedAt;

  BaseModel();

  factory BaseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseModelToJson(this);



  @override
  BaseModel.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    isActive = (json.containsKey('isActive')) ? json["isActive"] : null;

    if(json.containsKey('createdAt')) {
      createdAt = DateTime.parse(json["createdAt"]);
    }
    
    // updatedAt = document.data()["updatedAt"];
  }

  @override
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['isActive'] = isActive;
    map['id'] = id;
    
    // map['createdAt'] = createdAt.toDate().toString();
    // map['updatedAt'] = updatedAt.toDate().toString();

    return map;
  }

   @override
  BaseModel.fromData(Map<String, dynamic>  data) {
    id = data['id'];
    isActive = data["isActive"];
    createdAt = data["createdAt"]; 
    // updatedAt = data["updatedAt"];
  }

  @override
  String documentId() => id ?? '';

  @override
  void disableDocument() => isActive = false;

  @override
  void enableDocument() => isActive = true;

  @override
  void setCreateTime() => createdAt = DateTime.now();

  @override
  void setUpdateTime() => updatedAt = DateTime.now();

  @override
  void setDocumentId(String idDoc) => id = idDoc;

  DateTime dateTimeFromTimestamp(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  DateTime fromJsonTime(int int) 
    => DateTime.fromMillisecondsSinceEpoch(int);
  
}