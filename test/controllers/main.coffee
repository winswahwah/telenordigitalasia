require '../setup'


describe 'MainController', =>


	it 'getIndexValue with all parameters [Success]', (done) =>
		data =
			'index_name':		'NASDAQ'
			'start_datetime':	'2017-05-22'
			'end_datetime':		'2017-05-22'
			'limit':			10

		supertest.post('/api/index/value/get')
			.send(data)
			.expect 200, (req, res) =>
				expect(res.status).eql 200
				done()


	it 'getIndexValue with index_name parameter [Success]', (done) =>
		data =
			'index_name': 'NASDAQ'

		supertest.post('/api/index/value/get')
			.send(data)
			.expect 200, (req, res) =>
				expect(res.status).eql 200
				done()


	it 'getIndexValue with index_name, start_datetime and end_datetime parameter [Success]', (done) =>
		data =
			'index_name': 		'NASDAQ'
			'start_datetime':	'2017-05-22'
			'end_datetime':		'2017-05-22'

		supertest.post('/api/index/value/get')
			.send(data)
			.expect 200, (req, res) =>
				expect(res.status).eql 200
				done()


	it 'getIndexValue with index_name and limit parameter [Success]', (done) =>
		data =
			'index_name': 	'NASDAQ'
			'limit':		10

		supertest.post('/api/index/value/get')
			.send(data)
			.expect 200, (req, res) =>
				expect(res.status).eql 200
				done()


	it 'getIndexValue with no parameter [Fail]', (done) =>
		data = []

		supertest.post('/api/index/value/get')
			.send(data)
			.expect 400, (req, res) =>
				expect(res.status).eql 400
				done()


	it 'getIndexValue with index_name, start_datetime without end_datetime parameter [Fail]', (done) =>
		data =
			'index_name': 		'NASDAQ'
			'start_datetime':	'2017-05-22'

		supertest.post('/api/index/value/get')
			.send(data)
			.expect 400, (req, res) =>
				expect(res.status).eql 400
				done()


	it 'getIndexValue with index_name, end_datetime without start_datetime parameter [Fail]', (done) =>
		data =
			'index_name': 		'NASDAQ'
			'end_datetime':		'2017-05-22'

		supertest.post('/api/index/value/get')
			.send(data)
			.expect 400, (req, res) =>
				expect(res.status).eql 400
				done()


	it 'getIndexValue with start_datetime, end_datetime and limit parameter except index_name parameter [Fail]', (done) =>
		data =
			'start_datetime':	'2017-05-22'
			'end_datetime':		'2017-05-22'
			'limit':			10

		supertest.post('/api/index/value/get')
			.send(data)
			.expect 400, (req, res) =>
				expect(res.status).eql 400
				done()


	it 'getIndexValue with all parameter but limit is 0 [Fail]', (done) =>
		data =
			'index_name': 		'NASDAQ'
			'start_datetime':	'2017-05-22'
			'end_datetime':		'2017-05-22'
			'limit':			0

		supertest.post('/api/index/value/get')
			.send(data)
			.expect 400, (req, res) =>
				expect(res.status).eql 400
				done()


	it 'getIndexValue with all parameter but limit is negative value [Fail]', (done) =>
		data =
			'index_name': 		'NASDAQ'
			'start_datetime':	'2017-05-22'
			'end_datetime':		'2017-05-22'
			'limit':			-1

		supertest.post('/api/index/value/get')
			.send(data)
			.expect 400, (req, res) =>
				expect(res.status).eql 400
				done()
