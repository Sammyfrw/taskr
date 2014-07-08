$(function(){
$("#new_task").submit(function(){
	console.log("HELLO. YOU SUBMITTED A FORM!");
	$.post("/tasks", 
		$("#new_task").serialize()
		).done(function(html){
			$("#tasks").prepend(html);
			$("errors").html("");
			$("#task_title, #task_body").val("");
		}).fail(function(xhr){
			var html = xhr.responseText;
			$("#errors").html(html);
		});
	return false;
	});
});