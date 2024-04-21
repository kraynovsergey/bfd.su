{var $key = $table ~ $delimeter ~ $filter}
<div class="filter__radio" {if 'animation_low' | config == 1}data-magnetic{/if}>
    <input type="radio" name="{$filter_key}" id="mse2_{$key}_{$idx}" value="{$value}" {$checked} {$disabled}>
    <label class="letter-spacing {$disabled}" for="mse2_{$key}_{$idx}" data-magnetic-text>{$title}</label>
</div>