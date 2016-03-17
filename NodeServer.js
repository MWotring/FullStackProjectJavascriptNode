//Import modules
var http = require('http');
var express = require('express');
var url = require('url');
var path = require('path');
var ServerIP = '127.0.0.1', port = '8080';
var mysql = require("mysql");
var query;

//create the server
var Server = express();
Server.use(express.static(__dirname + '/public'));

Server.listen(port, ServerIP, function() {
	console.log("Listening..." + ServerIP + ":" + port);
});



Server.get('/', function(req, res) {
	
	var url_parts = url.parse(req.url, true);
	var url_query = url_parts.query;
	console.log(url_query);
	console.log(url_query.first);

	var fn = url_query.first;
	var ln = url_query.last;
	console.log(fn);
	console.log(ln);
	if(fn) {
		query = 'SELECT first, last, students.email, class_name, grade FROM students JOIN studentClasses ON students.email = studentClasses.email JOIN classes ON classes.id = studentClasses.id WHERE students.first="' + fn + '";';
		console.log("query: "+query);
	}
	else if(ln) {
		query = 'SELECT first, last, students.email, class_name, grade FROM students JOIN studentClasses ON students.email = studentClasses.email JOIN classes ON classes.id = studentClasses.id WHERE students.last="' + ln + '";';
		console.log("query: "+query);
	}
	get_json(query, res);
	
	
	
});

function get_json(query, res) { 	
	//create connection to db
	var db = mysql.createConnection({
		host: "localhost",
		port: "3306",
		database: "student_database",
		user: "root",
		password: "REDACTED"
	});

	db.connect(function(err){
		if(err){
			console.log('Error connecting to database ' + err);
			return;
		}
		console.log('Connection established');
	});
	
	db.query(query, function(err, rows, fields){
		if(err) throw err;
		json = JSON.stringify(rows);
		
		db.end();
		console.log('JSON-result:', json);
		
		res.end(json);
	});
	
};