<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Fale conosco</h1>
            </div>
            <div class="col-lg-12">
                <h3>Contato</h3>
                <?php
                $nome = array('name' => 'txt_nome', 'id' => 'txt_nome', 'Placeholder' => 'Nome', 'value' => set_value('txt_nome'));
                $descricao = array('name' => 'txt_descricao', 'id' => 'txt_descricao', 'Placeholder' => 'Descrição', 'value' => set_value('txt_descricao'));
                $email = array('name' => 'txt_email', 'id' => 'txt_email', 'Placeholder' => 'E-mail', 'value' => set_value('txt_email'));
                $caracteres = array('name'=>'caracteres','id'=>'caracteres', 'value'=> set_value('caracteres'));
                $foto = base_url().'assets/captcha/gera2.php';
                echo form_open('valida.php') . br() .
                    form_input($nome) . br() .
                    form_input($email) . br() .
                    form_textarea($descricao) . br() .
                    form_label('Caracteres:','txt_caracteres').br().
                    img($foto).br().
                    form_input($caracteres).br().
                    form_submit("btn_gravar", "Enviar") .
                    form_close();
                ?>
            </div>
        </div>
    </div>
</div>