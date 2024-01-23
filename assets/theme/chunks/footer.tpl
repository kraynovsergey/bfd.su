<footer class="footer">
    <div class="container footer__container">
        <button class="footer__btn btn-custom _big btn-reset" type="button" data-fancybox data-src="#modal-order" {if 'animation_low' | config == '1'}data-magnetic{/if}>
            <span class="btn-custom__bg"></span>
            <span class="btn-custom__text" data-magnetic-text>Обсудить проект</span>
            <svg width="97" height="102" data-magnetic-text>
                <use xlink:href="assets/theme/img/icons/icons.svg#arrow-right"></use>
            </svg>
        </button>

        <svg class="footer__logo" width="1820" height="360">
            <use xlink:href="assets/theme/img/icons/icons.svg#logo-text"></use>
        </svg>

        <div class="footer__items">
            <a class="footer__item footer__link animation-chars" href="tel:{'phone' | config | replace : '(' : '' | replace : ')' : '' | replace : '-' : '' | replace : ' ' : ''}">
                <span class="animation-chars__title" data-split-words-chars>ПОЗВОНИТЬ</span>
                <span class="animation-chars__title" data-split-words-chars>ПОЗВОНИТЬ</span>
            </a>
            
            {if 'vk' | config}
                <a class="footer__item footer__link animation-chars" href="{'vk' | config}" target="_blank" rel="nofollow">
                    <span class="animation-chars__title" data-split-words-chars>VK</span>
                    <span class="animation-chars__title" data-split-words-chars>VK</span>
                </a>
            {/if}

            {if 'youtube' | config}
                <a class="footer__item footer__link animation-chars" href="{'youtube' | config}" target="_blank" rel="nofollow">
                    <span class="animation-chars__title" data-split-words-chars>Youtube</span>
                    <span class="animation-chars__title" data-split-words-chars>Youtube</span>
                </a>
            {/if}
            
            <a class="footer__item footer__link animation-chars" href="mailto:{'email' | config}">
                <span class="animation-chars__title" data-split-words-chars>{'email' | config}</span>
                <span class="animation-chars__title" data-split-words-chars>{'email' | config}</span>
            </a>
            
            <a class="footer__item footer__link animation-chars" href="tel:{'phone' | config | replace : '(' : '' | replace : ')' : '' | replace : '-' : '' | replace : ' ' : ''}">
                <span class="animation-chars__title" data-split-words-chars>{'phone' | config}</span>
                <span class="animation-chars__title" data-split-words-chars>{'phone' | config}</span>
            </a>
            
            <div class="footer__item">{'address' | config}</div>
        </div>
    </div>
</footer>

<div class="cursor" id="cursor" style="filter: url('#goo');"></div>

<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="800">
    <defs>
        <filter id="goo">
            <feGaussianBlur in="SourceGraphic" stdDeviation="6" result="blur"></feGaussianBlur>
            <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 35 -15" result="goo">
            </feColorMatrix>
            <feComposite in="SourceGraphic" in2="goo" operator="atop"></feComposite>
        </filter>
    </defs>
</svg>