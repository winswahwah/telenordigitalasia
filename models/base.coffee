class Base


	constructor: (@params) ->
		@table = @params.table
		@schema = @params.schema


	get: (where) =>
		Promise.resolve(@schema.findAll(where))
			.then (obj) =>
				unless obj then return null

				_.map obj, (v) =>
					v.dataValues
			.catch (err) =>
				throw err


	create: (data, transaction) =>
		Promise.resolve(@schema.create(data, transaction: transaction))
			.then (obj) =>
				unless obj then return null

				obj.dataValues
			.catch (err) =>
				throw err


module.exports = Base
