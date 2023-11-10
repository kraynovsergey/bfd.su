{extends 'file:templates/base.tpl'}

{block 'main'}
    <main class="main _top">
        {set $image_header = 'pThumb' | snippet : [
            'input' => $_modx->resource.image_header,
            'options' => 'w=1920&zc=0&q=90&f=jpg'
        ]}

        {set $image_header_2x = 'pThumb' | snippet : [
            'input' => $_modx->resource.image_header,
            'options' => 'w=3840&zc=0&q=90&f=jpg'
        ]}

        {set $image_header_webp = 'pThumb' | snippet : [
            'input' => $_modx->resource.image_header,
            'options' => 'w=1920&zc=0&q=90&f=webp'
        ]}

        {set $image_header_webp_2x = 'pThumb' | snippet : [
            'input' => $_modx->resource.image_header,
            'options' => 'w=3840&zc=0&q=90&f=webp'
        ]}

        <picture class="case__intro picture" data-scroll-opacity>
            <source type="image/webp" srcset="{$image_header_webp_2x} 2x, {$image_header_webp} 1x">
            <img srcset="{$image_header_2x} 2x, {$image_header} 1x" alt="{$_modx->resource.pagetitle | escape}" width="1920" height="700" data-aos="zoom-out">
        </picture>

        <section class="rellax _black" data-rellax-speed="2">
            <section class="section _pt0 _pb0">
                <div class="container">
                    <h1 class="case__h1 animation-lines"><span data-aos="lines">{$_modx->resource.pagetitle}<sup>{$_modx->resource.intro_sup}</sup></span></h1>
                </div>
            </section>
        </section>

        <section class="section _pt0">
            <div class="container">
                <div class="case__texts">
                    <div class="case__text">
                        {if $_modx->resource.intro_title}
                            <div class="case__subtitle animation-lines">
                                <p data-aos="lines">{$_modx->resource.intro_title}</p>
                            </div>
                        {/if}

                        {if $_modx->resource.intro_text}
                            <div class="case__small animation-lines">
                                <p data-aos="lines">{$_modx->resource.intro_text}</p>
                            </div>
                        {/if}

                        {if $_modx->resource.link}    
                            <a class="case__link" href="{$_modx->resource.link}" target="_blank" rel="nofollow" data-magnetic>
                                <span data-aos="opacity" data-magnetic-text>Смотреть сайт</span>
                            </a>
                        {/if}
                    </div>
                </div>
            </div>
        </section>

        <section class="section">
            <div class="container">
                <div class="case__gradient {if $_modx->resource.first_section_gradient == 1}_gradient{/if}" {if $_modx->resource.first_section_gradient == 1}style="background: linear-gradient({$_modx->resource.first_section_gradient_direction}, {$_modx->resource.first_section_gradient1}, {$_modx->resource.first_section_gradient2 ? $_modx->resource.first_section_gradient2+', ' : ''}{$_modx->resource.first_section_gradient3});"{/if}>
                    {if $_modx->resource.first_section_image}
                        {if $_modx->resource.first_section_gradient == 1}
                            {set $first_section_image = 'pThumb' | snippet : [
                                'input' => $_modx->resource.first_section_image,
                                'options' => 'w=990&zc=0&q=90&f=jpg'
                            ]}
                            
                            {set $first_section_image_2x = 'pThumb' | snippet : [
                                'input' => $_modx->resource.first_section_image,
                                'options' => 'w=990&zc=0&q=90&f=jpg'
                            ]}

                            {set $first_section_image_webp = 'pThumb' | snippet : [
                                'input' => $_modx->resource.first_section_image,
                                'options' => 'w=1980&zc=0&q=90&f=webp'
                            ]}

                            {set $first_section_image_webp_2x = 'pThumb' | snippet : [
                                'input' => $_modx->resource.first_section_image,
                                'options' => 'w=1980&zc=0&q=90&f=webp'
                            ]}
                        {else}
                            {set $first_section_image = 'pThumb' | snippet : [
                                'input' => $_modx->resource.first_section_image,
                                'options' => 'w=1820&zc=0&q=90&f=jpg'
                            ]}
                            
                            {set $first_section_image_2x = 'pThumb' | snippet : [
                                'input' => $_modx->resource.first_section_image,
                                'options' => 'w=1820&zc=0&q=90&f=jpg'
                            ]}

                            {set $first_section_image_webp = 'pThumb' | snippet : [
                                'input' => $_modx->resource.first_section_image,
                                'options' => 'w=3640&zc=0&q=90&f=webp'
                            ]}

                            {set $first_section_image_webp_2x = 'pThumb' | snippet : [
                                'input' => $_modx->resource.first_section_image,
                                'options' => 'w=3640&zc=0&q=90&f=webp'
                            ]}
                        {/if}

                        <picture class="case__gradient-picture picture">
                            <source type="image/webp" srcset="{$first_section_image_webp_2x} 2x, {$first_section_image_webp} 1x">
                            <img srcset="{$first_section_image_2x} 2x, {$first_section_image} 1x" alt="{$_modx->resource.pagetitle | escape}" width="1820" height="1000" data-aos="opacity">
                        </picture>
                    {else}
                        {if $_modx->resource.first_section_video}
                            <video class="case__gradient-picture picture" autoplay muted loop playsinline data-aos="opacity">
                                <source type="video/mp4" src="{$_modx->resource.first_section_video}">
                            </video>
                        {/if}
                    {/if}
                </div>

                {if $_modx->resource.first_section_text1 or $_modx->resource.first_section_text2}
                    <div class="case__texts _mt50">
                        {if $_modx->resource.first_section_text1}
                            <div class="case__text">
                                <div class="case__default animation-lines">
                                    <p data-aos="lines">{$_modx->resource.first_section_text1}</p>
                                </div>
                            </div>
                        {/if}

                        {if $_modx->resource.first_section_text2}
                            <div class="case__text">
                                <div class="case__default animation-lines">
                                    <p data-aos="lines">{$_modx->resource.first_section_text2}</p>
                                </div>
                            </div>
                        {/if}
                    </div>
                {/if}
            </div>
        </section>

        <section class="section">
            <div class="case__pictures">
                {if $_modx->resource.second_section_image1}
                    {set $second_section_image1 = 'pThumb' | snippet : [
                        'input' => $_modx->resource.second_section_image1,
                        'options' => 'w=664&zc=0&q=90'
                    ]}

                    {set $second_section_image1_2x = 'pThumb' | snippet : [
                        'input' => $_modx->resource.second_section_image1,
                        'options' => 'w=1328&zc=0&q=90'
                    ]}

                    {set $second_section_image1_webp = 'pThumb' | snippet : [
                        'input' => $_modx->resource.second_section_image1,
                        'options' => 'w=664&zc=0&q=90&f=webp'
                    ]}

                    {set $second_section_image1_webp_2x = 'pThumb' | snippet : [
                        'input' => $_modx->resource.second_section_image1,
                        'options' => 'w=1328&zc=0&q=90&f=webp'
                    ]}

                    <picture class="case__pictures-picture picture">
                        <source type="image/webp" srcset="{$second_section_image1_2x} 2x, {$second_section_image1} 1x">
                        <img srcset="{$second_section_image1_webp_2x} 2x, {$second_section_image1_webp} 1x" alt="{$_modx->resource.pagetitle | eccape}" width="664" height="756" data-aos="fade-right">
                    </picture>
                {else}
                    {if $_modx->resource.second_section_video1}
                        <video class="case__pictures-picture picture" autoplay muted loop playsinline data-aos="fade-right">
                            <source type="video/mp4" src="{$_modx->resource.second_section_video1}">
                        </video>
                    {/if}
                {/if}

                {if $_modx->resource.second_section_image2}
                    {set $second_section_image2 = 'pThumb' | snippet : [
                        'input' => $_modx->resource.second_section_image2,
                        'options' => 'w=1255&zc=0&q=90'
                    ]}

                    {set $second_section_image2_2x = 'pThumb' | snippet : [
                        'input' => $_modx->resource.second_section_image2,
                        'options' => 'w=2510&zc=0&q=90'
                    ]}

                    {set $second_section_image2_webp = 'pThumb' | snippet : [
                        'input' => $_modx->resource.second_section_image2,
                        'options' => 'w=1255&zc=0&q=90&f=webp'
                    ]}

                    {set $second_section_image2_webp_2x = 'pThumb' | snippet : [
                        'input' => $_modx->resource.second_section_image2,
                        'options' => 'w=2510&zc=0&q=90&f=webp'
                    ]}

                    <picture class="case__pictures-picture picture">
                        <source type="image/webp" srcset="{$second_section_image2_2x} 2x, {$second_section_image2} 1x">
                        <img srcset="{$second_section_image2_webp_2x} 2x, {$second_section_image2_webp} 1x" alt="{$_modx->resource.pagetitle | eccape}" width="1255" height="756" data-aos="fade-left">
                    </picture>
                {else}
                    {if $_modx->resource.second_section_video2}
                        <video class="case__pictures-picture picture" autoplay muted loop playsinline data-aos="fade-left">
                            <source type="video/mp4" src="{$_modx->resource.second_section_video2}">
                        </video>
                    {/if}
                {/if}
            </div>

            {if $_modx->resource.second_section_text1 or $_modx->resource.second_section_text2}
                <div class="container">
                    <div class="case__texts _mt50">
                        {if $_modx->resource.second_section_text1}
                            <div class="case__text">
                                <div class="case__default animation-lines">
                                    <p data-aos="lines">{$_modx->resource.second_section_text1}</p>
                                </div>
                            </div>
                        {/if}

                        {if $_modx->resource.second_section_text2}
                            <div class="case__text">
                                <div class="case__default animation-lines">
                                    <p data-aos="lines">{$_modx->resource.second_section_text2}</p>
                                </div>
                            </div>
                        {/if}
                    </div>
                </div>
            {/if}
        </section>

        {if $_modx->resource.third_section_image or $_modx->resource.third_section_video or $_modx->resource.third_section_text1 or $_modx->resource.third_section_text2}
        <section class="section">
            {if $_modx->resource.third_section_image}
                {set $third_section_image = 'pThumb' | snippet : [
                    'input' => $_modx->resource.third_section_image,
                    'options' => 'w=1920&zc=0&q=90&f=jpg'
                ]}

                {set $third_section_image_2x = 'pThumb' | snippet : [
                    'input' => $_modx->resource.third_section_image,
                    'options' => 'w=1920&zc=0&q=90&f=jpg'
                ]}

                {set $third_section_image_webp = 'pThumb' | snippet : [
                    'input' => $_modx->resource.third_section_image,
                    'options' => 'w=1920&zc=0&q=90&f=webp'
                ]}

                {set $third_section_image_webp_2x = 'pThumb' | snippet : [
                    'input' => $_modx->resource.third_section_image,
                    'options' => 'w=1920&zc=0&q=90&f=webp'
                ]}

                <picture class="case__picture picture">
                    <source type="image/webp" srcset="{$third_section_image_webp_2x} 2x, {$third_section_image_webp} 1x">
                    <img srcset="{$third_section_image_2x} 2x, {$third_section_image} 1x" alt="{$_modx->resource.pagetitle | escape}" width="1920" height="2086" data-aos="opacity">
                </picture>
            {else}
                {if $_modx->resource.third_section_video}
                    <video class="case__picture picture" autoplay muted loop playsinline data-aos="opacity">
                        <source type="video/mp4" src="{$_modx->resource.third_section_video}">
                    </video>
                {/if}
            {/if}

            {if $_modx->resource.third_section_text1 or $_modx->resource.third_section_text2}
                <div class="container">
                    <div class="case__texts _mt50">
                        {if $_modx->resource.third_section_text1}
                            <div class="case__text">
                                <div class="case__default animation-lines">
                                    <p data-aos="lines">{$_modx->resource.third_section_text1}</p>
                                </div>
                            </div>
                        {/if}

                        {if $_modx->resource.third_section_text2}
                            <div class="case__text">
                                <div class="case__default animation-lines">
                                    <p data-aos="lines">{$_modx->resource.third_section_text2}</p>
                                </div>
                            </div>
                        {/if}
                    </div>
                </div>
            {/if}
        </section>
        {/if}

        {if $_modx->resource.fourth_section_image or $_modx->resource.fourth_section_video or $_modx->resource.fourth_section_text1 or $_modx->resource.fourth_section_text2}
        <section class="section">
            {if $_modx->resource.fourth_section_image}
                {set $fourth_section_image = 'pThumb' | snippet : [
                    'input' => $_modx->resource.fourth_section_image,
                    'options' => 'w=1920&zc=0&q=90&f=jpg'
                ]}

                {set $fourth_section_image_2x = 'pThumb' | snippet : [
                    'input' => $_modx->resource.fourth_section_image,
                    'options' => 'w=1920&zc=0&q=90&f=jpg'
                ]}

                {set $fourth_section_image_webp = 'pThumb' | snippet : [
                    'input' => $_modx->resource.fourth_section_image,
                    'options' => 'w=1920&zc=0&q=90&f=webp'
                ]}

                {set $fourth_section_image_webp_2x = 'pThumb' | snippet : [
                    'input' => $_modx->resource.fourth_section_image,
                    'options' => 'w=1920&zc=0&q=90&f=webp'
                ]}

                <picture class="case__picture picture">
                    <source type="image/webp" srcset="{$fourth_section_image_webp_2x} 2x, {$fourth_section_image_webp} 1x">
                    <img srcset="{$fourth_section_image_2x} 2x, {$fourth_section_image} 1x" alt="{$_modx->resource.pagetitle | escape}" width="1920" height="2086" data-aos="opacity" loading="lazy">
                </picture>
            {else}
                {if $_modx->resource.fourth_section_video}
                    <video class="case__picture picture" autoplay muted loop playsinline data-aos="opacity">
                        <source type="video/mp4" src="{$_modx->resource.fourth_section_video}">
                    </video>
                {/if}
            {/if}

            {if $_modx->resource.fourth_section_text1 or $_modx->resource.fourth_section_text2}
                <div class="container">
                    <div class="case__texts _mt50">
                        {if $_modx->resource.fourth_section_text1}
                            <div class="case__text">
                                <div class="case__default animation-lines">
                                    <p data-aos="lines">{$_modx->resource.fourth_section_text1}</p>
                                </div>
                            </div>
                        {/if}

                        {if $_modx->resource.fourth_section_text2}
                            <div class="case__text">
                                <div class="case__default animation-lines">
                                    <p data-aos="lines">{$_modx->resource.fourth_section_text2}</p>
                                </div>
                            </div>
                        {/if}
                    </div>
                </div>
            {/if}
        </section>
        {/if}

        {if $_modx->resource.other}
            <section class="section _pb0">
                <div class="container">
                    <div class="cases">
                        {'pdoResources' | snippet : [
                            'parents'  => $_modx->resource.parent,
                            'resources' => $_modx->resource.other,
                            'depth' => 0,
                            'sortby' => 'menuindex',
                            'sortdir' => 'ASC',
                            'limit' => 1,
                            'tpl' => '@FILE: chunks/portfolio/portfolio_item.tpl',
                            'includeContent' => 0,
                            'includeTVs' => 'image,year,industry,type_project,background',
                            'tvPrefix' => ''
                        ]}
                    </div>
                </div>
            </section>
        {/if}
    </main>
{/block}