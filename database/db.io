// Use DBML to define your database structure
// Docs: https://dbml.dbdiagram.io/docs

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

Table posts {
  id integer [primary key]
  user_id integer
  title varchar
  location varchar [note: 'Coordinates of the place in post']

  created_at timestamp

  data varchar [note: 'Small text description of the post']
  image_url string[]
}

Table photos [note: 'CEPH']{
  id integer [primary key]
  data blob
  uploaded_at timestamp
}

Table comments {
  id integer [primary key]
  user_id integer
  parent_comment_id integer [note: 'if zero value - no parent']
  body varchar
  created_at timestamp

  post_id integer
}

Table posts_reactions {
  id integer [primary key]
  user_id integer
  reaction_type integer [note: 'enum']
  created_at timestamp

  post_id integer
}

Table description [note: 'ElasticSearch'] {
  id integer [PK]
  post_id integer
  data varchar   [note: 'Small text description of the post']
}

Table user_timeline {
  id integer [primary key]
  data binary[]
}

Table home_timeline {
  id integer [primary key]
  data binary[]
}



Ref: posts.user_id > users.id

Ref: users.id < follows.following_user_id

Ref: users.id < follows.followed_user_id

Ref: posts.id - comments.post_id

Ref: comments.user_id - users.id 

Ref: posts.id - posts_reactions.post_id

Ref: posts_reactions.user_id - users.id

Ref: posts.id - description.post_id

Ref: user_timeline.id - users.id

Ref: home_timeline.id - users.id