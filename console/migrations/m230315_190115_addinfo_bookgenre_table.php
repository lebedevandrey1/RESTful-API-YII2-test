<?php

use yii\db\Migration;

/**
 * UP: Добавление данных в таблицу {{%book_genre}}
 * DOWN: Удаление данных из таблицы {{%book_genre}}
 */
class m230315_190115_addinfo_bookgenre_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->execute("SET foreign_key_checks = 0");
        $this->truncateTable('{{%book_genre}}');
        $this->batchInsert('{{%book_genre}}', ['book_id', 'genre_id'],[
            [1, 2],
            [2, 1],
            [3, 2],
            [4, 2],
            [4, 3],
            [5, 2],
            [5, 3],
            [6, 2],
            [6, 4],
            [7, 3],
            [8, 2],
            [9, 7],
            [9, 9]
        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->execute("SET foreign_key_checks = 0");
        $this->truncateTable('{{%book_genre}}');
    }
}
