<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "mydb";

// Criar conexão
$conexao = new mysqli($servername, $username, $password, $dbname);

// Verificar a conexão
if ($conexao->connect_error) {
    die("Conexão falhou: " . $conexao->connect_error);
}
?>
