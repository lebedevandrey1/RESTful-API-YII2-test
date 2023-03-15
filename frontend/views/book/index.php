<?php

use common\models\Book;
use kartik\grid\GridView;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\widgets\Pjax;

/** @var yii\web\View $this */
/** @var app\models\BookSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = Yii::t('app', 'Books');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="book-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Create Book'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php Pjax::begin(); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'hover' => true,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'id',
            'title',
            [
                'attribute' => 'author_name',
                'value' => 'authorn.name'
            ],
            [
                'attribute' => 'country_name',
                'value' => 'authorCountry.name'
            ],
            [
                'attribute' => 'genre',
                'format' => 'html',
                'value' => function ($model) {
                    $list = $model
                        ->getGenreTitles()
                        ->select(['title'])
                        ->indexBy('id')
                        ->groupBy('id')
                        ->column();
                    return implode('<br/>',$list);
                }
            ],
            [
                'attribute' => 'publish_date',
                'value' => function ($model) {
                    return Yii::$app->formatter->asDateTime($model->publish_date, 'php: d.m.Y');
                },
            ],
            [
                'class' => ActionColumn::class,
                'urlCreator' => function ($action, Book $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id' => $model->id]);
                 }
            ]
        ],
    ]); ?>

    <?php Pjax::end(); ?>

</div>
