<?php

namespace common\models;

use yii\db\ActiveRecord;

/**
 * Общая модель для всех базовых моделей всех подпроектов
 */
class CommonModel extends ActiveRecord
{
    /**
     * @var string Разделитель слов при поиске
     */
    const WORDSEPARATOR = ',';

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

    /**
     * Убирает из URL название модели при поиске
     *
     * @return void
     */
    public function formName()
    {
        return '';
    }

    /**
    * Формирует условия для поиска нескольких значений в таблице по переданному полю
    *
    * @param string $tableField Поле в таблице
    * @param string|null $searchField Поискомая фраза
    * @param string $format Формат данных. Пока только создано для работы с датами
    * @return array Либо пустой массив, либо массив данных для поиска
    */
    public function multipleSearch(string $tableField, ?string $searchField, string $format = ''): array
    {
        if ($searchField) {
            // Разбиваем на отдельные слова
            // Трим сделаем уже после разбивки на слова, чтобы у пользователя была возможность искать совпадения
            // с пробелами, например, "Название книги"
            $words = explode(static::WORDSEPARATOR, $searchField);
            $condition = ['or'];
            foreach ($words as $word) {
                if($format == 'date') {
                    // Проверяем введенную дату для поиска на существование
                    if (\DateTime::createFromFormat('d.m.Y', trim($word))) {
                        // Если дата существует, конвертируем ее в дату по формату БД
                        $word = \Yii::$app->formatter->asDate(trim($word), "php:Y-m-d");
                    }
                }

                $condition[] = ['like', $tableField, trim($word)];
            }

            return $condition;
        }

        return [];
    }
}