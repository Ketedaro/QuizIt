<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "quizIT.*" %>
<%@ page import = "controllers.*" %>
<%
ChangePasswordForm changePasswordForm = (ChangePasswordForm)request.getAttribute("changePasswordForm");

User utilisateur = (User)session.getAttribute("utilisateur");
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
        <form class="panel panel-primary tweak-padding-50" method="post" action="${pageContext.request.contextPath}/change_password">
          <fieldset>
            <legend>Changer son mot de passe</legend>

            <% if (changePasswordForm != null && !changePasswordForm.isCorrect()) { %>
              <div class="form-group">
                <div class="alert alert-danger">
                  <p><%= changePasswordForm.getMessage() %></p>
                </div>
              </div>
            <% } %>

            <% if (changePasswordForm != null && changePasswordForm.isCorrect()) { %>
              <div class="form-group">
                <div class="alert alert-success">
                  <p><%= changePasswordForm.getMessage() %></p>
                </div>
              </div>
            <% } %>

            <input class="form-control" id="inputEmail" placeholder="Pseudo" type="hidden" name="pseudo" value="<%= utilisateur.getLogin() %>">

            <div class="form-group">
              <label for="inputPassword" class="control-label"> Ancien mot de passe</label>
                <input class="form-control" id="inputPassword" placeholder="Password" type="password" name="oldpassword">
            </div>
            <div class="form-group">
              <label for="inputPassword" class="control-label"> Nouveau mot de passe</label>
                <input class="form-control" id="inputPassword" placeholder="Password" type="password" name="password1">
            </div>
            <div class="form-group">
              <label for="inputPassword" class="control-label"> Confirmation du nouveau mot de passe</label>
                <input class="form-control" id="inputPassword" placeholder="Password" type="password" name="password2">
            </div>
            <br>
            <div class="form-group text-center">
              <a href="${pageContext.request.contextPath}/home" class="btn btn-primary">Annuler</a>
              <button type="submit" class="btn btn-success" data-_extension-text-contrast="">Confirmer</button>
            </div>
          </fieldset>
        </form>

      </div>
      <div class="col-md-4"></div>
    </div>
  </body>

</html>
