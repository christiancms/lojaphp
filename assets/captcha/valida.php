<?php
session_start();
$nome = $_POST["nome"];
$caracteres = $_POST["caracteres"];

$codigo = $_SESSION["codigo"];

if ($codigo == $caracteres) {
    echo "Ok!";
} else {
    echo "Erro...";
}
