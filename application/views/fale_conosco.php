<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Fale conosco</h1>
            </div>
            <div class="col-lg-12">
                <?php echo form_open('faleconosco/valida'); ?>
                <input autocomplete="off" type="text" id="nome" name="nome" placeholder="Nome"/>
                <br/>
                <input autocomplete="off" type="text" id="email" name="email" placeholder="E-mail"/>
                <br/>
                <textarea autocomplete="off" type="text" id="descricao" name="descricao"
                          maxlength="200" placeholder="Descrição"></textarea>
                <br/>
                <img src="<?= base_url() . "gera2.php" ?>" alt="Caracteres"/>
                <br/> <br/>
                <input autocomplete="off" type="text" id="caracteres" name="caracteres" placeholder="Capctha"/>
                <br/>
                <input type="submit" class="btn btn-success" value="Enviar" name=""/>
                </br>
                <?php echo form_close(); ?>
                </br>
            </div>
        </div>
    </div>
</div>