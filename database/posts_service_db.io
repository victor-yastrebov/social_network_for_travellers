// type: PostgreSQL.

Table posts {
  id integer [primary key]
  user_id integer
  title varchar
  location varchar [note: 'Coordinates of the place in post']

  created_at timestamp

  data varchar   [note: 'Small text description of the post']
  image_url string[]
}
