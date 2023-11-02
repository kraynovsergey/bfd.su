{extends 'file:templates/base.tpl'}

{block 'main'}
    <main class="main">
        <section class="section _pt0">
            <div class="container">
                <h1 class="h1-big services__h1 animation-lines"><span data-aos="lines">{$_modx->resource.pagetitle}</span></h1>

                {if $_modx->resource.introtext}
                    <div class="services__big-subtitle animation-lines">
                        <p data-aos="lines" data-aos-delay="100">{$_modx->resource.introtext}</p>
                        <div class="services__big-subtitle-line" data-aos="left-right-full" data-aos-delay="200"></div>
                    </div>
                {/if}

                <div class="services__items">
                    {'pdoResources' | snippet : [
                        'parents'  => $_modx->resource.id,
                        'depth' => 0,
                        'sortby' => 'menuindex',
                        'sortdir' => 'ASC',
                        'limit' => 0,
                        'tpl' => '@FILE chunks/services/services_item.tpl',
                        'includeContent' => 0,
                        'includeTVs' => 'background,price',
                        'tvPrefix' => ''
                    ]}
                </div>
            </div>
        </section>
    </main>
{/block}