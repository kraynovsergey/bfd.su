<div id="mse2_mfilter" class="msearch2" data-single-accordion>
    <form class="filter ac" action="{$_modx->resource.id | url}" method="post" id="mse2_filters">
        <div class="filter__line" data-aos="left-right-full"></div>

        <button class="filter__btn btn-reset ac-trigger" type="button" data-aos="fade-up">
            <span class="animation-chars">
                <span class="animation-chars__title" data-split-words-chars>Раскрыть фильтры</span>
                <span class="animation-chars__title" data-split-words-chars>Раскрыть фильтры</span>
            </span>
            <svg width="22" height="20">
                <use xlink:href="assets/theme/img/icons/icons.svg#filter"></use>
              </svg>
        </button>

        <div class="filter__content ac-panel">
            {$filters}
        </div>

        <button class="filter__submit" type="submit" style="display: none;"></button>
    </form>

    <div class="cases" id="mse2_results" style="margin-bottom: 0;">
        {$results}
    </div>

    <div class="mse2_pagination">
        {'page.nav' | placeholder}
    </div>
</div>