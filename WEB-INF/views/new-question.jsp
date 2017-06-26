<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "quizIT.*" %>
<%@ page import = "controllers.*" %>
<%
List<Topic> topics = (List<Topic>)request.getAttribute("topics");
List<String> types = (List<String>)request.getAttribute("types");
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
          <ul class="nav navbar-nav">arg1
            <li><a href="${pageContext.request.contextPath}/home"><i class="fa fa-sign-out" aria-hidden="true"></i> Retour à l'accueil</a></li>
          </ul>
          <<ul class="nav navbar-nav navbar-right">
              <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                  <i class="fa fa-user-circle" aria-hidden="true"></i> <%= utilisateur.getLogin() %>
                <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="${pageContext.request.contextPath}/change_password">Changer de mot de passe</a></li>
                  <li><a href="${pageContext.request.contextPath}/disconnect">Se déconnecter</a></li>
                </ul>
              </li>

            <li><a href="https://github.com/Ketedaro/QuizIt" target="_blank"><i class="fa fa-github"></i> Github</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="row">
      <div class="col-md-4"></div>
      <div class="col-md-4">
        <form class="panel panel-primary tweak-padding-50" method="post" action="${pageContext.request.contextPath}/submit_question">
          <h1 class="text-center">Proposer une question</h1>
          <fieldset>
            <legend>Type :</legend>
            <div class="form-group">
              <select class="form-control" name="type" id="type">
                <option value="MCQ">Question à choix multiple</option>
                <option value="Blindtest">Blindtest (démo - pas d'upload audio possible)</option>
              </select>
            </div>
            <legend>Question</legend>
            <div class="form-group">
              <input class="form-control" name="questContent" placeholder="Question" type="text">
            </div>
            <div class="mcq">
              <legend>Catégorie :</legend>
              <div class="form-group">
                <select class="form-control" name="topic">
                  <% for(Topic topic : topics) { %>
                    <option value="<%= topic.getName() %>"><%= topic.getName() %></option>
                  <% } %>
                </select>
              </div>
            </div>
            <div class="blindtest" hidden>
              <hr>
              <legend>Ajouter un fichier audio <br><small>Cette fonctionnalité n'est pas encore disponible.</small></legend>
              <div class="form-group">
                <input class="form-control" name="mp3Link" placeholder="MP3, wav..." type="file" disabled>
              </div>
            </div>
            <hr>
            <select class="form-control" name="typeAns">
              <% for(String type : types) { %>
                <option value="<%= type %>"><%= type %></option>
              <% } %>
            </select>
            <legend>Réponses :</legend>
            <div class="form-group">
              <div class="input-group">
                <span class="input-group-addon">1.</span>
                <input class="form-control" placeholder="Réponse 1" type="text" name="Réponse1">
              </div>
            </div>
            <div class="form-group">
              <div class="input-group">
                <span class="input-group-addon">2.</span>
                <input class="form-control" placeholder="Réponse 2" type="text" name="Réponse2">
              </div>
            </div>
            <div class="form-group">
              <div class="input-group">
                <span class="input-group-addon">3.</span>
                <input class="form-control" placeholder="Réponse 3" type="text" name="Réponse3">
              </div>
            </div>
            <div class="form-group">
              <div class="input-group">
                <span class="input-group-addon">4.</span>
                <input class="form-control" placeholder="Réponse 4" type="text" name="Réponse4">
              </div>
            </div>
            <label for="goodAnswer">Bonne réponse :</label>
            <select class="form-control" name="goodAnswer" id="goodAnswer">
              <option value="1">Réponse 1</option>
              <option value="2">Réponse 2</option>
              <option value="3">Réponse 3</option>
              <option value="4">Réponse 4</option>
            </select>
            <br>
            <div class="form-group text-center">
              <a href="${pageContext.request.contextPath}/home" class="btn btn-primary">Annuler</a>
              <button type="submit" class="btn btn-success" id="propose">Proposer</button>
            </div>
          </fieldset>
        </form>

      </div>
      <div class="col-md-4"></div>
    </div>

    <script type="text/javascript">
      $(document).ready(function(){
        $("#type").on('change', function() {
          if ($("#type").val() == "Blindtest") {
            $(".blindtest").show();
            $("#propose").attr("type", "button");
            $("#propose").addClass("disabled");
          } else if ($("#type").val() == "MCQ") {
            $(".blindtest").hide();
            $("#propose").attr("type", "submit");
            $("#propose").removeClass("disabled");
          }
        });
      });
    </script>
  </body>

</html>
