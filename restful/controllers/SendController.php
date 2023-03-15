<?php

namespace restful\controllers;

use common\models\Genre;
use yii\helpers\Json;
use yii\httpclient\Client;
use yii\rest\ActiveController;
use yii\web\Controller;
use linslin\yii2\curl;

class SendController extends ActiveController
{









    public function actionIndex()
    {
        $curl = new curl\Curl();
        $response = $curl->get('http://host.docker.internal:8004/country');

//        $response = $curl->setOption(
//            CURLOPT_POSTFIELDS,
//            http_build_query(array(
//                    'title' => 'new111',
//                    'author_id' => 19,
////                    'genre' => [2, 3],
////                    'genre' => [0 => 2, 1 => 3],
//                    'publish_date' => '1998-01-01'
//                )
//            ))
//            ->get('http://host.docker.internal:8004/author');

//        $response = $curl->setOption(
//            CURLOPT_POSTFIELDS,
//            http_build_query(array(
//                    'name' => '1224234',
//                    'country_id' => 5
//                )
//            ))
//            ->post('http://host.docker.internal:8004/authors');

//        $client = new Client(['baseUrl' => 'http://host.docker.internal:8004/books']);
//        $response = $client->createRequest()
//            ->addHeaders(['content-type' => 'application/json'])
//            ->setMethod('post')
//            ->setData(['id' => 17])
//            ->send();

        $decode = Json::decode($response);

        echo '<pre>';
        print_r($decode);
        echo '</pre>';
        exit;
    }
}