<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Fornecedor extends CI_Controller
{


    public function __construct()
    {
        parent::__construct();

    }

    public function index()
    {
        $this->load->view('administracao/fornecedor');
    }

    public function import()
    {
        $filename = $_FILES['xmlFile']['name'];
        copy($_FILES['xmlFile']['tmp_name'], './assets/' . $filename);
        $xmlfile = "./assets/" . $filename;
        $xmlRaw = file_get_contents($xmlfile);
        $this->load->library('simplexml');
        $xmlData = $this->simplexml->xml_parse($xmlRaw);
        foreach ($xmlData['fornecedor'] as $row) {
            $this->fornecedor->inserir($row['cnpj'], $row['nome'], $row['fantasia'], $row['ie'], $row['iest'], $row['cep'],
                $row['rua'], $row['bairro'], $row['cidade'], $row['estado'], $row['numero'], $row['telefone'],
                $row['celular'], $row['email']);
        }
        $this->load->view('administracao/sucesso');
    }
}