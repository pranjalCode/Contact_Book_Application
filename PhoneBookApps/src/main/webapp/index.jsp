

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="com.conn.DbConnect" %>
    <%@ page import="java.sql.*" %> 
    <%@ page import="java.io.*" %>
    <%@ page import="com.entity.User" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="component/allCSS.jsp" %>
</head>

<style>

.back-img{
background-color: #ebf2f5;
width: 100%;
height: 90vh;
background-repeat: no-repeat;
background-size: cover;
}
.trin-trin
{
    animation-name: trin;
    animation-duration: 1.5s;
    animation-iteration-count: infinite;
    animation-timing-function: linear;
}

.icon-phone
{
    background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAC1klEQVRoQ+2Z21XbQBCG/7ULCKkgTgUxFcR0YCrAl7wHKvBQQeA9Fu4AqCCkgogKcCqIU4C1OaONOLYl7e5IstY+B73wwMwy385l/10UjvxTRx4/3gBCZ7A8AyPqQ3XeOQPUyTMWtHLa7ckgD8CBd3APhZ7n34wxp1NP28bN8gATehEEbwJSOMN3emo8Oo8F8wBT0h5+2yYHBsD17K79TQSNK0R0IwZvwKGohJ6g8Fm2tn7E/Hoo82nGuqiEFgAuRMtrrBDRe5FPQ8ZFGSAozMTrr3GKBcViv5oOeYAvNIDGD/G6gfqg6Bw4QRd/KgAsEdFHsV9Nh+KTeEIxFD6J1w5QRsUA09kNoL6KAQKcByUAxCPxXgjwG2v029ZF5WJumgo03wPtL9YYHMYUyrZ9Sr7nQbDgjQwr+1iVdvHLWUYB6n4zJvuNbEJ2WaExRpRmKthnB5hamznoPSDbMfed2H4mnGNOD8G239oDWVQ2acEiLkk10DIUhDsDHJm9F2Kscdb2/PcvIbYcUQ9dvJTussYCEY1DZMEvAyYLl1D4ZoEIcivzB3CXEhBgrMoATCnxpaVcYrQMIQPgLNjPBlNhWhGi2bWzJ0bEd487aAwAPCDBrVRPyQFMKY2gcGcNkBs7wVXpdDLB882vv7UOj2aFGFqxClghUTEsr3/VAEwmfMQej9hxblfLgrftiMYSCc5316oO4A+xXVJVgn8Fyz/f1AMQQWAJpQjQl7mycTbLfwONn4iI++X1qw9geqLaU4xv4Jnd3gB8G1sa8K79XgGM5OBLEKvTD3VjLfTfO4CBOEFXU6VXDRd1KwBZEEaG86htLhutAmQgRgSS4IWjPA9BALKy6oBBeIT6PtXkQYIBbIbCMgQpjPzp8iAAMhhWth3wC+DQ+x8qBS/gzRxkrunh83tu+gR9KPSh0Ut/bpabxjMSDHfv34cD4ANZYPMGUHHjGnM7+gz8A29K+DHRISQ9AAAAAElFTkSuQmCC');	
    background-repeat: no-repeat;
    background-size: 30px;
    height: 30px;
    width: 30px;
    display: inline-block;
}

@keyframes trin {

    from {
        transform:rotate3d(0, 0, 1, 0deg);
    }
    20%, 32%, 44%, 56%, 68% {
        transform: rotate3d(0, 0, 1, 0deg);
    }
    23%, 35%, 47%, 59%, 71% {
        transform: rotate3d(0,0,1,15deg);
    }
    26%, 38%, 50%, 62%, 74% {
        transform: rotate3d(0,0,1,0deg);
    }
    29%, 41%, 53%, 65%, 77% {
        transform: rotate3d(0,0,1,-15deg);
    }
    80% {
        transform:rotate3d(0, 0, 1, 0deg);
    }

}

section{
  max-width: 490px;
  margin: 0 auto;
}

p.type{
  font-family:"Helvetica Neue", Helvetica, Arial, sans-serif;
  color:gray;
  font-size:20px;
  text-align:center;
  font-weight:bold;
 
}
p{
  padding: 10px 20px;
  clear:both;
  border-radius:25px;
  
}
p.speech-them{
  font-family:"Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size:19px;
  background: #E5E5EA;
  animation-name:slideUp;
  transform:;
  animation-duration:1s;
  animation-fill-mode:both;
  animation-timing-function:ease;
  visibility: visible !important;
}

p.speech-me{
  font-family:"Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size:19px;
  float:right;
  background: #007AFF;
  transform:;
  animation-name:slideUp;
  -webkit-animation-name:slideUp2;
  animation-fill-mode:both;
  color:white;
  animation-duration:1s;
  -webkit-animation-duration:1s;
  animation-timing-function:ease;
  -webkit-animation-timing-function:ease;
  transition-delay:2s;
  visibility: visible !important; 
  
}

/* 
Adding a delay to each list item
One will play after the other (for them)
*/
p.speech-them:nth-child(1){
  animation-delay:;
}

p.speech-them:nth-child(2){
  animation-delay:;
}

p.speech-them:nth-child(3){
  animation-delay:;
}

/* 
Adding a delay to each list item
One will play after the other (for me)
*/
p.speech-me:nth-child(1){
  animation-delay:;
}

p.speech-me:nth-child(2){
  animation-delay:;
}

p.speech-me:nth-child(3){
  animation-delay:;
}

/*  KEYFRAME */
@keyframe slideUp{
  0%{
    transform:translateY(100%)
  }
  50%{ 
    transform:translateY(-8%)
  }
  
  65%{
    transform:translateY(4%)
  }
  80%{
    transform:translateY(-4%)
  }
  95%{
    transform:translateY(2%)
  }
  100%{
    transform:translateY(0%)
  }
}
  
  

</style>
<body>

<%@ include file="component/navbar.jsp" %>


<div class="container-fluid back-img text-center text-success">
<h1>Welcome to Phonebook</h1>
<div class="content">
        <span class="icon-phone trin-trin">
        </span>        
    </div>
    <section>
<p class="type">Contact<br></br></p>
<p class="speech-them">How can I help you ?</p>
<p class="speech-me">I want to add contact </p>
<p class="speech-them">Did you actually get new phone?</p>
<p class="speech-me">Yes !! <br>How can I use it ?</br></p>
<p class="speech-them">First you go to register tab<br>and then Login</br></p>
<p class="speech-me">Okay sure bye &#x270C</p>
</section>
</div>

<%@ include file="component/footer.jsp" %>
</body>
</html>