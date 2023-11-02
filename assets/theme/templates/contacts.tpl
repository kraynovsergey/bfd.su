{extends 'file:templates/base.tpl'}

{block 'main'}
    <main class="main">
        <div class="container">
            <div class="contacts__cols">
                <div class="contacts__col">
                    <h1 class="contacts__h1 animation-lines"> <span data-aos="lines">{$_modx->resource.pagetitle}</span></h1>

                    <div class="contacts__socials" data-aos="opacity" data-aos-delay="200">
                        {if 'youtube' | config}
                            <a class="contacts__social" href="{'youtube' | config}" target="_blank" rel="nofollow" data-magnetic>
                                <svg width="41" height="41" data-magnetic-text>
                                    <use xlink:href="assets/theme/img/icons/icons.svg#youtube"></use>
                                </svg>
                            </a>
                        {/if}

                        {if 'vk' | config}
                            <a class="contacts__social" href="{'vk' | config}" target="_blank" rel="nofollow" data-magnetic>
                                <svg width="41" height="41" data-magnetic-text>
                                    <use xlink:href="assets/theme/img/icons/icons.svg#vk"></use>
                                </svg>
                            </a>
                        {/if}
                    </div>
                </div>

                <div class="contacts__col">
                    <div class="contacts__green" data-aos="opacity" data-aos-delay="200">
                        <a class="contacts__email animation-chars" href="mailto:{'email' | config}">
                            <span class="animation-chars__title" data-split-words-chars>{'email' | config}</span>
                            <span class="animation-chars__title" data-split-words-chars>{'email' | config}</span>
                        </a>

                        <div class="contacts__messangers">
                            {if 'telegram' | config}
                                <a class="contacts__messanger animation-chars" href="tg://resolve?domain={'telegram' | config}" target="_blank" rel="nofollow">
                                    <span class="animation-chars__title" data-split-words-chars>Telegram</span>
                                    <span class="animation-chars__title" data-split-words-chars>Telegram</span>
                                </a>
                            {/if}
                            
                            {if 'whatsapp' | config}
                                <a class="contacts__messanger animation-chars" href="https://api.whatsapp.com/send?phone={'whatsapp' | config}" target="_blank" rel="nofollow">
                                    <span class="animation-chars__title" data-split-words-chars>WhatsApp</span>
                                    <span class="animation-chars__title" data-split-words-chars>WhatsApp</span>
                                </a>
                            {/if}
                        </div>
                    </div>

                    <div class="contacts__addresses" data-aos="opacity" data-aos-delay="400">
                        <p class="contacts__address">{'company_name' | config}</p>
                        <p class="contacts__address">{'address' | config}</p>
                        <a class="contacts__address animation-chars" href="tel:{'phone' | config | replace : '(' : '' | replace : ')' : '' | replace : '-' : '' | replace : ' ' : ''}" target="_blank">
                            <span class="animation-chars__title" data-split-words-chars>{'phone' | config}</span>
                            <span class="animation-chars__title" data-split-words-chars>{'phone' | config}</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="contacts__map" id="map" data-aos="opaciy" data-aos-delay="600"></div>
    </main>
{/block}