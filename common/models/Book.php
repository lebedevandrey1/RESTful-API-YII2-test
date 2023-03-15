<?php

namespace common\models;

use Yii;
use yii\db\ActiveQuery;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "{{%book}}".
 *
 * @property int $id
 * @property string|null $title Название
 * @property int|null $author_id Автор
 * @property int|null $genre Жанры
 * @property string|null $publish_date Дата публикации
 *
 * @property Author $authorn
 * @property BookGenre[] $bookGenres
 */
class Book extends CommonModel
{
    public $genre;

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%book}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['author_id', 'publish_date', 'title'], 'required'],
            [['genre'], 'required'],
            [['author_id'], 'integer'],
            ['genre', 'each', 'rule' => ['exist', 'skipOnError' => false, 'targetClass' => Genre::class, 'targetAttribute' => ['genre' => 'id']]],
            [['title'], 'string', 'max' => 555],
            [['author_id'], 'exist', 'skipOnError' => false, 'targetClass' => Author::class, 'targetAttribute' => ['author_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'title' => Yii::t('app', 'Title'),
            'genres' => Yii::t('app', 'Genres'),
            'author_id' => Yii::t('app', 'Author'),
            'author_name' => Yii::t('app', 'Author'),
            'country_name' => Yii::t('app', 'Country'),
            'publish_date' => Yii::t('app', 'Publish Date'),
        ];
    }

    public function fields()
    {
        return [
            'id', 'title',
            'author' => function () {
                return $this->authorn->name;
            },
            'country' => function () {
                return ($this->authorCountry->name) ?? null;
            },
            'genres' => function () {
                return ArrayHelper::map($this->genreTitles, 'id','title');
            },
            'publish_date' => function () {
                return ($this->publish_date) ? Yii::$app->formatter->asDateTime($this->publish_date, 'php: d.m.Y') : null;
            },
        ];
    }

    /**
     * Вставка данных в таблицу {book_genre}
     *
     * @param bool $insert True - новая запись (по умолчанию), False - обновление уже существующей записи
     * @return void
     */
    public function beforeSave($insert)
    {
        $this->publish_date = \Yii::$app->formatter->asDate($this->publish_date, "php:Y-m-d");

        return parent::beforeSave($insert);
    }

    /**
     * Вставка данных в таблицу {book_genre}
     *
     * @param bool $insert True - новая запись (по умолчанию), False - обновление уже существующей записи
     * @param array $changedAttributes При обновлении записи выводит данные, которые были изменены. При создании - пустые данные
     * @return void
     */
    public function afterSave($insert, $changedAttributes)
    {
        // При редактировании сначала удаляем все записи, которые уже есть в таблице "книга->жанр"
        // Сделано для метода "UPDATE", при DELETE связь CASCADE сама должна удалить записи
        if (!$insert) {
            Yii::$app->db
                ->createCommand()
                ->delete('book_genre', ['book_id' => $this->id])
                ->execute();
        }

        // Снижаем кол-во запросов к БД через пакетную вставку данных
        $bulkInsertArray = [];
        foreach ($this->genre as $value) {
            $bulkInsertArray[] = [
                'book_id' => $this->id,
                'genre_id' => $value
            ];
        }
        // На всякий случай проверим массив на пустоту, чтобы не выпадала ошибка
        // Хотя это можно пропустить, т.к. выбор жанра у нас required
        if (count($bulkInsertArray) > 0) {
            $columnNameArray = ['book_id','genre_id'];
            Yii::$app->db->createCommand()
                ->batchInsert('book_genre', $columnNameArray, $bulkInsertArray)
                ->execute();
        }

        return parent::afterSave($insert, $changedAttributes);
    }

    /**
     * Gets query for [[Authorn]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getAuthorn()
    {
        return $this->hasOne(Author::class, ['id' => 'author_id']);
    }

    /**
     * Gets query for [[Authorn]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getAuthorCountry()
    {
        return $this->hasOne(Country::class, ['id' => 'country_id'])->via('authorn');
    }

    /**
     * Gets query for [[BookGenres]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getBookGenres()
    {
        return $this->hasMany(BookGenre::class, ['book_id' => 'id']);
    }

    public function getGenreTitles(): ActiveQuery
    {
        return $this->hasMany( Genre::class,['id' => 'genre_id'])->via( 'bookGenres');
    }
}
