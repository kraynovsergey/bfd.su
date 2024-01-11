<base href="{'site_url' | config}">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="format-detection" content="telephone=no">
<title>{$_modx->resource.longtitle ?: $_modx->resource.pagetitle}{$.get.page ? (' - страница ' ~ $.get.page) : ''}</title>
<meta name="description" content="{$_modx->resource.description | escape}">
<meta name="keywords" content="{$_modx->getPlaceholder('seoPro.keywords')}">
<link rel="stylesheet" href="assets/theme/css/style.min.css">