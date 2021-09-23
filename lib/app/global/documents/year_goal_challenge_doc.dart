const String yearGoalsQuery = ''' 
  query FINANCIAL_QUERY(\$userId: String!) {
    FINANCIAL_APP_TB_YEAR_GOALS(where: {user_id: {_eq: \$userId}}, order_by: {created_at: desc}) {
      created_at
      date_end
      date_start
      id
      is_active
      money_end
      money_start
      progress
      qtd_saved
      title
      user_id
      total
      TB_YEAR_GOAL_WEEKs(order_by: {week: asc}) {
        date
        id
        money
        week
        saved
        year_goal_id
        title
      }
    }
  }
''';

const String yearGoalsSubscription = ''' 
  subscription GOAL_Subscription(\$userId: String!) {
    FINANCIAL_APP_TB_YEAR_GOALS(where: {user_id: {_eq: \$userId}}, order_by: {created_at: desc}) {
      created_at
      date_end
      date_start
      id
      is_active
      money_end
      money_start
      progress
      qtd_saved
      title
      user_id
      TB_YEAR_GOAL_WEEKs(order_by: {week: asc}) {
        date
        id
        money
        week
        saved
        year_goal_id
        title
      }
    }
  }
''';

const String yearGoalAndWeeksInsertQuery = ''' 
mutation GoalMutation(\$object: FINANCIAL_APP_TB_YEAR_GOALS_insert_input!) {
  insert_FINANCIAL_APP_TB_YEAR_GOALS_one(object: \$object) {
    id
    title
    user_id
    TB_YEAR_GOAL_WEEKs {
      year_goal_id
      week
      id
    }
  }
}
''';

const String yearGoalWeekUpdateQuery = ''' 
mutation GoalWeekMutation(\$object_goal_week: FINANCIAL_APP_TB_YEAR_GOAL_WEEK_set_input!, \$id_goal_week: uuid!, \$object_goal: FINANCIAL_APP_TB_YEAR_GOALS_set_input!, \$id_goal: uuid!) {
  update_FINANCIAL_APP_TB_YEAR_GOALS_by_pk(pk_columns: {id: \$id_goal}, _set: \$object_goal) {
    title
    qtd_saved
    progress
    id
  }

  update_FINANCIAL_APP_TB_YEAR_GOAL_WEEK_by_pk(pk_columns: {id: \$id_goal_week}, _set: \$object_goal_week) {
    week
    title
    id
    saved
  }
}
''';

const String yearGoalWeekInsertQuery = ''' 
mutation GoalMutation(
    \$week: smallint!, 
    \$title: String!,
    \$money: numeric!,
    \$saved: Boolean,
    \$year_goal_id: String!,
    \$date: timestamptz!,
  ) {
  insert_FINANCIAL_APP_TB_YEAR_GOALS_one(objects: {
      week: \$week,
      money: \$title,
      saved: \$saved,
      year_goal_id: \$year_goal_id,
      date: \$date
    }) {
    returning {
      id
    }
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
