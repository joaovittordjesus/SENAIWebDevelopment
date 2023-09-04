<><!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        .formulario{
            border: solid red 1px;
            width: 600px;
            margin: 0;
            padding: 0;
        }
        input{

        }
    </style>
</head>
<body>
    <div class="formulario">
        <form method="POST" action="recebe_dados.php">&nbsp;&nbsp;
            <label>Username</label>
            <input type="text" name="username" id="username" placeholder="username">
            <br>
            <label>Password</label>
            <input type="password" name="password" id="password" placeholder="Password Here">
            <br>
            <label>Name</label>
            <input type="text" name="name" id="name" placeholder="Your Name Here">
            <br>
            <label>E-mail</label>
            <input type="email" name="email" id="email" placeholder="example@email.com">
            <br>
            <label>City</label>
            <input type="text" name="city" id="city" placeholder="City Name Here">
            <br>
            <label>Submit Form</label>
            <input type="submit" value="SUBMIT" name="submit" id="submit">
            <br>
        </form>
    </div>
</body>
</html>