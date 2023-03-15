<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%author}}".
 *
 * @property int $id
 * @property string|null $name Автор
 * @property int|null $country_id ID страны 'country'
 *
 * @property Book[] $books
 * @property Country $country
 */
class Author extends CommonModel
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%author}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'country_id'], 'required'],
            [['country_id'], 'integer'],
            [['name'], 'string', 'max' => 555],
            [['country_id'], 'exist', 'skipOnError' => false, 'targetClass' => Country::class, 'targetAttribute' => ['country_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
            'country_id' => Yii::t('app', 'Country'),
        ];
    }

    public function fields()
    {
        return [
            'id', 'name',
            'country' => function () {
                return ($this->country->name) ?? null;
            },
        ];
    }

    /**
     * Gets query for [[Books]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getBooks()
    {
        return $this->hasMany(Book::class, ['author_id' => 'id']);
    }

    /**
     * Gets query for [[Country]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCountry()
    {
        return $this->hasOne(Country::class, ['id' => 'country_id']);
    }

    /**
     * Gets query for [[Author]].
     *
     * @return \yii\db\ActiveQuery
     */
    public static function listArray()
    {
        return static::find()
            ->orderBy('name')
            ->asArray()
            ->all();
    }
}
