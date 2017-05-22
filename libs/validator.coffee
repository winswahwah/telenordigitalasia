class Validator


	className = "Validator"


	validate: (params, schema) ->
		opts =
			abortEarly: 	false
			convert: 		true
			allowUnknown:	false
			stripUnknown: 	false
		Joi.validateAsync(params, schema, opts)
			.then (obj) =>
				obj
			.catch (err) =>
				throw ERROR.INVALID_REQUEST_PARAMETER


module.exports = new Validator()
