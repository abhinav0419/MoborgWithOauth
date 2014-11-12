<%@page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Welcome To MOMS</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> 
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
<script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>
<style type="text/css">
    .bs-example{
        margin: 20px;
    }
    /* Fix alignment issue of label on extra small devices in Bootstrap 3.2 */
    .form-horizontal .control-label{
        padding-top: 7px;
    }

    #register{
    background-color: #cccccc;
    color:#ffffff;
}

#register:hover{
    background-color: #686868;
    color:#ffffff;
}

#cancel{

    background-color:#cccccc ;
    color:#ffffff;
}
#cancel:hover{

    background-color:#7A7A7A ;
    color:#ffffff;
}
.col-centered{
    float: none;
    margin: 0 auto;
}
#header{
   margin-top: 40px;
   background: #F1F1F1;
   padding-bottom: 20px;
   padding-top: 20px;
}
.p{
    float: none;
    margin: 0 auto;
}
#register{
    outline: none;
}
.error {

    color:black;
    border:1px solid red;
}
.valid {
    color:black;
    outline:none;
}

</style>

</head>
<body>
<div class="bs-example col-xs-10 col-md-6 col-centered">
    <div class="col-xs-10 col-centered" id="header">
    <div></div>
    <div align="center"><img src="resource/img/mob-logo-small.png" />Get SetUp With the Mob</div>
    </div>
    <br>
    <form:form class="form-horizontal" id="myform" action="registration" method="post" commandName="userEntity">
     <div class="form-group">
            <div id="error-bubble" class=" col-xs-10 col-centered "  style="display:none;color:red;">Fields Marked Red Are Required</div>
        </div>
        <div class="form-group">
            <div class="col-xs-10 col-centered">

            <span id="errorspan" Style="color:red"></span><br>
                <%-- <form:input type="text" class="form-control" id="inputEmail123" placeholder="Your Mob Email" path="emailId" name="emailId" value="email@mobiquityinc.com" readonly="true"></form:input>
           		<form:errors path="emailId"></form:errors> 
>>>>>>> b54db60 Oauth commited
                <form:input type="text" class="form-control" id="inputEmail123" placeholder="Your Mob Email" path="emailId" name="emailId" ></form:input>
<<<<<<< Upstream, based on origin/develop
           		<form:errors path="emailId" class="err"></form:errors>
<%-- 
=======
           		<form:errors path="emailId" class="err"></form:errors> --%>

                <form:input type="text" class="form-control" id="inputEmail" placeholder="Your Mob Email" path="emailId" value="" readonly="true"></form:input>
                <form:errors path="emailId"></form:errors>
				<form:hidden path="userPicture"/>
            </div>
        </div>
        <div class="form-group">
            
            <div class="col-xs-10 col-centered">
            
                <form:input type="text" class="form-control validate" id="inputFullName123" placeholder="Full Name" path="fullName" name="fullName" ></form:input>
            	 <form:errors path="fullName"></form:errors>
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-10 col-centered">
                <select id="title" class="form-control validate" name="title">
                    <option value="">Title</option>
                   <c:forEach items="${titleNameList}" var="name">
                                   <option value="${name.titleName}">${name.titleName}</option>
                                   </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-10 col-centered">
                <select id="reportTo" class="form-control validate" name="reportTo" >
                    <option value="">Report To</option>
                    <c:forEach items="${managerList}" var="manager">
                                   <option value="${manager.fullName}">${manager.fullName}</option>
                                   </c:forEach>
                </select>
              
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-10 col-centered">
                <select id="officeLocation" class="form-control validate" name="officeLocation" >
                    <option value="">Office Location</option>
                    <c:forEach items="${officeList}" var="office">
                                   <option value="${office.addressLine1}">${office.addressLine1}</option>
                                   </c:forEach>
                </select>
            </div>
        </div>

        <div class="form-group">
            
            <div class="col-xs-10 col-centered">
                <form:input type="text" class="form-control validate" id="inputPhone123" path="contactNo" name="contactNo" placeholder="Contact Phone"  ></form:input>
                <form:errors path="contactNo"></form:errors>
            </div>
        </div>
        <div class="form-group">
            
            <div class="col-xs-10 col-centered">
                <form:input type="text" class="form-control validate" id="inputOfficePhone123" path="officeContactNo" name="officeContactNo" placeholder="Office Phone" value="${user.officeContactNo }"></form:input>
                <form:errors path="officeContactNo"></form:errors>
          
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-10 col-centered">Job Description</div>
              <div class="col-xs-10 col-centered"> <form:textarea type="text"   class="form-control validate" style="width:100%" path="jobDescription" ></form:textarea></div>
        </div>
        <div class="form-group">
            <div class="col-xs-10 col-centered">Interests/Hobbies</div>
              <div class="col-xs-10 col-centered"> <form:textarea type="text" class="form-control validate" style="width:100%" path="hobbies"></form:textarea></div>
        </div>
         
         
        <div class="form-group">
            <div class=" col-xs-10 col-centered">
                <input type="submit" value="Submit"/>
                <input id="logout" type="reset" value="Cancel" />
            </div>
        </div>
    </form:form>
    
</div>
<script type="text/javascript">

 $(document).ready(function(){
	 $("#logout").click(function(){
		window.location="<%=request.getContextPath()%>/logout";
	 });


$( "#myform" ).validate({
	
	
  rules: {
	  contactNo: {
      required: true,
      minlength: 8,
      maxlength:25
    },
    emailId:{
    	
    },
    
    fullName:{
          required:true,
          minlength:1,
          maxlength:40
    },
    title:{
        required:true
    },
    reportTo:{
        required:true
    },
    officeLocation:{
        required:true
    }
      },
      errorPlacement: function () {
    	  $('#error-bubble').show();
 	  
        },
        submitHandler: function(form) {  
            if ($(form).valid()) {
            	 $('#error-bubble').hide();
             form.submit();}
            else
            return false; // prevent normal form posting
   
        }
});
});

</script>
</body>
</html>
