<?php

namespace frontend\controllers;

use common\controllers\CommonController;
use yii\web\NotFoundHttpException;
use yii2mod\rbac\filters\AccessControl;

/**
 * Базовый контроллер подпроекта Frontend
 */
class FrontendController extends CommonController
{
    /**
     * @inheritDoc
     */
    public function behaviors()
    {
        return array_merge(
            parent::behaviors(),
            [
                'access' => [
                    'class' => AccessControl::class,
                    'denyCallback' => function() {
                        throw new NotFoundHttpException('Page not found.');
                    }
                ]
            ]
        );
    }
}