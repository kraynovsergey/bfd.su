<header class="header">
    <div class="container header__container">
        <a class="header__logo" href="{'site_url' | config}">
            <svg width="160" height="44">
                <use xlink:href="assets/theme/img/icons/icons.svg#logo"></use>
            </svg>
        </a>
        
        {if 'showreel_video' | config}
            <a class="header__link header__showreel animation-chars" href="{'showreel_video' | config}" data-fancybox>
                <span class="animation-chars__title" data-split-words-chars>Showreel</span>
                <span class="animation-chars__title" data-split-words-chars>Showreel</span>
            </a>
        {/if}

        <div class="header__navigation" id="header-navigation" data-lenis-prevent>
            <div class="header__navigation-wrap">
                <nav class="header__nav">
                    {'pdoMenu' | snippet : [
                        'parents' => 0,
                        'level' => 1,
                        'includeTVs' => '',
                        'plPrefix' => '',
                        'tplOuter' => '@INLINE 
                            <ul class="header__list list-reset">
                                {$wrapper}
                                {if "showreel_video" | config}
                                    <li class="header__listitem _mobile">
                                        <a class="header__link animation-chars" href="{"showreel_video" | config}" data-fancybox>
                                            <span class="animation-chars__title" data-split-words-chars>Showreel</span>
                                            <span class="animation-chars__title" data-split-words-chars>Showreel</span>
                                        </a>
                                    </li>
                                {/if}
                            </ul>',
                        'tpl' => '@INLINE 
                            <li class="header__listitem">
                                <a class="header__link animation-chars" href="{$link}" {$attributes}>
                                    <span class="animation-chars__title" data-split-words-chars>{$menutitle}</span>
                                    <span class="animation-chars__title" data-split-words-chars>{$menutitle}</span>
                                </a>
                            </li>'
                        'tplHere' => '@INLINE 
                            <li class="header__listitem">
                                <span class="header__link animation-chars">
                                    <span class="animation-chars__title" data-split-words-chars>{$menutitle}</span>
                                    <span class="animation-chars__title" data-split-words-chars>{$menutitle}</span>
                                </span>
                            </li>'
                    ]}
                </nav>

                <div class="header__navigation-btns">
                    <button class="header__navigation-btn btn-circle btn-reset" type="button" data-fancybox data-src="#modal-order">
                        Обсудить<br>проект
                        <svg width="36" height="35">
                            <use xlink:href="assets/theme/img/icons/icons.svg#btn-circle-arrow"></use>
                        </svg>
                    </button>
                    
                    <a class="header__navigation-btn btn-circle" href="tel:{'phone' | config | replace : '(' : '' | replace : ')' : '' | replace : '-' : '' | replace : ' ' : ''}">
                        Позвонить<br>нам
                        <svg width="36" height="35">
                            <use xlink:href="assets/theme/img/icons/icons.svg#btn-circle-arrow"></use>
                        </svg>
                    </a>
                </div>

                <button class="header__navigation-close btn-reset" type="button" data-fancybox-close></button>
            </div>
        </div>

        <button class="header__burger btn-reset" type="button" data-fancybox data-src="#header-navigation"></button>
    </div>
</header>