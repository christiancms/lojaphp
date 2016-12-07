<?php defined('BASEPATH') OR exit('No direct script access allowed');


class Faleconosco_model extends CI_Model
{
    public function __construct(){
        parent::__construct();
    }

    public function salvar($nome, $email, $descricao)
    {
        $dados['nome'] = $nome;
        $dados['email'] = $email;
        $dados['descricao'] = $descricao;
        return $this->db->insert('faleconosco',$dados);
    }
}