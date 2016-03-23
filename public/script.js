var form = document.getElementById('simpleForm');
if(form.attachEvent) {
	form.attachEvent("submit", get_form_req);
}else{
	form.addEventListener("submit", get_form_req);
}

function get_form_req(e) {
	if (e.preventDefault) e.preventDefault();
	var first = document.forms["simpleForm"]["first_name"].value;
	var last = document.forms["simpleForm"]["last_name"].value;
	console.log(first);
	console.log(last);
	
	if( (first == null || first == "") && (last == null || last == "") ) {
		alert("At least one of first_name or last_name must be filled out.");
		return false;
	}
	else {
		
		console.log("Javascript captured get ", first, last);
		
		var get_url = 'http://localhost:8080/?first=' + first + '&last=' + last;
		
		$.ajax({
			url: get_url,
			type: 'GET',
			async: false,
			contentType: "text/plain",
			datatype: 'json',
			cache: false,
			success: function (data) {
				process(data);
			}
			
		});
				
	}
	return true;
}

function process(data) {
	var student_objs = JSON.parse(data);
	console.log(student_objs);
	var name = get_full_name(student_objs);
	var gpa = get_gpa(student_objs);
	console.log(name + ' ' + gpa);
	var email = student_objs[0].email;
	var classes = details(student_objs);
 }

 function get_full_name(student_objs){
	var full_name = student_objs[0].first + " " + student_objs[0].last;	
	console.log(full_name);
	return full_name;
};

function get_gpa(student_objs){
	var leng = student_objs.length;
	var gpa = 0.0;
	for (var i = 1; i < leng; i++) {
		var temp = student_objs[i].grade;
		gpa += parseFloat(temp);
		console.log(temp);
	}
	return (gpa / (leng - 1));
};

function details(student_objs) {
	for (var i = 1; i < leng; i++) {
		var leng = student_objs.length;
		var classes = [];
		var classString = student_objs[i].class_name + ': ' + student_objs[i].grade;
		classes.push(classString);
	}
	return classes;
};