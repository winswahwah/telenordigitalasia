ERROR =
	INVALID_REQUEST_PARAMETER:
		httpCode:	400
		message:	"Invalid Request Parameter"
	DATA_NOT_FOUND:
		httpCode:	400
		message:	"Data Not Found"
	INTERNAL_SERVER_ERROR:
		httpCode:	500
		message:	"Internal Server Error"


module.exports = ERROR
