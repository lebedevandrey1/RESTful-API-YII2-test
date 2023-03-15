<?php

use common\models\Author;
use common\models\BookGenre;
use common\models\Genre;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\bootstrap5\ActiveForm;
use yii\jui\DatePicker;

/** @var yii\web\View $this */
/** @var app\models\Book $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="book-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'author_id')->dropDownList(
            ArrayHelper::map(Author::find()->all(), 'id', 'name'),
            ['prompt'=>'Выберите автора...']
    ) ?>

    <?= $form->field($model, 'genre[]',
    )->checkboxList(
        ArrayHelper::map(Genre::find()->all(), 'id', 'title'),
        [
            'item' => function($index, $label, $name, $checked, $value)  use ($model) {
                // Сортируем массив с теми жанрами, которые присвоены книге
                $genresArray = ArrayHelper::getColumn(BookGenre::find()->where(['book_id' => $model->id])->indexBy('genre_id')->all(), 'genre_id');
                // Если выводимый в форму жанр уже присвоен книге, надо сделать checked
                if (isset($genresArray[$value])) {
                    $checked = 'checked';
                }
                // Выводим чекбоксы по шаблону
                $output = '<div class="form-check form-switch">';
                $output .= '
                    <input class="form-check-input" name="' . $name .
                    '33" value="' . $value .
                    '" type="checkbox" role="switch" id="flexSwitchCheckDefault"' . $checked .
                    '>';
                $output .= '<label class="form-check-label" for="flexSwitchCheckDefault">' . $label . '</label>';
                $output .= '</div>';

                return $output;
            }
        ]
    ) ?>

    <?= $form->field($model,'publish_date')->widget(DatePicker::class,
            [
                'dateFormat' => 'dd.MM.yyyy',
                'options' => ['class' => 'form-control']
            ]
    )
    ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
