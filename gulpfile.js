'use strict'

// Load Node Module(s)
var gulp	= require('gulp');
var request	= require('request');

// Load Config
var config = require('./config/app_config');

gulp.task('scrape', function() {
	function scrapeNASDAQIndexValue() {
		request
			.post(config.server.host + ':' + config.server.port + '/api/index/value/scrape/NASDAQ')
	}

	setInterval(function() {
		scrapeNASDAQIndexValue();
	}, config.task.scrape.interval)
});

gulp.task('default', ['scrape']);
