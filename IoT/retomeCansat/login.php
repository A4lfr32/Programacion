<?php

  session_start();

  if (isset($_SESSION['user_id'])) {
    header('Location: ./');
  }
  require 'database.php';

  if (!empty($_POST['email']) && !empty($_POST['password'])) {
    $records = $conn->prepare('SELECT id, email, password FROM users WHERE email = :email');
    $records->bindParam(':email', $_POST['email']);
    $records->execute();
    $results = $records->fetch(PDO::FETCH_ASSOC);

    $message = '';
    if (is_array($results) && password_verify($_POST['password'], $results['password'])) {
      $_SESSION['user_id'] = $results['id'];
      header("Location: ./");
    } else {
      $message = 'Sorry, those credentials do not match';
    }
  }

?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Login</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">
  </head>
  <body>
    <?php require 'partials/header.php' ?>

    <?php if(!empty($message)): ?>
      <p> <?= $message ?></p>
    <?php endif; ?>

    <h1>Ingresar</h1>
    
    <form action="./login.php" method="POST">
      <input name="email" type="text" placeholder="Engrese su correo">
      <input name="password" type="password" placeholder="Ingrese su contraseña">
      <input type="submit" value="Ingresar ya">
    </form>
  <span>¿No tienes cuenta? <a href="./signup.php">Crearme una cuenta</a></span>
  </body>
</html>
