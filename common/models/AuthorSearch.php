<?php

namespace common\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;

/**
 * AuthorSearch represents the model behind the search form of `app\models\Author`.
 */
class AuthorSearch extends Author
{
    public $country_name;

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'name', 'country', 'country_name'], 'safe'],
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
        $query = Author::find()
            ->joinWith('country')
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

        $query->andFilterWhere($this->multipleSearch(Author::tableName() . '.id', $this->id));
        $query->andFilterWhere($this->multipleSearch(Author::tableName() . '.name', $this->name));
        $query->andFilterWhere($this->multipleSearch(Country::tableName() . '.name', $this->country_name));

        return $dataProvider;
    }
}
