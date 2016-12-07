<div id="page-wrapper" xmlns="http://www.w3.org/1999/html">
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
                <input autocomplete="off" type="text" id="caracteres" name="caracteres" placeholder="Capctha"/>
                <br/>
                <input type="submit" class="btn btn-success" value="Enviar" name=""/>
                <? echo form_close(); ?>
                </br>
                <img src="gera2.php" alt="Caracteres" />
            </div>
        </div>
    </div>
</div>