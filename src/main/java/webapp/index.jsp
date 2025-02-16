<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <%@page import="java.sql.*" %>
  
  <html>

  <head>
    <meta charset="UTF-8">
    <title>PhoneBook Application</title>
    <link rel="stylesheet" type="" href="Component/style.css">
    <%@include file="Component/allCall.jsp" %>
  </head>

  <body>
    <%@include file="Component/navbar.jsp" %>
    
    

      <main>
        <div class="container pt-5 mt-5">
          <h1 class="text-white pt-5">Welcome to PhoneBook</h1>
  		  <p class="text-white ">Manage your contacts easily!</p>
          
        </div>
      </main>
      
    <%@include file="Component/footer.jsp" %>
  </body>

  </html>