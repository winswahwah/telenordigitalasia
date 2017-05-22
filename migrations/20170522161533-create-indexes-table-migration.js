'use strict';

module.exports = {
	up: function (queryInterface, Sequelize) {
		/*
			Add altering commands here.
			Return a promise to correctly handle asynchronicity.

			Example:
			return queryInterface.createTable('users', { id: Sequelize.INTEGER });
		*/

		queryInterface.createTable(
			'indexes',
			{
				id: {
					type:			Sequelize.INTEGER,
					primaryKey:		true,
					autoIncrement:	true
				},
				name:	Sequelize.STRING,
				value:	Sequelize.DOUBLE,
				datetime: {
					type: Sequelize.DATE
				}
			}
		)
	},

	down: function (queryInterface, Sequelize) {
		/*
			Add reverting commands here.
			Return a promise to correctly handle asynchronicity.

			Example:
			return queryInterface.dropTable('users');
		*/

		return queryInterface.dropTable('indexes');
	}
};
