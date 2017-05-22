class Index extends Base


	_scrapeNASDAQIndexValue: () =>
		transaction = undefined

		mysql.transaction()
			.then (t) =>
				transaction = t
			.then =>
				# TODO

				insert =
					'name': 	'NASDAQ'
					'value':	9999
					'datetime':	Helper.getUTCDateTime()

				@create(insert, transaction)
			.then (result) =>
				if transaction isnt undefined
					Promise.resolve(transaction.commit())

				return


	scrapeNASDAQIndexValue: () =>
		setInterval (=>
			@_scrapeNASDAQIndexValue()
		), 10000 #3600000


module.exports = new Index({
	schema: IndexSchema
	table: "indexes"
})
