{extends 'file:templates/base.tpl'}

{block 'main'}
    <main class="main">
        <section class="section _pt0">
            <div class="container">
                <h1 class="about__h1 animation-lines letter-spacing"><span data-aos="lines">{$_modx->resource.pagetitle}</span></h1>
                <div class="about__subtitle animation-lines">
                    <p data-aos="lines" data-aos-delay="200">{$_modx->resource.introtext}</p>
                </div>
            </div>
        </section>

        {set $team = json_decode($_modx->resource.team, true)}
        {if $team | length > 0}
            <section class="section">
                <div class="container">
                    <div class="team__header">
                        {if $_modx->resource.team_title}
                            <h2 class="section__title team__title-block animation-lines">
                                <span data-aos="lines" data-aos-delay="400">{$_modx->resource.team_title}</span>
                            </h2>
                        {/if}

                        <div class="swiper__navigations team__navigations" data-aos="lines" data-aos-delay="600">
                            <button class="swiper__navigation btn-reset _prev" type="button" data-swiper-team-prev>
                                <svg width="24" height="25">
                                    <use xlink:href="assets/theme/img/icons/icons.svg#arrow-right"></use>
                                </svg>
                            </button>
                            <button class="swiper__navigation btn-reset" type="button" data-swiper-team-next>
                                <svg width="24" height="25">
                                    <use xlink:href="assets/theme/img/icons/icons.svg#arrow-right"></use>
                                </svg>
                            </button>
                        </div>
                    </div>

                    <div class="swiper team__swiper" data-swiper-team>
                        <div class="swiper-wrapper">
                            {foreach $team as $row}
                                {set $image = 'pThumb' | snippet : [
                                    'input' => 'assets/images/' ~ $row.image,
                                    'options' => 'w=450&h=550&zc=1&q=90&f=jpg'
                                ]}

                                {set $image_2x = 'pThumb' | snippet : [
                                    'input' => 'assets/images/' ~ $row.image,
                                    'options' => 'w=900&h=1100&zc=1&q=90&f=jpg'
                                ]}

                                {set $image_webp = 'pThumb' | snippet : [
                                    'input' => 'assets/images/' ~ $row.image,
                                    'options' => 'w=450&h=550&zc=1&q=90&f=webp'
                                ]}

                                {set $image_webp_2x = 'pThumb' | snippet : [
                                    'input' => 'assets/images/' ~ $row.image,
                                    'options' => 'w=900&h=1100&zc=1&q=90&f=webp'
                                ]}

                                <div class="swiper-slide">
                                    <article class="worker">
                                        <picture class="worker__picture">
                                            <source type="image/webp" srcset="{$image_webp_2x} 2x, {$image_webp} 1x">
                                            <img src="{$image}" srcset="{$image_2x} 2x, {$image} 1x" alt="{$row.title | escape}" width="450" height="550" data-aos="zoom-out">
                                        </picture>
                                        <h3 class="worker__title">{$row.title}</h3>
                                        {if $row.text}
                                            <p class="worker__position">{$row.text}</p>
                                        {/if}
                                    </article>
                                </div>
                            {/foreach}
                        </div>
                    </div>
                </div>
            </section>
        {/if}

        {set $principles = json_decode($_modx->resource.principles, true)}
        {if $principles | length > 0}
            <section class="section">
                <div class="container">
                    {if $_modx->resource.principles_title}
                        <h2 class="section__title animation-lines principles__title"><span data-aos="lines">{$_modx->resource.principles_title}</span></h2>
                    {/if}

                    <div class="principles">
                        {foreach $principles as $row}
                            <article class="principle">
                                <div class="principle__overlay" data-aos="left-right"></div>
                                <div class="principle__num">({if $row@index < 9}0{/if}{$row@index + 1})</div>
                                <h3 class="principle__title">{$row.title}</h3>
                                <p class="principle__text">{$row.text}</p>
                            </article>
                        {/foreach}
                    </div>
                </div>
            </section>
        {/if}
    </main>
{/block}