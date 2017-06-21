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
            <li><a href="../index.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i> Retour à l'accueil</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-user-circle" aria-hidden="true"></i> H0tmilk
              <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="change-password.jsp">Changer de mot de passe</a></li>
                <li><a href="disconnect">Se déconnecter</a></li>
              </ul>
            </li>
            <li><a href="https://github.com/Ketedaro/QuizIt" target="_blank"><i class="fa fa-github"></i> Github</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="row">
      <div class="col-md-2"></div>
      <div class="panel panel-success col-md-8 question-panel">
        <div class="panel-heading">
          <h3 class="panel-title">Question n°1</h3>
        </div>
        <div class="panel-body row">
          <div class="col-md-2"></div>
          <div class="col-md-8 row container">
            <header class="text-center">
              <h2>Quelle est la couleur du cheval blanc d'Henri IV ?</h2>
            </header>
            <form class="row row-centered col-md-12" action="index.jsp" method="post">
              <div class="field col-md-6">
                <button class="btn btn-success" name="button" value="1">Bleu</button>
              </div>
              <div class="field col-md-6">
                <button class="btn btn-success" name="button" value="2">Blanc</button>
              </div>
              <div class="field col-md-6">
                <button class="btn btn-success" name="button" value="2">Vert</button>
              </div>
              <div class="field col-md-6">
                <button class="btn btn-success" name="button" value="2">Violet</button>
              </div>
            </form>
          </div>
        </div>
      </div>

      <div class="col-md-2"></div>
    </div>

    <!-- PUB -->
    <div class="row">
      <div class="col-md-2"></div></div>
      <div class="">

      </div>
      <div class="col-md-2"></div>
    </div>
  </body>

</html>
