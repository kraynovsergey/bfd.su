<form class="container order__form" action="{$_modx->resource.id | url}" enctype="multipart/form-data">
    <input type="text" style="position: absolute; left: -9999px; top: -99999px;" name="info" value="">
    <input type="hidden" name="nospam:blank" value="">
    <input type="hidden" name="order" value="1">
    <input type="hidden" name="page" value="{$_modx->resource.id | url : [ 'scheme' => 'full' ]}">
    <input type="hidden" name="pageName" value="{$_modx->resource.pagetitle | escape}">

    <p class="order__title">{'discuss_form_title' | config}</p>

    <div class="order__fields">
        <input class="order__input" type="text" name="name" placeholder="Имя*">
        <input class="order__input" type="tel" name="phone" placeholder="Телефон*" data-tel>
        <input class="order__input" type="email" name="email" placeholder="E-mail*">
        <input class="order__input" type="text" name="company" placeholder="Компания">

        <div class="order__textarea-wrap order__radio-wrap">
            <button class="order__radio-value btn-reset" type="button" data-budget>Планируемый бюджет</button>
            <div class="order__radio-items">
                <div class="order__radio-item">
                    <input type="radio" name="budget" value="до 300 000р." id="order-budget-1" data-budget-input>
                    <label for="order-budget-1"><span></span>до 300 000р.</label>
                </div>
                <div class="order__radio-item">
                    <input type="radio" name="budget" value="300 000 - 500 000р." id="order-budget-2" data-budget-input>
                    <label for="order-budget-2"><span></span>300 000 - 500 000р.</label>
                </div>
                <div class="order__radio-item">
                    <input type="radio" name="budget" value="500 000 - 800 000р." id="order-budget-3" data-budget-input>
                    <label for="order-budget-3"><span></span>500 000 - 800 000р.</label>
                </div>
                <div class="order__radio-item">
                    <input type="radio" name="budget" value="800 000 - 1 500 000р." id="order-budget-4"
                        data-budget-input>
                    <label for="order-budget-4"><span></span>800 000 - 1 500 000р.</label>
                </div>
                <div class="order__radio-item">
                    <input type="radio" name="budget" value="больше 1 500 000р." id="order-budget-5" data-budget-input>
                    <label for="order-budget-5"><span></span>больше 1 500 000р.</label>
                </div>
            </div>
        </div>

        <div class="order__textarea-wrap">
            <textarea class="order__textarea" name="message" placeholder="Описание проекта*"></textarea>
            <div class="order__file">
                <input type="file" name="attachment" id="order-file" data-file-name>
                <label for="order-file">
                    <svg width="18" height="18">
                        <use xlink:href="assets/theme/img/icons/icons.svg#file"></use>
                    </svg><span>Загрузить файл</span>
                </label>
            </div>
        </div>

        <div class="order__checkbox">
            <input class="order__checkbox-input" type="checkbox" name="tinkoff" value="Да" id="order-tinkoff">
            <label class="order__checkbox-label" for="order-tinkoff">
                <span class="order__checkbox-check"></span>
                <span>Беспроцентная рассрочка от банка Тинькофф</span>
            </label>
        </div>

        <div class="order__checkbox">
            <input class="order__checkbox-input" type="checkbox" name="policy" id="order-policy" data-policy checked>
            <label class="order__checkbox-label" for="order-policy">
                <span class="order__checkbox-check"></span>
                <span>Я согласен с <a href="{'privacy_policy' | config}" target="_blank">политикой конфиденциальности</a></span>
            </label>
        </div>
    </div>

    <button class="footer__btn order__btn btn-custom _big btn-reset" type="submit" {if 'animation_low' | config == 1}data-magnetic{/if}>
        <span class="btn-custom__bg"></span>
        <span class="btn-custom__text" data-magnetic-text>Отправить заявку</span>
        <svg width="97" height="102" data-magnetic-text>
            <use xlink:href="assets/theme/img/icons/icons.svg#arrow-right"></use>
        </svg>
    </button>
</form>