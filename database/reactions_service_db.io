// type: PostgreSQL.

Table posts_reactions {
  id integer [primary key]
  user_id integer
  reaction_type integer [note: 'enum']
  created_at timestamp

  post_id integer
}
