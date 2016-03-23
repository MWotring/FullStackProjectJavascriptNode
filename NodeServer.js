//Import modules
var http = require('http');
var express = require('express');
var url = require('url');
var path = require('path');
var ServerIP = '127.0.0.1', port = '8080';
var mysql = require("mysql");
var query;
var query2;
var student;
var email;
var json;
var jsonResults = [];

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
		query = 'SELECT first, last, email FROM students WHERE first="' + fn + '";';
		console.log("query: "+query);
	}
	else if(ln) {
		query = 'SELECT first, last, email FROM students WHERE students.last="' + ln + '";';
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
		password: "12kgGoatB34Rdmys"
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
		jsonResults.push(json);
		student = rows[0];
		email = student.email;
		query2 = 'SELECT class_name, grade from studentClasses JOIN classes on studentClasses.id = classes.id WHERE email="' + email + '";';
		
		db.query(query2, function(err, rows, fields){
			if(err) throw err;
			if(rows) {
				
				json = json + JSON.stringify(rows);
				
				json = json.replace('\]\[', ', ');
				
			}
			
			console.log(json);
			res.end(json);
		});				
		db.end();
	});
	
};
