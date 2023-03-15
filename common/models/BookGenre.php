<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%book_genre}}".
 *
 * @property int $id
 * @property int $book_id ID книги 'book'
 * @property int $genre_id ID жанра 'genre'
 *
 * @property Book $book
 * @property Genre $genre
 */
class BookGenre extends CommonModel
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%book_genre}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['book_id', 'genre_id'], 'required'],
            [['book_id', 'genre_id'], 'integer'],
            [['book_id'], 'exist', 'skipOnError' => true, 'targetClass' => Book::class, 'targetAttribute' => ['book_id' => 'id']],
            [['genre_id'], 'exist', 'skipOnError' => true, 'targetClass' => Genre::class, 'targetAttribute' => ['genre_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'book_id' => Yii::t('app', 'Book ID'),
            'genre_id' => Yii::t('app', 'Genre ID'),
        ];
    }

    /**
     * Gets query for [[Book]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getBook()
    {
        return $this->hasOne(Book::class, ['id' => 'book_id']);
    }

    /**
     * Gets query for [[Genre]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getGenre()
    {
        return $this->hasOne(Genre::class, ['id' => 'genre_id']);
    }
}
