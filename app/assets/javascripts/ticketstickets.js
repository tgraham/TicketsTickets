// Place your application-specific JavaScript functions and classes here

$(function(){
	
	/* setup navigation, content boxes, etc... */
	Administry.setup();
	
	/* progress bar animations - setting initial values */
  // alert($('td.ta-right.open_tickets').text());
  
  var total_tickets = $('td.ta-right.total_tickets').text();
  var progress1 = $('td.ta-right.open_tickets').text();
  var progress2 = $('td.ta-right.customer_reply_tickets').text();
  var progress3 = $('td.ta-right.answered_tickets').text();
  var progress4 = $('td.ta-right.closed_tickets').text();
  
	Administry.progress("#progress1", progress1, total_tickets);
	Administry.progress("#progress2", progress2, total_tickets);
	Administry.progress("#progress3", progress3, total_tickets);
	Administry.progress("#progress4", progress4, total_tickets);

	// validate signup form on keyup and submit
	var validator = $("#loginform").validate({
		rules: {
			username: "required",
			password: "required"
		},
		messages: {
			username: "Enter your username",
			password: "Provide your password"
		},
		// the errorPlacement has to take the layout into account
		errorPlacement: function(error, element) {
			error.insertAfter(element.parent().find('label:first'));
		},
		// set new class to error-labels to indicate valid fields
		success: function(label) {
			// set &nbsp; as text for IE
			label.html("&nbsp;").addClass("ok");
		}
	});
  
	/* flot graphs */
	if ($('#placeholder').length > 0){
		var sales = [{
			label: 'Total Paid',
			data: [[1, 0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,900],[8,0],[9,0],[10,0],[11,0],[12,0]]
		},{
			label: 'Total Due',
			data: [[1, 0],[2,0],[3,0],[4,0],[5,0],[6,422.10],[7,0],[8,0],[9,0],[10,0],[11,0],[12,0]]
		}
		];

		var plot = $.plot($("#placeholder"), sales, {
			bars: { show: true, lineWidth: 1 },
			legend: { position: "nw" },
			xaxis: { ticks: [[1, "Jan"], [2, "Feb"], [3, "Mar"], [4, "Apr"], [5, "May"], [6, "Jun"], [7, "Jul"], [8, "Aug"], [9, "Sep"], [10, "Oct"], [11, "Nov"], [12, "Dec"]] },
			yaxis: { min: 0, max: 1000 },
			grid: { color: "#666" },
			colors: ["#0a0", "#f00"]			
	    });
	};
});

