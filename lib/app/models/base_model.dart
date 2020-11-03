import 'package:cloud_firestore/cloud_firestore.dart';
import '../interfaces/base_model_interface.dart';

class BaseModel implements IBaseModelInterface {
  String id;
  bool isActive = true;
  Timestamp createdAt;
  Timestamp updatedAt;

  BaseModel();

  @override
  BaseModel.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    isActive = (json.containsKey('isActive')) ? json["isActive"] : null;

    if(json.containsKey('createdAt')) {
      var parsedDate = DateTime.parse(json["createdAt"]);
      createdAt = Timestamp.fromDate(parsedDate);
    }
    
    // updatedAt = document.data()["updatedAt"];
  }

  @override
  Map toMap() {
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