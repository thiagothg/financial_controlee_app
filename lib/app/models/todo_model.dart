class TodoModel {
  String title;
  bool check;
  // DocumentReference reference;
  String? id;

  TodoModel({this.title = '', this.check = false, this.id});

  // factory TodoModel.fromDocument(DocumentSnapshot doc) {
  //   return TodoModel(
  //       title: doc['title'], check: doc['check'], reference: doc.reference);
  // }

  factory TodoModel.fromJson(Map doc) {
    return TodoModel(title: doc['title'], check: doc['check'], id: doc['id']);
  }
}