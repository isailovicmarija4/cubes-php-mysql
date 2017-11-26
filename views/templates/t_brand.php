<!-- ======== @Region: #highlighted ======== -->
<div id="highlighted">
    <div class="container">
        <div class="header">
            <h2 class="page-title">
                <span>Proizvodi brenda: <?php echo htmlspecialchars($brand['title']); ?></span> 
                <small><?php echo $totalRows; ?></small>
            </h2>
        </div>
    </div>
</div>

<!-- ======== @Region: #content ======== -->
<div id="content">
    <div class="container portfolio">
        <ul class="thumbnails row block projects" id="quicksand">
            <?php foreach ($products as $product) { ?>
                <li class="col-md-3">
                    <div class="">
                        <div class="project">
                            <a class="lnk-polaroid" href="/product.php?id=<?php echo $product['id'] ?>">
                                <img 
                                    class="img-polaroid img-responsive"
                                    src="/uploads/products/<?php echo htmlspecialchars($product['photo_file_name']); ?>" 
                                    alt="<?php echo htmlspecialchars($product['title']); ?>"
                                    >
                            </a>
                            <h3 class="title">
                                <a href="/product.php?id=<?php echo $product['id'] ?>">
                                    <?php echo htmlspecialchars($product['brand_title']); ?> - Product <?php echo htmlspecialchars($product['title']); ?>
                                </a>
                            </h3>
                            <div class="row">
                                <h4 class="col-xs-5">
                                    <small>
                                        <a href="/category.php?id=<?php echo $product['category_id'] ?>">
                                            <?php echo htmlspecialchars($product['category_title']); ?>
                                        </a>
                                    </small>
                                </h4>
                                <h4 class="col-xs-7 text-right">
                                    <?php echo htmlspecialchars($product['price']); ?>
                                </h4>
                            </div>
                        </div>
                    </div>
                </li>
            <?php } ?>
        </ul>
    </div>
    <div class="text-center">
        <ul class="pagination pagination-centered">
            <?php for ($i = 1; $i <= $totalPages; $i++) { ?>
                <?php
                $paginationQueryString = http_build_query(array(
                    'id' => $brand['id'],
                    'page' => $i));
                ?>
                <?php if ($page != $i) { ?>
                    <li><a href="/brand.php?<?php echo $paginationQueryString; ?>"><?php echo $i; ?></a></li>
                <?php } else { ?>
                    <li class="active"><span><?php echo $i; ?></span></li>
                        <?php } ?>

            <?php } ?>

        </ul>
    </div>
</div>
<!-- $page trenutno na toj strani si-->