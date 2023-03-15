<?php

namespace common\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;

/**
 * BookSearch represents the model behind the search form of `app\models\Book`.
 */
class BookSearch extends Book
{
    public $genre;
    public $author_name;
    public $country_name;

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'author_id', 'title', 'publish_date', 'genre', 'author_name', 'country_name'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Book::find()
            ->joinWith(['authorCountry', 'bookGenres', 'genreTitles'])
            ->orderBy(['id' => SORT_DESC]);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere($this->multipleSearch(Book::tableName() . '.id', $this->id));
        $query->andFilterWhere($this->multipleSearch('publish_date', $this->publish_date, 'date'));
        $query->andFilterWhere($this->multipleSearch(Author::tableName() . '.name', $this->author_name));
        $query->andFilterWhere($this->multipleSearch(Country::tableName() . '.name', $this->country_name));
        $query->andFilterWhere($this->multipleSearch(Book::tableName() . '.title', $this->title));
        $query->andFilterWhere($this->multipleSearch(Genre::tableName() . '.title', $this->genre));

        return $dataProvider;
    }
}
