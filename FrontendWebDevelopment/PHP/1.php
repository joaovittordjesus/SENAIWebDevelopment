<><!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Signup - Step 1 of 3</title>
</head>
<body>
    <div class="1">
        <form method="POST" action="2.php">
            <label>Name</label>
            <input type="text" name="name" id="name" size="20">
            <br>
            <label>E-mail</label>
            <input type="email" name="email" id="email" size="20">
            <br>
            <label>Birth Date</label>
            <input type="date" name="date" id="date" size="20">
            <br>
            <label>Gender</label>
            <input type="radio" value="male" checked name="gender" id="male">Male&nbsp;&nbsp;
            <input type="radio" value="female" name="gender" id="female">Female&nbsp;&nbsp;
            <br>
            <label>Job</label>
            <input type="text" name="job" id="job" size="20">
            <br>
            <br>
            <input type="submit" value="Next &gt;&gt;" name="next" id="next">

        </form>
    </div>
</body>
</html>