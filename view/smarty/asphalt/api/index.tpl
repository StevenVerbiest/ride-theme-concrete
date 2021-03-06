{extends file="base/index.sidebar"}

{block name="styles" append}
    <link href="{$app.url.base}/css/documentation.css" rel="stylesheet" media="screen">
{/block}

{block name="head_title" prepend}{translate key="title.api"} - {/block}

{block name="taskbar_panels" append}
    {url id="api.search" var=searchUrl}
    {call taskbarPanelSearch url=$searchUrl method="POST" query=$searchQuery}
{/block}

{block name="sidebar"}
    {if $classes}
        <h3>{translate key="title.classes"}</h3>
        <ul class="nav nav-pills nav-stacked nav-documentation">
        {foreach $classes as $c}
            <li{if $shortName == $c} class="active"{/if}><a href="{$urlClass}/{$namespace}/{$c}">{$c}</a></li>
        {/foreach}
        </ul>
    {/if}
    {if $namespaces}
        <h3>{translate key="title.namespaces"}</h3>
        <ul class="nav nav-pills nav-stacked nav-documentation">
        {foreach $namespaces as $ns}
            <li><a href="{$urlNamespace}/{$ns}">{$ns}</a></li>
        {/foreach}
        </ul>
    {/if}
{/block}

{block name="content_title"}
    <div class="page-header">
        <h1>{translate key="title.api"}</h1>
    </div>
{/block}

{block name="content_main" prepend}
    <div class="breadcrumb">
        {foreach $breadcrumbs as $url => $label}
            <span itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="breadcrumb__item{if $label@last} breadcrumb__item--active{/if}">
              <a href="{$url}" itemprop="url">
                <span itemprop="title">{$label}</span>
              </a>{if !$label@last} &rsaquo;{/if}
            </span>
        {/foreach}
    </div>
{/block}
