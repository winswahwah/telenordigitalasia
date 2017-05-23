## Description

Telenor Digital Asia Assignment

RESTful web service for scrape and store NASDAQ index value into database and provide the index data for a further use.

This project using
- Node.js
- Express.js
- Coffeescript
- Gulp (Task Runner)
- Sequelize (ORM / Database Query Builder)
- Mocha (For Testing)

## Installation

Installation as the steps below;

After Git Clone
1. run `npm install`
2. run `npm install -g coffeescript`
3. run `npm install -g sequelize-cli`
4. run `npm install -g mocha`
5. run `npm install -g gulp`
6. run `npm install -g gulp-cli`
7. Create a new MySQL Database (Only empty database)
8. Open `config/app_config.json` and `config/config.json` file for edit your database connection
9. run `sequelize db:migrate` in order to create a new database table

Please note that you can edit a server setting such as server port, web scraper interval or database connection in `config/app_config.json` file.

## How to run

First of all, you need to run `node index.js` to start the server process.

For scrape and store NASDAQ index value
- run `gulp` at the root directory of this project to start the web scraper and it will store the NASDAQ index value into database automatically.
or
- You can call RESTful web service by sending a POST method to API as below (For testing purpose, no parameter required);

	`{your_host}:{your_port}/api/index/value/scrape/NASDAQ`
	Example: `http://localhost:8000/api/index/value/scrape/NASDAQ`

For get NASDAQ index value
- You can call RESTful web service by sending a POST method to API as below;

	`{your_host}:{your_port}/api/index/value/get`
	Example: `http://localhost:8000/api/index/value/get`

	Request Parameter
	- {string} index_name (required)
	- {datetime} start_datetime (optional | required with end_datetime | UTC Format)
	- {datetime} end_datetime (optional | required with start_datetime | UTC Format)
	- {integer} limit (optional)

For unit testing
- run `mocha` at the root directory of this project to start the unit testing

## Developer

Tanawin Samutsin
