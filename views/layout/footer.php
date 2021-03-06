<?php
require_once __DIR__ . '/../../models/m_brands.php';
$randomBrands = brandsRandomFetchAll();
?>
<div id="content-below" class="wrapper">
    <div class="container">
        <div class="clients block">
            <h3 class="block-title">
                <span>Brendovi</span>
            </h3>
            <!--Recommended image sizing: 170px & 70px-->
            <ul class="thumbnails list-unstyled row">
<?php foreach ($randomBrands as $randomBrand) { ?>
                    <li class="col-sm-2">
                        <a href="/brand.php?id=<?php echo htmlspecialchars($randomBrand['id']); ?>" class="well well-lg text-uppercase text-justify">
    <?php echo htmlspecialchars($randomBrand['title']); ?>
                        </a>
                    </li>
<?php } ?>

            </ul>
        </div>
    </div>
</div>
<!-- FOOTER -->

<!-- ======== @Region: #footer ======== -->
<footer id="footer">
    <div class="container">
        <div class="row">
            <!--@todo: replace with company copyright details-->
            <div class="subfooter">
                <div class="col-md-5">
                    <p><a href="http://school.cubes.rs/">Cubes School</a> | Copyright 2017 &copy;</p>
                </div>
                <div class="col-md-7 col social-media">
                    <!--@todo: replace with company social media details-->
                    <a href="#"><i class="fa fa-twitter"></i> Twitter</a>
                    <a href="#"><i class="fa fa-facebook"></i> Facebook</a>
                    <a href="#"><i class="fa fa-linkedin"></i> LinkedIn</a>
                    <a href="#"><i class="fa fa-google-plus"></i> Google +</a>
                </div>
            </div>
        </div>
        <div class="row">
            <!--@todo: replace with company copyright details-->
            <div class="subfooter">

            </div>
        </div>
    </div>
</footer>
<!--Scripts -->
<script src="/skins/tema/js/jquery.js"></script>
<!-- Bootstrap Javascript -->
<script src="/skins/tema/plugins/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="/skins/tema/plugins/flexslider/jquery.flexslider-min.js"></script>
<!--Custom scripts mainly used to trigger libraries -->
<script src="/skins/tema/js/script.js"></script>
</body>

</html>
