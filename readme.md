## Description

Telenor Digital Asia Assignment By Tanawin Samutsin

RESTful web service for scrape and store NASDAQ index value into database and provide the index data to a further use.

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
8. Open `config/app_config.json` and `config/config.json` file for edit a new database information
9. run `sequelize db:migrate` in order to create a new database table

Please note that you can edit a server setting such as server port, web scraper interval or database information in `config/app_config.json` file.

## How to run

run `node index.js` to start the server process.

For scrape and store NASDAQ index value
- run `gulp` to start the web scraper and it will store the NASDAQ index value into database automatically.

For get NASDAQ index value
- You can call RESTful web service by sending a POST method to API as below;

	`{your_host}:{your_port}/api/index/value/get`

	request parameter(s)
		{string}	index_name		(required)
		{datetime}	start_datetime	(optional | required with end_datetime | UTC Format)
		{datetime}	end_datetime	(optional | required with start_datetime | UTC Format)
		{integer}	limit			(optional)
