const String todosQuery = ''' 
subscription MySubscription {
  TB_TODOS {
    check
    id
    title
    user_id
  }
}
''';

const String todosInsertQuery = ''' 
mutation InsertTodo(\$title: String) {
  insert_TB_TODOS_one(object: {title: \$title}) {
    id
  }
}
''';

const String todosUpdateQuery = ''' 
mutation UpdateTodo(\$id: uuid, \$title: String, \$check: Boolean) {
  update_TB_TODOS(where: {id: {_eq: \$id}}, _set: {check: \$check, title: \$title}) {
    affected_rows
  }
}
''';

const String todosDeleteQuery = ''' 
mutation DeleteTodo(\$id: uuid) {
  delete_TB_TODOS(where: {id: {_eq: \$id}}) {
    affected_rows
  }
}
''';