<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "quizIT.*" %>
<%
boolean connecté;
User utilisateur = null;
List<Topic> topics = (List<Topic>) request.getAttribute("topics");
List<User> users = (List<User>) request.getAttribute("users");
if (session.getAttribute("utilisateur") == null) {
  connecté = false;
} else {
  connecté = true;
  utilisateur = (User)session.getAttribute("utilisateur");
}
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
            <li><a href="${pageContext.request.contextPath}/home"><i class="fa fa-list"></i> Liste des quiz</a></li>
            <%-- <li><a href="#"><i class="fa fa-play-circle"></i> Partie aléatoire</a></li> --%>

            <li class="active"><a href="${pageContext.request.contextPath}/leaderboard"><i class="fa fa-trophy"></i> Classement</a></li>
          </ul>

          <ul class="nav navbar-nav navbar-right">
            <% if (connecté) { %>
              <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                  <i class="fa fa-user-circle" aria-hidden="true"></i> <%= utilisateur.getLogin() %>
                <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="${pageContext.request.contextPath}/change_password">Changer de mot de passe</a></li>
                  <li><a href="${pageContext.request.contextPath}/disconnect">Se déconnecter</a></li>
                </ul>
              </li>
              <li><a href="${pageContext.request.contextPath}/submit_question">
              <i class="fa fa-pencil" aria-hidden="true"></i> Proposer une question</a></li>
            <% } else { %>
              <li>
                <a href="${pageContext.request.contextPath}/connexion"><i class="fa fa-sign-in" aria-hidden="true"></i> Se connecter</a>
              </li>
              <li>
                <a href="${pageContext.request.contextPath}/sign_in">
                  <i class="fa fa-pencil-square-o" aria-hidden="true"></i> S'inscrire
                </a>
              </li>
            <% } %>

            <li><a href="https://github.com/Ketedaro/QuizIt" target="_blank"><i class="fa fa-github"></i> Github</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="row">
      <div class="col-md-3"></div>

      <div class="col-md-6 tweak-padding-50 row container">
        <header class="text-center">
          <h2>
            Classement
          </h2>
        </header>
        <table class="table leaderboard">
          <thead>
            <tr>
              <th>#</th>
              <th>Pseudo</th>
              <th>Nombre de points</th>
            </tr>
            <tbody>
              <% if(users != null) { %>
              <% int cpt = 0; %>
              <% for(User user : users) { %>
              <tr>
                <td><%= cpt + 1 %></td>
                <td><%= user.getLogin() %></td>
                <td><%= user.getScore() %></td>
              </tr>
              <% ++cpt; %>
              <% } %>
              <% } %>
            </tbody>
          </thead>
        </table>
      </div>

      <div class="col-md-3"></div>
    </div>
  </body>

</html>
