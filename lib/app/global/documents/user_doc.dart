const String saveUserInfoMutation = ''' 
mutation saveUserInfo(\$object: FINANCIAL_APP_TB_USERS_insert_input!) {
  insert_FINANCIAL_APP_TB_USERS_one(
    object: \$object, 
    on_conflict: {
      constraint: TB_USERS_pkey, 
      update_columns: update_at
  }) {
    email
    id
    is_active
    name
    photo_url
    create_at
  }
}
''';
