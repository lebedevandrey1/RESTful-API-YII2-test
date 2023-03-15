<?php

return [
    'components' => [
        'db' => [
            'class' => \yii\db\Connection::class,
            'dsn' => 'mysql:host=' . env('DB_HOST') . ';dbname=' . env('DB_NAME'),
            'username' => env('DB_USER'),
            'password' => env('DB_PASSWORD'),
            'charset' => 'utf8mb4',
        ],
        'mailer' => [
            'class' => \yii\symfonymailer\Mailer::class,
            'viewPath' => '@common/mail',
        ],
    ],
];
