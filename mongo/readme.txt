db.customers.update

db.users.bulkWrite

db.users.deleteOne({age:24})

db.users.updateMany({},
{$rename {name: “fullname”}
}
) db.users.find({age:{$gte:28}})
db.users.find().limit(4)
db.createcollection(“users”)
db.dropDatabase
db.users.insertMany([
{name:”vasta”, age:68},
{name:”vastsdsa”, age:68},
]
)

