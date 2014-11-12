

$(document).ready(function() {
	
	$("#uploadPicButton").click(function() {
		$("#mainContent").load("uploadpic");

	});
	
	$("#cancelButton").click(function() {
		
		$("#mainContent").load("cancel");

	});
	$("#feedbackHistory").click(function() {
		$("#mainContent").load("feedbackhistory");

	});

	$("#snackSurvey").click(function() {
		$("#mainContent").load("snacksurvey");

	});
	$("#feedbackSurvey").click(function() {
		$("#mainContent").load("showfeedback");
	});
	$("#userProfile").click(function() {
		$("#mainContent").load("userprofile");
	});
	$("#ChangePassword").click(function() {
		$("#mainContent").load("changepassword");
	});

	$("#createFeastPoll").click(function() {
		$("#mainContent").load("createfeastpoll");
	});

	$("#addEmployee").click(function() {
		$("#mainContent").load("addemployee");
	});

	$("#surveyHistory").click(function() {
		$("#mainContent").load("surveyhistory");
	});

	$("#userProfileUp").click(function() {
		$("#mainContent").load("userprofile");
	});
	$("#createFeedback").click(function() {
		$("#mainContent").load("createfeedback");
	});
	
	$("#SurveyReport").click(function() {
		$("#mainContent").load("surveyreport");
	});

	$("#FeedbackReport").click(function() {
		$("#mainContent").load("feedbackreport");
	});
	
	
	
	
});