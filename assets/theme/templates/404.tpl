<!DOCTYPE html>
<html lang="{'cultureKey' | config}">
<head>
    {include 'file:chunks/meta.tpl'}
</head>
<body class="scroll _hidden">
    <div class="not-found">
        <div class="not-found__container">
            <picture class="not-found__picture">
                <source type="image/webp" srcset="assets/theme/img/not-found@2x.webp 2x, assets/theme/img/not-found.webp 1x">
                <img srcset="assets/theme/img/not-found@2x.png 2x, assets/theme/img/not-found.png 1x" alt="{$_modx->resource.pagetitle | escape}" width="721" height="574">
            </picture>

            <h1 class="not-found__title">{$_modx->resource.pagetitle}</h1>
            
            <a class="not-found__link" href="{'site_url' | config}" data-magnetic><span data-magnetic-text>На главную</span></a>
        </div>

        <svg class="not-found__logo" width="301" height="83">
            <use xlink:href="assets/theme/img/icons/icons.svg#logo"></use>
        </svg>
    </div>

    {include 'file:chunks/scripts.tpl'}
</body>

</html>