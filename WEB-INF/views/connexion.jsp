<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "quizIT.*" %>
<%@ page import = "controllers.*" %>
<%
ConnexionForm form_connexion = (ConnexionForm)request.getAttribute("form_connexion");

%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>QuizIT !</title>

    <!-- Personal styles - to modyfy with Tomcat links -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/bootstrap-custom.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/master.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Javascript (jquery BEFORE bootstrap) -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"></script>
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  </head>

  <body>
    <!-- NAVBAR -->
    <nav class="navbar navbar-default">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2" data-_extension-text-contrast="">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">QuizIT !</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
          <ul class="nav navbar-nav">
            <li><a href="${pageContext.request.contextPath}/home"><i class="fa fa-sign-out" aria-hidden="true"></i> Retour à l'accueil</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="https://github.com/Ketedaro/QuizIt" target="_blank"><i class="fa fa-github"></i> Github</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="row">
      <div class="col-md-4"></div>
      <div class="col-md-4">
        <form class="panel panel-primary tweak-padding-50" method="post" action="${pageContext.request.contextPath}/connexion">
          <fieldset>
            <legend>Se connecter</legend>

            <% if (form_connexion != null && !form_connexion.isCorrect()) { %>
              <div class="form-group">
                <div class="alert alert-danger">
                  <p><%= form_connexion.getMessage() %></p>
                </div>
              </div>
            <% } %>

            <div class="form-group">
              <label class="control-label"> Pseudo</label>
                <input class="form-control" placeholder="Pseudo" type="text" name="pseudo">
            </div>
            <div class="form-group">
              <label class="control-label"> Mot de passe</label>
                <input class="form-control" placeholder="Mot de passe" type="password" name="password">
            </div>
            <br>
            <div class="form-group text-center">
              <a href="${pageContext.request.contextPath}/home" class="btn btn-primary">Annuler</a>
              <button type="submit" class="btn btn-success" data-_extension-text-contrast="">Connexion</button>
            </div>
          </fieldset>
        </form>

      </div>
      <div class="col-md-4"></div>
    </div>
  </body>

</html>
