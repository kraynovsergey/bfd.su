{extends 'file:templates/base.tpl'}

{block 'main'}
    <main class="main _top">
        <section class="home-intro data-ripples" data-ripples-img="assets/theme/img/home-intro-empty.png" data-scroll-opacity>
            <video class="home-intro__video" autoplay muted loop playsinline>
                <source type="video/mp4" src="{$_modx->resource.intro_video}">
            </video>

            <div class="container home-intro__container" data-100vh>
                <div class="home-intro__title animation-lines">
                    <svg width="925" height="219" data-aos="lines">
                        <use xlink:href="assets/theme/img/icons/icons.svg#web-studio"></use>
                    </svg>
                </div>

                <div class="home-intro__cols">
                    <div class="home-intro__leftcol">
                        <div class="home-intro__subtitle animation-lines">
                            <svg width="1160" height="219" data-aos="lines">
                                <use xlink:href="assets/theme/img/icons/icons.svg#digital-design"></use>
                            </svg>

                            <svg class="_mobile" width="380" height="300" data-aos="lines">
                                <use xlink:href="assets/theme/img/icons/icons.svg#digital-design-mobile"></use>
                            </svg>
                        </div>

                        <div class="home-intro__text letter-spacing animation-lines">
                            <p data-aos="lines" data-aos-offset="0" data-aos-delay="400">{$_modx->resource.intro_subtitle}</p>
                        </div>

                        <div class="home-intro__text letter-spacing home-intro__links _mobile animation-lines">
                            <a class="home-intro__link animation-chars" href="mailto:{'email' | config}" data-aos="lines" data-aos-offset="0" data-aos-delay="600">
                                <span class="animation-chars__title" data-split-words-chars>{'email' | config}</span>
                                <span class="animation-chars__title" data-split-words-chars>{'email' | config}</span>
                            </a>
                            
                            <a class="home-intro__link animation-chars" href="tel:{'phone' | config | replace : '(' : '' | replace : ')' : '' | replace : '-' : '' | replace : ' ' : ''}" data-aos="lines" data-aos-offset="0" data-aos-delay="800">
                                <span class="animation-chars__title" data-split-words-chars>{'phone' | config}</span>
                                <span class="animation-chars__title" data-split-words-chars>{'phone' | config}</span>
                            </a>
                        </div>
                    </div>

                    <div class="home-intro__rightcol">
                        <button class="home-intro__btn btn-circle btn-custom btn-reset" type="button" data-fancybox data-src="#modal-order" data-aos="opacity" data-aos-delay="1000" data-magnetic>
                            <span class="btn-custom__bg"></span>
                            <span class="btn-custom__text" data-magnetic-text>Обсудить<br>проект</span>
                            <svg width="36" height="35" data-magnetic-text>
                                <use xlink:href="assets/theme/img/icons/icons.svg#btn-circle-arrow"></use>
                            </svg>
                        </button>

                        <div class="home-intro__text letter-spacing home-intro__links animation-lines">
                            <a class="home-intro__link animation-chars" href="mailto:{'email' | config}" data-aos="lines" data-aos-offset="0" data-aos-delay="600">
                                <span class="animation-chars__title" data-split-words-chars>{'email' | config}</span>
                                <span class="animation-chars__title" data-split-words-chars>{'email' | config}</span>
                            </a>
                            
                            <a class="home-intro__link animation-chars" href="tel:{'phone' | config | replace : '(' : '' | replace : ')' : '' | replace : '-' : '' | replace : ' ' : ''}" data-aos="lines" data-aos-offset="0" data-aos-delay="800">
                                <span class="animation-chars__title" data-split-words-chars>{'phone' | config}</span>
                                <span class="animation-chars__title" data-split-words-chars>{'phone' | config}</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="rellax _black" data-rellax-speed="2">
            <section class="section home-about _pb0">
                <div class="container">
                    {if $_modx->resource.about_title}
                        <div class="home-about__title animation-lines">
                            <p data-aos="lines">{$_modx->resource.about_title}</p>
                        </div>
                    {/if}

                    {if $_modx->resource.about_subtitle}
                        <div class="home-about__text letter-spacing animation-lines">
                            <p data-aos="lines" data-aos-delay="100">{$_modx->resource.about_subtitle}</p>
                        </div>
                    {/if}
                </div>
            </section>
        </section>
        
        {set $pluses = json_decode($_modx->resource.pluses, true)}
        {if $pluses | length > 0}
            <section class="section home-pluses _pt0">
                <div class="container home-pluses__container">
                    {foreach $pluses as $row}
                        <article class="home-pluses__item">
                            <h3 class="home-pluses__title letter-spacing animation-lines">
                                <span data-aos="lines" data-aos-delay="{$row@index * 100}">{$row.title}</span>
                            </h3>

                            <p class="home-pluses__text letter-spacing animation-lines">
                                <span data-aos="lines" data-aos-delay="{$row@index * 100}">{$row.text}</span>
                            </p>
                        </article>
                    {/foreach}
                </div>
            </section>
        {/if}

        <section class="section home-cases">
            <div class="container">
                <h2 class="section__title animation-lines"><span data-aos="lines">Кейсы</span></h2>
                <div class="home-cases__items">
                    {'pdoResources' | snippet : [
                        'parents'  => 30,
                        'depth' => 0,
                        'sortby' => 'menuindex',
                        'sortdir' => 'DESC',
                        'limit' => 0,
                        'tpl' => '@FILE chunks/portfolio/portfolio_home_item.tpl',
                        'includeContent' => 0,
                        'includeTVs' => 'show_on_home,year,type_project,image_home,intro_home',
                        'tvPrefix' => '',
                        'tvFilters' => 'show_on_home===1'
                    ]}
                </div>
                <div class="home-cases__all" data-aos="lines">
                    <a class="letter-spacing" href="{30 | url}" data-magnetic>
                        <span data-magnetic-text>Смотреть ещё</span>
                    </a>
                </div>
            </div>
        </section>

        <section class="section technologies">
            <div class="container">
                <h2 class="section__title animation-lines"><span data-aos="lines">Технологии</span></h2>
                <div class="technologies__wrap" data-matter data-aos="opacity" data-matter-path="/assets/theme/img/"></div>
                
                <div class="technologies__texts">
                    {if $_modx->resource.technologies_text}
                        <div class="technologies__text letter-spacing animation-lines"> 
                            <p data-aos="lines">{$_modx->resource.technologies_text}</p>
                        </div>
                    {/if}
                    
                    {if $_modx->resource.technologies_text2}
                        <div class="technologies__text letter-spacing animation-lines"> 
                            <p data-aos="lines">{$_modx->resource.technologies_text2}</p>
                        </div>
                    {/if}
                </div>
            </div>
        </section>

        <section class="section clients">
            <div class="clients__title marquee" data-aos="opacity" data-duration="15000" data-direction="right"><span>Клиенты</span></div>
            <div class="clear"></div>
            <div class="clients__logos marquee" data-aos="opacity" data-duration="10000" data-direction="left">
                {set $clients = json_decode($_modx->resource.clients, true)}
                {foreach $clients as $row}
                    {set $image = 'assets/images/' ~ $row.image}
                    <img src="{$image}" width="210" height="40" alt="Клиенты">
                {/foreach}
            </div>
            <div class="clear"></div>
        </section>
    </main>
{/block}