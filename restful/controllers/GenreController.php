<?php

namespace restful\controllers;

use common\models\Genre;

class GenreController extends RestfulController
{
    public $modelClass = Genre::class;
}