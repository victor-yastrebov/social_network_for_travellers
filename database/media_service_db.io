// type: Ceph. We can use its partitions for purpose of deleting images that are loaded but post was not created for some period of time (ex. 24 hours).

Table photos [note: 'CEPH']{
  id integer [primary key]
  data blob
  uploaded_at timestamp
}