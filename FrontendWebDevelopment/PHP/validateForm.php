<?php
if($_REQUEST["action"] == "save")
{
    $validForm = true;
    $name_size = strlen($_POST["name"]);

    if($name_size < 5 || $name_size > 64)
    {
        echo("The field 'NAME' must have between 5 and 64 characters.".$name_size);
        $validForm = false;
    }
    $age = (int)$_POST["age"];
    if(is_nan($age) || $age < 4 || $age > 120)
    {
        echo("The field 'AGE' must be filled correctly!");
        $validForm = false;
    }
    $email = $_POST["email"];
    $regex = "/^[^0-9][A-z0-9_]+([.][A-z0-9_]+)*[@][A-z0-9_]+([.][A-z0-9_]+)*[.][A-z]{2,4}$/";
    if(!preg_match($regex, $email))
    {
        echo("The field email must be filled correctly");
        $validForm = false;
    }
    $gender = $_POST["gender"];
    if($gender != "M" && $gender != "F")
    {
        echo("The field 'gender' must be filled");
        $validForm = false;
    }
    $course = $_POST["course"];
    if ($course == "" || $course == "Select ...");
    {
        echo("The filed 'course' must be filled");
        $validForm = false;
    }
    if ($validForm)
    {
        echo("Form Successfully Validated");
        exit();
    }
}
?>
<><!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Forms Example</title>
    <script language="JavaScript">
        function validateForm()
        {
            var name_size = document.forms["validateForm.php"].name.value.lenght;
            if(name_size < 5 || name_size > 64)
            {
                alert("The field name must have between 5 and 64 characters.");
                return false;
            }

            var age = document.forms["validateForm.php"].age.value;
            if(isNaN(age) || age < 4 || age > 120)
            {
                alert("The field age must be filled correctly.");
                return false;
            }
            var email = document.forms["validateForm.php"].email.value;
            if(email.length < 5 || email.length > 128 || email.indexOf('@') === -1 || email.indexOf('.') === -1){
                alert("The email field must be fileed correctly!");
                return false;
            }

        }
    </script>
</head>
<body>

</body>
</html>
