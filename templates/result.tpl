<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">

  <!-- Import Google Material-Icons font-->
  <link type="text/css" rel="stylesheet" href="/static/css/material-icon-font.css"/>
  <!-- <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> -->

  <!--Import materialize.css-->
  <link type="text/css" rel="stylesheet" href="/static/css/materialize.min.css"  media="screen,projection"/>

  <!--Import font-awesome font-->
  <link type="text/css" rel="stylesheet" href="/static/css/font-awesome.min.css"/>

  <!--Let browser know website is optimized for mobile-->
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

  <!--Import jQuery before materialize.js-->
  <script type="text/javascript" src="/static/js/jquery-2.2.0.min.js"></script>
  <script type="text/javascript" src="/static/js/materialize.min.js"></script>

  <!--Import useful custom styles-->
  <link type="text/css" rel="stylesheet" href="/static/css/style.css"/>

  <!--Google pie chart-->
  <script type="text/javascript" src="/static/js/loader.js"></script>
  <script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {

      var data = google.visualization.arrayToDataTable([
        ['Task', 'Hours per Day'],
        ['Верных ответов',     {{.True}}],
        ['Неверных ответов',      {{.False}}]
      ]);

      var options = {
        title: 'Результаты тестирования'
      };

      var chart = new google.visualization.PieChart(document.getElementById('piechart'));

      chart.draw(data, options);
    }
  </script>

  <title>Amazing test system</title>
</head>
<body class="white">
<audio src="/static/mp3/audio.mp3" autoplay></audio>

<nav class="light-blue">
  <div class="nav-wrapper">
  <div class="container">
    <a href="#" class="brand-logo graceful-text" style="font-size: 45px;">ATS</a>
    <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
    <ul class="right hide-on-med-and-down">
      <li><a href="#"><i class="material-icons left">new_releases</i>Новые тесты</a></li>
      <li class="bold"><a href="#"><i class="material-icons left">contacts</i>Контакты</a></li>
      <li class="bold"><a href="#"><i class="material-icons left">info_outline</i>О нас</a></li>
      <li><a class="amber darken-2 waves-effect waves-light btn">Кнопка</a></li>
    </ul>
    <ul class="side-nav" id="mobile-demo">
      <li><a href="#"><i class="material-icons left">new_releases</i>Новые тесты</a></li>
      <li class="bold"><a href="#"><i class="material-icons left">contacts</i>Пользователи</a></li>
      <li class="bold"><a href="#"><i class="material-icons left">info_outline</i>О нас</a></li>
      <li class="bold"><a href="#">Не кнопка</a></li>
    </ul>
  </div>
  </div>
</nav>

<!--Ads banner-->
  <div class="slider">
    <ul class="slides">
      <li>
        <img src="static/images/starwars.jpg"> <!-- random image -->
        <div class="caption center-align">
          <h3 class="grey-text text-lighten-5">Star Destroyer</h3>
          <h5 class="light grey-text text-lighten-5">The most valuable imperial starship available now!</h5>
        </div>
      </li>
      <li>
        <img src="static/images/t50.jpg"> <!-- random image -->
        <div class="caption left-align">
          <h3 class="grey-text text-darken-2">T-50</h3>
          <h5 class="light grey-text text-lighten-3">Buy new 5th generation fighter now!</h5>
        </div>
      </li>
      <li>
        <img src="static/images/formulaone.jpg"> <!-- random image -->
        <div class="caption right-align">
          <h3 class="grey-text text-darken-4">Formula One tickets</h3>
          <h5 class="light grey-text text-lighten-3">Get tickets to Bakhrain stage!</h5>
        </div>
      </li>
    </ul>
  </div>


<div class="container">
<div class="row">
<div id="piechart" style="width: 900px; height: 500px;"></div>
</div>
</div>

  <footer class="page-footer light-blue">
      <div class="container">
        <div class="row">
          <div class="col l6 s12">
            <h5 class="white-text">Правила использования</h5>
            <p class="grey-text text-lighten-4">Если Вы используете систему тестирования ATS (Amazing Test System, то соглашаетесь с тем условием, что в случае некорректного использования ситемы тестирования или нарушения авторских прав, Вас покарают.</p>
          </div>
          <div class="col l4 offset-l2 s12">
            <h5 class="white-text">Socials</h5>
            <ul>
              <li><a class="grey-text text-lighten-3" href="#!"><i class="fa fa-facebook-official"></i> Наша страничка в Facebook</a></li>
              <li><a class="grey-text text-lighten-3" href="#!"><i class="fa fa-youtube-play"></i> Канал на YouTube</a></li>
              <li><a class="grey-text text-lighten-3" href="#!"><i class="fa fa-vk"></i> Группа ВКонтакте</a></li>
              <li><a class="grey-text text-lighten-3" href="#!"><i class="fa fa-google-plus"></i> Сообщество G+</a></li>
              <li><a class="grey-text text-lighten-3" href="#!"><i class="fa fa-twitter"></i> Twitter</a></li>
              <li><a class="grey-text text-lighten-3" href="#!"><i class="fa fa-instagram"></i> Наш Instagram</a></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="footer-copyright">
        <div class="container">
            &copy; FiftyFive Group
        <a class="grey-text text-lighten-4 right" href="#!"><i class="fa fa-github"></i> Другие проекты</a>
        </div>
      </div>
    </footer>

    <script>
    $(document).ready(function() {
      $(".button-collapse").sideNav();
      $('.slider').slider({indicators: false});
    });
    </script>
</body>
</html>