const {MongoClient} = require('mongodb')

const client = new MongoClient('localhost://admin:w0nd3rwaLL')

const start = async () => {
	try {
		await client.connect()
		console.log('Conn established')
		await client.db().createCollection("users")
		const users = client.db().collection("name": 'users')
		users.insertOne(doc {name: 'vadim', age: 21})
		const user = await users.findOne({name: 'vadim'})
		console.log(user)
	} catch(e) {
		console.log(e)
	}
} 

start()
