{var $key = $table ~ $delimeter ~ $filter}
<fieldset class="filter__fieldset" id="mse2_{$key}" data-filter-fieldset>
    <div class="filter__fieldset-title letter-spacing animation-lines"><span data-aos="lines">{('mse2_filter_' ~ $table ~ '_' ~ $filter) | lexicon}:</span></div>
    <div class="filter__fieldset-content">
        {$rows}
    </div>
    <div class="filter__reset-wrap">
        <button class="filter__reset btn-reset" type="button" data-filter-reset></button>
    </div>
</fieldset>