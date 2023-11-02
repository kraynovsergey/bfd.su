<script src="assets/theme/js/app.min.js"></script>

{if $_modx->resource.template == 13}
    <script src="assets/theme/js/jquery-3.7.1.min.js"></script>
{/if}

{if $_modx->resource.template == 18}
    <script src="https://api-maps.yandex.ru/2.1/?apikey=ваш API-ключ&amp;lang=ru_RU" type="text/javascript"></script>
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