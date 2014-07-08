$(function(){
$("#new_task").submit(function(){
	console.log("HELLO. YOU SUBMITTED A FORM!");
	$.post("/tasks", 
		$("#new_task").serialize()
		).done(function(html){
			$("#tasks").prepend(html);
		});
	return false;

});
});