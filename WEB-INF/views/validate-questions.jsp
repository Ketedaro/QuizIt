<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "quizIT.*" %>
<%
boolean connecté;
User utilisateur = null;

List<Question> questions = (List<Question>)request.getAttribute("UnvalidateQuestions");

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
    <script type="text/javascript" defaultsrc="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  </head>

  <body class="end-game">
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

    <% for(Question question : questions) { %>
      <div class="row">
        <div class="col-md-2"></div>
        <div class="panel panel-success col-md-8 question-panel tweak-margin-bottom tweak-margin-bottom">
          <div class="panel-heading">
            <h3 class="panel-title">Question de <i><%= question.getSubmitter() %></i></h3>
          </div>
          <div class="panel-body row tweak-margin-bottom">
            <div class="col-md-2"></div>
            <div class="col-md-8 row container">
              <header divclass="text-center">
                <h2 class="text-center"><%= question.getEntitled() %>
                <br><small><strong>Catégorie : </strong><%= question.getTopic() %></small></h2>
              </header>
              <div class="row row-centered">
                <% int cpt = 0; %>
                <% String desc = "Sans commentaire."; %>
                <% for(Answer answer : question.getAnswers()) { %>
                <% ++cpt; %>
                <div class="field col-md-6">
                  <% if(answer.isCorrect()){ %>
                    <button class="btn btn-success" name="answer" value="<%= cpt %>"><%= answer.getAnswer() %></button>
                  <% } else { %>
                    <button class="btn btn-default" name="answer" value="<%= cpt %>"><%= answer.getAnswer() %></button>
                  <% } %>

                  <% if(answer.isCorrect() && !answer.getDescription().equals("null")) { %>
                      <% desc = answer.getDescription(); %>
                  <% } %>
                </div>
                <% } %>
              </div>
              <div class="tweak-margin-top">

                <p class="well desc"><%= desc %></p>
                <form class="form text-center" action="${pageContext.request.contextPath}/validate-questions" method="post">
                  <button class="btn btn-primary" type="submit" name="id_quest" value="<%= question.getId() %>">Valider la question</button>
                </form>
              </div>
            </div>
            <div class="col-md-2"></div>
          </div>
        </div>

        <div class="col-md-2"></div>
      </div>
    <% } %>

    <!-- PUB -->
    <div class="row tweak-margin-top tweak-margin-bottom">
      <div class="col-md-4"></div>
      <div class="col-md-4 text-center">
        <a href="${pageContext.request.contextPath}/home" class="btn btn-primary">Retour à l'accueil</a>
          <a href="${pageContext.request.contextPath}/leaderboard" class="btn btn-success">Classement</a>
      </div>
      <div class="col-md-4"></div>
    </div>
  </body>

</html>
