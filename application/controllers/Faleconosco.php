<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Faleconosco extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Categorias_model', 'modelcategorias');
        $this->load->model('Faleconosco_model','modelfaleconosco');
        $this->categorias = $this->modelcategorias->listar_categorias();
    }

    public function index()
    {
        $data_header['categorias'] = $this->categorias;
        $this->load->view('html-header');
        $this->load->view('header',$data_header);
        $this->load->view('fale_conosco');
        $this->load->view('footer');
        $this->load->view('html-footer');
    }

    public function valida()
    {
//        session_start();
        $nome = $_POST["nome"];
        $email = $_POST["email"];
        $descricao = $_POST["descricao"];
        $caracteres = $_POST["caracteres"];

        $codigo = $_SESSION["codigo"];

        if ($codigo == $caracteres) {
            if($this->modelfaleconosco->adicionar($nome,$email,$descricao)){
                redirect(base_url('home'));
            }
        } else {
            echo "Erro...";
        }
    }
}







