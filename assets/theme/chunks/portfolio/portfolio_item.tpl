<article class="cases__item" style="background: {$background};" data-aos="opacity">
    {set $img = 'pThumb' | snippet : [
        'input' => $image,
        'options' => 'w=347&h=195&zc=1&q=90&f=jpg'
    ]}

    {set $img_2x = 'pThumb' | snippet : [
        'input' => $image,
        'options' => 'w=694&h=390&zc=1&q=90&f=jpg'
    ]}

    {set $img_webp = 'pThumb' | snippet : [
        'input' => $image,
        'options' => 'w=347&h=195&zc=1&q=90&f=webp'
    ]}

    {set $img_webp_2x = 'pThumb' | snippet : [
        'input' => $image,
        'options' => 'w=694&h=390&zc=1&q=90&f=webp'
    ]}

    <picture class="cases__picture">
        <source type="image/webp" srcset="{$img_webp_2x} 2x, {$img_webp} 1x">
        <img src="{$img}" srcset="{$img_2x} 2x, {$img} 1x" alt="{$pagetitle | escape}" width="347" height="195">
    </picture>
    
    <div class="cases__content">
        <h3 class="cases__title">
            <a class="cases__link" href="{$id | url}">{$menutitle ?: $pagetitle}<sup class="letter-spacing">({$year})</sup></a>
        </h3>
        
        <div class="cases__params">
            <div class="cases__param">
                <div class="cases__param-title">Отрасль</div>
                <div class="cases__param-value">
                    {set $industry_array = $.php.explode('||', $industry)}
                    {foreach $industry_array as $row}
                        {if $row@index == 0}({/if}{if $row@index > 0}, {/if}{$row}{if ($row@index + 1) == $industry_array | length}){/if}
                    {/foreach}
                </div>
            </div>

            <div class="cases__param">
                <div class="cases__param-title">Тип проекта</div>
                <div class="cases__param-value">
                    {set $type_project_array = $.php.explode('||', $type_project)}
                    {foreach $type_project_array as $row}
                        {if $row@index == 0}({/if}{if $row@index > 0}, {/if}{$row}{if ($row@index + 1) == $type_project_array | length}){/if}
                    {/foreach}
                </div>
            </div>
        </div>
    </div>
    
    <svg class="cases__arrow" width="97" height="102">
        <use xlink:href="assets/theme/img/icons/icons.svg#arrow-right"></use>
    </svg>
</article>