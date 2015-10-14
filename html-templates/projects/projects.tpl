{extends designs/site.tpl}

{block title}{_ "Projects"} &mdash; {$dwoo.parent}{/block}

{block js-bottom}
    {$dwoo.parent}
    {jsmin "features/sidebar-tags.js"}
{/block}

{block content-wrapper-open}<div class="container-fluid">{/block}

{block content}
    <div class="page-header">
        {if $.User}
            <form class="pull-right" action="/projects/create">
                <button class="btn btn-success" type="submit">{glyph "plus"}&nbsp;{_ "Add Project&hellip;"}</button>
            </form>
        {else}
            <a href="/register" class="btn btn-danger pull-right">{glyph "fire"}&nbsp;{_ "Register with the Brigade!"}</a>
        {/if}
        <h2>{_ "Civic Projects Directory"}</h2>
    </div>
    
    {template tagLink tagData rootUrl linkCls=""}
        <a class="{$linkCls}" href="{$rootUrl}?tag={$tagData.Handle}">{$tagData.Title}{if $tagData.itemsCount} <span class="badge pull-right">{$tagData.itemsCount|number_format}</span>{/if}</a>
    {/template}
    
     <nav class="sidebar left">
    <!-- PROJECTS BLOCK -->
        <section class="tagsSummary projects ">
            <h4><a href="/projects">{_ "Projects"} <span class="badge">{$projectsTotal|number_format}</span></a>
            <a class="btn btn-success btn-xs pull-right" href="/projects/create">{glyph "plus"}&nbsp;{_ "Add Project"}</a></h4>

            <header class="btn-group btn-group-justified btn-group-xs" role="group">
                <a href="#projects-by-topic" class="tagFilter active btn btn-default" role="button" data-group="byTopic">{_ "topics"}</a>
                <a href="#projects-by-tech" class="tagFilter btn btn-default" role="button" data-group="byTech">{_ "tech"}</a>
                <a href="#projects-by-event" class="tagFilter btn btn-default" role="button" data-group="byEvent">{_ "events"}</a>
                <a href="#projects-by-event" class="tagFilter btn btn-default" role="button" data-group="byStage">{_ "stages"}</a>
            </header>

            <div class="tags list-group byTopic">
                {foreach item=tag from=$projectsTags.byTopic}
                    {tagLink tagData=$tag rootUrl="/projects" linkCls="list-group-item"}
                {/foreach}
            </div>

            <div class="tags list-group byTech" style="display: none">
                {foreach item=tag from=$projectsTags.byTech}
                    {tagLink tagData=$tag rootUrl="/projects" linkCls="list-grou-item"}
                {/foreach}
            </div>

            <div class="tags list-group byEvent" style="display: none">
                {foreach item=tag from=$projectsTags.byEvent}
                    {tagLink tagData=$tag rootUrl="/projects" linkCls="list-group-item"}
                {/foreach}
            </div>

            <div class="tags list-group byStage" style="display: none">
                {foreach item=stage from=$projectsStages}
                    <a class="list-group-item" href="/projects?stage={$stage.Stage}">{$stage.Stage} <span class="badge pull-right">{$stage.itemsCount|number_format}</span></a>
                {/foreach}
            </div>
        </section>
    </nav>
    {foreach item=Project from=$data}
        <div class="project-listing row-fluid clearfix">
            <div class="col-sm-8">
                <h3>
                    <a name="{$Project->Handle}" href="{$Project->getURL()}">{$Project->Title|escape}</a>
                </h3>

                <div class="well">
                    {if $Project->README}
                        <div class="markdown readme">{$Project->README|escape|markdown}</div>
                    {/if}
                </div>
            </div>

            {if $Project->Memberships}
            <div class="col-sm-4">
                <h4>Project Info</h4>

                <div class="btn-group btn-group-justified" role="group">
                    {if $Project->UsersUrl}<a class="btn btn-primary" role="button" href="{$Project->UsersUrl|escape}">{glyph "link"}&nbsp;Public Site</a>{/if}
                    {if $Project->DevelopersUrl}<a class="btn btn-success" role="button" href="{$Project->DevelopersUrl|escape}">{glyph "link"}Developers</a>{/if}
                </div>


                <h4>{_ "Members"}</h4>

                <ul class="list-inline people-list">
                {foreach item=Membership from=$Project->Memberships}
                    {$Member = $Membership->Member}
                    <li class="listed-person {tif $Project->MaintainerID == $Member->ID ? maintainer}">
                        <a
                            href="/members/{$Member->Username}"
                            class="member-thumbnail"
                            data-toggle="tooltip"
                            title="{$Member->FullName|escape} &mdash; {projectMemberTitle $Membership}"
                        >
                            {avatar $Member size=48}
                        </a>
                    </li>
                {foreachelse}
                    <li class="muted">{_ "None registered"}</li>
                {/foreach}
                </ul>
            </div>
            {/if}
        </div> <!-- .row-fluid -->
        <hr>
    {foreachelse}
        <em>No projects were found, try creating one{if count($conditions)} or <a href="?">browse without any filters</a>{/if}.</em>
    {/foreach}
{/block}

{block content-wrapper-close}</div>{/block}