<?php

  require 'database.php';

  $message = '';

  if (!empty($_POST['email']) && !empty($_POST['password'])) {
    $sql = "INSERT INTO users (email, password) VALUES (:email, :password)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':email', $_POST['email']);
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT);
    $stmt->bindParam(':password', $password);

    if ($stmt->execute()) {
      $message = 'Successfully created new user';
    } else {
      $message = 'Sorry there must have been an issue creating your account';
    }
  }
?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>SignUp</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
  </head>
  <body class="flex-container" style="overflow-x: hidden;">
    <div>
      <?php require 'partials/header.php' ?>

      <?php if(!empty($message)): ?>
        <p> <?= $message ?></p>
      <?php endif; ?>
  <div style="text-align: center;">
        <h1>Registrarme</h1>
        
        <form action="signup.php" method="POST">
          <input name="email" type="text" placeholder="Introducir el email">
          <input name="password" type="password" placeholder="Introducir la contraseña">
          <input name="confirm_password" type="password" placeholder="Confirma la contraseña">
          <input type="submit" value="Registrarme">
        </form>
        <span>¿ya tienes cuenta? <a href="./login.php">Ingresar</a></span>
      </div>
    </div>
  </body>
</html>
