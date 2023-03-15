<?php

namespace restful\controllers;

use common\models\Author;

class AuthorController extends RestfulController
{
    public $modelClass = Author::class;
}