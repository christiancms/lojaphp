<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Relatorios extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->library('Pdf');
        //$this->pdf->fontpath = 'font';
    }

    public function index() {
        //carrega a model de produtos
        $this->load->model('Produtos_model', 'modelprodutos');

        //obtém os registros a serem exibidos no relatório
        $dados = $this->modelprodutos->selectRelat();

        //define o título do relatório
        $this->pdf->setTitulo(utf8_decode('Relatório de Produtos'));

        //define o título e largura das colunas
        $this->pdf->setColunas(array(utf8_decode('Código') => 15,
            utf8_decode('Descrição') => 50,
            'Marca' => 20,
//            'Valor Compra' => 30,
//            'Valor Venda' => 30,
//            'Quant.' => 15,
//            'Foto' => 40
        ));

        //uso do total de páginas
        $this->pdf->AliasNbPages();
        //adiciona uma página
        $this->pdf->AddPage();

        foreach ($dados as $linha) {
            $this->pdf->Cell(15, 8, $linha->id . "  ", 0, 0, "R");
            $this->pdf->Cell(50, 8, utf8_decode($linha->descricao));
//            $this->pdf->Cell(20, 8, utf8_decode($linha->marca));
//            $this->pdf->Cell(30, 8, utf8_decode(number_format($linha->valorCompra, 2, ',', ',')));
//            $this->pdf->Cell(30, 8, utf8_decode(number_format($linha->valorVenda, 2, ',', ',')));
//            $this->pdf->Cell(15, 8, utf8_decode($linha->quantidade));
//            $this->pdf->Cell(40, 30, $this->pdf->Image(base_url('fotos/' . $linha->foto), $this->pdf->GetX(), $this->pdf->GetY(), 28.78), 0, 1, 'L');
        }

        $this->pdf->Output();
    }
    
//
//    public function produtos() {
//        //carrega a model de produtos
//        $this->load->model('Produtos_model', 'modelprodutos');
//
//        //obtém os registros a serem exibidos no relatório
//        $dados = $this->produtosM->selectRelat();
//
//        //define o título do relatório
//        $this->pdf->setTitulo(utf8_decode('Relatório de Produtos'));
//
//        //define o título e largura das colunas
//        $this->pdf->setColunas(array(utf8_decode('Código') => 15,
//            utf8_decode('Descrição') => 50,
//            'Marca' => 20,
//            'Valor Compra' => 30,
//            'Valor Venda' => 30,
//            'Quant.' => 15,
//            'Foto' => 40
//        ));
//
//        //uso do total de páginas
//        $this->pdf->AliasNbPages();
//        //adiciona uma página
//        $this->pdf->AddPage();
//
////        foreach ($dados as $linha) {
////            $this->pdf->Cell(15, 8, $linha->id . "  ", 0, 0, "R");
////            $this->pdf->Cell(50, 8, utf8_decode($linha->descricao));
////            $this->pdf->Cell(20, 8, utf8_decode($linha->marca));
////            $this->pdf->Cell(30, 8, utf8_decode(number_format($linha->valorCompra, 2, ',', ',')));
////            $this->pdf->Cell(30, 8, utf8_decode(number_format($linha->valorVenda, 2, ',', ',')));
////            $this->pdf->Cell(15, 8, utf8_decode($linha->quantidade));
////            $this->pdf->Cell(40, 30, $this->pdf->Image(base_url('fotos/' . $linha->foto), $this->pdf->GetX(), $this->pdf->GetY(), 28.78), 0, 1, 'L');
////        }
//
//        $this->pdf->Output();
//    }
//
//    public function usuarios() {
//        //carrega a model de produtos
//        $this->load->model('Usuarios_model', 'usuariosM');
//
//        //obtém os registros a serem exibidos no relatório
//        $dados = $this->usuariosM->selectRelat();
//
//        //define o título do relatório
//        $this->pdf->setTitulo(utf8_decode('Relatório de Usuários'));
//
//        //define o título e largura das colunas
//        $this->pdf->setColunas(array(utf8_decode('Código') => 15,
//            'Nome' => 40,
//            'E-mail' => 40,
//            'Data Nasc.' => 25,
//            'CPF' => 29,
//            'Telefone.' => 29,
//            utf8_decode('Nível') => 5
//        ));
//
//        //uso do total de páginas
//        $this->pdf->AliasNbPages();
//        //adiciona uma página
//        $this->pdf->AddPage();
//
//        foreach ($dados as $linha) {
//            $this->pdf->Cell(15, 8, $linha->id . "  ", 0, 0, "R");
//            $this->pdf->Cell(40, 8, utf8_decode($linha->nome));
//            $this->pdf->Cell(40, 8, utf8_decode($linha->email));
//            $this->pdf->Cell(25, 8, utf8_decode(date_format(date_create($linha->dataNascimento), 'd/m/Y')));
//            $this->pdf->Cell(29, 8, utf8_decode($linha->cpf));
//            $this->pdf->Cell(29, 8, utf8_decode($linha->telefone));
//
//            if ($linha->nivel == 2) {
//                $this->pdf->Cell(5, 8, utf8_decode('Admin'), 0, 1, "L");
//            } else {
//                $this->pdf->Cell(5, 8, utf8_decode('Cliente'), 0, 1, "L");
//            }
//        }
//
//        $this->pdf->Output();
//    }

}
