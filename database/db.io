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
  role varchar
  created_at timestamp
}

Table posts {
  id integer [primary key]
  user_id integer
  title varchar
  location varchar [note: 'Coordinates of the place in post']

  created_at timestamp

  description_id integer 
  comments_id integer[]
  photos_id integer[]

  reactions_id integer[]
}

Table photos [note: 'CEPH']{
  id integer [primary key]
  data blob
  uploaded_at timestamp
}

Table comments {
  id integer [primary key]
  user_id integer
  body varchar
  created_at timestamp
}

Table posts_reactions {
  id integer [primary key]
  user_id integer
  reaction_id integer
  created_at timestamp
}

Table reactions {
  id integer [primary key]
  reaction_type integer
}

Table description [note: 'ElasticSearch'] {
  id integer [PK]
  post_id integer
  data varchar   [note: 'Small text description of the post']
}



Ref: posts.user_id > users.id

Ref: users.id < follows.following_user_id

Ref: users.id < follows.followed_user_id

Ref: posts.photos_id - photos.id

Ref: posts.comments_id - comments.id

Ref: comments.user_id - users.id 

Ref: posts.reactions_id - posts_reactions.id

Ref: posts_reactions.reaction_id - reactions.id 

Ref: posts.description_id - description.id

Ref: posts.id - description.post_id