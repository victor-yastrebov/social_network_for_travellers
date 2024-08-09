// type: PostgreSQL.

Table follows {
  following_user_id integer
  followed_user_id integer
  created_at timestamp
  id         integer
}

Table users {
  id integer [primary key]
  username varchar
  created_at timestamp
}

Ref: users.id < follows.following_user_id

Ref: users.id < follows.followed_user_id