<?php

namespace restful\controllers;

use common\models\Book;
use common\models\BookSearch;

class BookController extends RestfulController
{
    public $modelClass = Book::class;


    public function actions()
    {
        return [
            'index' => [
                'class' => 'yii\rest\IndexAction',
                'modelClass' => $this->modelClass,
                'prepareDataProvider' => function () {
                    $searchModel = new BookSearch();
                    return $searchModel->search(\Yii::$app->request->queryParams);
                },
            ],
        ];

//        $actions = parent::actions();
//        $actions['index']['prepareDataProvider'] = [$this, 'prepareDataProvider'];
//        return $actions;
    }

    public function prepareDataProvider()
    {
        $search = new BookSearch();
        return $search->search(\Yii::$app->request->getQueryParams());
    }
}