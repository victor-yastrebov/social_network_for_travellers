// type: ElasticSearch. Its search engine will be used for finding posts by description.

Table description [note: 'ElasticSearch'] {
  id integer [PK]
  post_id integer
  data varchar   [note: 'Small text description of the post']
}