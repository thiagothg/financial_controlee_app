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

const String insertYearGoalAndWeekMutation = ''' 
mutation saveYearGoalMutation(\$objects: [FINANCIAL_APP_TB_YEAR_GOALS_insert_input!]!) {
  insert_FINANCIAL_APP_TB_YEAR_GOALS(objects: \$objects) {
    affected_rows
    returning {
      id
      title
      user_id
      total
      updated_at
      progress
      qtd_saved
      money_start
      money_end
      is_active
      date_start
      date_end
      created_at
      TB_YEAR_GOAL_WEEKs {
        id
        year_goal_id
        saved
        money
        date
        title
        week
      }
    }
  }
}
''';

const String yearGoalDelete = ''' 
mutation deleteYearGoalMutation(\$id: uuid!) {
  delete_FINANCIAL_APP_TB_YEAR_GOALS_by_pk(id: \$id) {
    id
    TB_YEAR_GOAL_WEEKs {
      id
    }
  }
}
''';

const String yearGoalWeekUpdate = ''' 
mutation updateYearGoalGoalAndWeek(
  \$id: uuid!, 
  \$_set: FINANCIAL_APP_TB_YEAR_GOALS_set_input!, 
  \$id1: uuid!, 
  \$_set1: FINANCIAL_APP_TB_YEAR_GOAL_WEEK_set_input!) {
  update_FINANCIAL_APP_TB_YEAR_GOALS_by_pk(pk_columns: {id: \$id}, _set: \$_set) {
    qtd_saved
    progress
    id
  }
  update_FINANCIAL_APP_TB_YEAR_GOAL_WEEK_by_pk(pk_columns: {id: \$id1}, _set: \$_set1) {
    week
    title
    id
  }
}
''';
