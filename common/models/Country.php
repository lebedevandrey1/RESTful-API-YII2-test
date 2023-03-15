<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%country}}".
 *
 * @property int $id
 * @property int $code
 * @property string $name
 * @property string $fullname
 * @property string $alpha2
 * @property string $alpha3
 *
 * @property Author[] $authors
 */
class Country extends CommonModel
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%country}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['code', 'name', 'fullname', 'alpha2', 'alpha3'], 'required'],
            [['code'], 'integer'],
            [['name', 'fullname'], 'string', 'max' => 250],
            [['alpha2'], 'string', 'max' => 2],
            [['alpha3'], 'string', 'max' => 3],
            [['code', 'name', 'fullname', 'alpha2', 'alpha3'], 'unique']
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'code' => Yii::t('app', 'Code'),
            'name' => Yii::t('app', 'Name'),
            'fullname' => Yii::t('app', 'Fullname'),
            'alpha2' => Yii::t('app', 'Alpha2'),
            'alpha3' => Yii::t('app', 'Alpha3'),
        ];
    }

    /**
     * Gets query for [[Authors]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getAuthors()
    {
        return $this->hasMany(Author::class, ['country_id' => 'id']);
    }
}
