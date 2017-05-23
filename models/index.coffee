'use strict'

class Index extends Base


	scrapeNASDAQIndexValue: () =>
		# Declare Database Transaction
		transaction = undefined

		# Create Database Transaction
		mysql.transaction()
			.then (t) =>
				transaction = t
			.then =>
				# Create Request Object
				options =
					uri: 'http://www.nasdaq.com/'
					transform: (body) ->
						cheerio.load body

				# Send Request To Specific URI
				request(options)
					.then(($) =>
						# Extract HTML Code
						index_table = $('#indexTable').children().next().html()

						index_data = index_table.split('nasdaqHomeIndexChart.storeIndexInfo')

						nasdaq_index = index_data[1].replace('(', '')
						nasdaq_index = nasdaq_index.replace(');', '')
						nasdaq_index = nasdaq_index.replace(/\"/g, '')

						nasdaq_index = nasdaq_index.split(',')

						nasdaq_index_name	= nasdaq_index[0]
						nasdaq_index_value	= nasdaq_index[1]

						# Prepare SQL Insert Object
						insert =
							'name': 	'NASDAQ'
							'value':	nasdaq_index_value
							'datetime':	Helper.getUTCDateTime()

						# Call Create Method
						@create(insert, transaction)
							.then (result) =>
								# Commit And Release Database Transaction
								if transaction isnt undefined
									transaction.commit()

								result
					)
					.then (result) ->
						result
			.catch (err) ->
				return


module.exports = new Index({
	schema: IndexSchema
	table: "indexes"
})
