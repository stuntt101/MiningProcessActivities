$(document).ready(function() {
	$(function() {
		$("#method").autocomplete({

			source : function(request, response) {
				$.ajax({
					url : "AutoCompleteController",
					type : "POST",
					data : {
						term : request.term
					},
					dataType : "json",
					success : function(data) {
						response(data);
					}
				});
			}
		});
                
	});
});
