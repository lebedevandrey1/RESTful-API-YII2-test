<?php

namespace restful\controllers;

use yii\rest\ActiveController;

class RestfulController extends ActiveController
{
    public $serializer = [
        'class' => 'yii\rest\Serializer',
        'collectionEnvelope' => 'response',
    ];

    /**
     * @inheritDoc
     */
    protected function verbs()
    {
        return [
            'index' => ['GET'],
            'view' => ['GET'],
            'create' => ['POST'],
            'update' => ['POST'],
            'delete' => ['DELETE', 'POST'],
        ];
    }
}