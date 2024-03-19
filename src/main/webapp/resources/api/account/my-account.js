$("#change-avatar").on("submit", function(e) {
	e.preventDefault();
	$.ajax({
		url: "/my-account/user/avatar",
		type: "POST",
		data: new FormData(this),
		processData: false,
		contentType: false,
		success: function(data) {
			$("#change-avatar").trigger("reset");
			$("#current-avatar").css('background-image', 'url(' + data + ')');
		},
		error: function(err) {
			$("#current-avatar").html(err);
		}
	});
});