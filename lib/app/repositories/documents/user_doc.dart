const String usersQuery = ''' 
subscription MySubscription {
  TB_TODOS {
    check
    id
    title
    user_id
  }
}
''';

const String userInsertQuery = ''' 
mutation ControlleMutation(
    \$id: String!, 
    \$name: String!,
    \$email: String!,
    \$photoUrl: String,
    \$isActive: Boolean,
  ) {
  insert_control_app_TB_USERS_one(object: {
      id: \$id,
      name: \$name,
      email: \$email,
      photoUrl: \$photoUrl,
      isActive: \$isActive,
    }) {
    id
  }
}
''';

const String userUpdateQuery = ''' 
mutation UpdateTodo(\$id: uuid, \$title: String, \$check: Boolean) {
  update_TB_TODOS(where: {id: {_eq: \$id}}, _set: {check: \$check, title: \$title}) {
    affected_rows
  }
}
''';

const String userDeleteQuery = ''' 
mutation DeleteTodo(\$id: uuid) {
  delete_TB_TODOS(where: {id: {_eq: \$id}}) {
    affected_rows
  }
}
''';

const String userByIdQuery = ''' 
query ControlleQuery(\$id: String!) {
  control_app_TB_USERS_by_pk(id: \$id) {
    id
  }
}
''';