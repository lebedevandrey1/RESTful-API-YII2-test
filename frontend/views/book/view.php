<?php

use common\models\Author;
use common\models\Genre;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var app\models\Book $model */



$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Books'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="book-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'title',
            [
                'attribute' => 'author',
                'filter'    => ArrayHelper::map(Author::listArray(), 'id', 'name'),
                'value' => function ($data) {
                    return $data->authorn->name;
                }
            ],
            [
                'attribute' => 'country_name',
                'value' => function ($data) {
                    return $data->authorCountry->name;
                }
            ],
            [
                'attribute' => 'genre',
                'filter' => Genre::find()->select(['title', 'id'])->indexBy('id')->column(),
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
        ],
    ]) ?>

</div>
