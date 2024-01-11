{extends 'file:templates/base.tpl'}

{block 'main'}
    <main class="main">
        <section class="section _small _pt0">       
            <div class="container">
                <h1 class="about__h1 animation-lines letter-spacing"><span data-aos="lines">{$_modx->resource.pagetitle}</span></h1>
                <div class="about__subtitle animation-lines"> 
                    <p data-aos="lines" data-aos-delay="200">{$_modx->resource.intro_subtitle}</p>
                </div>
            </div>
        </section>

        <div class="section _small">
            <div class="container">
                <div class="video-page__item">
                    <div class="video-page__virtual"></div>

                    <div class="video-page__content">
                        {if $_modx->resource.intro_video or $_modx->resource.intro_youtube}
                            <a class="video-page__video" href="{if $_modx->resource.intro_video}{$_modx->resource.intro_video}{else}{$_modx->resource.intro_youtube}{/if}" data-fancybox>
                                {set $intro_image = 'pThumb' | snippet : [
                                    'input' => $_modx->resource.intro_image,
                                    'options' => 'w=1206&h=678&zc=1&q=90&f=jpg'
                                ]}

                                {set $intro_image_2x = 'pThumb' | snippet : [
                                    'input' => $_modx->resource.intro_image,
                                    'options' => 'w=2412&h=1356&zc=1&q=90&f=jpg'
                                ]}

                                {set $intro_image_webp = 'pThumb' | snippet : [
                                    'input' => $_modx->resource.intro_image,
                                    'options' => 'w=1206&h=678&zc=1&q=90&f=jpg'
                                ]}

                                {set $intro_image_webp_2x = 'pThumb' | snippet : [
                                    'input' => $_modx->resource.intro_image,
                                    'options' => 'w=2412&h=1356&zc=1&q=90&f=jpg'
                                ]}
                                
                                <picture>
                                    <source type="image/webp" srcset="{$intro_image_webp_2x} 2x, {$intro_image_webp} 1x">
                                    <img src="{$intro_image}" srcset="{$intro_image_2x} 2x, {$intro_image} 1x" width="1206" height="678" alt="{$_modx->resource.pagetitle | escape}" data-aos="zoom-out">
                                </picture>

                                <svg class="video-page__video-play" width="98" height="118" data-aos="opacity">
                                    <use xlink:href="assets/theme/img/icons/icons.svg#play"></use>
                                </svg>
                            </a>
                        {/if}

                        <div class="video-page__texts">
                            {if $_modx->resource.intro_text}
                                <div class="video-page__text animation-lines">
                                    <p data-aos="lines">{$_modx->resource.intro_text}</p>
                                </div>
                            {/if}

                            {if $_modx->resource.intro_text2}
                                <div class="video-page__text animation-lines">
                                    <p data-aos="lines">{$_modx->resource.intro_text2}</p>
                                </div>
                            {/if}
                        </div>
                    </div>
                </div>
            </div>
        </div>

        {set $big_clients = json_decode($_modx->resource.big_clients, true)}
        {if $big_clients | length > 0}
            <div class="section _small">
                <div class="container">
                    <div class="video-page__item">
                        {if $_modx->resource.big_clients_title}
                            <div class="video-page__title section__title animation-lines">
                                <span data-aos="lines">{$_modx->resource.big_clients_title}</span>
                            </div>
                        {/if}

                        <div class="video-page__content">
                            <div class="swiper video-page__swiper" data-swiper-clients>
                                <div class="swiper-wrapper video-page__clients">
                                    {foreach $big_clients as $row}
                                        {set $image = 'assets/images/' ~ $row.image}
                                        <div class="swiper-slide">
                                            <div class="video-page__client" data-aos="zoom-in" data-aos-delay="{$row@index * 100}">
                                                <img src="{$image}" alt="{$_modx->resource.big_clients_title | escape}">
                                            </div>
                                        </div>
                                    {/foreach}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        {/if}

        {set $numbers = json_decode($_modx->resource.numbers, true)}
        {if $numbers | length > 0}
            <div class="section _small">
                <div class="container">
                    <div class="video-page__item">
                        {if $_modx->resource.numbers_title}
                            <div class="video-page__title section__title animation-lines">
                                <span data-aos="lines">{$_modx->resource.numbers_title}</span>
                            </div>
                        {/if}

                        <div class="video-page__content">
                            <div class="swiper video-page__swiper" data-swiper-numbers>
                                <div class="swiper-wrapper video-page__clients">
                                    {foreach $numbers as $row}
                                        <div class="swiper-slide">
                                            <div class="video-page__number" data-aos="zoom-in" data-aos-delay="{$row@index * 100}">
                                                <div class="video-page__number-title">{$row.title}</div>
                                                <div class="video-page__number-text">{$row.text}</div>
                                            </div>
                                        </div>
                                    {/foreach}
                                </div>
                            </div>

                            <div class="video-page__texts">
                                {if $_modx->resource.numbers_text1}
                                    <div class="video-page__text animation-lines">
                                        <p data-aos="lines">{$_modx->resource.numbers_text1}</p>
                                    </div>
                                {/if}

                                {if $_modx->resource.numbers_text2}
                                    <div class="video-page__text animation-lines">
                                        <p data-aos="lines">{$_modx->resource.numbers_text2}</p>
                                    </div>
                                {/if}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        {/if}

        <div class="section _small">
            <div class="container">
                <div class="video-page__item">
                    {if $_modx->resource.effect_title}
                        <div class="video-page__title section__title animation-lines">
                            <span data-aos="lines">{$_modx->resource.effect_title}</span>
                        </div>
                    {/if}

                    {if $_modx->resource.effect_text}
                        <div class="video-page__content">
                            <div class="video-page__texts">
                                <div class="video-page__text animation-lines">
                                    <p data-aos="lines">{$_modx->resource.effect_text}</p>
                                </div>
                            </div>
                        </div>
                    {/if}
                </div>

                {set $effect = json_decode($_modx->resource.effect, true)}
                {if $effect | lenth > 0}
                    <div class="principles video-page__principles">
                        {foreach $effect as $row}
                            <article class="principle">
                                <div class="principle__overlay" data-aos="left-right"></div>
                                <div class="principle__num">({if $row@index < 9}0{/if}{$row@index + 1})</div>
                                <h3 class="principle__title">{$row.title}</h3>
                                <p class="principle__text">{$row.text}</p>
                            </article>
                        {/foreach}
                    </div>
                {/if}
            </div>
        </div>

        {set $types_video = json_decode($_modx->resource.types_video, true)}
        {if $types_video | length > 0}
            <div class="section _small">
                <div class="container">
                    <div class="video-page__item">
                        {if $_modx->resource.types_video_title}
                            <div class="video-page__title section__title animation-lines">
                                <span data-aos="lines">{$_modx->resource.types_video_title}</span>
                            </div>
                        {/if}

                        <div class="video-page__content">
                            <div class="video-page__accordions">
                                {foreach $types_video as $row}
                                    {set $video = 'assets/files/' ~ $row.video}

                                    {set $types_video_image = 'pThumb' | snippet : [
                                        'input' => 'assets/images/' ~ $row.image,
                                        'options' => 'w=1206&h=678&zc=1&q=90&f=jpg'
                                    ]}

                                    {set $types_video_image_2x = 'pThumb' | snippet : [
                                        'input' => 'assets/images/' ~ $row.image,
                                        'options' => 'w=2412&h=1356&zc=1&q=90&f=jpg'
                                    ]}

                                    {set $types_video_image_webp = 'pThumb' | snippet : [
                                        'input' => 'assets/images/' ~ $row.image,
                                        'options' => 'w=1206&h=678&zc=1&q=90&f=webp'
                                    ]}

                                    {set $types_video_image_webp_2x = 'pThumb' | snippet : [
                                        'input' => 'assets/images/' ~ $row.image,
                                        'options' => 'w=2412&h=1356&zc=1&q=90&f=webp'
                                    ]}

                                    <div class="video-page__accordion" {if 'animation_spoiler' | config == 1}data-case-hover{else}data-case{/if}>
                                        <div class="video-page__accordion-overlay" data-aos="left-right" data-aos-once="true"></div>

                                        <button class="video-page__accordion-title btn-reset letter-spacing" type="button">{$row.title}<span></span></button>

                                        <div class="video-page__accordion-content-wrap" data-case-content>
                                            <div class="video-page__accordion-content" data-case-content-height>
                                                <a class="video-page__video" href="{if $row.video}{$video}{else}{$row.youtube}{/if}" data-fancybox>
                                                    <picture>
                                                        <source type="image/webp" srcset="{$types_video_image_webp_2x} 2x, {$types_video_image_webp} 1x">
                                                        <img src="{$types_video_image}" srcset="{$types_video_image_2x} 2x, {$types_video_image} 1x" width="1206" height="678" alt="{$row.title | escape}">
                                                    </picture>

                                                    <svg class="video-page__video-play" width="98" height="118">
                                                        <use xlink:href="assets/theme/img/icons/icons.svg#play"></use>
                                                    </svg>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        {/if}

    </main>
{/block}