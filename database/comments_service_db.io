// type: PostgreSQL.

Table comments {
  id integer [primary key]
  user_id integer
  parent_comment_id integer [note: 'if zero value - no parent']
  body varchar
  created_at timestamp

  post_id integer
}
