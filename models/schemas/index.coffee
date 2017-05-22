'use strict'

Schema = mysql.define('indexes',
	{
		name:
			type			: Sequelize.STRING
			defaultValue	: null
		value:
			type			: Sequelize.DOUBLE
			defaultValue	: null
		datetime:
			type			: Sequelize.DATE
			defaultValue	: null
	},
	{
		timestamps		: false
		freezeTableName	: true
		tableName		: 'indexes'
	}
)

module.exports = Schema
