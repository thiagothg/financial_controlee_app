const String userGoalsQuery = ''' 
subscription ControleeSubcription(\$userId: String!) {
  control_app_TB_YEAR_GOALS(where: {userId: {_eq: \$userId}}, order_by: {dateStart: asc}) {
    createdAt
    dateEnd
    dateStart
    id
    isActive
    moneyEnd
    moneyStart
    progress
    qtdSaved
    title
    userId
    TB_YEAR_GOAL_WEEKs {
      date
      id
      money
      week
      saved
      year_goal_id
    }
  }
}
''';

const String userGoalInsertQuery = ''' 
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

const String userGoalsUpdateQuery = ''' 
mutation UpdateTodo(\$id: uuid, \$title: String, \$check: Boolean) {
  update_TB_TODOS(where: {id: {_eq: \$id}}, _set: {check: \$check, title: \$title}) {
    affected_rows
  }
}
''';

const String userGoalsDeleteQuery = ''' 
mutation DeleteTodo(\$id: uuid) {
  delete_TB_TODOS(where: {id: {_eq: \$id}}) {
    affected_rows
  }
}
''';

const String userGoalsByIdQuery = ''' 
query ControlleQuery(\$id: String!) {
  control_app_TB_USERS_by_pk(id: \$id) {
    id
  }
}
''';