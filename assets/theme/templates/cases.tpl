{extends 'file:templates/base.tpl'}

{block 'main'}
    <main class="main">
        <section class="section _pt0">
            <div class="container">
                <h1 class="h1-big animation-lines"><span data-aos="lines">{$_modx->resource.pagetitle}</span></h1>

                {'!mFilter2' | snippet : [
		            'element' => 'pdoResources',
		            'sort' => 'resource|menuindex:desc',
		            'filters' => '
			            tv|type_project:radio,
						tv|industry:radio,
		            ',
		            'suggestionsRadio' => 'tv|industry,tv|type_project',
		            'parents'  => $_modx->resource.id,
		            'depth' => 0,
		            'limit' => 8,
		            'tpls' => '@FILE: chunks/portfolio/portfolio_item.tpl',
		            'includeContent' => 0,
		            'includeTVs' => 'image,year,industry,type_project,background',
		            'processTVs' => 'image',
		            'tvPrefix' => '',
		            'ajaxMode' => 'button',
		            'tplOuter' => '@FILE: chunks/filter/filter_outer.tpl',
		            'tplFilter.outer.tv|industry' => '@FILE: chunks/filter/filter_radio_outer.tpl',
		            'tplFilter.row.tv|industry' => '@FILE: chunks/filter/filter_radio_row.tpl',
		            'tplFilter.outer.tv|type_project' => '@FILE: chunks/filter/filter_radio_outer.tpl',
		            'tplFilter.row.tv|type_project' => '@FILE: chunks/filter/filter_radio_row.tpl',
	            ]}
            </div>
        </section>
    </main>
{/block}