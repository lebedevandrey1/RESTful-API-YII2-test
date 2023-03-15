<?php

use yii\db\Migration;

/**
 * UP: Добавление данных в таблицу {{%book}}
 * DOWN: Удаление данных из таблицы {{%book}}
 */
class m230315_190106_addinfo_book_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->execute("SET foreign_key_checks = 0");
        $this->truncateTable('{{%book}}');
        $this->batchInsert('{{%book}}', ['title', 'author_id', 'publish_date'],[
            ['Белая гвардия', 1, '1925-07-07'],
            ['Дьяволиада', 1,'1924-12-09'],
            ['Мансарда снов', 2,'1920-04-17'],
            ['На Западном фронте без перемен', 2,'1929-05-21'],
            ['Идиот', 3,'1867-01-01'],
            ['Убийство в «Восточном экспрессе»', 8,'1934-08-05'],
            ['Белое безмолвие', 5,'1899-10-09'],
            ['Капитанская дочка', 6,'1836-01-29'],
            ['Пир во время чумы', 6,'1832-04-16']
        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->execute("SET foreign_key_checks = 0");
        $this->truncateTable('{{%book}}');
    }
}
