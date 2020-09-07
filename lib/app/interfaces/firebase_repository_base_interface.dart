import 'dart:async';


import 'package:cloud_firestore/cloud_firestore.dart';
import '../core/responses/response_default.dart';

import 'base_model_interface.dart';


abstract class IFirebaseRepositoryBaseInterface<
    Model extends IBaseModelInterface> {

  Future<DefaultResponse> add(Model model);

  Future<DefaultResponse> update(Model model);

  Future<DefaultResponse> disable(Model model);

  Future<DefaultResponse> enable(Model model);

  Future<DefaultResponse> delete(String documentId);

  Future<DefaultResponse> getById(String documentId);

  Future<DefaultResponse> getAll();

  CollectionReference filter();

  List<Model> fromSnapshotToModelList(
      List<DocumentSnapshot> documentList);

  Model fromSnapshotToModel(DocumentSnapshot document);
}