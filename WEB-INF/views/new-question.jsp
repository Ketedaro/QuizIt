<%@ page contentType="text/html; charset=UTF-8" %>
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
            <span class="icon-bar"></span> id="type"
          </button>
          <a class="navbar-brand" href="#">QuizIT !</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
          <ul class="nav navbar-nav">
            <li><a href="${pageContext.request.contextPath}/home"><i class="fa fa-sign-out" aria-hidden="true"></i> Retour à l'accueil</a></li>
          </ul>
          <<ul class="nav navbar-nav navbar-right">
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
      <div class="col-md-4"></div>
      <div class="col-md-4">
        <form class="panel panel-primary tweak-padding-50" method="post" action="/inscription">
          <h1 class="text-center">Proposer une question</h1>
          <fieldset>
            <legend>Type :</legend>
            <div class="form-group">
              <select class="form-control" name="topic" id="type">
                <option value="MCQ">Question à choix multiple</option>
                <option value="Blindtest">Blindtest</option>
              </select>
            </div>
            <div class="mcq">
              <legend>Question</legend>
              <div class="form-group">
                <input class="form-control" id="inputEmail" placeholder="Question" type="text">
              </div>
              <legend>Catégorie :</legend>
              <div class="form-group">
                <select class="form-control" name="topic">
                  <option value="Histoire">Histoire</option>
                  <option value="Géographie">Géographie</option>
                  <option value="Le monde en 2016">Le monde en 2016</option>
                </select>
              </div>
            </div>
            <div class="blindtest" hidden>
              <legend>Question</legend>
                <div class="form-group">
                <input class="form-control" id="inputEmail" placeholder="Question" type="text">
              </div>
              <legend>URL du MP3</legend>
              <div class="form-group">
                <input class="form-control" id="inputEmail" placeholder="URL ftp, http..." type="text">
              </div>
              <legend>Catégorie :</legend>
              <div class="form-group">
                <select class="form-control" name="topic">
                  <option value="Histoire">Histoire</option>
                  <option value="Géographie">Géographie</option>
                  <option value="Le monde en 2016">Le monde en 2016</option>
                </select>
              </div>
            </div>
            <hr>
            <legend>Réponses :</legend>
            <div class="form-group">
              <input type="radio" name="good-response" value="1" checked> Ceci est la bonne réponse
              <input class="form-control" placeholder="Réponse 1" type="text">
            </div>
            <div class="form-group">
              <input type="radio" name="good-response" value="2"> Ceci est la bonne réponse
              <input class="form-control" placeholder="Réponse 2" type="text">
            </div>
            <div class="form-group">
              <input type="radio" name="good-response" value="3"> Ceci est la bonne réponse
              <input class="form-control" placeholder="Réponse 3" type="text">
            </div>
            <div class="form-group">
              <input type="radio" name="good-response" value="4"> Ceci est la bonne réponse
              <input class="form-control" placeholder="Réponse 4" type="text">
            </div>
            <br>
            <div class="form-group text-center">
              <a href="index.jsp" class="btn btn-primary">Annuler</a>
              <button type="submit" class="btn btn-success" data-_extension-text-contrast="">Proposer</button>
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
            $(".mcq").hide();
            $(".blindtest").show();
          } else if ($("#type").val() == "MCQ") {
            $(".mcq").show();
            $(".blindtest").hide();
          }
        });
      });
    </script>
  </body>

</html>
