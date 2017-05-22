'use strict'


#	getIndexValue
#
#	@restapi GET /api/index/value/get
#
#	@request parameter(s)
#		{string}	index_name		(required)
#		{datetime}	start_datetime	(optional | required with end_datetime | UTC Format)
#		{datetime}	end_datetime	(optional | required with start_datetime | UTC Format)
#		{integer}	limit			(optional)
#
#	@response (JSON Format)
#		{
#			"data": [
#				{
#					"id":		{integer}
#					"name":		{string}
#					"value":	{double}
#					"datetime":	{datetime}	(UTC Format)
#				}
#			],
#			"message": {string}
#		}
#
exports.getIndexValue = (req, res) ->
	params = undefined

	# Declare Validation Schema
	schema = Joi.object().keys
		index_name: 	Joi.string().required()
		start_datetime:	Joi.date().optional()
		end_datetime: 	Joi.date().optional()
		limit: 			Joi.number().integer().min(1).optional()
	.with('start_datetime',	'end_datetime')
	.with('end_datetime',	'start_datetime')

	# Validate Request Parameter
	Promise.try(-> Validator.validate(req.body, schema))
		.then (p) ->
			params = p

			# Prepare SQL Query Object
			where =
				where:
					'name': params.index_name

			if params.start_datetime? and params.end_datetime?
				where.where.datetime =
					$gte: params.start_datetime
					$lte: params.end_datetime

			if params.limit? then where.limit = params.limit

			# Call Get Method from Index Model
			Promise.resolve(Index.get(where))
		.then (result) ->
			[200, result, 'Index Value Retrieved Successfully']
		.then (data) ->
			# Return JSON Response
			Helper.responseSuccess(req, res, data)
		.catch (err) ->
			# Return JSON Error Response
			Helper.responseError(req, res, err)
