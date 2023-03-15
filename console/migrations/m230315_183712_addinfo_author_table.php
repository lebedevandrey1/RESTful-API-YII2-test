<?php

use yii\db\Migration;

/**
 * UP: Добавление данных в таблицу {{%author}}
 * DOWN: Удаление данных из таблицы {{%author}}
 */
class m230315_183712_addinfo_author_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->execute("SET foreign_key_checks = 0");
        $this->truncateTable('{{%author}}');
        $this->batchInsert('{{%author}}', ['name','country_id'],[
            ['М. Булгаков', 169],
            ['Э.М. Ремарк', 53],
            ['Ф. Достоевский', 169],
            ['Д. Оруэлл', 189],
            ['Д. Лондон', 194],
            ['А. Пушкин', 169],
            ['Л. Толстой', 169],
            ['А. Кристи', 189]

        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->execute("SET foreign_key_checks = 0");
        $this->truncateTable('{{%author}}');
    }
}
