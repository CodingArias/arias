<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style type="text/css">
    /* Remove the navbar's default margin-bottom and rounded borders */
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none;
    }
    
    .mypage_title {
    color: white;
    
    }
    
    #mypage_title{
    color: white;
    
    }
  }
  </style>
  <script type="text/javascript">
  	$(function(){
  	
  		
        $('#mypage').hover(
                function () {
                	$(this).addClass("open");
                	$(".dropdown").attr("aria-expanded","true");
                	
                }, 
                function () {
                	$(this).removeClass("open");
                	$(".dropdown").attr("aria-expanded","false");
                }
             );
  	});
  </script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Logo</a>
    </div>
    
 
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Hosting</a></li>
        <li><a href="#">Notice</a></li>
        <li><a href="#">statistics</a></li>
        <li id="mypage"><a href="#" class="dropdown" data-toggle="dropdown">My page</a>
        		  <ul class="dropdown-menu" >
				    <li><a href="#">Member Infomation</a></li>
				    <li><a href="#">Reservation Status</a></li>
				    <li><a href="#">Hosting List</a></li>
				  </ul>
        	
        </li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
        <li id="login_status"><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
   

  </div>
</nav>



</body>
</html>
