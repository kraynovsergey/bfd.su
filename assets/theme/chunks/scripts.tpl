{if $_modx->resource.template == 13}
    <script src="assets/theme/js/jquery-3.7.1.min.js"></script>
{/if}

<script defer="defer" src="assets/theme/js/app.min.js"></script>

{if $_modx->resource.template == 18}
    <script src="https://api-maps.yandex.ru/2.1/?apikey=вашAPI-ключ&amp;lang=ru_RU"></script>
    <script>
        const map = document.querySelector('#map');
        if (map) { 
            ymaps.ready(init);

            function init() { 
                var myMap = new ymaps.Map("map", { 
                    center: [{'map' | config}],
                    zoom: 15
                });

                let myGeoObject = new ymaps.Placemark([{'map' | config}], { }, { 
                    preset: 'islands#redIcon'
                });

                myMap.geoObjects.add(myGeoObject);

                myMap.behaviors.disable('scrollZoom');
                myMap.controls.remove('default');
            }
        }
    </script>
{/if}

<!-- Yandex.Metrika counter -->
<script>
   (function(m,e,t,r,i,k,a){ m[i]=m[i]||function(){ (m[i].a=m[i].a||[]).push(arguments)};
   m[i].l=1*new Date();
   for (var j = 0; j < document.scripts.length; j++) { if (document.scripts[j].src === r) {  return; }}
   k=e.createElement(t),a=e.getElementsByTagName(t)[0],k.async=1,k.src=r,a.parentNode.insertBefore(k,a)})
   (window, document, "script", "https://mc.yandex.ru/metrika/tag.js", "ym");

   ym(94769945, "init", { 
        clickmap:true,
        trackLinks:true,
        accurateTrackBounce:true,
        webvisor:true
   });
</script>
<noscript><div><img src="https://mc.yandex.ru/watch/94769945" style="position:absolute; left:-9999px;" alt=""></div></noscript>
<!-- /Yandex.Metrika counter -->