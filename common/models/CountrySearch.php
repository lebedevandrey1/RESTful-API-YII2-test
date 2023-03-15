<?php

namespace common\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;

/**
 * CountrySearch represents the model behind the search form of `app\models\Country`.
 */
class CountrySearch extends Country
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'code', 'name', 'fullname', 'alpha2', 'alpha3'], 'safe'],
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
        $query = Country::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere($this->multipleSearch('id', $this->id));
        $query->andFilterWhere($this->multipleSearch('code', $this->code));
        $query->andFilterWhere($this->multipleSearch('name', $this->name));
        $query->andFilterWhere($this->multipleSearch('fullname', $this->fullname));
        $query->andFilterWhere($this->multipleSearch('alpha2', $this->alpha2));
        $query->andFilterWhere($this->multipleSearch('alpha2', $this->alpha2));
        $query->andFilterWhere($this->multipleSearch('alpha3', $this->alpha3));

        return $dataProvider;
    }
}
