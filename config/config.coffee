config =
	'server':
		'port': 8000
	'database':
		'mysql':
			'username':	'root'
			'password':	''
			'database':	'telenor_digital_asia'
			'options':
				'host':			'127.0.0.1'
				'port':			3306
				'dialect':		'mysql'
				'timezone ':	"+00':00"
				'logging':		false
				'pool':
					'max':	10
					'min':	1


module.exports = config
