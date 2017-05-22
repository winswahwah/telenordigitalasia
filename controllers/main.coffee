className = "MainController"


exports.getIndexValue = (req, res) ->
	console.log className, "|", "getIndexValue called"
	console.log className, "|", "request parameter(s):", req.query

	params = undefined

	# Create Validation Schema
	schema = Joi.object().keys
		index_name: 	Joi.string().required()
		start_datetime:	Joi.date().optional()
		end_datetime: 	Joi.date().optional()
		limit: 			Joi.number().integer().optional()
	.with('start_datetime',	'end_datetime')
	.with('end_datetime',	'start_datetime')

	# Validate Request Parameter
	Promise.try(-> Validator.validate(req.query, schema))
		.then (p) ->
			params = p

			# TODO: Get Index Value

			result = []

			[200, result, 'Index Value Retrieved Successfully']
		.then (data) ->
			console.log className, "|", "RESULT:", data

			# Return JSON Response
			Helper.responseSuccess(req, res, data)
		.catch (err) ->
			console.log className, '|', 'ERROR:', err

			# Return JSON Error Response
			Helper.responseError(req, res, err)
