module.exports = (app) ->


	app.post '/api/index/value/get', MainController.getIndexValue


	global.ROUTERS = _.chain(app._router.stack)
		.map (route) ->
			route.Route
		.compact()
		.flatten()
		.value()
