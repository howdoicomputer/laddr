<?php

$pageData= array();

// projects
    $pageData['projectsTotal'] = Laddr\Project::getCount();
    $pageData['projectsTags']['byTech'] = TagItem::getTagsSummary(array(
        'tagConditions' => array(
            'Handle LIKE "tech.%"'
        )
        ,'itemConditions' => array(
            'ContextClass' => Laddr\Project::getStaticRootClass()
        )
    ));
    $pageData['projectsTags']['byTopic'] = TagItem::getTagsSummary(array(
        'tagConditions' => array(
            'Handle LIKE "topic.%"'
        )
        ,'itemConditions' => array(
            'ContextClass' => Laddr\Project::getStaticRootClass()
        )
    ));
    $pageData['projectsTags']['byEvent'] = TagItem::getTagsSummary(array(
        'tagConditions' => array(
            'Handle LIKE "event.%"'
        )
        ,'itemConditions' => array(
            'ContextClass' => Laddr\Project::getStaticRootClass()
        )
    ));
    $pageData['projectsStages'] = Laddr\Project::getStagesSummary();


Laddr\ProjectsRequestHandler::handleRequest('projects',$pageData);
//RequestHandler::respond('projects', $pageData);