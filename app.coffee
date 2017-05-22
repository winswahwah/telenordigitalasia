# Load Node Module(s)
express		= require 'express'
useragent	= require 'express-useragent'
http		= require 'http'
bodyParser	= require 'body-parser'
fs			= require 'fs'

# Load Global Node Module(s)
global._		= require 'lodash'
global.Promise	= require 'bluebird'
global.Joi		= Promise.promisifyAll(require 'joi')
global.moment	= require 'moment'
global.request	= require 'request-promise'

# Load Config
global.config = require './config/config'

# Load Error List
global.ERROR = require './config/error'

# Initialize Database Connection
global.Sequelize = Promise.promisifyAll(require 'sequelize')
mysqlConf = config.database.mysql
global.mysql = new Sequelize mysqlConf.database, mysqlConf.username, mysqlConf.password, mysqlConf.options


module.exports = ()->

	app = express()
	server = require('http').createServer app

	app.set 'port', config.server.port

	app.disable 'x-powered-by'

	app.use bodyParser.urlencoded(extended: true)
	app.use bodyParser.json()
	app.use useragent.express()

	# Database Connection Authentication
	Promise.resolve(mysql.authenticate())
		.then =>
			# Listening to server port
			server.listen app.get('port'), =>
				console.log "Listening on port #{app.get('port')}"

			app.server = server

			return app
		.catch (err) =>
			console.log "Server could not be started :", err

			return
