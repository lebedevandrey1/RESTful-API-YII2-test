<?php

namespace common\models;

use common\models\BookGenre;
use Yii;

/**
 * This is the model class for table "{{%genre}}".
 *
 * @property int $id
 * @property string $title Жанр
 *
 * @property BookGenre[] $bookGenres
 */
class Genre extends CommonModel
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%genre}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['title'], 'required'],
            [['title'], 'string', 'max' => 100],
            [['title'], 'unique'],
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
        ];
    }

    /**
     * Gets query for [[BookGenres]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getBookGenres()
    {
        return $this->hasMany(BookGenre::class, ['genre_id' => 'id']);
    }

    /**
     * Gets query for [[Books]].
     *
     * @return \yii\db\ActiveQuery
     */
    public static function listArray()
    {
        return static::find()
            ->orderBy('title')
            ->asArray()
            ->all();
    }
}
