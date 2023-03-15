<?php

namespace restful\controllers;

use common\models\Country;
use yii\data\ActiveDataProvider;

class CountryController extends RestfulController
{
    public $modelClass = Country::class;

    public function actions()
    {
        $actions = parent::actions();

        // disable the "delete" and "create" actions
        unset($actions['delete'], $actions['create']);

        return $actions;
    }
}