<?php

namespace common\controllers;

use yii\web\Controller;

/**
* Общий контроллер для всех базовых контроллеров всех подпроектов
*/
class CommonController extends Controller
{
    /**
    * @var mixed Данные из authManager, которые можно использовать по всему проекту
    */
    public $auth;

    /**
    * Инициализация контроллера
    *
    * @return void
    */
    public function init()
    {
        parent::init();
        $this->auth = \Yii::$app->authManager;
    }
}