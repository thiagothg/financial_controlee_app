import 'package:cloud_firestore/cloud_firestore.dart';
import '../interfaces/base_model_interface.dart';

class BaseModel implements IBaseModelInterface {
  String id;
  bool isActive = true;
  Timestamp createdAt;
  Timestamp updatedAt;

  BaseModel();

  @override
  BaseModel.fromMap(DocumentSnapshot document) {
    id = document.id;
    isActive = document.data()["isActive"];
    createdAt = document.data()["createdAt"];
    updatedAt = document.data()["updatedAt"];
  }

  @override
  Map toMap() {
    var map = <String, dynamic>{};
    map['isActive'] = isActive;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;

    return map;
  }

   @override
  BaseModel.fromData(Map<String, dynamic>  data) {
    id = data['uid'];
    isActive = data["isActive"];
    createdAt = data["createdAt"];
    updatedAt = data["updatedAt"];
  }

  @override
  String documentId() => id;

  @override
  void disableDocument() => isActive = false;

  @override
  void enableDocument() => isActive = true;

  @override
  void setCreateTime() => createdAt = Timestamp.now();

  @override
  void setUpdateTime() => updatedAt = Timestamp.now();
}