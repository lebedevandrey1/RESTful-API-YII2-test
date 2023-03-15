<?php

use yii\db\Migration;

/**
 * UP: Добавление данных в таблицу {{%genre}}
 * DOWN: Удаление данных из таблицы {{%genre}}
 */
class m230315_190048_addinfo_genre_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->execute("SET foreign_key_checks = 0");
        $this->truncateTable('{{%genre}}');
        $this->batchInsert('{{%genre}}', ['title'],[
            ['Повесть'],
            ['Роман'],
            ['Рассказ'],
            ['Фантастика'],
            ['Детектив'],
            ['Драма'],
            ['Поэзия'],
            ['Комедия'],
            ['Трагедия']
        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->execute("SET foreign_key_checks = 0");
        $this->truncateTable('{{%genre}}');
    }
}
