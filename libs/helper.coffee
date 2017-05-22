class Helper


	className = "Helper"


	responseSuccess: (req, res, data) =>
		data = _.toArray(data)

		if data.length is 3
			result =
				data: data[1]
				message: data[2]
			res.status(data[0]).json(result)
		else if data[0] is 204
			res.status(204).end()
		else
			@responseError req, res, []


	responseError: (req, res, err) =>
		httpCode = err.httpCode or ERROR.INTERNAL_SERVER_ERROR.httpCode

		error =
			httpCode:	httpCode
			message:	err.message or ERROR.INTERNAL_SERVER_ERROR.message

		res.status(err.httpCode).json(error)


	parseControllerName: (text, delimiter = '_') =>
		(_.capitalize(word) for word in text.split(delimiter)).join ''


	getUTCDateTime: (dateTime) =>
		moment.utc().format('Y-MM-DD hh:mm:ss')


module.exports = new Helper()
