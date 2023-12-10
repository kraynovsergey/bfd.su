<article class="services__item" style="background: {$background};" {if 'animation_spoiler' | config == 1}data-case-hover{else}data-case{/if} data-aos="fade-up">
    <button class="services__header btn-reset" type="button">
        <div class="services__num"><span>{if $idx < 10}0{/if}{$idx}</span></div>
        <h3 class="services__title">{$menutitle ?: $pagetitle}</h3>
        <div class="services__plus"><span></span></div>
    </button>
    <div class="services__content-outer" data-case-content>
        <div class="services__content-wrap" data-case-content-height>
            <div class="services__content-num"></div>
            <div class="services__content">
                {if $introtext}
                    <p class="services__text">{$introtext}</p>
                {/if}
                
                {if $price}
                    <div class="services__price letter-spacing">{$price}</div>
                {/if}
                
                {if $hidemenu != 1}
                    <a class="services__more services__text home-cases__more" href="{$id | url}" {$link_attributes} data-magnetic>
                        <span>Смотреть</span>
                        <svg width="16" height="15" data-magnetic-text>
                            <use xlink:href="assets/theme/img/icons/icons.svg#btn-circle-arrow"></use>
                        </svg>
                    </a>
                {/if}
            </div>
            <div class="services__content-plus"></div>
        </div>
    </div>
</article>