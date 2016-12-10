<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Fornecedor_model extends CI_Model{
    public function __construct(){
        parent::__construct();
    }    


	
	public function inserir($cnpj,$nome,$fantasia,$ie,$iest,$cep,$rua,$bairro,$cidade,$estado,$numero,$telefone,$celular,$email){
		$dados['cnpj'] = $cnpj;
		$dados['nome'] = $nome;
		$dados['fantasia'] = $fantasia;
		$dados['ie'] = $ie;
		$dados['iest'] = $iest;
		$dados['cep'] = $cep;
		$dados['rua'] = $rua;
		$dados['bairro'] = $bairro;
		$dados['cidade'] = $cidade;
		$dados['estado'] = $estado;
		$dados['numero'] = $numero;
		$dados['telefone'] = $telefone;
		$dados['celular'] = $celular;
		$dados['email'] = $email;
		$this->db->query('INSERT INTO fornecedores ');
		return $this->db->update('clientes',$dados);
	}
	

	
}