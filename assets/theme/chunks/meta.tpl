<base href="{'site_url' | config}">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="format-detection" content="telephone=no">

<link rel="preload" href="assets/theme/css/style.min.css" as="style" fetchpriority="high">

{if $_modx->resource.template == 11 and $_modx->resource.intro_image}
    {set $intro_image = 'pThumb' | snippet : [
        'input' => $_modx->resource.intro_image,
        'options' => 'w=1920&h=1080&zc=1&q=90&f=jpg'
    ]}
    <link rel="preload" href="{$intro_image}" as="image" fetchpriority="high">
{/if}

<link rel="preload" href="assets/theme/img/icons/icons.svg" as="image" fetchpriority="high">

<title>{$_modx->resource.longtitle ?: $_modx->resource.pagetitle}{$.get.page ? (' - страница ' ~ $.get.page) : ''}</title>
<meta name="description" content="{$_modx->resource.description | escape}">
<meta name="keywords" content="{$_modx->getPlaceholder('seoPro.keywords')}">

<link rel="stylesheet" href="assets/theme/css/style.min.css">