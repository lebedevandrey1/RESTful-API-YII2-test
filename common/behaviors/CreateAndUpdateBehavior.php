<?php

namespace common\behaviors;

use yii\behaviors\TimestampBehavior;

class CreateAndUpdateBehavior extends TimestampBehavior
{
    /**
    * Переопределение родительской функции для изменения формата даты
    *
    * @param array $event Параметр события
    * @return string Дата (напр: 2023-03-10 03:43:58)
    */
    public function getValue($event): string
    {
        $this->value = date('Y-m-d h:i:s');

        return parent::getValue($event);
    }
}