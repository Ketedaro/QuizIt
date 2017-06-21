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
            <li class="active"><a href="index.jsp"><i class="fa fa-list"></i> Liste des quiz</a></li>
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#">Catégories de questions
              <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="index.jsp#MCQ">Questions à choix multiples</a></li>
                <li><a href="index.jsp#Blind">Blindtests</a></li>
              </ul>
            </li>
            <li><a href="#"><i class="fa fa-play-circle"></i> Partie aléatoire</a></li>

            <li><a href="leaderboard.jsp"><i class="fa fa-trophy"></i> Classement</a></li>
          </ul>

          <ul class="nav navbar-nav navbar-right">
            <!-- SI CONNECTE -->

            <!-- <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-user-circle" aria-hidden="true"></i> H0tmilk
              <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="change-password.jsp">Changer de mot de passe</a></li>
                <li><a href="disconnect">Se déconnecter</a></li>
              </ul>
            </li>
            <li><a href="new-question.jsp">
              <i class="fa fa-pencil" aria-hidden="true"></i> Proposer une question</a></li> -->

            <!-- SINON -->
            <li>
              <a href="connexion.jsp" target="_blank"><i class="fa fa-sign-in" aria-hidden="true"></i> Se connecter</a>
            </li>
            <li>
              <a href="create-account.jsp">
                <i class="fa fa-pencil-square-o" aria-hidden="true"></i> S'inscrire
              </a>
            </li>

            <li><a href="https://github.com/Ketedaro/QuizIt" target="_blank"><i class="fa fa-github"></i> Github</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- QUIZ LIST -->
    <div class="row">
      <div class="col-md-1"></div>

      <div class="quiz-list col-md-10 tweak-padding-50 row container" id="MCQ">
        <header>
          <h2>
            Questions à choix multiples <br>
            <small>Une question, quatre réponses possibles.</small>
          </h2>
        </header>
        <div class="row row-centered">
          <a class="quiz col-xs-3 col-centered" href="question-simple.jsp">
              <img src="../images/histoire.jpg" alt="Histoire" class="img-circle img-thumbnail img-responsive">
              <h3>Histoire</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
          </a>
          <a class="quiz col-xs-3 col-centered" href="quiz.jsp">
              <img src="../images/histoire.jpg" alt="Histodexire" class="img-circle img-thumbnail img-responsive">
              <h3>Histoire</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
          </a>
          <a class="quiz col-xs-3 col-centered" href="quiz.jsp">
              <img src="../images/histoire.jpg" alt="Histoire" class="img-circle img-thumbnail img-responsive">
              <h3>Histoire</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
          </a>
          <a class="quiz col-xs-3 col-centered" href="quiz.jsp">
              <img src="../images/histoire.jpg" alt="Histoire" class="img-circle img-thumbnail img-responsive">
              <h3>Histoire</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
          </a>
          <a class="quiz col-xs-3 col-centered" href="quiz.jsp">
              <img src="../images/histoire.jpg" alt="Histoire" class="img-circle img-thumbnail img-responsive">
              <h3>Histoire</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
          </a>
          <a class="quiz col-xs-3 col-centered" href="quiz.jsp">
              <img src="../images/histoire.jpg" alt="Histoire" class="img-circle img-thumbnail img-responsive">
              <h3>Histoire</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
          </a>
          <a class="quiz col-xs-3 col-centered" href="quiz.jsp">
              <img src="../images/histoire.jpg" alt="Histoire" class="img-circle img-thumbnail img-responsive">
              <h3>Histoire</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
          </a>
        </div>
      </div>

      <div class="col-md-1"></div>
    </div>

    <div class="row">
      <div class="col-md-1"></div>

      <div class="quiz-list col-md-10 tweak-padding-50 row container" id="Blind">
        <header>
          <h2>
            Blindtests <br>
            <small>Testez votre culture musicale.</small>
          </h2>
        </header>
        <div class="row row-centered">
          <a class="quiz col-xs-3 col-centered" href="quiz.jsp">
              <img src="../images/musique.jpeg" alt="Histoire" class="img-circle img-thumbnail img-responsive">
              <h3>Années 70s</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
          </a>
          <a class="quiz col-xs-3 col-centered" href="quiz.jsp">
              <img src="../images/musique.jpeg" alt="Histoire" class="img-circle img-thumbnail img-responsive">
              <h3>Variété française</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
          </a>
          <a class="quiz col-xs-3 col-centered" href="quiz.jsp">
              <img src="../images/musique.jpeg" alt="Histoire" class="img-circle img-thumbnail img-responsive">
              <h3>Pop / électro</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
          </a>
        </div>
      </div>

      <div class="col-md-1"></div>
    </div>
  </body>

</html>
