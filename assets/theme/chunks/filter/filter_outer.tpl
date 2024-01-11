<div id="mse2_mfilter" class="msearch2">
    <form class="filter" action="{$_modx->resource.id | url}" method="post" id="mse2_filters">
        <div class="filter__line" data-aos="left-right-full"></div>
        {$filters}

        <button class="filter__submit" type="submit" style="display: none;"></button>
    </form>

    <div class="cases" id="mse2_results" style="margin-bottom: 0;">
        {$results}
    </div>

    <div class="mse2_pagination">
        {'page.nav' | placeholder}
    </div>
</div>