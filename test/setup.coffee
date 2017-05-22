'use strict'

global.expect = require('chai').expect
supertest = require 'supertest'
app = undefined


before (done) =>
	Promise.resolve(require('../app')())
		.then (@app) =>
			app = @app
			global.supertest = supertest(app.server)
		.done => done()


after (done) =>
	Promise.resolve(app.server.close)
		.done => done()
