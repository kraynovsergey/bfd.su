<div class="home-cases__item {$idx == 1 ? '_active' : ''}" {if 'animation_spoiler' | config == 1}data-case-hover{else}data-case{/if}>
    <div class="home-cases__overlay" data-aos="left-right" data-aos-delay="{$idx * 25}" data-aos-once="true"></div>

    <button class="home-cases__header btn-reset" type="button">
        <span class="home-cases__header-title home-cases__header-text letter-spacing">{$menutitle ?: $pagetitle}</span>
        <span class="home-cases__header-text home-cases__header-category letter-spacing">
            {set $type_project_array = $.php.explode('||', $type_project)}
            {foreach $type_project_array as $row}
                {if $row@index > 0}, {/if}{$row}
            {/foreach}
        </span>
        <span class="home-cases__header-text home-cases__header-year letter-spacing">({$year})</span>
    </button>

    <div class="home-cases__content-wrap" data-case-content>
        <div class="home-cases__content" data-case-content-height>
            <div class="home-cases__text">
                <p>{$intro_home}</p>
                
                <a class="home-cases__more" href="{$id | url}" data-magnetic>
                    <span>подробнее</span>
                    <svg width="16" height="15" data-magnetic-text>
                        <use xlink:href="assets/theme/img/icons/icons.svg#btn-circle-arrow"></use>
                    </svg>
                </a>
            </div>

            {set $image = 'pThumb' | snippet : [
                'input' => $image_home,
                'options' => 'w=592&h=592&zc=1&q=90&f=jpg'
            ]}

            {set $image_2x = 'pThumb' | snippet : [
                'input' => $image_home,
                'options' => 'w=1184&h=1184&zc=1&q=90&f=jpg'
            ]}

            {set $image_webp = 'pThumb' | snippet : [
                'input' => $image_home,
                'options' => 'w=592&h=592&zc=1&q=90&f=webp'
            ]}

            {set $image_webp_2x = 'pThumb' | snippet : [
                'input' => $image_home,
                'options' => 'w=1184&h=1184&zc=1&q=90&f=webp'
            ]}

            <picture class="home-cases__picture">
                <source type="image/webp" srcset="{$image_webp_2x} 2x, {$image_webp} 1x">
                <img srcset="{$image_2x} 2x, {$image} 1x" alt="{$pagetitle | escape}" width="592" height="592">
            </picture>
        </div>
    </div>
</div>