<?php

$params = array_merge(
    require __DIR__ . '/../../common/config/params.php',
    require __DIR__ . '/../../common/config/params-local.php',
    require __DIR__ . '/params.php',
    require __DIR__ . '/params-local.php'
);

return [
    'id' => 'app-restful',
    'basePath' => dirname(__DIR__),
    'controllerNamespace' => 'restful\controllers',
    'bootstrap' => [
        'log',
        [
            'class' => 'yii\filters\ContentNegotiator',
            'formats' => [
                'application/json' => \yii\web\Response::FORMAT_JSON,
                'application/xml' => \yii\web\Response::FORMAT_XML,
            ]
        ],
    ],
    'components' => [
        'request' => [
            'csrfParam' => '_csrf-restful',
            'baseUrl' => '',
            'parsers' => [
                'application/json' => 'yii\web\JsonParser',
            ]
        ],
        'user' => [
            'identityClass' => 'common\models\User',
            'enableAutoLogin' => true,
            'identityCookie' => ['name' => '_identity-restful', 'httpOnly' => true],
        ],
        'session' => [
            // this is the name of the session cookie used for login on the restful
            'name' => 'wi-restful',
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => \yii\log\FileTarget::class,
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'urlManager' => [
            'enablePrettyUrl' => true,
            'showScriptName' => false,
            'rules' => [
                ['class' => 'yii\rest\UrlRule', 'controller' => 'author'],
                ['class' => 'yii\rest\UrlRule', 'controller' => 'book'],
                ['class' => 'yii\rest\UrlRule', 'controller' => 'genre'],
//                [
//                    'class' => 'yii\rest\UrlRule',
//                    'controller' => 'genre',
//                    'except' => ['create', 'update', 'delete']
//                ],
//                [
//                    'class' => 'yii\rest\UrlRule',
//                    'controller' => 'country',
//                    'except' => ['create', 'update', 'delete']
//                ]
            ],
        ],
        'i18n' => [
            'translations' => [
                'yii2mod.rbac' => [
                    'class' => 'yii\i18n\PhpMessageSource',
                    'basePath' => '@yii2mod/rbac/messages',
                ],
            ],
        ],
        'response' => [
            'class' => 'yii\web\Response',
            'on beforeSend' => function ($event) {
                $response = $event->sender;
                if ($response->data !== null) {
                    $response->data = [
                        'status' => ($response->isSuccessful) ? 'ok' : 'error',
                        'code' => $response->statusCode,
                        'data' => $response->data
                    ];
                }
            },
        ],
    ],
    'params' => $params,
];
