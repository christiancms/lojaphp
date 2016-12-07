<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Faleconsoco extends CI_Controller
{


    public function index()
    {
        $this->load->view('fale_conosco');
    }

    public function valida()
    {
        session_start();
        $nome = $_POST["nome"];
        $email = $_POST["email"];
        $descricao = $_POST["descricao"];
        $caracteres = $_POST["caracteres"];

        $codigo = $_SESSION["codigo"];

        if ($codigo == $caracteres) {
            echo "Ok!";
        } else {
            echo "Erro...";
        }
    }
}







