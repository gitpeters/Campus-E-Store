<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Error page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/error-page.css" />
    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        
        setTimeout("preventBack()", 0.0);
        window.onunload = function () { null };
    </script>
  </head>
  <body>
    <nav>
      <!-- Logo -->
      <a href="#" class="logo">
        <img src="img/logo/projectLogo.PNG" alt="" style= "height: 80px;"/>
      </a>
    </nav>

    <!-- 404-page-section -->
    <section class="page-not-found">
      <!-- img -->
      <img src="./img/500-error.gif" alt="" />
      <!-- text -->
      <h1>500 ERROR!</h1>
      <p>
        Sorry. An internal server error occurred. Click
        <a href="index.jsp">here</a> to come back to home page.
      </p>

      <!-- btn -->
      <a href="index.jsp"><button>Back</button></a>
    </section>
  </body>
</html>
