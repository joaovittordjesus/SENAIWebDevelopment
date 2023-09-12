<html>
<title>Desenvolvimento de Sites com PHP</title>
<body>
    <?php
       $username = $_POST["username"];
       $password = $_POST["password"];
       $name = $_POST["name"];
       $email = $_POST["email"];
       $city = $_POST["city"];
       $state = $_POST["state"];
       $erro = 0;

       if(strlen($username) < 5){
           echo "The user name must contain at least 5 characters ";
       }
       if(strlen($password) < 8){
           echo "The password must contain at least 8 characters";
       }
       if($username == $password){
           echo "The username must be different from the password";
       }
       if (empty($name) OR strstr ($name, '')==FALSE){
           echo "Please inform your name correctly";
       }
       if(strlen($email) < 8 || strstr ($email, )){

       }

    ?>
</body>
</html>