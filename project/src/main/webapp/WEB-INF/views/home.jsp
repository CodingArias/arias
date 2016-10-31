<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="kr">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
  }

  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none;
    }
  }
  .image {
  	position:relative;
  	float:left;
  }
  
  .image .text {
  	position:absolute;
  	bottom: 2px;
  	color: white;
  	margin-left: 10px;
   }
  </style>
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
        <li class="active"><a href="#">Home</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Projects</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="https://placehold.it/1200x400?text=IMAGE" alt="Image">
        <div class="carousel-caption">
          <h3>Sell $</h3>
          <p>Money Money.</p>
        </div>
      </div>

      <div class="item">
        <img src="https://placehold.it/1200x400?text=Another Image Maybe" alt="Image">
        <div class="carousel-caption">
          <h3>More Sell $</h3>
          <p>Lorem ipsum...</p>
        </div>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
  
<div class="container text-center">
  <h3>두근두근 세계여행</h3><br>
  <div class="row">
    <div class="col-sm-6 image">
      <img src="/resources/img/main/paris.jpg" class="img-responsive" style="width:100%" alt="Image">
      <div class="text">
      	<h4>파리</h4>
      </div>
    </div>
    <div class="col-sm-3 image">
      <img src="/resources/img/main/rome.jpg" class="img-responsive" style="width:100%" alt="Image">
      <div class="text">
      	<h4>로마</h4>
      </div>
    </div>
    <div class="col-sm-3 image">
      <img src="/resources/img/main/LA.jpg" class="img-responsive" style="width:100%" alt="Image">
      <div class="text">
      	<h4>로스앤젤레스</h4>
      </div>
    </div>
    <div class="col-sm-3 image">
      <img src="/resources/img/main/lisboa.jpg" class="img-responsive" style="width:100%" alt="Image">
      <div class="text">
      	<h4>리스본</h4>
      </div>
    </div>
    <div class="col-sm-3 image">
      <img src="/resources/img/main/tokyo.jpg" class="img-responsive" style="width:100%" alt="Image">
    	<div class="text">
      	<h4>도쿄</h4>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-sm-3">
     <div class="image">
      <img src="/resources/img/main/newyork.jpg" class="img-responsive" style="width:100%" alt="Image">
      <div class="text">
      	<h4>뉴욕</h4>
      </div>
      </div>
      <div class="image">
      <img src="/resources/img/main/amsterdam.jpg" class="img-responsive" style="width:100%" alt="Image">
      <div class="text">
      	<h4>암스테르담</h4>
      </div>
    </div>
    </div>
    
    <div class="col-sm-6 image">
      <img src="/resources/img/main/liverpool.jpg" class="img-responsive" style="width:100%" alt="Image">
    	<div class="text">
      	<h4>리버풀</h4>
      </div>
    </div>
    <div class="col-sm-3 image">
      <img src="/resources/img/main/barcelona.jpg" class="img-responsive" style="width:100%" alt="Image">
    <div class="text">
      	<h4>바르셀로나</h4>
      </div>
    </div>
    <div class="col-sm-3 image">
      <img src="/resources/img/main/berlin.jpg" class="img-responsive" style="width:100%" alt="Image">
    <div class="text">
      	<h4>베를린</h4>
      </div>
    </div>
    
  </div>
</div><br>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>


