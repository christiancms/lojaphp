<?php

// $num: indica o número de caracteres a serem gerados
function geraCodigo($num) {
    // $possiveis: caracteres a serem exibidos na imagem
    // não utilizar caracteres parecidos: 1 e l, 0 e O
    $possiveis = "23456789abcdefghijmnpqrstuvwxyz";
    $codigo = "";
    $i = 0;
    
    while ($i < $num) {
        // mt_rand: retorna um número aleatório
        $rand = mt_rand(0, strlen($possiveis)-1);
        // acessa o caracter na posição gerada
        $novo = $possiveis[$rand];
        $codigo = $codigo . $novo;
        $i++;                
    }
    return $codigo;    
}
session_start();
header("Content-type: image/jpeg");

$figura = imagecreatefromjpeg("assets/captcha/fundo.jpg");

// declara as cores a serem utilizadas
//$cor_fundo = imagecolorallocate($figura, 0, 0, 255);
$cor_texto = imagecolorallocate($figura, 255, 255, 255);
//$cor_linha = imagecolorallocate($figura, 233, 239, 239);

// cria um retângulo na figura
//imagefilledrectangle($figura, 0, 0, 99, 29, $cor_fundo);

// desenha linhas na imagem
//imageline($figura, 0, 0, 35, 29, $cor_linha);
//imageline($figura, 0, 0, 64, 29, $cor_linha);

// obtém os caracteres a serem inseridos na figura
$string = geraCodigo(5);

// insere os caracteres na figura
imagestring($figura, 7, 20, 6, $string, $cor_texto);

$_SESSION["codigo"] = $string;

imagejpeg($figura);
imagedestroy($figura);