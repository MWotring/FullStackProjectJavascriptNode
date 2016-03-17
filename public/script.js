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
	console.log(data);
	var student_obj = JSON.parse(data);
	console.log(student_obj);
	var name = get_full_name(student_obj);
	var gpa = get_gpa(student_obj);
	console.log(name + ' ' + gpa);
 }

 function get_full_name(student_obj){
	var full_name = student_obj.first + " " + student_obj.last;	
	return full_name;
};

function get_gpa(student_obj){
	var leng = student_obj.length;
	var gpa = 0;
	for (i = 0; i < leng; i++) {
		gpa += student_obj.grade;
	}
	return (gpa / leng);
};

function details() {
	var email = student_object.students.email;
	var leng = student_obj.studentClasses.length;
	var classes;
	for (i = 0; i < leng; i++) {
		classes [ "student_obj.classes[student_obj.studentClasses[i]]" ] = "student_obj.studentClasses.id[i]";
	}
};