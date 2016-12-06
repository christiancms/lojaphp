<style>
    .carousel-inner > .item > img,
    .carousel-inner > .item > a > img {
        width: 100%;
        margin: auto;
    }
</style>


<div id="homebody">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
            <li data-target="#myCarousel" data-slide-to="3"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="assets/img/imagem1.jpg" alt="Chania">
            </div>
            <div class="item">
                <img src="assets/img/imagem2.jpg" alt="Chania">
            </div>
            <div class="item">
                <img src="assets/img/imagem3.jpg" alt="Flower">
            </div>
            <div class="item">
                <img src="assets/img/imagem4.jpg" alt="Flower">
            </div>
        </div>
    </div>



    <div class="row-fluid">
        <?php
        $contador = 0;
        foreach ($destaques as $destaque) {
            $contador++;
            echo "<div class='span4 caixacategoria'>" .
            heading($destaque->titulo, 3);
            if (is_file("assets/img/produtos/" . md5($destaque->id) . ".jpg")) {
                echo img("assets/img/produtos/" . md5($destaque->id) . ".jpg");
            }
            echo "<p>" . word_limiter($destaque->descricao, 20) . "</p>" .
            anchor(base_url("produto/" . $destaque->id . "/" . limpar($destaque->titulo)), "Ver produto", array('class' => 'btn')) .
            "</div>";
            if ($contador % 3 == 0) {
                echo "</div><div class='row-fluid'>";
            }
        }
        ?>
    </div>  
</div>