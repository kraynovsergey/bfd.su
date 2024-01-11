<div class="order" id="modal-order" data-lenis-prevent>
    {'!FetchIt' | snippet : [
	    'form' => '@FILE: chunks/forms/order_form.tpl',
	    'validate' => 'name:required,email:required,phone:required,info:blank',
	    'hooks' => 'spam,email,FormItSaveForm',
	    'emailTpl' => '@FILE: chunks/forms/form_report.tpl',
	    'submitVar' => 'order',
	    'emailSubject' => 'Заявка с сайта ' ~ 'site_name' | config,
	    'emailTo' => 'email_form' | config,
	    'emailFrom' => 'emailsender' | config,
	    'emailFromName' => 'site_name' | config,
	    'formName' => 'Заявка',
	    'formFields' => 'page,pageName,name,email,phone,company,budget,message,tinkoff',
	    'fieldNames' => 'pageName==Название страницы,page==Ссылка на страницу,name==ФИО,email==Email,phone==Телефон,company==Компания,budget==Планируемый бюджеи,message==Описание проекта,tinkoff==Беспроцентная рассрочка от банка Тинькофф'
    ]}
</div>

<div class="order" id="modal-thankyou" data-lenis-prevent>
    <div class="container thankyou__container">
        <p class="thankyou__title"><span>{'thankyou_title' | config}</span>{'thankyou_subtitle' | config}</p>
        <picture class="thankyou__picture">
            <source type="image/webp" srcset="assets/theme/img/thankyou@2x.webp 2x, assets/theme/img/thankyou.webp 1x">
            <img src="assets/theme/img/thankyou.png" srcset="assets/theme/img/thankyou@2x.png 2x, assets/theme/img/thankyou.png 1x" alt="{'site_name' | config | escape}" width="429" height="429">
        </picture>
    </div>
</div>