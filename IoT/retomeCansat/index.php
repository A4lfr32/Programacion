<?php
// https://youtu.be/37IN_PW5U8E
  session_start();

  require 'database.php';

  if (isset($_SESSION['user_id'])) {
    $records = $conn->prepare('SELECT id, email, password FROM users WHERE id = :id');
    $records->bindParam(':id', $_SESSION['user_id']);
    $records->execute();
    $results = $records->fetch(PDO::FETCH_ASSOC);

    $user = null;

    if (count($results) > 0) {
      $user = $results;
    }
  }
?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Welcome to you WebApp</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <script src='https://cdn.plot.ly/plotly-latest.min.js'></script>
  </head>
  <body>
  <div class="container">

    <?php if(!empty($user)): ?>
      <header class="row">
        <a class="col-6" href="./">Cansat <?= $user['email']; ?></a>
        <a class="col-1" href="logout.php">buscador</a>
        <a class="col-1" href="logout.php">Notificaciones</a>
        <a class="col-1" href="logout.php">Mensajes</a>
        <a class="col-2" href="logout.php">Salir</a>
        <a class="col-1" href="logout.php">Foto</a>
      </header>
      <!-- <br> Welcome. <?= $user['email']; ?> -->
      <!-- <br>You are Successfully Logged In -->
      <!-- <a href="logout.php"> -->
        <!-- Logout -->
      <!-- </a> -->
      <h2>Gráficas</h2>
      <div class="row">
        <div class="col-3">
          <div class="mensaje card p-3 m-2 border-primary">Ganancias mensual</div>
        </div>
        <div class="col-3">
          <div class="mensaje card p-3 m-2 border-secondary">Ganancias anual</div>
        </div>
        <div class="col-3">
          <div class="mensaje card p-3 m-2 border-success">Task</div>
        </div>
        <div class="col-3">
          <div class="mensaje card p-3 m-2 border-danger">Peticiones pendientes</div>
        </div>
      </div>

      <div class="row">
        <div class="col-8">
          <div class="card m-1 mt-4 h-100">
            <div class="card-header">Default Card Example</div>
            <div class="card-body p-0"><div id='myDiv'><!-- Plotly chart will be drawn inside this DIV --></div></div>
          </div>
        </div>
        <div class="col-4">
          <div class="card m-1 mt-4 h-100">
            <div class="card-header">Basic Card Example</div>
            <div class="card-body p-0"><div id='myDiv2'><!-- Plotly chart will be drawn inside this DIV --></div></div>
          </div>
        </div>
      </div>
      <div class="row mt-5">
        <div class="col-8">prueba 3</div>
        <div class="col-4">prueba 4</div>
      </div>
    <?php else: ?>
      <header>
        <a href="./">Cansat 2</a>
      </header>
      <div style="text-align: center;">
        <h1>Please Login or SignUp</h1>

        <a href="login.php">Login</a> or
        <a href="signup.php">SignUp</a>
      </div>
    <?php endif; ?>

    <!-- container end -->
    </div> 

    <script>
      var trace1 = {
      x: [1, 2, 3, 4],
      y: [10, 15, 13, 17],
      type: 'scatter'
    };

    var trace2 = {
      x: [1, 2, 3, 4],
      y: [16, 5, 11, 9],
      type: 'scatter'
    };

    var data = [trace1, trace2];

    Plotly.newPlot('myDiv', data);
    </script>
    <script>
      var data = [{
  values: [16, 15, 12, 6, 5, 4, 42],
  labels: ['US', 'China', 'European Union', 'Russian Federation', 'Brazil', 'India', 'Rest of World' ],
  domain: {column: 0},
  name: 'GHG Emissions',
  hoverinfo: 'label+percent+name',
  hole: .5,
  type: 'pie'
}
// ,{
//   values: [27, 11, 25, 8, 1, 3, 25],
//   labels: ['US', 'China', 'European Union', 'Russian Federation', 'Brazil', 'India', 'Rest of World' ],
//   text: 'CO2',
//   textposition: 'inside',
//   domain: {column: 1},
//   name: 'CO2 Emissions',
//   hoverinfo: 'label+percent+name',
//   hole: .4,
//   type: 'pie'
// }
];

var layout = {
  title: 'Global Emissions 1990-2011',
  annotations: [
    {
      font: {
        size: 15
      },
      showarrow: false,
      text: 'GHG',
      x: 0.33,
      y: 0.5
    }
    // ,
    // {
    //   font: {
    //     size: 20
    //   },
    //   showarrow: false,
    //   text: 'CO2',
    //   x: 0.82,
    //   y: 0.5
    // }
  ],
    height: 300,
    width: 300,
    showlegend: false,
    grid: {rows: 1, columns: 1}
  };

  Plotly.newPlot('myDiv2', data, layout);

    </script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
 
  </body>
</html>
