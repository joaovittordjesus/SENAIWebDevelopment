<><!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Signup - Step 2 of 3</title>
</head>
<body>
    <div class="2">
        <form method="POST" action="3.php">
            <input type="hidden" name="name" id="name" value="<?php echo $_POST['name'];?>">
            <input type="hidden" name="email" id="email" value="<?php echo $_POST['email'];?>">
            <input type="hidden" name="birthdate" id="birthdate" value="<?php echo $_POST['birthdate'];?>">
            <input type="hidden" name="gender" id="gender" value="<?php echo $_POST['gender'];?>">
            <input type="hidden" name="job" id="job" value="<?php echo $_POST['job'];?>">

            <div class="labels">
                <label>Phone</label>
                <input type="text" name="phone" id="phone" size="20">
                <br>
                <label>Address</label>
                <input type="text" name="address" id="address" size="20">
                <br>
                <label>City</label>
                <input type="text" name="city" id="city" size="20">&nbsp;&nbsp;&nbsp;
                <br>
                <label>State</label>
                <input type="text" name="state" id="state" size="2">
                <br>
                <label>Postcode</label>
                <input type="text" name="postcode" id="postcode" size="9">
                <br>
                <br>
                <input type="submit" value="NEXT &gt;&gt;" name="next">
            </div>

        </form>
    </div>
</body>
</html>