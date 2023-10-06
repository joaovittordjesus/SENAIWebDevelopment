<><!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Developing Websites with PHP</title>
</head>
<body>
<header>Signup - Step 3 of 3</header>
<form method="POST" action="signup.php">
    <input type="hidden" name="name" value="<?php echo $_POST["nome"]; ?>">
    <input type="hidden" name="email" value="<?php echo $_POST["email"]; ?>">
    <input type="hidden" name="birthdate" value="<?php echo $_POST["birthdate"]; ?>">
    <input type="hidden" name="gender" value="<?php echo $_POST["gender"]; ?>">
    <input type="hidden" name="job" value="<?php echo $_POST["job"]; ?>">
    <input type="hidden" name="phone" value="<?php echo $_POST["phone"]; ?>">
    <input type="hidden" name="address" value="<?php echo $_POST["address"]; ?>">
    <input type="hidden" name="city" value="<?php echo $_POST["city"]; ?>">
    <input type="hidden" name="state" value="<?php echo $_POST["state"]; ?>">
    <input type="hidden" name="postcode" value="<?php echo $_POST["postcode"]; ?>">
    <br>
    <label>Username</label>
    <input type="text" name="username" size="10"><br>

    <label>Password</label>
    <input type="password" name="password" size="10"><br>

    <label>Confirm Your Password</label>
    <input type="password" name="confimpassword" size="10"><br>

    <input type="submit" value="Finish Signup" name="finish" id="finish">


</form>
</body>
</html>