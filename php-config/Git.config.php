<?php

Git::$repositories['laddr'] = [
    'remote' => 'https://github.com/howdoicomputer/laddr.git'
    ,'originBranch' => 'production'
    ,'workingBranch' => 'production'
    ,'localOnly' => true
    ,'trees' => [
        'html-templates',
        'locales',
        'php-classes',
        'php-config' => [
            'exclude' => '#^/Git\\.config\\.php$#' // don't sync this file
        ],
        'php-migrations',
        'site-root'
    ]
];
