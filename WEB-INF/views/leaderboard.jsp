<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>QuizIT !</title>

    <!-- Personal styles - to modyfy with Tomcat links -->
    <link rel="stylesheet" href="styles/bootstrap-custom.css">
    <link rel="stylesheet" href="styles/master.css">
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
            <li><a href="index.jsp"><i class="fa fa-list"></i> Liste des quiz</a></li>
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#">Catégories de questions
              <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="index.jsp#MCQ">Questions à choix multiples</a></li>
                <li><a href="index.jsp#Blind">Blindtests</a></li>
              </ul>
            </li>
            <li><a href="#"><i class="fa fa-play-circle"></i> Partie aléatoire</a></li>
            <li class="active"><a href="leaderboard.jsp"><i class="fa fa-trophy"></i> Classement</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
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
              <tr>
                <td>1</td>
                <td>H0tmilk</td>
                <td>10 469</td>
              </tr>
              <tr>
                <td>2</td>
                <td>Kekettaro</td>
                <td>5 021</td>
              </tr>
              <tr>
                <td>3</td>
                <td>Yoshiiix</td>
                <td>2 924</td>
              </tr>
              <tr>
                <td>4</td>
                <td>Xeizo</td>
                <td>2</td>
              </tr>
            </tbody>
          </thead>
        </table>
      </div>

      <div class="col-md-3"></div>
    </div>
  </body>

</html>
