<!-- ======== @Region: #highlighted ======== -->
<div id="highlighted">
    <!-- Flexslider - May use standard Bootstrap markup within slides - For best results use images all the same size (in this example they are 600px x 400px) -->
    <!--Flexslider Showshow-->
    <section class="flexslider-wrapper container">
        <div class="flexslider" data-slidernav="auto" data-transition="slide">
            <!--The Slides-->
            <div class="slides">
                <!--Slide #1 with caption-->
                <div class="slide">
                    <div class="row">
                        <div class="col-sm-6">
                            <img src="/skins/tema/img/slides/slide1.png" alt="Full responsive slide image" class="animated fadeInDownBig" />
                        </div>
                        <div class="col-sm-6 caption animated fadeInUpBig">
                            <h2>
                                Najnoviji iPhone, iPad, MacBook 
                            </h2>
                            <h4>
                                Sve od brenda <a href="#">Apple</a>
                            </h4>
                            <p>Odlican odnos cene i kvaliteta!</p>
                            <a href="#" class="btn btn-lg btn-primary">Naruci</a>

                        </div>
                    </div>
                </div>
                <!--Slide #2 with caption-->
                <div class="slide">
                    <div class="row">
                        <div class="col-sm-6">
                            <img src="/skins/tema/img/slides/slide2.png" alt="Easy to customise" />
                        </div>
                        <div class="col-sm-6 caption">
                            <h2>
                                Najbolji Samsung televizor
                            </h2>
                            <h4>
                                <i class="glyphicon glyphicon-ok"></i> Pobednik sajma tehnike
                                <br />
                                <i class="glyphicon glyphicon-ok"></i> Garancija 2 god.
                                <br />
                                <i class="glyphicon glyphicon-ok"></i> Ekstra kvalitet 
                            </h4>
                            <a href="#" class="btn btn-lg btn-primary">Detaljnije</a>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>


<div id="content">
    <div class="container">
        <!-- Mission statement -->
        <div class="mission">
            <div class="inner">
                <h3>
                    Posetite nas u <span>našim prodavnicama</span> na Terazijama ili u SC Delta City.
                    <small><a href="#">Saznajte vise</a></small>
                </h3>
            </div>
        </div>
        <!-- Services -->

        <!-- portfolio -->
        <!-- Recommended screenshot size: 400px x 300px -->
        <div class="block portfolio margin-top-large">
            <h2 class="block-title">
                <span>Proizvodi na akciji</span> 
                <small><a href="/sale.php">Vidi sve</a></small>
            </h2>
            <ul class="thumbnails row projects">
                <?php foreach ($newProductsOnSale as $newProductOnSale) { ?>
                    <li class="col-md-3">
                        <div class="">
                            <div class="project">
                                <a class="lnk-polaroid" href="/product.php?id=<?php echo $newProductOnSale['id'] ?>">
                                    <img 
                                        class="img-polaroid img-responsive"
                                        src="/uploads/products/<?php echo htmlspecialchars($newProductOnSale['photo_file_name']); ?>" 
                                        alt="<?php echo htmlspecialchars($newProductOnSale['title']); ?>"
                                        >
                                </a>
                                <h3 class="title">
                                    <a href="/product.php?id=<?php echo $newProductOnSale['id'] ?>">
                                        <?php echo htmlspecialchars($newProductOnSale['brand_title']); ?> - Product <?php echo htmlspecialchars($newProductOnSale['title']); ?>
                                    </a>
                                </h3>
                                <div class="row">
                                    <h4 class="col-xs-5">
                                        <small>
                                            <a href="/category.php?id=<?php echo $newProductOnSale['category_id'] ?>">
                                                <?php echo htmlspecialchars($newProductOnSale['category_title']); ?>
                                            </a>
                                        </small>
                                    </h4>
                                    <h4 class="col-xs-7 text-right">
                                        <?php echo htmlspecialchars($newProductOnSale['price']); ?>
                                    </h4>
                                </div>
                            </div>
                        </div>
                    </li>
                <?php } ?>
            </ul>
        </div>
    </div>
</div>

