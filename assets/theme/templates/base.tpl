<!DOCTYPE html>
<html lang="{'cultureKey' | config}">
<head>
    {include 'file:chunks/meta.tpl'}
</head>
<body class="scroll _hidden">
    <div class="preloader" data-preloader>
        <div class="preloader__progress"></div>
        <div class="container">
            <div class="preloader__percent" data-preloader-percent>0</div>
            <svg class="preloader__logo" width="301" height="83">
                <use xlink:href="assets/theme/img/icons/icons.svg#logo"></use>
            </svg>
        </div>
    </div>

    {include 'file:chunks/header.tpl'}

    {block 'main'}{/block}

    {include 'file:chunks/footer.tpl'}

    {include 'file:chunks/forms/order_modal.tpl'}

    {include 'file:chunks/scripts.tpl'}
</body>
</html>