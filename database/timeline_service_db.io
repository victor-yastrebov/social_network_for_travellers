// type: Tarantool. Prepared data for reading part of the system (CQRS Pattern)

Table user_timeline {
  id integer [primary key]
  data binary[]
}

Table home_timeline {
  id integer [primary key]
  data binary[]
}
